"""Skills module: taxonomy, synonyms, extraction and matching.

Import functions lazily to avoid importing the spaCy-based extractor on
package import (which would create an import cycle with ``app.nlp``).
"""

from app.utils import get_logger
from app.skills.skill_taxonomy import (
    SKILL_TAXONOMY,
    CATEGORY_LABELS,
    all_terms,
)
from app.skills.skill_synonyms import (
    normalize_key,
    canonical_list,
    category_for,
)

logger = get_logger("skills")

__all__ = [
    "SKILL_TAXONOMY",
    "CATEGORY_LABELS",
    "all_terms",
    "normalize_key",
    "canonical_list",
    "category_for",
    "extract_skills",
    "extract_skills_detailed",
    "profile_text_skills",
    "extract_skills_from_text",
    "match_skills",
]


def extract_skills(text: str) -> list[str]:
    from app.skills.skill_extractor import extract_skills

    return extract_skills(text)


def extract_skills_detailed(text: str) -> list[dict]:
    from app.skills.skill_extractor import extract_skills_detailed

    return extract_skills_detailed(text)


def profile_text_skills(text: str) -> dict:
    from app.skills.skill_extractor import profile_text_skills

    return profile_text_skills(text)


def extract_skills_from_text(text: str) -> list[str]:
    """Compatibility wrapper used by older callers."""
    return extract_skills(text)


def match_skills(
    resume_skills: list[str],
    jd_skills: list[str],
    matched_threshold: float | None = None,
    partial_threshold: float | None = None,
) -> dict:
    from app.skills.skill_matcher import compute_match_score

    result = compute_match_score(
        resume_skills,
        jd_skills,
        matched_threshold=matched_threshold,
        partial_threshold=partial_threshold,
    )

    logger.info(
        "Semantic skill match: %.1f%% score (%d matched, %d partial, %d gap) via %s",
        result["match_score"],
        len(result["matched"]),
        len(result["partial"]),
        len(result["gap"]),
        result["method_used"],
    )

    return result
