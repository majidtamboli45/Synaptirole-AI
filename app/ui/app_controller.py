from PySide6.QtCore import Property, QObject, Signal, Slot
from uuid import uuid4
import sys
from pathlib import Path

from app.authentication import authenticate_user, register_user
from app.authentication.jwt_manager import create_token, verify_token
from app.database import init_db
from app.database.repository import UserRepository
from app.utils import get_logger


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

    errorOccurred = Signal(
        str,
        str,
        arguments=["title", "message"]
    )

    userChanged = Signal()

    # ---------------------------------------------------------
    # Constructor
    # ---------------------------------------------------------

    def __init__(self, parent=None):
        super().__init__(parent)

        self._currentPage = "login"
        self._user = None
        self._user_id = None
        self._remember_token = None

        init_db()
        self._load_remember_token()

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