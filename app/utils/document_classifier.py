import re
from app.utils import get_logger

logger = get_logger("document_classifier")

RESUME_SIGNALS = {
    "curriculum vitae": 3,
    "work experience": 3,
    "employment history": 3,
    "career objective": 2,
    "professional summary": 2,
    "technical skills": 2,
    "projects": 2,
    "education": 2,
    "certifications": 2,
    "achievements": 2,
    "internship": 1,
    "experience": 1,
    "objective": 1,
    "skills": 1,
    "contact": 1,
}

JD_SIGNALS = {
    "job description": 3,
    "responsibilities": 3,
    "qualifications": 3,
    "we are looking for": 3,
    "you will be responsible": 3,
    "about the company": 2,
    "about us": 2,
    "employment type": 2,
    "experience required": 2,
    "salary": 2,
    "compensation": 2,
    "benefits": 2,
    "join our team": 2,
    "requirements": 2,
    "apply": 1,
    "position": 1,
    "location": 1,
    "full-time": 1,
    "part-time": 1,
    "posted": 1,
    "role": 1,
    "we are hiring": 3,
}

RESUME_MIN_SCORE = 3
JD_MIN_SCORE = 3


def classify_document(text: str) -> str:
    if not text or not text.strip():
        return "unknown"

    lowered = text.lower()

    resume_score = sum(
        weight
        for keyword, weight in RESUME_SIGNALS.items()
        if re.search(r"\b" + re.escape(keyword) + r"\b", lowered)
    )

    jd_score = sum(
        weight
        for keyword, weight in JD_SIGNALS.items()
        if re.search(r"\b" + re.escape(keyword) + r"\b", lowered)
    )

    if resume_score >= RESUME_MIN_SCORE and resume_score > jd_score:
        result = "resume"
    elif jd_score >= JD_MIN_SCORE and jd_score > resume_score:
        result = "jd"
    else:
        result = "unknown"

    logger.info(
        "Document classified as '%s' (resume_score=%d, jd_score=%d)",
        result,
        resume_score,
        jd_score,
    )
    return result