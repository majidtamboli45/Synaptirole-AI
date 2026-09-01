import json
import re
from pathlib import Path
from app.utils import get_logger
from app.resume.pdf_parser import extract_text_from_pdf
from app.resume.docx_parser import extract_text_from_docx

logger = get_logger("resume_analyzer")

SKILL_PATTERNS = [
    "python", "java", "javascript", "typescript", "c\\+\\+", "c#", "ruby", "go", "rust", "kotlin",
    "react", "angular", "vue", "node\\.?js", "django", "flask", "fastapi", "spring",
    "sql", "mysql", "postgresql", "mongodb", "redis", "elasticsearch",
    "aws", "azure", "gcp", "docker", "kubernetes", "jenkins", "git", "ci/cd",
    "machine learning", "deep learning", "nlp", "natural language processing",
    "tensorflow", "pytorch", "keras", "scikit-learn", "pandas", "numpy",
    "html", "css", "sass", "less",
    "agile", "scrum", "jira", "confluence",
    "rest", "graphql", "grpc", "microservices",
    "linux", "bash", "powershell",
    "opencv", "mediapipe", "transformers", "huggingface",
    "xgboost", "shap", "faiss", "langchain", "llm", "openai",
]

EDUCATION_PATTERNS = [
    r"(Bachelor(?:'s)?(?:\s+of\s+\w+)?(?:\s+in\s+[\w\s]+)?)",
    r"(Master(?:'s)?(?:\s+of\s+\w+)?(?:\s+in\s+[\w\s]+)?)",
    r"(Ph\.?D\.?(?:\s+in\s+[\w\s]+)?)",
    r"(B\.?Tech(?:nology)?(?:\s+in\s+[\w\s]+)?)",
    r"(M\.?Tech(?:nology)?(?:\s+in\s+[\w\s]+)?)",
    r"(MBA(?:\s+in\s+[\w\s]+)?)",
    r"(B\.?Sc\.?(?:\s+in\s+[\w\s]+)?)",
    r"(M\.?Sc\.?(?:\s+in\s+[\w\s]+)?)",
]


def extract_skills(text: str) -> list[str]:
    text_lower = text.lower()
    found = []
    for pattern in SKILL_PATTERNS:
        if re.search(pattern, text_lower):
            clean = pattern.replace("\\+\\+", "++").replace("\\.?", ".").replace("\\w", "w")
            found.append(clean)
    return sorted(set(found))


def extract_education(text: str) -> list[str]:
    results = []
    for pattern in EDUCATION_PATTERNS:
        matches = re.findall(pattern, text, re.IGNORECASE)
        results.extend([m.strip() for m in matches])
    return sorted(set(results))


def extract_experience(text: str) -> list[dict]:
    experiences = []
    lines = text.split("\n")
    for i, line in enumerate(lines):
        if re.search(r"\b(years?|experience|worked at|positioned as|role as)\b", line, re.IGNORECASE):
            context = " ".join(lines[max(0, i-1):min(len(lines), i+2)])
            experiences.append({"context": context.strip()[:200]})
    return experiences[:10]


def analyze_resume(file_path: Path) -> dict:
    ext = file_path.suffix.lower()
    if ext == ".pdf":
        text = extract_text_from_pdf(file_path)
    elif ext in (".docx", ".doc"):
        text = extract_text_from_docx(file_path)
    elif ext == ".txt":
        text = file_path.read_text(encoding="utf-8", errors="ignore")
    else:
        text = ""

    skills = extract_skills(text)
    education = extract_education(text)
    experience = extract_experience(text)

    logger.info("Resume analysis: %d skills, %d education, %d experience", len(skills), len(education), len(experience))

    return {
        "raw_text": text,
        "skills": skills,
        "education": education,
        "experience": experience,
    }
