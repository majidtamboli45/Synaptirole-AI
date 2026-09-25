from PySide6.QtCore import Property, QObject, Signal, Slot
from uuid import uuid4
import sys
import threading
from pathlib import Path

from app.authentication import authenticate_user, register_user
from app.authentication.jwt_manager import create_token, verify_token
from app.database import init_db
from app.database.repository import UserRepository
from app.utils import get_logger
from app.utils.file_handler import save_upload, delete_file, get_file_info, get_file_size_mb
from app.resume.resume_analyzer import analyze_resume
from app.job.jd_parser import parse_job_description


logger = get_logger("app_controller")


def _get_data_dir() -> Path:
    """
    Returns the directory used for application data.

    When packaged:
        <application>/data

    During development:
        <project>/data
    """
    if getattr(sys, "frozen", False):
        return Path(sys.executable).parent / "data"

    return Path(__file__).resolve().parent.parent / "data"


class AppController(QObject):

    # ---------------------------------------------------------
    # Signals
    # ---------------------------------------------------------

    loginSuccess = Signal()
    logoutRequested = Signal()

    toastMessage = Signal(
        str,
        arguments=["message"]
    )

    pageRequested = Signal(
        str,
        arguments=["page"]
    )

    currentPageChanged = Signal()

    skillAnalysisChanged = Signal()

    analysisBusyChanged = Signal()

    skillAnalysisReady = Signal(
        str,
        arguments=["json"]
    )

    skillAnalysisFailed = Signal(
        str,
        str,
        arguments=["title", "message"]
    )

    errorOccurred = Signal(
        str,
        str,
        arguments=["title", "message"]
    )

    userChanged = Signal()

    resumeUploaded = Signal()
    jdUploaded = Signal()
    resumeParsed = Signal()
    jdParsed = Signal()
    documentsChanged = Signal()

    # ---------------------------------------------------------
    # Constructor
    # ---------------------------------------------------------

    def __init__(self, parent=None):
        super().__init__(parent)

        self._currentPage = "login"
        self._user = None
        self._user_id = None
        self._remember_token = None
        self._skill_analysis_json = ""

        self._analysis_lock = threading.Lock()
        self._analysis_running = False
        self._analysis_rerun = False
        self._analysis_busy = False

        self._resume_path = None
        self._resume_data = None
        self._jd_path = None
        self._jd_data = None

        init_db()
        self._load_remember_token()

        self.skillAnalysisReady.connect(self._apply_skill_analysis)
        self.skillAnalysisFailed.connect(self._handle_skill_analysis_error)

        self._start_background_warmup()

    # ---------------------------------------------------------
    # Background asset warm-up (latency fix)
    # ---------------------------------------------------------

    def _start_background_warmup(self):
        """Pre-load shared NLP / ontology assets off the GUI thread.

        spaCy (skill NER) and the ESCO/O*NET ontology index are needed as soon
        as the first resume or JD is parsed. Warming them in daemon threads at
        startup removes their load cost from the upload / analysis path. The
        threads never touch the GUI and never block it.
        """
        def _warm():
            try:
                from app.nlp.pipeline import get_nlp
                get_nlp()
            except Exception as exc:
                logger.warning("Background spaCy warm-up failed: %s", exc)
            try:
                from app.skills.ontology import load_ontology
                load_ontology()
            except Exception as exc:
                logger.warning("Background ontology warm-up failed: %s", exc)

        threading.Thread(target=_warm, daemon=True, name="asset-warmup").start()

    def _warm_sbert(self):
        """Pre-load the Sentence-BERT embedding model off the GUI thread.

        Called once both documents are parsed so the skill-analysis worker does
        not have to pay the multi-second model load when it starts.
        ``sbert_model.get_model`` is idempotent, exception-safe and
        lock-guarded, so overlapping with the worker thread is harmless.
        """
        def _warm():
            try:
                from app.skills import sbert_model
                sbert_model.get_model()
            except Exception as exc:
                logger.warning("Background SBERT warm-up failed: %s", exc)

        threading.Thread(target=_warm, daemon=True, name="sbert-warmup").start()

    # ---------------------------------------------------------
    # Remember Me
    # ---------------------------------------------------------

    def _remember_token_file(self) -> Path:
        return _get_data_dir() / "remember_token.json"

    def _load_remember_token(self):
        import json

        token_file = self._remember_token_file()

        if not token_file.exists():
            return

        try:
            with open(token_file, "r", encoding="utf-8") as file:
                data = json.load(file)

            token = data.get("token")

            if not token:
                return

            payload = verify_token(token)

            if not payload:
                self._clear_remember_token()
                return

            user_id = payload.get("user_id")

            if not user_id:
                self._clear_remember_token()
                return

            user = UserRepository.get_by_id(user_id)

            if user:
                self._remember_token = token
                self._set_user(user)
                self._currentPage = "dashboard"

        except Exception as exc:
            logger.warning(
                "Failed to load remember token: %s",
                exc
            )

    def _save_remember_token(self, token: str):
        import json

        token_file = self._remember_token_file()

        try:
            token_file.parent.mkdir(
                parents=True,
                exist_ok=True
            )

            with open(token_file, "w", encoding="utf-8") as file:
                json.dump(
                    {"token": token},
                    file
                )

            self._remember_token = token

        except Exception as exc:
            logger.warning(
                "Failed to save remember token: %s",
                exc
            )

    def _clear_remember_token(self):
        token_file = self._remember_token_file()

        try:
            if token_file.exists():
                token_file.unlink()

        except Exception as exc:
            logger.warning(
                "Failed to clear remember token: %s",
                exc
            )

        self._remember_token = None

    # ---------------------------------------------------------
    # User
    # ---------------------------------------------------------

    def _set_user(self, user):
        self._user = user
        self._user_id = user.id

        self.userChanged.emit()

    def _clear_user(self):
        self._user = None
        self._user_id = None

        self.userChanged.emit()

    # ---------------------------------------------------------
    # QML Properties
    # ---------------------------------------------------------

    @Property(str, notify=userChanged)
    def userName(self):
        return self._user.name if self._user else ""

    @Property(str, notify=userChanged)
    def userRole(self):
        return self._user.role if self._user else ""

    @Property(str, notify=userChanged)
    def userEmail(self):
        return self._user.email if self._user else ""

    @Property(str, notify=userChanged)
    def userPhone(self):
        return self._user.phone if self._user else ""

    @Property(str, notify=userChanged)
    def userLocation(self):
        return self._user.location if self._user else ""

    @Property(str, notify=userChanged)
    def memberSince(self):
        if (
            self._user
            and getattr(self._user, "created_at", None)
        ):
            return self._user.created_at.split(" ")[0]

        return ""

    @Property(str, notify=userChanged)
    def accountStatus(self):
        return "Active" if self._user else ""

    @Property(bool, notify=userChanged)
    def isLoggedIn(self):
        return self._user is not None

    # ---------------------------------------------------------
    # Current Page
    # ---------------------------------------------------------

    def _get_current_page(self):
        return self._currentPage

    def _set_current_page(self, page):
        if self._currentPage == page:
            return

        self._currentPage = page
        self.currentPageChanged.emit()
        self.pageRequested.emit(page)

    currentPage = Property(
        str,
        _get_current_page,
        _set_current_page,
        notify=currentPageChanged
    )

    # ---------------------------------------------------------
    # Navigation
    # ---------------------------------------------------------

    @Slot(str)
    def navigate(self, page):
        self.currentPage = page

    @Slot()
    def showSignup(self):
        """
        Used by QML when the user wants to open signup.

        The actual login/signup UI is handled by login.qml
        using signupMode, so we don't navigate to another
        page here.
        """
        self.toastMessage.emit(
            "Create your account to continue."
        )

    @Slot()
    def showLogin(self):
        self.currentPage = "login"

    # ---------------------------------------------------------
    # Skill Gap Analysis (Phase 5)
    # ---------------------------------------------------------

    def _set_analysis_busy(self, busy: bool):
        if self._analysis_busy != busy:
            self._analysis_busy = busy
            self.analysisBusyChanged.emit()

    @Property(bool, notify=analysisBusyChanged)
    def analysisBusy(self) -> bool:
        """True while a skill-gap analysis is running on the worker thread."""
        return self._analysis_busy

    @Slot()
    def refreshSkillAnalysis(self):
        """Run the skill-gap pipeline off the GUI thread.

        Only produces a result once a resume AND a job description have
        been parsed successfully (``documentsReady``). The SBERT model
        load + embedding pipeline can take many seconds, so it runs on a
        daemon worker thread and the result is delivered back on the GUI
        thread via ``skillAnalysisReady``. Re-entrant calls while a run
        is in flight collapse into a single follow-up.
        """
        if not self.documentsReady:
            return

        with self._analysis_lock:
            if self._analysis_running:
                self._analysis_rerun = True
                return
            self._analysis_running = True

        self._set_analysis_busy(True)

        threading.Thread(
            target=self._run_skill_analysis,
            args=(self._user_id,),
            daemon=True,
        ).start()

    def _run_skill_analysis(self, user_id):
        try:
            from app.recommendation.dashboard_service import dashboard_json_for_skills

            resume_skills: list[str] = []
            required_skills: list[str] = []
            preferred_skills: list[str] = []

            if self._resume_data and "error" not in self._resume_data:
                resume_skills = list(self._resume_data.get("skills") or [])

            if self._jd_data and "error" not in self._jd_data:
                from app.job.job_analyzer import extract_preferred_skills

                jd_skills = list(self._jd_data.get("skills") or [])
                preferred = list(
                    extract_preferred_skills(
                        self._jd_data.get("cleaned_text") or ""
                    ) or []
                )
                preferred_lower = {s.strip().lower() for s in preferred}

                pref_skills = [
                    s for s in jd_skills if s.lower() in preferred_lower
                ]

                if pref_skills:
                    preferred_skills = pref_skills
                    required_skills = [
                        s for s in jd_skills if s.lower() not in preferred_lower
                    ]
                else:
                    preferred_skills = []
                    required_skills = jd_skills

            self.skillAnalysisReady.emit(
                dashboard_json_for_skills(
                    resume_skills,
                    required_skills,
                    preferred_skills,
                    user_id,
                )
            )
        except Exception as exc:
            logger.exception("Skill analysis failed")
            self.skillAnalysisFailed.emit(
                "Skill Analysis Failed",
                "Unable to compute the skill gap analysis.",
            )
        finally:
            with self._analysis_lock:
                self._analysis_running = False
                rerun = self._analysis_rerun
                self._analysis_rerun = False
            self._set_analysis_busy(False)
            if rerun:
                self.refreshSkillAnalysis()

    def _clear_skill_analysis(self):
        if self._skill_analysis_json:
            self._skill_analysis_json = ""
            self.skillAnalysisChanged.emit()

    def _apply_skill_analysis(self, analysis_json):
        self._skill_analysis_json = analysis_json
        self.skillAnalysisChanged.emit()

    def _handle_skill_analysis_error(self, title, message):
        self._skill_analysis_json = ""
        self.skillAnalysisChanged.emit()
        self.showError(title, message)

    @Property(str, notify=skillAnalysisChanged)
    def skillAnalysisJson(self):
        return self._skill_analysis_json

    @Property(str, notify=skillAnalysisChanged)
    def jobFitPct(self):
        try:
            import json
            data = json.loads(self._skill_analysis_json or "{}")
            return str(data.get("job_fit_pct", 0))
        except Exception:
            return "0"

    @Property(str, notify=skillAnalysisChanged)
    def matchedPct(self):
        try:
            import json
            data = json.loads(self._skill_analysis_json or "{}")
            return str(data.get("matched_pct", 0))
        except Exception:
            return "0"

    @Property(int, notify=skillAnalysisChanged)
    def gapCount(self):
        try:
            import json
            data = json.loads(self._skill_analysis_json or "{}")
            return int(data.get("gap_count", 0))
        except Exception:
            return 0

    @Property(str, notify=skillAnalysisChanged)
    def skillGapSummary(self):
        try:
            import json
            data = json.loads(self._skill_analysis_json or "{}")
            return (
                f"{data.get('matched_count', 0)} matched, "
                f"{data.get('partial_count', 0)} partial, "
                f"{data.get('gap_count', 0)} gap"
            )
        except Exception:
            return ""

    @Property(bool, notify=skillAnalysisChanged)
    def hasAnalysis(self):
        return bool(self._skill_analysis_json)

    # ---------------------------------------------------------
    # Login
    # ---------------------------------------------------------

    @Slot(str, str, bool)
    def login(
        self,
        email: str,
        password: str,
        remember_me: bool = False
    ):
        email = (email or "").strip().lower()

        logger.info("Login request received: email=%s", email)

        if not email:
            self.showError(
                "Login Failed",
                "Please enter your email address."
            )
            return

        if not password:
            self.showError(
                "Login Failed",
                "Please enter your password."
            )
            return

        logger.info("Login password length=%d", len(password))

        logger.info("Calling authenticate_user for %s", email)

        try:
            success, message, user = authenticate_user(
                email,
                password
            )

            logger.info(
                "authenticate_user result: success=%s user_exists=%s message=%s",
                success,
                bool(user),
                message
            )

        except Exception as exc:
            logger.exception("Login error")

            self.showError(
                "Login Failed",
                "An unexpected error occurred while logging in."
            )
            return

        if not success or not user:
            logger.warning(
                "Login failed for %s: %s",
                email,
                message
            )
            self.showError(
                "Login Failed",
                message
            )
            return

        logger.info("Login succeeded for email=%s user_id=%s", email, user.id)

        self._set_user(user)

        try:
            token = create_token(
                user.id,
                user.email
            )

            if remember_me:
                self._save_remember_token(token)
            else:
                self._clear_remember_token()

        except Exception as exc:
            logger.warning(
                "Failed to create login token: %s",
                exc
            )

        logger.info("Navigating to dashboard after login")
        self.currentPage = "dashboard"

        self.loginSuccess.emit()

        self.toastMessage.emit(
            f"Welcome back, {user.name}!"
        )

    # ---------------------------------------------------------
    # Signup
    # ---------------------------------------------------------

    @Slot(str, str, str, bool, str)
    def signup(
        self,
        name: str,
        email: str,
        password: str,
        remember_me: bool = False,
        role: str = ""
    ):
        name = (name or "").strip()
        email = (email or "").strip().lower()
        role = (role or "").strip()

        logger.info(
            "Signup request received: email=%s role=%s",
            email,
            role
        )

        if not name:
            self.showError(
                "Signup Failed",
                "Please enter your full name."
            )
            return

        if not email:
            self.showError(
                "Signup Failed",
                "Please enter your email address."
            )
            return

        if not password:
            self.showError(
                "Signup Failed",
                "Please enter a password."
            )
            return

        logger.info("Signup password length=%d", len(password))

        if not role:
            self.showError(
                "Signup Failed",
                "Please select your role."
            )
            return

        logger.info("Creating user account for %s", email)

        try:
            success, message = register_user(
                name,
                email,
                password,
                role
            )

        except Exception as exc:
            logger.exception("Signup error")

            self.showError(
                "Signup Failed",
                "An unexpected error occurred while creating your account."
            )
            return

        if not success:
            self.showError(
                "Signup Failed",
                message
            )
            return

        logger.info("User account created successfully: %s", email)

        # Automatically login after successful signup
        try:
            success, message, user = authenticate_user(
                email,
                password
            )
        except Exception as exc:
            logger.exception(
                "Signup auto-login error"
            )

            self.showError(
                "Signup Successful",
                "Your account was created. Please login manually."
            )
            return

        if not success or not user:
            self.showError(
                "Signup Successful",
                "Your account was created. Please login manually."
            )
            return

        logger.info("Signup auto-login successful: %s", email)

        self._set_user(user)

        try:
            token = create_token(
                user.id,
                user.email
            )

            if remember_me:
                self._save_remember_token(token)
            else:
                self._clear_remember_token()

        except Exception as exc:
            logger.warning(
                "Failed to create signup token: %s",
                exc
            )

        logger.info("Navigating to dashboard after signup")
        self.currentPage = "dashboard"

        self.loginSuccess.emit()

        self.toastMessage.emit(
            f"Account created! Welcome, {user.name}!"
        )

    # ---------------------------------------------------------
    # Forgot Password
    # ---------------------------------------------------------

    @Slot()
    def showForgotPassword(self):
        self.toastMessage.emit(
            "Password reset flow coming soon."
        )

    # ---------------------------------------------------------
    # Social Login
    # ---------------------------------------------------------

    @Slot()
    def loginWithGoogle(self):
        self._social_login("google")

    @Slot()
    def loginWithGitHub(self):
        self._social_login("github")

    def _social_login(self, provider: str):

        email = (
            f"{provider}_{uuid4().hex[:8]}"
            "@example.com"
        )

        name = f"{provider.capitalize()} User"
        password = "social123"

        try:
            success, message = register_user(
                name,
                email,
                password
            )

            if not success:
                user = UserRepository.get_by_email(email)

                if not user:
                    self.showError(
                        "Social Login Failed",
                        message
                    )
                    return

            success, message, user = authenticate_user(
                email,
                password
            )

        except Exception as exc:
            logger.exception(
                "Social login error"
            )

            self.showError(
                "Social Login Failed",
                "Unable to complete social login."
            )
            return

        if not success or not user:
            self.showError(
                "Login Failed",
                message
            )
            return

        self._set_user(user)

        try:
            token = create_token(
                user.id,
                user.email
            )

            self._save_remember_token(token)

        except Exception as exc:
            logger.warning(
                "Failed to create social login token: %s",
                exc
            )

        self.currentPage = "dashboard"

        self.loginSuccess.emit()

        self.toastMessage.emit(
            f"Welcome back, {user.name}!"
        )

    # ---------------------------------------------------------
    # Logout
    # ---------------------------------------------------------

    @Slot()
    def logout(self):
        self._clear_remember_token()
        self._clear_user()

        self.logoutRequested.emit()

        self.currentPage = "login"

        self.toastMessage.emit(
            "Logged out successfully."
        )

    # ---------------------------------------------------------
    # Utility
    # ---------------------------------------------------------

    @Slot(str)
    def notify(self, message):
        self.toastMessage.emit(message)

    @Slot()
    def downloadData(self):
        self.toastMessage.emit(
            "Preparing your data archive. "
            "Download will start shortly."
        )

    @Slot(str)
    def exportReport(self, fmt):
        self.toastMessage.emit(
            "Report exported as " + fmt + "."
        )

    @Slot()
    def updatePassword(self):
        self.toastMessage.emit(
            "Password updated successfully."
        )

    # ---------------------------------------------------------
    # Profile
    # ---------------------------------------------------------

    @Slot()
    def saveProfile(self):

        if not self._user:
            self.showError(
                "Error",
                "Not logged in."
            )
            return

        try:
            UserRepository.update(self._user)

            self.userChanged.emit()

            self.toastMessage.emit(
                "Profile changes saved successfully."
            )

        except Exception as exc:
            logger.exception(
                "Failed to save profile"
            )

            self.showError(
                "Error",
                "Unable to save profile changes."
            )

    @Slot()
    def saveAccount(self):
        self.saveProfile()

    # ---------------------------------------------------------
    # Delete Account
    # ---------------------------------------------------------

    @Slot()
    def deleteAccount(self):

        if not self._user:
            self.showError(
                "Error",
                "Not logged in."
            )
            return

        try:
            UserRepository.delete(
                self._user.id
            )

            self._clear_remember_token()
            self._clear_user()

            self.logoutRequested.emit()

            self.currentPage = "login"

            self.toastMessage.emit(
                "Account deleted. You have been logged out."
            )

        except Exception as exc:
            logger.exception(
                "Failed to delete account"
            )

            self.showError(
                "Error",
                "Unable to delete account."
            )

    # ---------------------------------------------------------
    # Resume & JD
    # ---------------------------------------------------------

    @Property(bool, notify=documentsChanged)
    def hasResume(self):
        return self._resume_path is not None

    @Property(str, notify=documentsChanged)
    def resumeFileName(self):
        if self._resume_path:
            return self._resume_data.get("file_name", self._resume_path.name) if self._resume_data else self._resume_path.name
        return ""

    @Property(str, notify=documentsChanged)
    def resumeFileSize(self):
        if self._resume_path and self._resume_path.exists():
            size_mb = get_file_size_mb(self._resume_path)
            if size_mb < 1:
                return f"{size_mb * 1024:.0f} KB"
            return f"{size_mb:.2f} MB"
        return ""

    @Property(str, notify=documentsChanged)
    def resumeName(self):
        if self._resume_data:
            return self._resume_data.get("name", "")
        return ""

    @Property(str, notify=documentsChanged)
    def resumeRole(self):
        if self._resume_data:
            return self._resume_data.get("current_role", "")
        return ""

    @Property(str, notify=documentsChanged)
    def resumeExperience(self):
        if self._resume_data:
            return self._resume_data.get("experience_years", "")
        return ""

    @Property(str, notify=documentsChanged)
    def resumeSkills(self):
        if self._resume_data:
            skills = self._resume_data.get("skills", [])
            return ", ".join(skills[:7])
        return ""

    @Property(str, notify=documentsChanged)
    def resumeRawText(self):
        if self._resume_data:
            return self._resume_data.get("raw_text", "")
        return ""

    @Property(str, notify=documentsChanged)
    def resumeStatus(self):
        if self._resume_data and "error" not in self._resume_data:
            return "parsed"
        elif self._resume_data and "error" in self._resume_data:
            return "error"
        elif self._resume_path:
            return "uploaded"
        return "none"

    @Property(bool, notify=documentsChanged)
    def hasJd(self):
        return self._jd_path is not None

    @Property(str, notify=documentsChanged)
    def jdFileName(self):
        if self._jd_path:
            return self._jd_data.get("file_name", self._jd_path.name) if self._jd_data else self._jd_path.name
        return ""

    @Property(str, notify=documentsChanged)
    def jdFileSize(self):
        if self._jd_path and self._jd_path.exists():
            size_mb = get_file_size_mb(self._jd_path)
            if size_mb < 1:
                return f"{size_mb * 1024:.0f} KB"
            return f"{size_mb:.2f} MB"
        return ""

    @Property(str, notify=documentsChanged)
    def jdTitle(self):
        if self._jd_data:
            return self._jd_data.get("title", "")
        return ""

    @Property(str, notify=documentsChanged)
    def jdCompany(self):
        if self._jd_data:
            return self._jd_data.get("company", "")
        return ""

    @Property(str, notify=documentsChanged)
    def jdExperienceRequired(self):
        if self._jd_data:
            return self._jd_data.get("experience_required", "")
        return ""

    @Property(str, notify=documentsChanged)
    def jdEmploymentType(self):
        if self._jd_data:
            return self._jd_data.get("employment_type", "")
        return ""

    @Property(str, notify=documentsChanged)
    def jdSkills(self):
        if self._jd_data:
            skills = self._jd_data.get("skills", [])
            return ", ".join(skills[:7])
        return ""

    @Property(str, notify=documentsChanged)
    def jdRawText(self):
        if self._jd_data:
            return self._jd_data.get("raw_text", "")
        return ""

    @Property(str, notify=documentsChanged)
    def jdStatus(self):
        if self._jd_data and "error" not in self._jd_data:
            return "parsed"
        elif self._jd_data and "error" in self._jd_data:
            return "error"
        elif self._jd_path:
            return "uploaded"
        return "none"

    @Property(bool, notify=documentsChanged)
    def documentsReady(self):
        return (
            self._resume_data is not None
            and "error" not in self._resume_data
            and self._jd_data is not None
            and "error" not in self._jd_data
        )

    @Slot(str, str)
    def uploadResume(self, file_url: str, original_name: str):
        logger.info("Resume upload requested: %s", original_name)

        try:
            from PySide6.QtCore import QUrl
            local_path = QUrl(file_url).toLocalFile()
            file_path = Path(local_path)

            if not file_path.exists():
                self.showError("Upload Failed", f"File not found: {original_name}")
                return

            doc_type = self._classify_file(file_path)

            if doc_type == "jd":
                self.showError(
                    "Wrong File Type",
                    "This looks like a Job Description, not a Resume. "
                    "Please upload your Resume in the Resume section.",
                )
                return
            if doc_type == "unknown":
                self.showError(
                    "Wrong File Type",
                    "Could not identify this document as a Resume. "
                    "Please upload a valid Resume (PDF, DOCX, DOC, TXT).",
                )
                return

            file_bytes = file_path.read_bytes()

            saved_path = save_upload(file_bytes, original_name, subfolder="resumes")

            self._resume_path = saved_path
            self.resumeUploaded.emit()
            self.documentsChanged.emit()

            logger.info("Resume saved: %s", saved_path.name)

            self._clear_skill_analysis()
            self._parse_resume()

        except Exception as exc:
            logger.exception("Resume upload error")
            self.showError("Upload Failed", f"Could not upload resume: {exc}")

    def _classify_file(self, file_path: Path) -> str:
        try:
            from app.resume.text_extractor import extract_text
            from app.utils.document_classifier import classify_document

            extraction = extract_text(file_path)
            return classify_document(extraction.get("cleaned_text", ""))
        except Exception as exc:
            logger.warning(
                "Could not classify file %s: %s",
                file_path.name,
                exc,
            )
            return "unknown"

    def _parse_resume(self):
        if not self._resume_path:
            return

        logger.info("Parsing resume: %s", self._resume_path.name)

        try:
            self._resume_data = analyze_resume(self._resume_path)

            if "error" in self._resume_data:
                self.showError("Parse Error", self._resume_data["error"])
            else:
                self.resumeParsed.emit()
                self.toastMessage.emit(
                    f"Resume parsed: {self._resume_data.get('char_count', 0)} chars, "
                    f"{len(self._resume_data.get('skills', []))} skills found"
                )
            self.documentsChanged.emit()

            if self.documentsReady:
                self._warm_sbert()
                self.refreshSkillAnalysis()

        except Exception as exc:
            logger.exception("Resume parse error")
            self.showError("Parse Error", f"Could not parse resume: {exc}")
            self._resume_data = {"error": str(exc)}
            self.documentsChanged.emit()

    @Slot(str, str)
    def uploadJd(self, file_url: str, original_name: str):
        logger.info("JD upload requested: %s", original_name)

        try:
            from PySide6.QtCore import QUrl
            local_path = QUrl(file_url).toLocalFile()
            file_path = Path(local_path)

            if not file_path.exists():
                self.showError("Upload Failed", f"File not found: {original_name}")
                return

            doc_type = self._classify_file(file_path)

            if doc_type == "resume":
                self.showError(
                    "Wrong File Type",
                    "This looks like a Resume, not a Job Description. "
                    "Please upload the Job Description in the JD section.",
                )
                return
            if doc_type == "unknown":
                self.showError(
                    "Wrong File Type",
                    "Could not identify this document as a Job Description. "
                    "Please upload a valid Job Description (PDF, DOCX, DOC, TXT).",
                )
                return

            file_bytes = file_path.read_bytes()

            saved_path = save_upload(file_bytes, original_name, subfolder="job_descriptions")

            self._jd_path = saved_path
            self.jdUploaded.emit()
            self.documentsChanged.emit()

            logger.info("JD saved: %s", saved_path.name)

            self._clear_skill_analysis()
            self._parse_jd()

        except Exception as exc:
            logger.exception("JD upload error")
            self.showError("Upload Failed", f"Could not upload job description: {exc}")

    def _parse_jd(self):
        if not self._jd_path:
            return

        logger.info("Parsing JD: %s", self._jd_path.name)

        try:
            self._jd_data = parse_job_description(self._jd_path)

            if "error" in self._jd_data:
                self.showError("Parse Error", self._jd_data["error"])
            else:
                self.jdParsed.emit()
                self.toastMessage.emit(
                    f"JD parsed: {len(self._jd_data.get('skills', []))} skills found"
                )
            self.documentsChanged.emit()

            if self.documentsReady:
                self._warm_sbert()
                self.refreshSkillAnalysis()

        except Exception as exc:
            logger.exception("JD parse error")
            self.showError("Parse Error", f"Could not parse JD: {exc}")
            self._jd_data = {"error": str(exc)}
            self.documentsChanged.emit()

    @Slot()
    def clearResume(self):
        if self._resume_path:
            delete_file(self._resume_path)
        self._resume_path = None
        self._resume_data = None
        self._clear_skill_analysis()
        self.resumeUploaded.emit()
        self.documentsChanged.emit()
        self.toastMessage.emit("Resume cleared. You can upload a new resume.")

    @Slot()
    def clearJd(self):
        if self._jd_path:
            delete_file(self._jd_path)
        self._jd_path = None
        self._jd_data = None
        self._clear_skill_analysis()
        self.jdUploaded.emit()
        self.documentsChanged.emit()
        self.toastMessage.emit("Job Description cleared. You can upload a new JD.")

    # ---------------------------------------------------------
    # Interview
    # ---------------------------------------------------------

    @Slot()
    def endInterview(self):
        self.currentPage = "reports"

        self.toastMessage.emit(
            "Interview ended early. "
            "A partial report was generated."
        )

    # ---------------------------------------------------------
    # Errors
    # ---------------------------------------------------------

    @Slot(str, str)
    def showError(self, title, message):
        self.errorOccurred.emit(
            title,
            message
        )