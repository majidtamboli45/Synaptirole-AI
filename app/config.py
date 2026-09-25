import os
import sys
from pathlib import Path

if getattr(sys, "frozen", False):
    BASE_DIR = Path(sys.executable).parent
else:
    BASE_DIR = Path(__file__).resolve().parent.parent

DATA_DIR = BASE_DIR / "data"
MODEL_DIR = BASE_DIR / "models"
DB_DIR = BASE_DIR / "database"
OUTPUT_DIR = BASE_DIR / "output"
UPLOAD_DIR = DATA_DIR / "resumes"
JD_DIR = DATA_DIR / "job_descriptions"
KNOWLEDGE_DIR = DATA_DIR / "knowledge_base"
ONET_DIR = KNOWLEDGE_DIR / "O_NET"
ESCO_DIR = KNOWLEDGE_DIR / "ESCO"

for d in [DATA_DIR, MODEL_DIR, DB_DIR, OUTPUT_DIR, UPLOAD_DIR, JD_DIR, KNOWLEDGE_DIR, ONET_DIR, ESCO_DIR]:
    d.mkdir(parents=True, exist_ok=True)

DB_PATH = DB_DIR / "careerpilot.db"
JWT_SECRET = os.getenv("CP_JWT_SECRET", "careerpilot-dev-secret-change-in-prod")
JWT_ALGORITHM = "HS256"
JWT_EXPIRY_HOURS = 24

OPENAI_API_KEY = os.getenv("OPENAI_API_KEY", "")
OPENAI_MODEL = os.getenv("CP_OPENAI_MODEL", "gpt-4o-mini")

EMBEDDING_MODEL = os.getenv("CP_EMBEDDING_MODEL", "all-MiniLM-L6-v2")
SPACY_MODEL = os.getenv("CP_SPACY_MODEL", "en_core_web_sm")
SPACY_MODEL_FALLBACKS = ["en_core_web_lg", "en_core_web_md", "en_core_web_sm"]
RESUME_NER_MODEL = os.getenv(
    "CP_RESUME_NER_MODEL",
    str(MODEL_DIR / "ner_resume_model"),
)
RAG_INDEX_ROOT = DATA_DIR / "rag" / "indexes"

RAG_CHUNK_SIZE = int(os.getenv("CP_RAG_CHUNK_SIZE", "600"))
RAG_CHUNK_OVERLAP = int(os.getenv("CP_RAG_CHUNK_OVERLAP", "100"))
RAG_TOP_K = int(os.getenv("CP_RAG_TOP_K", "3"))

ROLE_SKILLS = {
    "software_developer": ["python", "java", "cpp", "oops", "dbms", "dsa", "mysql", "nodejs", "spring", "fastapi", "django", "git", "github_actions", "system_design"],
    "data_scientist": ["python", "statistics", "machine_learning", "deep_learning", "data_science", "sql"],
    "ml_engineer": ["python", "machine_learning", "deep_learning", "mlops", "docker", "git"],
    "ai_engineer": ["python", "nlp", "llm", "machine_learning", "deep_learning", "docker", "git"],
    "frontend_developer": ["javascript", "react", "html_css", "git"],
    "backend_developer": ["java", "python", "mysql", "dbms", "docker", "oops", "nodejs", "spring", "fastapi", "django", "git", "system_design"],
    "devops_engineer": ["docker", "kubernetes", "terraform", "linux", "ci_cd", "aws", "gcp", "jenkins", "git", "github_actions"],
}

RAG_INDEX_ROOT.mkdir(parents=True, exist_ok=True)

FAISS_INDEX_PATH = MODEL_DIR / "faiss_index"
WHISPER_MODEL = os.getenv("CP_WHISPER_MODEL", "base")
XGBOOST_MODEL_PATH = MODEL_DIR / "xgboost" / "score_model.pkl"

SERVER_HOST = "0.0.0.0"
SERVER_PORT = 8000

LOG_LEVEL = os.getenv("CP_LOG_LEVEL", "INFO")
LOG_DIR = BASE_DIR / "logs"
LOG_DIR.mkdir(exist_ok=True)
