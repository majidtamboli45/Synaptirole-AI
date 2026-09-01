from app.utils import get_logger

logger = get_logger("skills")


def extract_skills_from_text(text: str) -> list[str]:
    from app.resume.resume_analyzer import extract_skills
    return extract_skills(text)


def match_skills(resume_skills: list[str], jd_skills: list[str]) -> dict:
    resume_set = set(s.lower() for s in resume_skills)
    jd_set = set(s.lower() for s in jd_skills)

    matched = sorted(resume_set & jd_set)
    missing = sorted(jd_set - resume_set)
    partial = sorted(resume_set - jd_set)

    total = len(jd_set) if jd_set else 1
    score = len(matched) / total * 100

    logger.info("Skill match: %.1f%% (%d matched, %d missing, %d extra)", score, len(matched), len(missing), len(partial))

    return {
        "matched": matched,
        "missing": missing,
        "partial": partial,
        "match_score": round(score, 1),
    }
