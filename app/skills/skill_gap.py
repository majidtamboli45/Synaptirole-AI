from __future__ import annotations

from app.utils import get_logger
from app.skills.skill_matcher import compute_match_score

logger = get_logger("skill_gap")


def analyze_skill_gap(
    resume_skills: list[str],
    jd_skills: list[str],
    matched_threshold: float | None = None,
    partial_threshold: float | None = None,
) -> dict:
    """Skill-gap analysis built on top of semantic skill matching.

    Classifies every JD requirement as Matched / Partial / Gap and derives:
      - gap_severity      (high / medium / low)
      - recommendations   ("Learn X" for gaps, "Deepen X" for partials)
      - learning_priority (ranked list of skills to work on)
    """
    result = compute_match_score(
        resume_skills,
        jd_skills,
        matched_threshold=matched_threshold,
        partial_threshold=partial_threshold,
    )

    matched_skills = result["matched"]
    partial_skills = result["partial"]
    gap_skills = result["gap"]

    if result["match_score"] >= 70:
        severity = "low"
    elif result["match_score"] >= 40:
        severity = "medium"
    else:
        severity = "high"

    recommendations: list[str] = []
    skill_details = {d["jd_skill"]: d for d in result["details"]}

    for skill in gap_skills:
        recommendations.append(f"Learn {skill} — required for this role (skill gap)")
        logger.info("Skill gap: %s (%s)", skill, "no match found")

    for skill in partial_skills:
        sim = skill_details.get(skill, {}).get("best_similarity", 0.0)
        recommendations.append(
            f"Deepen {skill} — currently a partial match (similarity {sim:.0%})"
        )

    learning_priority = [
        {"skill": s, "priority": "high"} for s in gap_skills
    ] + [
        {"skill": s, "priority": "medium"} for s in partial_skills
    ]

    return {
        "match_score": result["match_score"],
        "coverage": result["coverage"],
        "matched_skills": matched_skills,
        "partial_skills": partial_skills,
        "gap_skills": gap_skills,
        "method_used": result["method_used"],
        "gap_severity": severity,
        "recommendations": recommendations,
        "learning_priority": learning_priority,
        "details": result["details"],
    }