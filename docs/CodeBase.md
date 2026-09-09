# SynaptiRole-AI — Complete Codebase Documentation

> **Last Updated:** September 2026
> **Project Name:** SynaptiRole-AI (also branded as "CareerPilot AI")
> **Tagline:** AI-Powered Interview Copilot

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [Technology Stack](#2-technology-stack)
3. [Directory Structure](#3-directory-structure)
4. [Entry Point — main.py](#4-entry-point--mainpy)
5. [Configuration — app/config.py](#5-configuration--appconfigpy)
6. [Database Layer](#6-database-layer)
7. [Authentication Module](#7-authentication-module)
8. [Resume Module](#8-resume-module)
9. [Job Description Module](#9-job-description-module)
10. [Skills Module](#10-skills-module)
11. [Interview Module](#11-interview-module)
12. [LLM Module](#12-llm-module)
13. [RAG Module (Retrieval-Augmented Generation)](#13-rag-module-retrieval-augmented-generation)
14. [Audio Module](#14-audio-module)
15. [Vision Module](#15-vision-module)
16. [Scoring Module](#16-scoring-module)
17. [Explainability Module](#17-explainability-module)
18. [Skill Gap & Improvement Module](#18-skill-gap--improvement-module)
19. [Utilities](#19-utilities)
20. [UI Layer — PySide6 + QML](#20-ui-layer--pyside6--qml)
21. [QML Components Reference](#21-qml-components-reference)
22. [Key Application Flows](#22-key-application-flows)
23. [Data & Assets](#23-data--assets)
24. [Build & Packaging](#24-build--packaging)
25. [Environment Variables](#25-environment-variables)

---

## 1. Project Overview

**SynaptiRole-AI** is a **Windows desktop application** that helps job candidates prepare for technical interviews. It uses AI/ML to:

1. **Parse** the user's resume and a target job description.
2. **Analyze skill gaps** using semantic matching (Sentence-BERT + cosine similarity).
3. **Conduct an adaptive personalized text-based interview** — generates personalized questions via a pretrained instruction-tuned LLM.
4. **Capture audio + video** while the user answers questions.
5. **Evaluate answers** using LLM answer evaluation, audio feature analysis, and video/body language analysis.
6. **Verify technical claims** using RAG (Retrieval-Augmented Generation) against O*NET + ESCO + curated technical documentation.
7. **Produce a final performance score** using XGBoost.
8. **Explain the score** using SHAP (SHapley Additive exPlanations).
9. **Provide skill gap analysis and areas of improvement** based on identified skill gaps.

The application runs locally using pretrained models — no web server or cloud backend is required. OpenAI API usage is optional.

---

## 2. Technology Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| **UI Framework** | PySide6 + QML (Qt Quick) | Desktop GUI with modern declarative UI |
| **Packaging** | PyInstaller | Build standalone `.exe` for Windows |
| **Database** | SQLite | Local persistent storage (WAL mode, FK constraints) |
| **LLM** | Pretrained instruction-tuned LLM: Mistral / Llama / Qwen (optional: OpenAI GPT API) | Personalized question generation, answer evaluation, RAG verification |
| **Embeddings** | Sentence-BERT (`all-MiniLM-L6-v2`) | Semantic skill matching, vector embeddings |
| **Vector Search** | FAISS (`IndexFlatL2`) | Fast nearest-neighbor search for RAG knowledge retrieval |
| **ML Model** | XGBoost | Final interview scoring regression model |
| **Explainability** | SHAP | Explains "why" the user got a particular score |
| **Vision** | MediaPipe + OpenCV | Gaze/camera orientation, head movement, hand gestures, shoulder/posture analysis |
| **Audio** | Librosa + Whisper | Audio feature extraction + speech-to-text |
| **Auth** | PyJWT (HS256) + bcrypt | JWT tokens + password hashing |
| **NLP** | spaCy | Text preprocessing |
| **Ontology** | O*NET + ESCO | Occupation-skill mappings for RAG knowledge base (plus curated technical documentation) |

---

## 3. Directory Structure

```
Synaptirole-AI/
│
├── main.py                         # Application entry point
├── requirements.txt                # Python dependencies (22 packages)
├── SynaptiRoleAI.spec              # PyInstaller build specification
│
├── app/                            # Main application source code
│   ├── config.py                   # Centralized configuration (paths, keys, model names)
│   │
│   ├── database/                   # Database layer (SQLite)
│   │   ├── __init__.py             # Connection management, WAL mode, init_db() DDL
│   │   ├── models.py               # 7 dataclass models (User, Resume, JD, Interview, etc.)
│   │   └── repository.py           # 7 repository classes (CRUD operations)
│   │
│   ├── authentication/             # User authentication
│   │   ├── __init__.py             # register_user(), authenticate_user(), bcrypt hashing
│   │   └── jwt_manager.py          # create_token(), verify_token() using PyJWT
│   │
│   ├── resume/                     # Resume parsing & analysis
│   │   ├── __init__.py
│   │   ├── pdf_parser.py           # PDF text extraction (PyMuPDF)
│   │   ├── docx_parser.py          # DOCX text extraction (python-docx)
│   │   └── resume_analyzer.py      # Skill/experience/education extraction from resume text
│   │
│   ├── job/                        # Job description parsing & analysis
│   │   ├── __init__.py
│   │   ├── jd_parser.py            # JD text extraction (PDF/DOCX)
│   │   └── job_analyzer.py         # Required/preferred skill extraction from JD text
│   │
│   ├── skills/                     # Skill matching & gap analysis
│   │   ├── __init__.py
│   │   ├── skill_extractor.py      # Extract skills from raw text
│   │   ├── skill_matcher.py        # Match resume skills vs JD skills
│   │   ├── skill_gap.py            # Compute skill gaps (matched, missing, partial)
│   │   ├── sbert_model.py          # Sentence-BERT model loading & embedding generation
│   │   └── ontology.py             # O*NET/ESCO ontology lookup for skill normalization
│   │
│   ├── interview/                  # Interview orchestration
│   │   ├── __init__.py
│   │   ├── adaptive_interview.py   # AdaptiveInterviewEngine — manages interview lifecycle
│   │   ├── question_engine.py      # QuestionEngine — generates questions using LLM
│   │   └── followup_question.py    # Follow-up question generation based on answers
│   │
│   ├── llm/                        # Pretrained LLM integration
│   │   ├── __init__.py
│   │   ├── llm_manager.py          # Pretrained LLM client management (Mistral/Llama/Qwen, optional OpenAI)
│   │   ├── pretrained_model.py     # Low-level wrapper around pretrained instruction-tuned LLM
│   │   ├── question_generator.py   # Generates interview questions via pretrained LLM
│   │   └── answer_evaluator.py     # Evaluates language/answer quality via pretrained LLM
│   │
│   ├── rag/                        # Retrieval-Augmented Generation
│   │   ├── __init__.py
│   │   ├── document_loader.py      # Load documents from knowledge base
│   │   ├── embedding_model.py      # Generate embeddings for documents
│   │   ├── vector_database.py      # FAISS index creation & management
│   │   ├── retriever.py            # Retrieve relevant documents for a query
│   │   └── knowledge_verifier.py   # Verify candidate's technical claims via RAG + LLM
│   │
│   ├── audio/                      # Audio capture & analysis
│   │   ├── __init__.py
│   │   ├── audio_analyzer.py       # Orchestrates audio recording during answers
│   │   ├── audio_features.py       # Extract features: speaking rate, pauses, fillers, pitch, energy
│   │   └── speech_to_text.py       # Whisper-based speech-to-text transcription
│   │
│   ├── vision/                     # Video capture & analysis
│   │   ├── __init__.py
│   │   ├── camera.py               # Camera capture management (OpenCV)
│   │   ├── face_orientation.py     # Detect if user is facing the camera
│   │   ├── gaze_analysis.py        # Eye gaze tracking (MediaPipe)
│   │   ├── hand_gestures.py        # Hand movement detection (MediaPipe)
│   │   ├── head_pose.py            # Head pose estimation (nodding, shaking)
│   │   ├── posture_analysis.py     # Shoulder/back posture analysis
│   │   └── video_analyzer.py       # Orchestrates all video analysis modules
│   │
│   ├── scoring/                    # Score computation pipeline
│   │   ├── __init__.py
│   │   ├── feature_engineering.py  # Build engineered feature vector from answer/audio/video/skill/RAG features
│   │   ├── xgboost_model.py        # XGBoost regression model — final interview score
│   │   └── final_score.py          # Compute and store final interview score
│   │
│   ├── explainability/             # Score explanation
│   │   ├── __init__.py
│   │   ├── shap_analysis.py        # SHAP analysis on feature contributions
│   │   └── explanation.py          # Format SHAP values into human-readable explanations
│   │
│   ├── recommendation/             # Improvement suggestions
│   │   ├── __init__.py
│   │   ├── skill_gap_analysis.py   # Analyze skill gaps for recommendations
│   │   ├── improvement_engine.py   # Generate improvement priorities (HIGH/MEDIUM/LOW)
│   │   └── learning_recommendation.py # Suggest learning resources for each skill gap
│   │
│   ├── utils/                      # Shared utilities
│   │   ├── __init__.py             # get_logger() factory
│   │   ├── file_handler.py         # File I/O helpers
│   │   └── validators.py           # Input validation functions
│   │
│   └── ui/                         # User Interface
│       ├── app_controller.py       # QObject bridge between QML and Python (signals/slots)
│       ├── main_window.py          # QQmlApplicationEngine bootstrap
│       └── qml/
│           ├── Main.qml            # Root ApplicationWindow + StackView navigation
│           ├── Shell.qml           # Sidebar + StackLayout (9 pages)
│           ├── Login.qml           # Login/Signup form with role selection
│           └── components/         # 24 reusable QML components
│               ├── Theme.qml       # Singleton: colors, fonts, design tokens
│               ├── SideBar.qml     # Navigation sidebar
│               ├── AppButton.qml
│               ├── AppTextField.qml
│               ├── AppComboBox.qml
│               ├── Card.qml
│               ├── ScoreCard.qml
│               ├── SkillCard.qml
│               ├── DonutChart.qml
│               ├── BarsChart.qml
│               ├── LineChart.qml
│               ├── HBarRow.qml
│               ├── ProgressRing.qml
│               ├── SkillConstellation.qml
│               ├── QuestionPopup.qml
│               ├── ErrorDialog.qml
│               ├── PageHeader.qml
│               ├── ProfileChip.qml
│               ├── NotificationBell.qml
│               ├── MenuRow.qml
│               ├── ToggleRow.qml
│               ├── DropRow.qml
│               ├── DateRange.qml
│               └── qmldir
│
├── data/                           # Runtime data (mostly empty, populated at runtime)
│   ├── resumes/                    # Uploaded resume files (PDF/DOCX)
│   ├── job_descriptions/           # Uploaded JD files
│   ├── knowledge_base/             # Ontology datasets + technical docs for RAG
│   │   ├── O_NET/                  # O*NET occupation-skill mappings
│   │   ├── ESCO/                   # ESCO occupation-skill mappings
│   │   └── technical_docs/         # Curated technical documentation
│   └── remember_token.json         # Stored JWT for persistent login
│
├── database/
│   └── careerpilot.db              # SQLite database file
│
├── docs/                           # Project documentation
│   ├── requirements.md
│   ├── technology_working.md
│   ├── user_storyline.md
│   ├── Project.md
│   ├── Login.md / signup.md
│   ├── Dashboard.md
│   ├── Resume_and_jd.md
│   ├── interview.md
│   ├── Mock Interview.md
│   ├── Reports.md
│   ├── Profile.md
│   ├── Settings.md
│   ├── Account_Settings.md
│   └── Prototype.md
│
└── Implementation_docs/
    └── phase1.md                   # Phase 1 implementation summary
```

---

## 4. Entry Point — main.py

**File:** `main.py`

This is the application entry point. It does the following:

1. **Sets the Qt Quick Controls style** to "Basic" (clean native look).
2. **Checks for `--selftest` flag** — if present, runs the app in headless/offscreen mode and prints `SELFTEST_OK` (used for CI/testing).
3. **Creates `QGuiApplication`** — the PySide6 application instance.
4. **Instantiates `MainWindow`** — which loads the QML engine and connects the Python backend.
5. **Installs a global exception handler** (`sys.excepthook`) that logs unhandled exceptions.
6. **Runs the event loop** via `window.run(app)`.

```python
# Simplified flow:
app = QGuiApplication(sys.argv)
window = MainWindow()     # Loads QML, connects AppController
window.run(app)           # Shows maximized, enters event loop
```

---

## 5. Configuration — app/config.py

**File:** `app/config.py`

This file centralizes ALL configuration for the application. It auto-detects whether running from source or a packaged `.exe`, and creates all required directories at import time.

| Variable | Default | Purpose |
|----------|---------|---------|
| `BASE_DIR` | Project root | Root directory for all paths |
| `DATA_DIR` | `base/data` | Runtime data storage |
| `MODEL_DIR` | `base/models` | Trained models (FAISS index, XGBoost) |
| `DB_DIR` | `base/database` | SQLite database directory |
| `OUTPUT_DIR` | `base/output` | Generated reports |
| `UPLOAD_DIR` | `data/resumes` | Uploaded resume files |
| `JD_DIR` | `data/job_descriptions` | Uploaded JD files |
| `KNOWLEDGE_DIR` | `data/knowledge_base` | RAG knowledge base |
| `DB_PATH` | `database/careerpilot.db` | SQLite database path |
| `JWT_SECRET` | env `CP_JWT_SECRET` | JWT signing secret |
| `JWT_ALGORITHM` | `HS256` | JWT algorithm |
| `JWT_EXPIRY_HOURS` | `24` | Token validity duration |
| `LLM_MODEL` | env `CP_LLM_MODEL` / `mistral-7b-instruct` | Pretrained LLM model name (Mistral / Llama / Qwen) |
| `OPENAI_API_KEY` | env `OPENAI_API_KEY` | Optional — OpenAI API key (only if OpenAI GPT backend used) |
| `EMBEDDING_MODEL` | env / `all-MiniLM-L6-v2` | Sentence-BERT model |
| `FAISS_INDEX_PATH` | `models/faiss_index` | FAISS index file path |
| `WHISPER_MODEL` | env / `base` | Whisper model size |
| `XGBOOST_MODEL_PATH` | `models/xgboost/score_model.pkl` | XGBoost model path |
| `LOG_LEVEL` | env `CP_LOG_LEVEL` / `INFO` | Logging verbosity |
| `LOG_DIR` | `base/logs` | Log file directory |

---

## 6. Database Layer

### 6.1 Connection Management — `app/database/__init__.py`

- Uses a **singleton connection pattern** (`_connection` global variable).
- Enables **WAL (Write-Ahead Logging)** mode for better concurrent read performance.
- Enables **foreign key constraints**.
- Provides a **`get_cursor()` context manager** that auto-commits on success and rolls back on error.
- **`init_db()`** creates all 7 tables using `CREATE TABLE IF NOT EXISTS`.

### 6.2 Data Models — `app/database/models.py`

All models are Python **dataclasses** with default values:

| Model | Key Fields | Purpose |
|-------|-----------|---------|
| **User** | id, name, email, password_hash, role, phone, location, avatar_path | User account |
| **Resume** | id, user_id, filename, file_path, raw_text, skills[], education[], experience[] | Parsed resume data |
| **JobDescription** | id, user_id, title, company, file_path, raw_text, required_skills[], preferred_skills[] | Parsed JD data |
| **Interview** | id, user_id, resume_id, jd_id, title, role, total_questions, status, score, duration_seconds | Interview session |
| **InterviewQuestion** | id, interview_id, question_index, question_text, candidate_answer, answer_audio_path, answer_video_path, transcript, answer_score, audio_score, video_score, rag_verification, response_duration_seconds | Individual Q&A |
| **SkillAnalysis** | id, user_id, resume_id, jd_id, matched_skills[], missing_skills[], partial_skills[], match_score | Skill gap analysis results |
| **Report** | id, interview_id, user_id, overall_score, answer_score, audio_score, video_score, skill_match_score, strengths[], weaknesses[], recommendations[], shap_values{} | Final performance report |

### 6.3 Repository Pattern — `app/database/repository.py`

Each model has a corresponding **Repository class** with static methods for CRUD operations:

| Repository | Key Methods |
|-----------|-------------|
| `UserRepository` | `create()`, `get_by_id()`, `get_by_email()`, `update()`, `delete()` |
| `ResumeRepository` | `create()`, `get_by_user()`, `get_by_id()`, `delete()` |
| `JDRepository` | `create()`, `get_by_user()`, `get_by_id()`, `delete()` |
| `InterviewRepository` | `create()`, `get_by_user()`, `get_by_id()`, `update()`, `delete()` |
| `InterviewQuestionRepository` | `create()`, `get_by_interview()`, `update_answer()` |
| `SkillAnalysisRepository` | `create()`, `get_latest_by_user()` |
| `ReportRepository` | `create()`, `get_by_interview()`, `get_by_user()` |

**Note:** List/array fields (skills, education, experience, etc.) are stored as JSON strings in SQLite and automatically serialized/deserialized by the repository.

---

## 7. Authentication Module

**Files:** `app/authentication/__init__.py`, `app/authentication/jwt_manager.py`

### 7.1 Password Security

- Passwords are hashed using **bcrypt** with auto-generated salt.
- `hash_password(password)` → bcrypt hash string
- `verify_password(password, hash)` → boolean

### 7.2 Registration

```
register_user(name, email, password, role) → (success: bool, message: str)
```

1. Checks if email already exists in database.
2. If not, hashes the password and creates a new `User` record.
3. Returns success status and a message.

### 7.3 Login

```
authenticate_user(email, password) → (success: bool, message: str, user: User|None)
```

1. Looks up user by email.
2. Verifies password against stored bcrypt hash.
3. Returns the `User` object on success.

### 7.4 JWT Token Management

- **`create_token(user_id, email)`** → JWT string with `user_id`, `email`, `exp` (24h), `iat` claims, signed with HS256.
- **`verify_token(token)`** → decoded payload dict or `None` (handles expiry and invalid tokens).

### 7.5 Remember Me

The `AppController` stores the JWT in `data/remember_token.json`. On app startup, it tries to load and verify this token to auto-login the user.

---

## 8. Resume Module

**Files:** `app/resume/pdf_parser.py`, `app/resume/docx_parser.py`, `app/resume/resume_analyzer.py`

| File | Purpose |
|------|---------|
| `pdf_parser.py` | Extracts raw text from PDF files using **PyMuPDF** (`fitz`) |
| `docx_parser.py` | Extracts raw text from DOCX files using **python-docx** |
| `resume_analyzer.py` | Analyzes raw resume text to extract **skills**, **education**, and **work experience** using NLP (spaCy) |

**Flow:** Upload PDF/DOCX → extract raw text → analyze text → store structured data (skills, education, experience) in the database.

---

## 9. Job Description Module

**Files:** `app/job/jd_parser.py`, `app/job/job_analyzer.py`

| File | Purpose |
|------|---------|
| `jd_parser.py` | Extracts raw text from JD files (supports PDF/DOCX) |
| `job_analyzer.py` | Parses JD text to extract **required skills** and **preferred skills** |

---

## 10. Skills Module

**Files:** `app/skills/` (6 files)

This module performs **semantic skill matching** between the user's resume and the target job description.

> **Distinction:** FAISS is used for **RAG knowledge retrieval**; skill matching is handled by **Sentence-BERT + cosine similarity**.

| File | Purpose |
|------|---------|
| `sbert_model.py` | Loads the **Sentence-BERT** model (`all-MiniLM-L6-v2`) and generates sentence embeddings |
| `skill_extractor.py` | Extracts skills from raw text using NLP techniques |
| `skill_matcher.py` | Compares resume skills against JD skills using **cosine similarity** of embeddings |
| `skill_gap.py` | Computes the gap: **matched skills**, **missing skills**, **partial matches** |
| `ontology.py` | Maps skills to standardized **O*NET** and **ESCO** occupation-skill ontologies |

**How it works:**
1. Extract skills from resume text and JD text separately.
2. Generate Sentence-BERT embeddings for each skill.
3. Compute pairwise cosine similarity between resume skills and JD skills.
4. Skills with similarity > threshold → **matched**.
5. JD skills with no close match → **missing**.
6. JD skills with partial similarity → **partial**.
7. Compute overall `match_score`.

---

## 11. Interview Module

**Files:** `app/interview/` (4 files)

| File | Purpose |
|------|---------|
| `adaptive_interview.py` | **AdaptiveInterviewEngine** — manages the interview lifecycle: start, iterate through questions, handle responses, end |
| `question_engine.py` | **QuestionEngine** — generates interview questions using the LLM, personalized based on skill gaps |
| `followup_question.py` | Generates **follow-up questions** based on the candidate's previous answer |

**Interview Flow:**
1. User starts an interview session (linked to a resume + JD).
2. `AdaptiveInterviewEngine` initializes with the user's skill gap data.
3. `QuestionEngine` generates personalized questions via a pretrained instruction-tuned LLM.
4. For each question:
   - Question is displayed to the user.
   - User speaks their answer (audio + video captured).
   - Answer is recorded, transcribed, and scored.
   - A follow-up question may be generated if the answer is weak.
5. After all questions, the interview ends and a report is generated.

---

## 12. LLM Module

**Files:** `app/llm/` (5 files)

| File | Purpose |
|------|---------|
| `llm_manager.py` | Manages the pretrained LLM client (loads/model selection: Mistral / Llama / Qwen; optional OpenAI GPT backend) |
| `pretrained_model.py` | Low-level wrapper around the pretrained instruction-tuned LLM (chat completion) |
| `question_generator.py` | Generates interview questions given: resume, JD, matched skills, skill gaps, target role, previous answer context |
| `answer_evaluator.py` | Evaluates the quality of a candidate's answer using the pretrained LLM (language quality + qualitative feedback) |

**LLM Usage:**
- **Question Generation:** Sends a system prompt + user context (resume, skills, gaps, role, previous answers) to generate personalized interview questions.
- **Answer Evaluation:** Sends the question + candidate's transcript to the LLM to evaluate language/answer quality and produce qualitative feedback.
- **RAG Verification:** Sends the candidate's technical claims + retrieved context documents for fact-checking.

The LLM evaluates the **language/answer quality** of responses; XGBoost produces the final numerical interview score from engineered features.

---

## 13. RAG Module (Retrieval-Augmented Generation)

**Files:** `app/rag/` (6 files)

RAG is used to **verify technical claims** made by the candidate during the interview.

| File | Purpose |
|------|---------|
| `document_loader.py` | Loads documents from the `data/knowledge_base/` directory (O*NET + ESCO + curated technical documentation) |
| `embedding_model.py` | Generates embeddings for loaded documents using Sentence-BERT |
| `vector_database.py` | Creates and queries a **FAISS** index (IndexFlatL2) for fast nearest-neighbor search |
| `retriever.py` | Given a query (candidate's answer), retrieves the most relevant knowledge base documents |
| `knowledge_verifier.py` | Combines retrieved documents with the LLM to **verify or refute** technical claims |

**RAG Knowledge Base:**

```
RAG Knowledge Base
├── O*NET
├── ESCO
├── Curated Technical Documentation
└── Interview/Technical Reference Material
```

**RAG Flow:**
1. On startup, load all documents (O*NET + ESCO + curated technical documentation) from `data/knowledge_base/`.
2. Generate embeddings and build a FAISS index.
3. During interview, when a candidate makes a technical claim:
   - Embed the claim and query the FAISS index.
   - Retrieve top-K relevant documents.
   - Send the claim + retrieved context to the LLM for verification.
   - LLM returns: "verified" / "partially correct" / "incorrect" with explanation.

---

## 14. Audio Module

**Files:** `app/audio/` (4 files)

| File | Purpose |
|------|---------|
| `audio_analyzer.py` | Orchestrates audio recording during interview answers (uses `sounddevice`) |
| `audio_features.py` | Extracts features from recorded audio using **Librosa**: speaking rate, pause count/duration, filler words, pitch, energy, volume |
| `speech_to_text.py` | Transcribes spoken audio to text using **Whisper** (OpenAI's speech-to-text model) |

**Audio Features Extracted:**
- **Speaking rate** (words per minute)
- **Pause count** and **total pause duration**
- **Filler word count** (um, uh, like, you know, etc.)
- **Pitch** (mean, variance)
- **Energy/Volume** (mean, variance)
- **Response duration** (seconds)

---

## 15. Vision Module

**Files:** `app/vision/` (8 files)

| File | Purpose |
|------|---------|
| `camera.py` | Manages webcam capture using **OpenCV** |
| `face_orientation.py` | Detects camera/gaze orientation — if the user is facing the camera (not looking away) |
| `gaze_analysis.py` | Tracks **eye gaze direction** (looking at screen vs. looking away) using MediaPipe face mesh |
| `hand_gestures.py` | Detects **hand movements** and gestures (excessive fidgeting) using MediaPipe hands |
| `head_pose.py` | Estimates **head movement** (nodding, shaking, tilting) using MediaPipe face landmarks |
| `posture_analysis.py` | Analyzes **shoulder alignment** and overall body posture |
| `video_analyzer.py` | **Orchestrator** — runs all vision sub-modules and aggregates results into a single video analysis score |

> **Scope note:** The vision module does **NOT** perform facial-expression or emotion recognition (no FER-2013). It covers camera/gaze orientation, head movement, hand gestures, and shoulder/posture analysis only.

**Video Features Extracted:**
- **Camera/gaze orientation** (facing the camera %)
- **Eye gaze stability** (looking at screen %)
- **Head movement** (excessive nodding/shaking)
- **Hand activity** (fidgeting level)
- **Posture quality** (shoulder alignment, straightness)
- **Overall video score** (0-100)

---

## 16. Scoring Module

**Files:** `app/scoring/` (4 files)

This module generates the final interview performance score using **engineered multimodal features and XGBoost** — XGBoost is the learned scoring model, not a manually weighted fusion.

| File | Purpose |
|------|---------|
| `feature_engineering.py` | Builds an engineered feature vector from all sources |
| `xgboost_model.py` | Runs the **XGBoost regression model** — produces the final interview score |
| `final_score.py` | Stores the final score in the database |

**Feature Sources:**
- LLM-based answer evaluation (language/answer quality)
- Audio features from Librosa
- Video/behavioral features from OpenCV + MediaPipe
- Resume-JD skill match score
- RAG verification results

**Flow:**

```
Answer Analysis
       +
Audio Analysis
       +
Video Analysis
       +
Skill Gap / Matching
       +
RAG Verification
       ↓
Feature Engineering
       ↓
XGBoost
       ↓
Final Interview Score
       ↓
SHAP Explainability
```

**Feature Engineering:** `feature_engineering.py` builds an engineered feature vector from answer quality, audio characteristics, video/behavioral features, skill match, and RAG verification. It does not rely on a fixed-dimensional hard-coded vector.

XGBoost directly generates the final interview score from the engineered features.

---

## 17. Explainability Module

**Files:** `app/explainability/` (3 files)

| File | Purpose |
|------|---------|
| `shap_analysis.py` | Runs **SHAP** (TreeExplainer) on the XGBoost model to get per-feature contribution values |
| `explanation.py` | Converts raw SHAP values into **human-readable explanations** (positive factors + areas for improvement) |

**How it works:**
1. After scoring, the engineered feature vector is fed to SHAP's `TreeExplainer`.
2. Each feature gets a SHAP value indicating its positive or negative contribution.
3. `explanation.py` maps features to human-readable labels (e.g., "Speaking Rate", "Gaze/Camera Orientation", "Skill Match").
4. Features with positive SHAP values → **strengths**.
5. Features with negative SHAP values → **areas for improvement**.

---

## 18. Skill Gap & Improvement Module

**Files:** `app/recommendation/` (4 files)

| File | Purpose |
|------|---------|
| `skill_gap_analysis.py` | Analyzes the skill gap data to determine priority levels |
| `improvement_engine.py` | Generates **areas of improvement** with priority (HIGH / MEDIUM / LOW) |
| `learning_recommendation.py` | Suggests **learning resources** (courses, books, practice) for each skill gap |

**Priority Assignment:**
- **HIGH** — Skill is required by JD and completely missing from resume.
- **MEDIUM** — Skill is partially matched or preferred by JD.
- **LOW** — Skill is nice-to-have but not critical.

**Performance Report Output:**
```
Performance Report
├── Overall Score
├── Section-wise Performance
├── Strengths
├── Weaknesses
├── Skill Gap Analysis
└── Areas of Improvement
```

---

## 19. Utilities

**Files:** `app/utils/__init__.py`, `app/utils/file_handler.py`, `app/utils/validators.py`

| File | Purpose |
|------|---------|
| `__init__.py` | Exports `get_logger(name)` — creates a named logger with file + console handlers |
| `file_handler.py` | File I/O helper functions (read, write, ensure directories) |
| `validators.py` | Input validation (email format, password strength, file types) |

---

## 20. UI Layer — PySide6 + QML

### 20.1 Architecture

The UI uses a **hybrid architecture**:
- **Python backend** (`AppController`): handles business logic, database calls, authentication, signals.
- **QML frontend**: handles layout, styling, animations, user interaction.
- **Bridge**: `AppController` is injected into QML as a context property named `App`.

### 20.2 main_window.py

- Creates `QQmlApplicationEngine`.
- Injects `AppController` as context property `App`.
- Loads `Main.qml` as the root QML file.
- Shows the window maximized.

### 20.3 app_controller.py — The Brain

`AppController` is a `QObject` that exposes:

**Signals (QML listens to these):**
- `loginSuccess` — emitted after successful login/signup → triggers navigation to Shell.
- `logoutRequested` — emitted after logout → triggers navigation back to Login.
- `toastMessage(message)` — shows a toast notification.
- `errorOccurred(title, message)` — shows an error dialog.
- `pageRequested(page)` — notifies page changes.
- `userChanged` — emitted when user data changes.

**Properties (QML reads these):**
- `userName`, `userRole`, `userEmail`, `userPhone`, `userLocation`
- `memberSince`, `accountStatus`
- `isLoggedIn` (boolean)
- `currentPage` (read/write — controls navigation)

**Slots (QML calls these):**
- `login(email, password, remember_me)` — authenticates and navigates to dashboard.
- `signup(name, email, password, remember_me, role)` — registers, auto-logs in, navigates to dashboard.
- `logout()` — clears user, token, navigates to login.
- `navigate(page)` — changes the current page.
- `saveProfile()` / `saveAccount()` — updates user in database.
- `deleteAccount()` — deletes user and logs out.
- `showError(title, message)` — triggers error dialog.
- `loginWithGoogle()` / `loginWithGitHub()` — social login (optional future enhancement; not currently implemented).

### 20.4 Navigation Flow

```
Main.qml (StackView)
  ├── Login.qml (initial)
  └── Shell.qml (after login)
       └── StackLayout (9 pages, controlled by App.currentPage)
            ├── 0: Dashboard
            ├── 1: ResumeJD
            ├── 2: SkillAnalysis
            ├── 3: Interview
            ├── 4: PerformanceReport
            ├── 5: Profile
            ├── 6: SettingsPage
            ├── 7: AccountSettings
            └── 8: ActualInterview
```

### 20.5 QML Pages

| Index | Page Name | Description |
|-------|-----------|-------------|
| — | `Login.qml` | Login/Signup form with role selection, password validation, "Remember Me" |
| 0 | `Dashboard` | Welcome dashboard with stats and quick actions |
| 1 | `ResumeJD` | Upload and manage resume and job description files |
| 2 | `SkillAnalysis` | View skill gap analysis (matched, missing, partial skills) |
| 3 | `Interview` | Interview setup and personalized question generation |
| 4 | `PerformanceReport` | Final performance report with scores and charts |
| 5 | `Profile` | User profile view and editing |
| 6 | `SettingsPage` | Application settings (theme, notifications, etc.) |
| 7 | `AccountSettings` | Account-level settings (password, delete account, data export) |
| 8 | `ActualInterview` | Live interview session with question display, audio/video capture |

---

## 21. QML Components Reference

All components are in `app/ui/qml/components/`. The `Theme.qml` singleton provides consistent design tokens.

### Theme Singleton (`Theme.qml`)

| Property | Value | Purpose |
|----------|-------|---------|
| `fontName` | `"Segoe UI"` | Application font |
| `primary` | `#7c3aed` | Primary purple |
| `primaryDark` | `#5b21b6` | Darker purple |
| `bg` | `#f6f7fb` | Background color |
| `card` | `#ffffff` | Card background |
| `text` | `#0f172a` | Primary text |
| `muted` | `#64748b` | Secondary text |
| `green` / `red` / `amber` / `blue` | Various | Status colors |

### Component List

| Component | Purpose |
|-----------|---------|
| `AppButton.qml` | Reusable button with variants (primary, secondary, danger) |
| `AppTextField.qml` | Text input field with label and validation |
| `AppComboBox.qml` | Dropdown selection component |
| `Card.qml` | Container card with shadow and border |
| `ScoreCard.qml` | Displays a score metric (value + label + icon) |
| `SkillCard.qml` | Displays a skill with match status |
| `DonutChart.qml` | Circular progress/donut chart |
| `BarsChart.qml` | Vertical bar chart |
| `LineChart.qml` | Line chart for trends |
| `HBarRow.qml` | Horizontal bar row for comparison |
| `ProgressRing.qml` | Circular progress indicator |
| `SkillConstellation.qml` | Visual skill map/constellation |
| `QuestionPopup.qml` | Interview question display popup |
| `ErrorDialog.qml` | Error message dialog |
| `PageHeader.qml` | Page title and description header |
| `ProfileChip.qml` | User avatar + name chip |
| `NotificationBell.qml` | Notification bell icon with badge |
| `MenuRow.qml` | Navigation menu row item |
| `ToggleRow.qml` | Toggle/switch with label |
| `DropRow.qml` | Drag-and-drop upload row |
| `DateRange.qml` | Date range picker |
| `SideBar.qml` | Left navigation sidebar |

---

## 22. Key Application Flows

### 22.1 Signup Flow

```
User opens app → Login.qml displayed (signupMode = false)
  ↓
User clicks "Sign up" link → signupMode = true (form switches to signup)
  ↓
User fills: Full Name, Email, Password, Confirm Password, selects Role, accepts Terms
  ↓
Login.qml validates:
  - Name not empty
  - Password: 8+ chars, 1 uppercase, 1 number, 1 special char
  - Passwords match
  - Role selected
  - Terms accepted
  ↓
Calls App.signup(name, email, password, false, role)
  ↓
AppController.signup():
  - Calls register_user() → bcrypt hash → INSERT INTO users
  - Auto-calls authenticate_user() → returns User object
  - Creates JWT token via create_token()
  - Sets user in controller (_set_user)
  - Sets currentPage = "dashboard"
  - Emits loginSuccess signal
  ↓
Main.qml listens for loginSuccess → replaces StackView with Shell.qml
  ↓
Shell.qml loads with Dashboard as default page
```

### 22.2 Login Flow

```
User opens app → Login.qml displayed
  ↓
On startup, AppController checks for remember_token.json:
  - If valid JWT found → auto-login → skip to Shell.qml
  - If no token or expired → show Login.qml
  ↓
User enters Email + Password + optional "Remember Me"
  ↓
Login.qml validates: email format, password not empty
  ↓
Calls App.login(email, password, remember_me)
  ↓
AppController.login():
  - Calls authenticate_user() → bcrypt verify → returns User
  - Creates JWT token
  - If remember_me: saves token to remember_token.json
  - Sets user, sets currentPage = "dashboard"
  - Emits loginSuccess
  ↓
Main.qml replaces StackView with Shell.qml
  ↓
Welcome toast: "Welcome back, {name}!"
```

### 22.3 Logout Flow

```
User clicks Logout in SideBar
  ↓
App.logout():
  - Clears remember_token.json
  - Clears user object
  - Emits logoutRequested
  - Sets currentPage = "login"
  ↓
Main.qml listens for logoutRequested → replaces Shell with Login.qml
  ↓
Toast: "Logged out successfully."
```

### 22.4 Resume & JD Upload Flow

```
User navigates to ResumeJD page (index 1)
  ↓
User uploads Resume (PDF/DOCX):
  - File saved to data/resumes/
  - pdf_parser.py or docx_parser.py extracts raw text
  - resume_analyzer.py extracts: skills, education, experience
  - Stored in Resume table via ResumeRepository
  ↓
User uploads Job Description (PDF/DOCX):
  - File saved to data/job_descriptions/
  - jd_parser.py extracts raw text
  - job_analyzer.py extracts: required_skills, preferred_skills
  - Stored in JobDescription table via JDRepository
```

### 22.5 Skill Gap Analysis Flow

```
Resume + JD are uploaded
  ↓
Skills module activates:
  1. skill_extractor.py extracts skills from resume text
  2. job_analyzer.py has extracted skills from JD text
  3. sbert_model.py generates embeddings for both skill sets
  4. skill_matcher.py computes cosine similarity between each pair
  ↓
skill_gap.py classifies each JD skill:
  - similarity > threshold → MATCHED
  - 0 < similarity < threshold → PARTIAL
  - similarity ≈ 0 → MISSING
  ↓
SkillAnalysis record created:
  - matched_skills: [Python, Django, REST APIs, ...]
  - missing_skills: [Docker, Kubernetes, CI/CD, ...]
  - partial_skills: [AWS (has GCP experience)]
  - match_score: 0.65 (65%)
  ↓
Displayed on SkillAnalysis page with visual cards and charts
```

### 22.6 Interview Flow (Complete)

```
User navigates to Interview page → starts new interview
  ↓
AdaptiveInterviewEngine initializes:
  - Loads resume, JD, skill-gap and interview context
  - Sets total number of questions (default: 10)
  ↓
QuestionEngine generates first question via pretrained instruction-tuned LLM:
  - System prompt + user context → personalized question
  ↓
Question displayed in ActualInterview page (index 8)
  ↓
User speaks answer while:
  - Audio is recorded (sounddevice) → audio_features.py extracts features
  - Video is captured (OpenCV) → video_analyzer.py analyzes body language
  - Whisper transcribes speech to text
  ↓
Answer is evaluated:
  1. answer_evaluator.py evaluates the transcript (language/answer quality) via pretrained LLM
  2. audio_features.py computes audio score (0-100)
  3. video_analyzer.py computes video score (0-100)
  4. knowledge_verifier.py verifies technical claims via RAG
  ↓
Follow-up question may be generated if answer was weak
  ↓
Next question → repeat process
  ↓
After all questions:
  - feature_engineering.py builds the engineered feature vector
  - xgboost_model.py produces the final interview score
  - final_score.py stores the final score in Report table
  ↓
shap_analysis.py generates SHAP values
  ↓
explanation.py formats strengths and weaknesses
  ↓
learning_recommendation.py generates improvement suggestions
  ↓
Report displayed on PerformanceReport page with charts and explanations
```

### 22.7 Score Computation Flow (Detailed)

```
For each answered question:
  ┌─────────────────────────────────────────┐
  │  LLM Answer Evaluation (language quality)│
  │  Audio Features:                        │
  │    - Speaking rate                      │
  │    - Pause count & duration             │
  │    - Filler word count                  │
  │    - Pitch & energy                     │
  │  Video Features:                        │
  │    - Camera/gaze orientation %          │
  │    - Gaze stability %                   │
  │    - Posture quality                    │
  │    - Head movement                      │
  │    - Hand activity                      │
  │  Skill Match Score (from SkillAnalysis) │
  │  RAG Verification results               │
  └─────────────────────────────────────────┘
                    ↓
      Feature Engineering (engineered feature vector)
                    ↓
            XGBoost Model
         (learned scoring model)
                    ↓
           Final Interview Score (0-100)
                    ↓
              SHAP Analysis
                    ↓
        Strengths + Areas of Improvement
                    ↓
         Learning Recommendations
                    ↓
           Store in Report table
```

---

## 23. Data & Assets

### 23.1 Knowledge Base — `data/knowledge_base/`

Contains occupation-skill ontology data plus curated technical documentation:

| Directory | Source | Contents |
|-----------|--------|----------|
| `O_NET/` | O*NET OnLine | Occupational descriptions, skill requirements, ability mappings |
| `ESCO/` | European Skills/Competences | Occupation-skill relationships, skill hierarchies |
| `technical_docs/` | Curated | Technical documentation and interview reference material |

These are used by the RAG module to **verify technical claims** during interviews. The system can check if a candidate's answer about a skill or concept aligns with the authoritative ontology definitions and reference material.

### 23.2 Uploads

| Directory | Purpose |
|-----------|---------|
| `data/resumes/` | User-uploaded resume files (PDF/DOCX) |
| `data/job_descriptions/` | User-uploaded job description files |

### 23.3 Models — `models/`

| Path | Contents |
|------|----------|
| `models/faiss_index` | Pre-built FAISS vector index for knowledge base |
| `models/xgboost/score_model.pkl` | Trained XGBoost regression model |

### 23.4 Database — `database/careerpilot.db`

SQLite database with 7 tables (see Section 6.2). Uses WAL mode for performance and foreign key constraints for data integrity.

### 23.5 Persistent Login — `data/remember_token.json`

Stores the JWT token for "Remember Me" functionality. Example:
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

---

## 24. Build & Packaging

### 24.1 Requirements — `requirements.txt`

22 Python packages:

| Package | Version | Purpose |
|---------|---------|---------|
| PySide6 | >=6.6 | Qt GUI framework |
| PyMuPDF | >=1.24 | PDF text extraction |
| python-docx | >=1.1 | DOCX text extraction |
| spacy | >=3.7 | NLP processing |
| sentence-transformers | >=2.7 | Sentence-BERT embeddings |
| torch | >=2.2 | PyTorch (required by sentence-transformers) |
| openai | >=1.30 | OpenAI API client (optional — only if OpenAI GPT backend used) |
| faiss-cpu | >=1.8 | Vector similarity search |
| numpy | >=1.26 | Numerical computing |
| pandas | >=2.2 | Data manipulation |
| scikit-learn | >=1.4 | ML utilities |
| xgboost | >=2.0 | Gradient boosting model |
| shap | >=0.45 | Model explainability |
| opencv-python | >=4.9 | Computer vision |
| mediapipe | >=0.10 | Face/hand/body landmarks |
| librosa | >=0.10 | Audio feature extraction |
| sounddevice | >=0.4 | Audio recording |
| soundfile | >=0.12 | Audio file I/O |
| PyJWT | >=2.8 | JWT token management |
| bcrypt | >=4.1 | Password hashing |
| python-dotenv | >=1.0 | Environment variable loading |
| pyinstaller | >=6.6 | Application packaging |

### 24.2 PyInstaller Spec — `SynaptiRoleAI.spec`

Builds a **single-folder distribution** (not single-file) named `SynaptiRoleAI`:

- **Entry point:** `main.py`
- **Bundled data:** QML files, components, data/, models/, database/
- **Hidden imports:** bcrypt, jwt, encodings, sqlite3
- **Excluded:** tkinter, matplotlib, IPython, jupyter, pytest, PyQt5/6
- **Output:** `dist/SynaptiRoleAI/` folder with all files
- **Console:** `False` (no terminal window)

### 24.3 How to Build

```bash
pip install -r requirements.txt
pyinstaller SynaptiRoleAI.spec
# Output: dist/SynaptiRoleAI/SynaptiRoleAI.exe
```

---

## 25. Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `OPENAI_API_KEY` | `""` | **Optional.** OpenAI API key — only required when using the OpenAI GPT backend |
| `CP_LLM_MODEL` | `mistral-7b-instruct` | Pretrained LLM model to use (Mistral / Llama / Qwen) |
| `CP_JWT_SECRET` | `careerpilot-dev-secret-change-in-prod` | JWT signing secret |
| `CP_EMBEDDING_MODEL` | `all-MiniLM-L6-v2` | Sentence-BERT model name |
| `CP_WHISPER_MODEL` | `base` | Whisper model size (tiny/base/small/medium/large) |
| `CP_LOG_LEVEL` | `INFO` | Logging level (DEBUG/INFO/WARNING/ERROR) |

---

## Quick Reference — Where Things Happen

| What | Where |
|------|-------|
| User registers | `app/authentication/__init__.py:17` → `register_user()` |
| User logs in | `app/authentication/__init__.py:27` → `authenticate_user()` |
| JWT created | `app/authentication/jwt_manager.py:10` → `create_token()` |
| Resume parsed | `app/resume/pdf_parser.py` / `docx_parser.py` |
| JD parsed | `app/job/jd_parser.py` |
| Skills matched | `app/skills/skill_matcher.py` |
| Skill gaps computed | `app/skills/skill_gap.py` |
| Questions generated | `app/llm/question_generator.py` |
| Answers evaluated | `app/llm/answer_evaluator.py` |
| Audio analyzed | `app/audio/audio_features.py` |
| Video analyzed | `app/vision/video_analyzer.py` |
| Technical claims verified | `app/rag/knowledge_verifier.py` |
| Features engineered | `app/scoring/feature_engineering.py` |
| Final interview score (XGBoost) | `app/scoring/xgboost_model.py` |
| SHAP explanation | `app/explainability/shap_analysis.py` |
| Recommendations generated | `app/recommendation/improvement_engine.py` |
| UI navigation | `app/ui/app_controller.py` (Python) + `app/ui/qml/Shell.qml` (QML) |
| Database tables created | `app/database/__init__.py:46` → `init_db()` |
| Application starts | `main.py:14` → `main()` |

---

*This documentation covers the entire Synaptirole-AI codebase as of September 2026. For page-specific documentation, refer to the individual `.md` files in the `docs/` directory.*
