from __future__ import annotations

import json
from datetime import datetime
from pathlib import Path

from app.utils import get_logger
from app.recommendation.priority_ranking import compute_weighted_skill_gap

logger = get_logger("dashboard_service")

SAMPLE_RESUME_SKILLS = [
    "Python", "Machine Learning", "NLP", "SQL", "Docker", "Git",
    "Pandas", "NumPy", "PyTorch", "FastAPI", "AWS", "Computer Vision",
]

SAMPLE_REQUIRED_SKILLS = [
    "Python", "Machine Learning", "Deep Learning", "NLP",
    "Docker", "AWS", "TensorFlow",
]

SAMPLE_PREFERRED_SKILLS = [
    "PyTorch", "Computer Vision", "Kubernetes", "MLOps",
]


def _load_user_data(user_id: int | None) -> tuple[list[str], list[str], list[str]]:
    """Load the latest resume skills + JD required/preferred skills for a user.

    Falls back to bundled sample data when no documents are found, so the
    dashboard is always populated. Returns (resume_skills, required, preferred).
    """
    resume_skills = []
    required_skills = []
    preferred_skills = []

    if user_id:
        try:
            from app.database.repository import ResumeRepository, JDRepository

            resumes = ResumeRepository.get_by_user(user_id)
            jds = JDRepository.get_by_user(user_id)

            if resumes:
                latest = resumes[0]
                resume_skills = list(latest.skills or [])

            if jds:
                latest_jd = jds[0]
                required_skills = list(latest_jd.required_skills or [])
                preferred_skills = list(latest_jd.preferred_skills or [])

        except Exception as exc:
            logger.warning("Failed to load user skill data: %s", exc)

    if not resume_skills:
        resume_skills = list(SAMPLE_RESUME_SKILLS)
    if not required_skills:
        required_skills = list(SAMPLE_REQUIRED_SKILLS)
    if not preferred_skills:
        preferred_skills = list(SAMPLE_PREFERRED_SKILLS)

    return resume_skills, required_skills, preferred_skills


def get_dashboard_data(
    user_id: int | None = None,
    matched_threshold: float | None = None,
    partial_threshold: float | None = None,
) -> dict:
    """Build the full dashboard payload (JSON-serializable) for QML.

    Executes the Phase-4 semantic matcher + Phase-5 weighted priority
    ranking and wraps everything the UI needs into one dict.
    """
    resume_skills, required_skills, preferred_skills = _load_user_data(user_id)

    analysis = compute_weighted_skill_gap(
        resume_skills,
        required_skills,
        preferred_skills,
        matched_threshold=matched_threshold,
        partial_threshold=partial_threshold,
    )

    analysis["analysis_timestamp"] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    analysis["data_source"] = "user_resume_jd" if user_id and _has_user_docs(user_id) else "sample_data"

    return analysis


def get_dashboard_data_for_skills(
    resume_skills: list[str],
    required_skills: list[str],
    preferred_skills: list[str],
    user_id: int | None = None,
    matched_threshold: float | None = None,
    partial_threshold: float | None = None,
) -> dict:
    """Build the dashboard payload from already-parsed in-memory skills.

    Unlike ``get_dashboard_data`` this never falls back to the bundled
    sample datasets, so the live UI can only ever reflect the actual
    resume + job description the user parsed.
    """
    analysis = compute_weighted_skill_gap(
        list(resume_skills or []),
        list(required_skills or []),
        list(preferred_skills or []),
        matched_threshold=matched_threshold,
        partial_threshold=partial_threshold,
    )

    analysis["analysis_timestamp"] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    analysis["data_source"] = "parsed_documents"
    analysis["user_id"] = user_id

    return analysis


def dashboard_json_for_skills(
    resume_skills: list[str],
    required_skills: list[str],
    preferred_skills: list[str],
    user_id: int | None = None,
    matched_threshold: float | None = None,
    partial_threshold: float | None = None,
) -> str:
    return json.dumps(
        get_dashboard_data_for_skills(
            resume_skills,
            required_skills,
            preferred_skills,
            user_id,
            matched_threshold=matched_threshold,
            partial_threshold=partial_threshold,
        ),
        ensure_ascii=False,
    )


def _has_user_docs(user_id: int | None) -> bool:
    if not user_id:
        return False
    try:
        from app.database.repository import ResumeRepository, JDRepository
        return bool(ResumeRepository.get_by_user(user_id)) or bool(JDRepository.get_by_user(user_id))
    except Exception:
        return False


def dashboard_json(
    user_id: int | None = None,
    matched_threshold: float | None = None,
    partial_threshold: float | None = None,
) -> str:
    return json.dumps(
        get_dashboard_data(
            user_id,
            matched_threshold=matched_threshold,
            partial_threshold=partial_threshold,
        ),
        ensure_ascii=False,
    )


def write_dashboard_report(path: Path | None = None) -> Path:
    report_path = path or (Path("output") / "dashboard_skill_gap.json")
    report_path.parent.mkdir(parents=True, exist_ok=True)
    data = get_dashboard_data()
    report_path.write_text(json.dumps(data, indent=2, ensure_ascii=False), encoding="utf-8")
    logger.info("Dashboard skill-gap report written to %s", report_path)
    return report_path


if __name__ == "__main__":
    import json as _json
    data = get_dashboard_data()
    print(_json.dumps({
        k: v for k, v in data.items()
        if k in ("job_fit_pct", "matched_pct", "gap_count", "partial_count",
                 "matched_count", "total_jd_skills", "data_source",
                 "required_weight", "preferred_weight")
    }, indent=2, ensure_ascii=False))
    print("\n--- Priority Rankings ---")
    for r in data["priority_rankings"][:8]:
        print(f"  [{r['priority'] or 'N/A':5s}] {r['type']:9s} {r['status']:8s} {r['skill']:20s} sim={r['similarity']:.2f}")