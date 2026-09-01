# SynaptiRole-AI — Setup Guide for Developers

> **Purpose:** This guide walks any team member through getting the **SynaptiRole-AI** (CareerPilot AI) desktop application running locally on their machine after cloning the repository.

---

## Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [Clone the Repository](#2-clone-the-repository)
3. [Set Up a Virtual Environment](#3-set-up-a-virtual-environment)
4. [Install Dependencies](#4-install-dependencies)
5. [Configure Environment Variables](#5-configure-environment-variables)
6. [Prepare Models & Knowledge Base (Optional)](#6-prepare-models--knowledge-base-optional)
7. [Run the Application](#7-run-the-application)
8. [Verify It Works (Selftest)](#8-verify-it-works-selftest)
9. [Common Issues & Troubleshooting](#9-common-issues--troubleshooting)
10. [Project Structure Cheat Sheet](#10-project-structure-cheat-sheet)

---

## 1. Prerequisites

Before you start, make sure your machine has:

| # | Software | Minimum Version | Purpose |
|---|----------|-----------------|---------|
| 1 | **Python** | 3.10 – 3.12 | Runtime (⚠️ see note below) |
| 2 | **Git** | Latest | Clone the repo |
| 3 | **OpenAI API Key** | — | Required for LLM features (generate/evaluate questions, RAG verification) |
| 4 | **Webcam** (optional) | Any | Video/body-language analysis |
| 5 | **Microphone** (optional) | Any | Audio/voice analysis |
| 6 | **Internet** | Stable | OpenAI API calls + model downloads |

> ⚠️ **IMPORTANT — Python version:** Use **Python 3.10, 3.11, or 3.12**. The current machine in this project uses 3.13.2, but some dependencies (e.g. `PyMuPDF`, `torch`, `mediapipe`) may not have prebuilt wheels for the very latest Python version. If you hit `pip` build errors, **install Python 3.11** — it has the widest compatibility with all packages in `requirements.txt`.

> 🎯 **Team members who only want to run WITHOUT AI features** can skip the OpenAI API key for now — the app still launches and the auth/database/UI flows work. AI features (question generation, answer evaluation, RAG) will only work once the key is configured.

---

## 2. Clone the Repository

```bash
git clone https://github.com/<ORGANIZATION_OR_USER>/Synaptirole-AI.git
cd Synaptirole-AI
```

---

## 3. Set Up a Virtual Environment

It's strongly recommended to use an isolated virtual environment so dependencies don't clash with your system Python.

### On Windows (PowerShell / CMD)
```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1     # PowerShell
# OR
.\.venv\Scripts\activate.bat     # CMD
```

### On macOS / Linux
```bash
python3 -m venv .venv
source .venv/bin/activate
```

You should now see `(.venv)` at the start of your terminal prompt.

---

## 4. Install Dependencies

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

This installs **22 packages**, including:
- `PySide6` — Qt GUI framework (QML UI)
- `sentence-transformers` + `torch` — embeddings for skill matching & RAG
- `openai` — LLM API client
- `faiss-cpu`, `numpy`, `pandas`, `scikit-learn`
- `xgboost`, `shap` — scoring + explainability
- `opencv-python`, `mediapipe` — video analysis
- `librosa`, `sounddevice`, `soundfile` — audio analysis
- `PyJWT`, `bcrypt` — authentication
- `PyMuPDF`, `python-docx` — resume/JD parsing
- `spacy` — NLP

> **Note:** This step downloads **PyTorch** (`torch`), which is large (~2 GB). It may take a few minutes.

### Optional — spaCy language model
The skill extractor uses spaCy. Download the English model:
```bash
python -m spacy download en_core_web_sm
```

---

## 5. Configure Environment Variables

The app reads configuration from `app/config.py`. Some values can be overridden via environment variables (typically placed in a `.env` file).

### Create a `.env` file in the project root

```
# Optional (used by config.py defaults if not set):
OPENAI_API_KEY=sk-your-key-here
CP_OPENAI_MODEL=gpt-4o-mini
CP_JWT_SECRET=your-own-secret
CP_EMBEDDING_MODEL=all-MiniLM-L6-v2
CP_WHISPER_MODEL=base
CP_LOG_LEVEL=INFO
```

| Variable | Required? | Default | Purpose |
|----------|-----------|---------|---------|
| `OPENAI_API_KEY` | **Yes** (for AI features) | `""` | OpenAI API key for question generation, answer evaluation, RAG verification |
| `CP_OPENAI_MODEL` | No | `gpt-4o-mini` | LLM model name |
| `CP_JWT_SECRET` | No | dev secret | JWT signing secret (change in prod) |
| `CP_EMBEDDING_MODEL` | No | `all-MiniLM-L6-v2` | Sentence-BERT model |
| `CP_WHISPER_MODEL` | No | `base` | Whisper STT model size |
| `CP_LOG_LEVEL` | No | `INFO` | Logging level |

> 🔑 **Get an OpenAI key:** https://platform.openai.com/api-keys

> ⚠️ **Never commit your `.env` file.** It is already excluded via `.gitignore`.

> 💡 **Note:** `python-dotenv` is in the requirements, but `app/config.py` currently reads directly from the OS environment (`os.getenv`). If you prefer the `.env` auto-loading, ensure `dotenv` is loaded in `main.py` (or run with the variables exported). Otherwise, set the variables in your shell:
> ```powershell
> $env:OPENAI_API_KEY="sk-your-key-here"
> ```

---

## 6. Prepare Models & Knowledge Base (Optional)

The app auto-creates `data/`, `models/`, `database/`, and `logs/` directories on first run.

- **SQLite database** (`database/careerpilot.db`) — created automatically on first launch via `init_db()`.
- **Knowledge base** (`data/knowledge_base/O_NET/` and `data/knowledge_base/ESCO/`) — used by the RAG module for fact-checking. If these are empty, RAG features will fall back to a minimized/brute-force mode (see note in the code docs). These datasets can be downloaded from O*NET and ESCO (see `docs/requirements.md`).
- **Models** (`models/faiss_index`, `models/xgboost/score_model.pkl`) — pre-trained FAISS index and XGBoost model. If absent, the app uses the brute-force fallback / creates them at runtime.

**For basic app usage (login, signup, database, UI), nothing extra is required** — everything auto-initializes on first run.

---

## 7. Run the Application

With the virtual environment activated:

```bash
python main.py
```

You should see the **Login screen** (a purple/white themed window). From there you can:

1. Click **"Sign up"** to create an account (name, email, strong password, role, accept terms).
2. After signup you're **auto-logged in** and land on the **Dashboard**.
3. Use the **SideBar** to navigate all 9 pages.

---

## 8. Verify It Works (Selftest)

The app includes a headless self-test mode that verifies QML loads and the app initializes without a display:

```bash
python main.py --selftest
```

**Expected output:** the app builds the UI offscreen and the process exits cleanly (prints `SELFTEST_OK`, exit code 0). If you see errors here, the QML or Python layer has a problem.

---

## 9. Common Issues & Troubleshooting

| Symptom | Likely Cause | Fix |
|---------|--------------|-----|
| `pip install` fails on a package (e.g. `PyMuPDF`, `torch`, `mediapipe`) | Python version too new (no prebuilt wheel) | Use **Python 3.10/3.11**; recreate the venv |
| "OpenAI API key not found" / LLM errors | Key not set | Set `OPENAI_API_KEY` before running |
| QML load errors on startup | Missing QML assets / component path | Ensure you run from project root; run `--selftest` |
| Signup error "Email already registered" | That email already exists in the local DB | Use a different email, or delete `database/careerpilot.db` |
| App opens but no webcam/mic | Hardware not available | Ignore (audio/video only needed for mock interview) |
| `.env` values not applied | `config.py` uses `os.getenv`, not auto-loaded dotenv | Export the vars in your shell, or load `python-dotenv` |
| Huge download / slow install | `torch` is large | Ensure good internet; consider CPU-only torch if GPU unused |
| "Module not found: `app.*`" | Ran from wrong directory | Run from the repo root (`cd Synaptirole-AI`) |

---

## 10. Project Structure Cheat Sheet

```
Synaptirole-AI/
├── main.py                 # Entry point
├── requirements.txt        # Python dependencies
├── SynaptiRoleAI.spec      # PyInstaller build config
├── app/                    # Main source
│   ├── config.py           # Centralized configuration
│   ├── database/           # SQLite (models.py, repository.py)
│   ├── authentication/     # bcrypt + JWT auth
│   ├── resume/             # PDF/DOCX parsing + analysis
│   ├── job/                # JD parsing + analysis
│   ├── skills/             # SBERT skill matching + gap analysis
│   ├── interview/          # Interview engine
│   ├── llm/                # OpenAI integration
│   ├── rag/                # FAISS + knowledge base verification
│   ├── audio/              # Recording + Whisper + Librosa
│   ├── vision/             # MediaPipe + OpenCV analysis
│   ├── scoring/            # XGBoost + score fusion
│   ├── explainability/     # SHAP
│   ├── recommendation/     # Improvement suggestions
│   ├── utils/              # Logging, file handlers, validators
│   └── ui/                 # QML views + AppController bridge
├── data/                   # Runtime data (resumes, JDs, knowledge base)
├── models/                 # FAISS index, XGBoost model
├── database/               # careerpilot.db (SQLite)
├── docs/                   # Documentation
└── Implementation_docs/    # Implementation summaries
```

---

## Quick-Start (TL;DR)

```bash
# 1. Pre-req: Python 3.10-3.12 installed
git clone <repo-url>
cd Synaptirole-AI

# 2. Virtual env
python -m venv .venv
.venv\Scripts\Activate      # Windows (PowerShell: Activate.ps1)

# 3. Dependencies
pip install --upgrade pip
pip install -r requirements.txt
python -m spacy download en_core_web_sm

# 4. Set your OpenAI key (for AI features)
#    Windows:      $env:OPENAI_API_KEY="sk-your-key"
#    Mac/Linux:    export OPENAI_API_KEY="sk-your-key"

# 5. Run!
python main.py
```

If you hit issues, see **Section 10** or ask on the team channel. 🚀
