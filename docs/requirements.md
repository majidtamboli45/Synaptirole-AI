# CareerPilot AI — Requirements from You

## API Keys & Accounts

| # | Item | Purpose | Where to Get |
|---|------|---------|-------------|
| 1 | **OpenAI API Key** | LLM for question generation, answer evaluation, RAG verification | https://platform.openai.com/api-keys |
| 2 | **HuggingFace Token** (optional) | If running Llama 3 / Mistral locally via HF Inference | https://huggingface.co/settings/tokens |
| 3 | **Gmail App Password** (or SMTP credentials) | Email verification, password reset flows | Google Account → Security → App Passwords |

> **Note:** You only need ONE LLM provider. OpenAI is simplest to start. Local models (Llama 3, Mistral) require a GPU with 8GB+ VRAM.

---

## Datasets & Knowledge Bases

| # | Item | Purpose | Source |
|---|------|---------|--------|
| 4 | **O\*NET Database** | Skill taxonomy, occupation-skill mappings | https://www.onetcenter.org/database.html (free download) |
| 5 | **ESCO Dataset** | European skills classification, multilingual skill names | https://esco.ec.europa.eu/en/classification/skill (CSV/JSON export) |
| 6 | **Sample Resumes** (10-20 PDFs/DOCX) | For testing resume parser & skill extraction | You provide — your own resumes or anonymized samples |
| 7 | **Sample Job Descriptions** (10-20 JDs) | For testing JD parser & skill matching | You provide — scraped or manually collected |
| 8 | **Interview Transcript Dataset** (optional) | For training/validating answer evaluator | https://www.kaggle.com/ or custom collected |

---

## Hardware Requirements (Your Machine)

| # | Requirement | Minimum | Recommended |
|---|-------------|---------|-------------|
| 9 | **RAM** | 8 GB | 16 GB+ |
| 10 | **GPU** (for local LLMs) | Not needed if using OpenAI API | NVIDIA 8GB+ VRAM (RTX 3060+) |
| 11 | **Disk Space** | 5 GB free | 15 GB+ (for models + deps) |
| 12 | **Webcam** | Any USB webcam | 720p+ for video analysis |
| 13 | **Microphone** | Any USB/3.5mm mic | Headset mic for cleaner audio |
| 14 | **Internet** | Required for OpenAI API | Stable broadband |

---

## Pre-installed Software

| # | Software | Version | Purpose |
|---|----------|---------|---------|
| 15 | **Python** | 3.11 or 3.12 | Runtime |
| 16 | **VS Code** | Latest | IDE |
| 17 | **Git** | Latest | Version control |
| 18 | **CUDA Toolkit** (if using GPU) | 11.8 or 12.x | Required for local LLM inference |

---

## Decisions I Need From You

| # | Decision | Options | Default Recommendation |
|---|----------|---------|----------------------|
| 19 | **LLM Provider** | OpenAI GPT / Llama 3 (local) / Mistral (local) | OpenAI GPT-4o-mini (cheapest, easiest) |
| 20 | **Embedding Model** | all-MiniLM-L6-v2 (fast) / all-mpnet-base-v2 (accurate) | all-MiniLM-L6-v2 |
| 21 | **Vector DB** | FAISS (local, no server) / ChromaDB | FAISS |
| 22 | **Database** | SQLite (simple) / PostgreSQL | SQLite |
| 23 | **Auth Method** | JWT + bcrypt (stateless) / Session-based | JWT + bcrypt |
| 24 | **UI Style Preference** | Any specific color scheme, branding, or reference UI? | Modern purple/blue theme (current) |
| 25 | **Deployment** | One-folder exe / One-file exe / Installer (Inno Setup) | One-folder exe first, then Inno Setup |

---

## Budget Estimate (API Costs)

| Service | Cost | Notes |
|---------|------|-------|
| OpenAI API (GPT-4o-mini) | ~$5-15/month | For development + moderate usage |
| OpenAI API (GPT-4o) | ~$30-100/month | Higher quality, more expensive |
| Whisper API (if used) | ~$0.006/min | Only if not running locally |
| HuggingFace | Free | For model downloads |

---

## What I Will Build (No Input Needed)

- [x] All QML UI pages (Login → Dashboard → Resume → Skills → Interview → Reports → Settings)
- [x] App scaffolding (main.py, main_window.py, app_controller.py)
- [x] PyInstaller packaging
- [x] Resume/JD parsers (PyMuPDF + python-docx)
- [x] Skill extraction + matching (spaCy + SBERT)
- [x] LLM integration layer (switchable OpenAI/local)
- [x] RAG pipeline (FAISS + embeddings)
- [x] Audio analysis (Whisper + Librosa)
- [x] Video analysis (OpenCV + MediaPipe)
- [x] Scoring engine (XGBoost + feature fusion)
- [x] SHAP explainability
- [x] Recommendation engine
- [x] SQLite database + models
- [x] JWT authentication
- [x] Tests for all modules

---

## Summary: What You Must Provide

1. **OpenAI API Key** (or decide to use local LLMs)
2. **Sample resumes** (10-20 files for testing)
3. **Sample job descriptions** (10-20 for testing)
4. **O\*NET database** download
5. **ESCO dataset** download
6. **Hardware** with webcam + mic (for interview feature)
7. **Decisions** on items 19-25 above
