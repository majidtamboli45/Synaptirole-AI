from app.utils import get_logger

logger = get_logger("recommendation")


def analyze_skill_gap(resume_skills: list[str], jd_skills: list[str]) -> dict:
    from app.skills.skill_matcher import compute_match_score

    result = compute_match_score(resume_skills, jd_skills)
    gap_skills = result["gap"]
    matched = result["matched"]

    return {
        "matched": matched,
        "missing": gap_skills,
        "missing_skills": gap_skills,
        "gap_skills": gap_skills,
        "partial_skills": result["partial"],
        "match_score": result["match_score"],
    }