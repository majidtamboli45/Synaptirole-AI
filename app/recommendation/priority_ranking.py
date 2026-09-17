from __future__ import annotations

from app.utils import get_logger
from app.skills.skill_matcher import compute_match_score

logger = get_logger("priority_ranking")

REQUIRED_WEIGHT = 1.0
PREFERRED_WEIGHT = 0.5

STATUS_SCORE = {
    "matched": 1.0,
    "partial": 0.5,
    "gap": 0.0,
}

PRIORITY_MATRIX = {
    ("required", "gap"): "HIGH",
    ("required", "partial"): "MEDIUM",
    ("preferred", "gap"): "LOW",
    ("preferred", "partial"): "LOW",
}


def _priority_for(skill_type: str, status: str) -> str | None:
    if status == "matched":
        return None
    return PRIORITY_MATRIX.get((skill_type, status))


def compute_weighted_skill_gap(
    resume_skills: list[str],
    required_skills: list[str],
    preferred_skills: list[str],
    matched_threshold: float | None = None,
    partial_threshold: float | None = None,
) -> dict:
    """Weighted skill-gap analysis with HIGH / MEDIUM / LOW priority ranking.

    Weighting rule (required 1.0 / preferred 0.5):
      - Required skills carry full weight: a gap here is critical.
      - Preferred skills carry half weight: nice-to-have items.

    Per-skill contribution = weight x status score:
      matched -> 1.0 | partial -> 0.5 | gap -> 0.0

    Metrics returned:
      - job_fit_pct     : weighted overall fit (0-100)
      - matched_pct     : % of all JD skills fully matched
      - gap_count       : number of true gaps
      - priority list   : skill -> type / status / HIGH|MEDIUM|LOW
    """
    req = list(dict.fromkeys(required_skills or []))
    pref = list(dict.fromkeys(preferred_skills or []))
    resume = list(dict.fromkeys(resume_skills or []))

    req_result = compute_match_score(
        resume, req,
        matched_threshold=matched_threshold,
        partial_threshold=partial_threshold,
    ) if req else {
        "matched": [], "partial": [], "gap": [], "details": [],
        "match_score": 0.0, "method_used": "none",
    }

    pref_result = compute_match_score(
        resume, pref,
        matched_threshold=matched_threshold,
        partial_threshold=partial_threshold,
    ) if pref else {
        "matched": [], "partial": [], "gap": [], "details": [],
        "match_score": 0.0, "method_used": "none",
    }

    req_details = {d["jd_skill"]: d for d in req_result.get("details", [])}
    pref_details = {d["jd_skill"]: d for d in pref_result.get("details", [])}

    weighted_numerator = 0.0
    weighted_denominator = 0.0
    total_jd_skills = 0
    matched_count = 0
    req_total = 0
    req_matched = 0
    pref_total = 0
    pref_matched = 0
    priority_rankings: list[dict] = []
    recommendations: list[str] = []

    def process_group(skills: list[str], skill_type: str, weight: float):
        nonlocal weighted_numerator, weighted_denominator, total_jd_skills, matched_count
        nonlocal req_total, req_matched, pref_total, pref_matched
        details = req_details if skill_type == "required" else pref_details
        for skill in skills:
            detail = details.get(skill, {})
            status = detail.get("status", "gap")
            sim = detail.get("best_similarity", 0.0)
            matched_skill = detail.get("matched_skill", "")

            weighted_numerator += weight * STATUS_SCORE.get(status, 0.0)
            weighted_denominator += weight
            total_jd_skills += 1
            if status == "matched":
                matched_count += 1
            if skill_type == "required":
                req_total += 1
                if status == "matched":
                    req_matched += 1
            else:
                pref_total += 1
                if status == "matched":
                    pref_matched += 1

            priority = _priority_for(skill_type, status)
            priority_rankings.append({
                "skill": skill,
                "type": skill_type,
                "status": status,
                "priority": priority,
                "similarity": round(sim, 4),
                "matched_skill": matched_skill,
            })

            if status == "gap":
                if skill_type == "required":
                    recommendations.append(f"Learn {skill} — required for this role")
                else:
                    recommendations.append(f"Add {skill} — preferred (nice-to-have)")
            elif status == "partial":
                recommendations.append(
                    f"Deepen {skill} — partial match ({sim:.0%} similar)"
                )

    process_group(req, "required", REQUIRED_WEIGHT)
    process_group(pref, "preferred", PREFERRED_WEIGHT)

    job_fit_pct = (
        weighted_numerator / weighted_denominator * 100
        if weighted_denominator > 0 else 0.0
    )
    matched_pct = (
        matched_count / total_jd_skills * 100
        if total_jd_skills else 0.0
    )
    required_match_pct = (
        req_matched / req_total * 100
        if req_total else 0.0
    )
    preferred_match_pct = (
        pref_matched / pref_total * 100
        if pref_total else 0.0
    )

    gap_items = [r for r in priority_rankings if r["status"] == "gap"]
    partial_items = [r for r in priority_rankings if r["status"] == "partial"]

    priority_rankings.sort(
        key=lambda r: (
            0 if (r["priority"] == "HIGH") else
            1 if (r["priority"] == "MEDIUM") else 2,
            r["type"] == "preferred",
            -r["similarity"],
        )
    )

    logger.info(
        "Weighted skill gap: job_fit=%.1f%% matched=%.1f%% (%d gaps, %d partials)",
        job_fit_pct, matched_pct,
        len(gap_items), len(partial_items),
    )

    return {
        "job_fit_pct": round(job_fit_pct, 1),
        "matched_pct": round(matched_pct, 1),
        "gap_count": len(gap_items),
        "partial_count": len(partial_items),
        "matched_count": matched_count,
        "total_jd_skills": total_jd_skills,
        "required_weight": REQUIRED_WEIGHT,
        "preferred_weight": PREFERRED_WEIGHT,
        "required_count": req_total,
        "preferred_count": pref_total,
        "required_match_pct": round(required_match_pct, 1),
        "preferred_match_pct": round(preferred_match_pct, 1),
        "required_skills": req,
        "preferred_skills": pref,
        "resume_skills": resume,
        "priority_rankings": priority_rankings,
        "recommendations": recommendations,
        "method_used": req_result.get("method_used", "none") or pref_result.get("method_used", "none"),
    }