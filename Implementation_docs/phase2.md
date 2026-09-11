# Phase 2: Document Processing & Text Extraction — Implementation Summary

## Phase Overview
**Phase Number:** 2  
**Phase Name:** Document Processing & Text Extraction  
**Status:** ✅ Complete — Verified & Built  

---

## Factors Built / Implemented

### 1. PyMuPDF Integration for PDF Parsing (`app/resume/pdf_parser.py`)
- **Full rewrite** with robust error handling:
  - Validates file existence and non-empty before processing
  - Handles **encrypted/password-protected PDFs** — attempts empty-password unlock, raises clear error if locked
  - Handles **corrupted PDFs** — catches open/parse failures with descriptive messages
  - Handles **image-only PDFs** — logs warning when no text is extractable
  - Custom `PDFParseError` exception class for structured error propagation
  - Proper `doc.close()` in `finally` block to prevent resource leaks
  - Logs page count and character count per extraction

### 2. python-docx Integration for DOCX Parsing (`app/resume/docx_parser.py`)
- **Full rewrite** with robust error handling:
  - Validates file existence and non-empty before processing
  - Handles **corrupted DOCX** files — catches open failures with descriptive messages
  - Extracts text from both **paragraphs AND tables** (cells joined with ` | `)
  - Custom `DOCXParseError` exception class for structured error propagation
  - Logs character count per extraction

### 3. Unified Text Extraction Pipeline (`app/resume/text_extractor.py`) — **NEW FILE**
- Central `extract_text(file_path) -> dict` function that:
  - Routes to correct parser based on file extension (`.pdf`, `.docx`, `.doc`, `.txt`)
  - Validates file type against `SUPPORTED_EXTENSIONS`
  - Returns structured result: `raw_text`, `cleaned_text`, `char_count`, `word_count`, `page_count`, `file_extension`, `file_name`
  - `_clean_text()` — normalizes whitespace, collapses excessive newlines
  - `_estimate_pages()` — uses PyMuPDF to count PDF pages, defaults to 1 for other formats
  - Custom `TextExtractionError` exception for pipeline-level errors
  - Propagates `PDFParseError` / `DOCXParseError` as `TextExtractionError`

### 4. Enhanced Resume Analyzer (`app/resume/resume_analyzer.py`)
- Now uses `text_extractor.extract_text()` instead of directly calling parsers
- **New extractions added:**
  - `extract_name()` — detects candidate name from first line of resume
  - `extract_current_role()` — detects job title/role from early lines
  - `extract_experience_years()` — regex-based detection of "X+ Years" patterns
- Returns enriched dict with: `name`, `current_role`, `experience_years`, `skills`, `education`, `experience`, `raw_text`, `cleaned_text`, `char_count`, `word_count`, `page_count`
- Graceful error handling — returns partial results with `error` key on failure

### 5. Enhanced JD Parser (`app/job/jd_parser.py`)
- Now uses `text_extractor.extract_text()` for extraction
- **New extractions added:**
  - `_extract_company()` — heuristic company detection from JD lines
  - `_extract_experience_required()` — regex-based "X+ Years" / "X to Y Years" detection
  - `_extract_employment_type()` — detects Full-Time/Part-Time/Contract/etc.
  - `extract_required_skills()` — delegates to `job_analyzer.py`
- Returns enriched dict with: `title`, `company`, `skills`, `experience_required`, `employment_type`, `raw_text`, `cleaned_text`, `char_count`, `word_count`, `page_count`

### 6. File Validation & Handling (`app/utils/file_handler.py`)
- **New `validate_file()` function:**
  - Extension whitelist: `{.pdf, .docx, .doc, .txt}`
  - Max file size: 10 MB (configurable)
  - Rejects empty files
  - Raises `FileValidationError` with descriptive messages
- `save_upload()` now calls `validate_file()` before writing
- **New `get_file_info()` helper** — returns dict with name, size, extension
- Added logging to save/delete operations

### 7. Resume/JD Upload in AppController (`app/ui/app_controller.py`)
- **New signals:** `resumeUploaded`, `jdUploaded`, `resumeParsed`, `jdParsed`
- **New QML properties (read from QML):**
  - Resume: `hasResume`, `resumeFileName`, `resumeName`, `resumeRole`, `resumeExperience`, `resumeSkills`, `resumeRawText`, `resumeStatus`
  - JD: `hasJd`, `jdFileName`, `jdTitle`, `jdCompany`, `jdExperienceRequired`, `jdEmploymentType`, `jdSkills`, `jdRawText`, `jdStatus`
  - Combined: `documentsReady`
- **New QML-callable slots:**
  - `uploadResume(file_url, original_name)` — saves file via `file_handler`, triggers parse
  - `uploadJd(file_url, original_name)` — saves file via `file_handler`, triggers parse
  - `clearResume()` — deletes file, clears data
  - `clearJd()` — deletes file, clears data
- Auto-parses after upload; emits toast with extraction stats

### 8. Resume & JD Upload UI (`app/ui/qml/ResumeJD.qml`) — **Full Rewrite**
- **Drag-and-drop upload zones** for both Resume and JD cards:
  - `DropArea` with `keys: ["text/uri-list"]`
  - Visual border highlight on drag-enter (`root.resumeDragging` / `root.jdDragging`)
  - Auto-uploads on drop via `App.uploadResume()` / `App.uploadJd()`
- **File picker fallback** via `FileDialog` with filters (PDF, DOCX, DOC, TXT)
- **Dynamic data binding** — all displayed data reads from `App` controller properties:
  - File name, status badge (Parsed/Error), extracted fields (name, role, experience, skills)
  - Skill chips rendered dynamically from comma-separated skill strings
  - "No file uploaded yet" placeholder when empty
- **Status indicators:**
  - Green "Parsed" badge when extraction succeeds
  - Red "Error" badge when parsing fails
  - Empty state with upload prompt and format info
- **Card actions:** Preview (opens raw text popup), Re-upload, Remove
- **Preview popup** now shows actual extracted `raw_text` instead of hardcoded sample
- **Upload & Parsing Status Banner** — dynamically updates based on document state
- **Step indicators** — dynamic completion based on `App.hasResume`, `App.resumeStatus`, etc.
- **"Proceed to Mock Interviews" banner** — only visible when `App.documentsReady`

### 9. Module API Cleanup (`app/resume/__init__.py`, `app/job/__init__.py`)
- **Removed duplicate code** — both `__init__.py` files previously re-implemented parser logic
- Now expose clean public API via imports:
  - `app.resume`: `extract_text`, `TextExtractionError`, `extract_text_from_pdf`, `PDFParseError`, `extract_text_from_docx`, `DOCXParseError`, `analyze_resume`
  - `app.job`: `parse_jd` function (simple) + `parse_job_description` from `jd_parser.py` (detailed)

---

## Changes Made in This Phase

| File | Change Type | Description |
|------|-------------|-------------|
| `app/resume/pdf_parser.py` | **Rewritten** | Added encrypted PDF handling, corrupted file handling, PDFParseError, resource cleanup, structured logging |
| `app/resume/docx_parser.py` | **Rewritten** | Added table extraction, corrupted file handling, DOCXParseError, structured logging |
| `app/resume/text_extractor.py` | **Created** | Unified text extraction pipeline with validation, cleaning, page counting |
| `app/resume/resume_analyzer.py` | **Rewritten** | Uses text_extractor, added name/role/experience extraction, structured output |
| `app/resume/__init__.py` | **Rewritten** | Clean API exports, removed duplicate parser logic |
| `app/job/__init__.py` | **Rewritten** | Clean API exports, removed duplicate parser logic |
| `app/job/jd_parser.py` | **Rewritten** | Uses text_extractor, added company/skills/experience/type extraction |
| `app/utils/file_handler.py` | **Enhanced** | Added validate_file(), FileValidationError, get_file_info(), logging |
| `app/ui/app_controller.py` | **Enhanced** | Added resume/JD upload/parse/clear slots, 15+ new QML properties, 4 new signals |
| `app/ui/qml/ResumeJD.qml` | **Full Rewrite** | Drag-drop upload, file picker, dynamic data binding, status badges, preview popup |

---

## Files Created / Modified

### New Files
- `app/resume/text_extractor.py` — Unified text extraction pipeline

### Modified Files
- `app/resume/pdf_parser.py` — Robust PDF parsing with error handling
- `app/resume/docx_parser.py` — Robust DOCX parsing with table support
- `app/resume/resume_analyzer.py` — Enhanced analysis with name/role/experience extraction
- `app/resume/__init__.py` — Clean module API
- `app/job/__init__.py` — Clean module API
- `app/job/jd_parser.py` — Enhanced JD parsing with skills/experience/type extraction
- `app/utils/file_handler.py` — File validation and enhanced utilities
- `app/ui/app_controller.py` — Resume/JD upload and parsing integration
- `app/ui/qml/ResumeJD.qml` — Full drag-drop upload UI with dynamic binding

---

## Architecture

```
User uploads file (drag-drop or file picker)
         │
         ▼
AppController.uploadResume() / uploadJd()
         │
         ▼
file_handler.save_upload() ← validates extension + size
         │
         ▼
resume_analyzer.analyze_resume() / jd_parser.parse_job_description()
         │
         ▼
text_extractor.extract_text() ← unified pipeline
         │
         ├── pdf_parser.extract_text_from_pdf()   (PyMuPDF)
         ├── docx_parser.extract_text_from_docx()  (python-docx)
         └── txt direct read
         │
         ▼
Extracted data → AppController properties → QML dynamic binding
```

---

## Bug Fix: Upload Not Working (QUrl.toLocalPath)

### Issue
After initial Phase 2 implementation, trying to upload a resume/JD via the file picker silently failed — the UI kept showing "No file uploaded yet".

### Root Cause
`app/ui/app_controller.py` used `QUrl(file_url).toLocalPath()` in both `uploadResume()` and `uploadJd()`. **PySide6 does not expose `QUrl.toLocalPath()`** — the correct method is `QUrl.toLocalFile()`. Every upload call raised an `AttributeError` inside the `try` block, which triggered the generic error dialog instead of completing the upload.

### Fix
```python
# BEFORE (broken — AttributeError in PySide6)
local_path = QUrl(file_url).toLocalPath()

# AFTER (correct)
local_path = QUrl(file_url).toLocalFile()
```
Applied in both `uploadResume()` and `uploadJd()`.

### Verification
Headless QML→Python end-to-end tests (offscreen QGuiApplication + QQmlApplicationEngine):
- **Resume upload:** QML calls `App.uploadResume(url, name)` → file saved → parsed → `resumeStatus='parsed'`, name="Aarav Mehta", 3 skills extracted. ✅
- **JD upload:** QML calls `App.uploadJd(url, name)` → file saved → parsed → `jdStatus='parsed'`, title="ML Engineer", 3 skills extracted. ✅
- `python main.py --selftest` → `SELFTEST_OK`. ✅

---

## Feature: Document Type Validation (Resume/JD Classification)

### Issue
Users could upload a JD into the Resume slot and a Resume into the JD slot — the parser accepted either file type in either slot and "fetched information" from the wrong document.

### Solution
Added **document classification** so each slot only accepts its own document type:

| File | Change Type | Description |
|------|-------------|-------------|
| `app/utils/document_classifier.py` | **Created** | Keyword-score based classifier returning `'resume'`, `'jd'`, or `'unknown'` |
| `app/ui/app_controller.py` | **Modified** | `_classify_file()` helper; `uploadResume()`/`uploadJd()` reject wrong document types before saving |

### How it works
- **Scoring:** Each document's text is scored against `RESUME_SIGNALS` and `JD_SIGNALS` weighted keywords (e.g. `work experience`=3, `projects`=2 for resumes; `responsibilities`=3, `qualifications`=3, `salary`=2 for JDs). Matches use word-boundary regex on lowercased text.
- **Decision:** `resume` if resume_score ≥ 3 and > jd_score; `jd` if jd_score ≥ 3 and > resume_score; otherwise `unknown`.
- **Enforcement:**
  - `uploadResume()`: rejects files classified as `jd` or `unknown` with a "Wrong File Type" error dialog — nothing is saved.
  - `uploadJd()`: rejects files classified as `resume` or `unknown` — nothing is saved.
  - Files pass **before `save_upload()`**, so wrong-type files are never written to `data/`.

### Verification (headless QML→Python)
| Scenario | Result |
|----------|--------|
| JD PDF uploaded to Resume slot | ✅ Rejected ("Wrong File Type"), `hasResume=False` |
| Resume PDF uploaded to JD slot | ✅ Rejected ("Wrong File Type"), `hasJd=False` |
| Resume PDF uploaded to Resume slot | ✅ Parsed, name extracted |
| JD PDF uploaded to JD slot | ✅ Parsed, title/company extracted |
| `python main.py --selftest` | ✅ SELFTEST_OK |

### Notes
- `unknown` documents (too generic to classify) are also rejected to enforce strict typing.
- Thresholds/weights are configurable constants in `document_classifier.py` (`RESUME_MIN_SCORE`, `JD_MIN_SCORE`, etc.).

---

## Bug Fix: Remove → Upload Breaks + Layout Misalignment

### Symptoms
After clicking **Remove** in the Resume or JD card:
- The "Upload Resume" / "Upload JD" button appeared pushed down / visually broken
- Both the old preview AND the empty-prompt showed simultaneously
- Re-upload and drag-drop appeared non-functional (layout issue, not a real code break)

### Root Causes (3 bugs)

**Bug 1 — Stale property bindings after Clear (`app_controller.py`)**
`resumeStatus` / `jdStatus` were wired to `notify=resumeParsed` / `notify=jdParsed`, but `clearResume()` / `clearJd()` only emitted `resumeUploaded` / `jdUploaded`. Result: after Remove, QML kept the old `resumeStatus="parsed"` binding **and** also showed the empty prompt (because `resumeFileName` DID update to `""`). Both sections rendered at once, doubling the card height and pushing the button row off-screen.

**Bug 2 — Broken `documentsReady` double-decorator**
```python
@Property(bool, notify=resumeUploaded)
@Property(bool, notify=jdUploaded)
def documentsReady(self): ...
```
Only the outer `@Property` is registered; `documentsReady` only notified on `resumeUploaded`, not `jdUploaded`. Status banner / step-3 / "Proceed" card were stale after JD changes.

**Bug 3 — Static step-indicator Repeater model**
```qml
Repeater {
    model: [
        { n: 1, done: (App?.hasResume && App?.hasJd) },   // computed once at load
        ...
    ]
}
```
A JS array literal is evaluated once — the step badges never updated after uploads/removals.

### Fix

**`app_controller.py`**
- Added dedicated `documentsChanged = Signal()`.
- All resume/JD properties (`resumeStatus`, `resumeFileName`, `resumeName`, `resumeSkills`, `jdStatus`, `jdFileName`, `documentsReady`, etc.) now use `notify=documentsChanged`.
- `documentsChanged.emit()` added at every state transition: after save, after parse (success and error), and in both `clearResume()` / `clearJd()`.
- Removed duplicate `@Property` decorator on `documentsReady`.

**`ResumeJD.qml`**
- Step-indicator Repeater: replaced static JS array with a delegate `id: stepItem` and a `stepDone` live binding that reads `App?.resumeStatus` / `App?.jdStatus` / `App?.documentsReady` directly (re-evaluated automatically).
- Drag-highlight overlays (`z:10`) now set `visible: false` when not dragging and `enabled: false` to guarantee they never block clicks/drops.

### Verification
Headless upload → clear → re-upload cycle (6 steps):
| Step | Action | State |
|------|--------|-------|
| 1 | Upload resume | `hasResume=True`, `status=parsed`, name=PRIYA PATEL ✅ |
| 2 | Clear resume | `hasResume=False`, `status=none`, fileName="" ✅ |
| 3 | Re-upload resume | `hasResume=True`, `status=parsed`, name=PRIYA PATEL ✅ |
| 4 | Upload JD | `hasJd=True`, `status=parsed`, title=ML Engineer ✅ |
| 5 | Clear JD | `hasJd=False`, `status=none`, fileName="" ✅ |
| 6 | Re-upload JD | `hasJd=True`, `status=parsed`, title=ML Engineer ✅ |
| — | documentsReady | `True` ✅ |

`python main.py --selftest` → `SELFTEST_OK` ✅

---

## Bug Fix: Experience Years Shown When Resume Has No Experience

### Symptom
The Resume card's **Experience** field displayed a value (e.g. `3+ Years`) even when the uploaded resume contained no work-experience section at all.

### Root Cause
`_infer_experience_years_from_dates()` in `app/resume/resume_analyzer.py` scanned the **entire document** and summed **every** `20XX to 20XX/Present` date range it found. Any date range located outside the work-experience section — e.g. an education span like `B.Tech | 2021 to 2024`, project timelines, or certifications — was interpreted as experience and reported as `3+ Years` (or `4+ Years`, etc.).

### Fix (`app/resume/resume_analyzer.py`)
- Added `_extract_experience_section()` — isolates only the text under a work-experience heading (`PROFESSIONAL EXPERIENCE`, `WORK EXPERIENCE`, `EMPLOYMENT HISTORY`, `WORK HISTORY`, `CAREER HISTORY`, `WORK SUMMARY`, or a standalone `EXPERIENCE` line), terminated by the next major section (Education, Projects, Skills, Certifications, etc.).
- `extract_experience_years()` now:
  1. Keeps explicit phrase detection globally (e.g. `3+ years of experience` in the summary is a legitimate self-claim).
  2. Runs date-based inference **only on the extracted experience section**.
  3. Returns `""` when the resume has no experience section — nothing is fabricated.
- `_infer_experience_years_from_dates()` now **merges overlapping date intervals** so concurrent roles are not double-counted (e.g. two parallel jobs `2020–2026` + `2022–Present` = 6 years, not 10).

### Verification
- Fresher resume (education `2021 to 2024`, project `2023 to 2024`, no experience section): `resumeExperience = ""` ✅ (previously fabricated a year value)
- Sample resumes with a genuine experience section: still `3+ Years` ✅
- Overlapping concurrent roles: merged correctly ✅
- `python main.py --selftest` → `SELFTEST_OK` ✅

---

## Verification

### Python Syntax Check
All modified Python files pass `py_compile`:
```bash
python -c "import py_compile; py_compile.compile('app/resume/pdf_parser.py', doraise=True)"
python -c "import py_compile; py_compile.compile('app/resume/docx_parser.py', doraise=True)"
python -c "import py_compile; py_compile.compile('app/resume/text_extractor.py', doraise=True)"
python -c "import py_compile; py_compile.compile('app/resume/resume_analyzer.py', doraise=True)"
python -c "import py_compile; py_compile.compile('app/job/jd_parser.py', doraise=True)"
python -c "import py_compile; py_compile.compile('app/utils/file_handler.py', doraise=True)"
python -c "import py_compile; py_compile.compile('app/ui/app_controller.py', doraise=True)"
```
**Result:** ✅ All files compile without errors

### Application Run Test
```bash
python main.py --selftest
```
**Expected:** ✅ SELFTEST_OK (exit code 0)

### Manual Verification Steps
1. Launch app → Login → Navigate to Resume & JD page
2. **Empty state:** Both cards show "No file uploaded yet" with upload prompt
3. **Drag-drop:** Drag a PDF onto the Resume card → file is saved, parsed, data appears
4. **File picker:** Click "Upload JD" → file dialog opens → select DOCX → parsed
5. **Status banner:** Turns green when both documents parsed successfully
6. **Step indicators:** Update dynamically as documents are uploaded/parsed
7. **Preview:** Click "Preview Resume" → popup shows actual extracted text
8. **Re-upload:** Click "Re-upload" → file dialog → new file replaces old one
9. **Remove:** Click "Remove" → file deleted, card resets to empty state
10. **Proceed banner:** Appears only when both resume and JD are parsed

---

## Dependencies on User

**Required for full testing:**
- Sample resume PDFs (3-5) — various formats (text-based, image-only, encrypted)
- Sample JD PDFs/DOCX (3-5) — various formats
- Expected extracted fields for validation (name, skills, experience, etc.)

**Already satisfied:**
- PyMuPDF (`pymupdf`) — in requirements.txt
- python-docx — in requirements.txt
- No new pip dependencies required for Phase 2

---

## Next Phase
Phase 3: Skill Matching & Analysis — requires the extracted text from Phase 2 as input, plus skill ontology data (O*NET, ESCO).
