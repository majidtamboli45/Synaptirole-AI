from app.utils import get_logger

logger = get_logger("skill_extractor")


def extract_skills(text: str) -> list[str]:
    from app.resume.resume_analyzer import extract_skills as _extract
    skills = _extract(text)
    logger.info("Extracted %d skills", len(skills))
    return skills
