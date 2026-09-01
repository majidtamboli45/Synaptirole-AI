from app.utils import get_logger

logger = get_logger("skill_gap_analysis")


def generate_gap_report(resume_skills: list[str], jd_skills: list[str], scores: dict = None) -> dict:
    r_set = set(s.lower() for s in resume_skills)
    j_set = set(s.lower() for s in jd_skills)
    missing = sorted(j_set - r_set)
    matched = sorted(r_set & j_set)

    report = {
        "total_required": len(j_set),
        "matched_count": len(matched),
        "missing_count": len(missing),
        "match_percentage": round(len(matched) / len(j_set) * 100, 1) if j_set else 100,
        "missing_skills": missing,
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

    logger.info("Gap report: %d/%d matched, %d missing", len(matched), len(j_set), len(missing))
    return report
