import re
from app.utils import get_logger

logger = get_logger("job_analyzer")

TECH_SKILLS = [
    "python", "java", "javascript", "typescript", "c++", "c#", "ruby", "go", "rust", "kotlin",
    "react", "angular", "vue", "node.js", "django", "flask", "fastapi", "spring",
    "sql", "mysql", "postgresql", "mongodb", "redis", "elasticsearch",
    "aws", "azure", "gcp", "docker", "kubernetes", "jenkins", "git", "ci/cd",
    "machine learning", "deep learning", "nlp", "natural language processing",
    "tensorflow", "pytorch", "keras", "scikit-learn", "pandas", "numpy",
    "html", "css", "sass",
    "agile", "scrum", "jira",
    "rest", "graphql", "grpc", "microservices",
    "linux", "bash",
    "opencv", "mediapipe", "transformers", "hugging face",
    "xgboost", "shap", "faiss", "langchain", "llm", "openai",
]


def extract_required_skills(text: str) -> list[str]:
    text_lower = text.lower()
    return sorted(set(s for s in TECH_SKILLS if s in text_lower))


def extract_preferred_skills(text: str) -> list[str]:
    preferred_section = ""
    lines = text.split("\n")
    capture = False
    for line in lines:
        if re.search(r"preferred|nice.to.have|bonus|plus", line, re.IGNORECASE):
            capture = True
        elif capture and re.match(r"^[A-Z]", line) and not re.search(r"preferred|nice.to.have", line, re.IGNORECASE):
            capture = False
        if capture:
            preferred_section += line + " "
    return sorted(set(s for s in TECH_SKILLS if s in preferred_section.lower()))
