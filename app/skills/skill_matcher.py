from app.utils import get_logger

logger = get_logger("skill_matcher")


def compute_match_score(resume_skills: list[str], jd_skills: list[str]) -> dict:
    r_set = set(s.lower() for s in resume_skills)
    j_set = set(s.lower() for s in jd_skills)

    matched = sorted(r_set & j_set)
    missing = sorted(j_set - r_set)
    extra = sorted(r_set - j_set)

    total = len(j_set) if j_set else 1
    score = len(matched) / total * 100

    return {
        "matched": matched,
        "missing": missing,
        "extra": extra,
        "match_score": round(score, 1),
    }
