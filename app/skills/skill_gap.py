from app.utils import get_logger
from app.skills.skill_matcher import compute_match_score

logger = get_logger("skill_gap")


def analyze_skill_gap(resume_skills: list[str], jd_skills: list[str]) -> dict:
    result = compute_match_score(resume_skills, jd_skills)
    gap_analysis = {
        "match_score": result["match_score"],
        "matched_skills": result["matched"],
        "missing_skills": result["missing"],
        "extra_skills": result["extra"],
        "gap_severity": "high" if result["match_score"] < 40 else "medium" if result["match_score"] < 70 else "low",
        "recommendations": [],
    }
    for skill in result["missing"]:
        gap_analysis["recommendations"].append(f"Learn {skill} — required for this role")
    logger.info("Skill gap analysis: %.1f%% match, %d gaps", result["match_score"], len(result["missing"]))
    return gap_analysis
