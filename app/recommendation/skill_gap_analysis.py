from app.utils import get_logger

logger = get_logger("skill_gap_analysis")


def generate_gap_report(resume_skills: list[str], jd_skills: list[str], scores: dict = None) -> dict:
    from app.skills.skill_matcher import compute_match_score

    result = compute_match_score(resume_skills, jd_skills)
    matched = result["matched"]
    gap = result["gap"]
    partial = result["partial"]
    total = len(result["jd_skills_normalized"])

    report = {
        "total_required": total,
        "matched_count": len(matched),
        "partial_count": len(partial),
        "missing_count": len(gap),
        "match_percentage": round(len(matched) / total * 100, 1) if total else 100,
        "missing_skills": gap,
        "gap_skills": gap,
        "partial_skills": partial,
        "matched_skills": matched,
    }

    if scores:
        weak_areas = []
        if scores.get("audio_score", 0) < 60:
            weak_areas.append("communication")
        if scores.get("video_score", 0) < 60:
            weak_areas.append("body language")
        if scores.get("answer_score", 0) < 60:
            weak_areas.append("technical knowledge")
        report["weak_areas"] = weak_areas

    logger.info("Gap report: %d matched, %d partial, %d gap", len(matched), len(partial), len(gap))
    return report