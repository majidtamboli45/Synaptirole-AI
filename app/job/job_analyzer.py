"""Job description skill extraction backed by the Phase 3 NLP pipeline.

Required vs preferred skills are separated by scanning for the
preferred / nice-to-have / bonus / plus section of the JD.
"""

import re
from app.utils import get_logger
from app.skills.skill_extractor import extract_skills as _extract_skills_nlp

logger = get_logger("job_analyzer")

_PREFERRED_SECTION_RE = re.compile(
    r"preferred|nice.to.have|bonus|plus|good.nodes|would.be",
    re.IGNORECASE,
)

_PREFERRED_END_RE = re.compile(
    r"^\s*(?:benefits|salary|compensation|about|apply|posted|how.to.apply|"
    r"location|perks|interview.process)\b",
    re.IGNORECASE,
)


def extract_required_skills(text: str) -> list[str]:
    """Extract canonical skills from the main body of the JD."""
    preferred = extract_preferred_skills_raw(text)
    skills = sorted(_extract_skills_nlp(text))
    if preferred:
        pref_set = set(preferred)
        skills = [s for s in skills if s not in pref_set]
    logger.info("JD required skills: %d", len(skills))
    return skills


def extract_preferred_skills(text: str) -> list[str]:
    return sorted(extract_preferred_skills_raw(text))


def extract_preferred_skills_raw(text: str) -> list[str]:
    """Return canonical skills found only inside preferred/nice-to-have sections."""
    preferred_lines: list[str] = []
    capture = False
    for line in text.split("\n"):
        stripped = line.strip()
        if _PREFERRED_SECTION_RE.search(stripped):
            capture = True
        elif capture and _PREFERRED_END_RE.match(stripped):
            capture = False
            break
        if capture and stripped:
            preferred_lines.append(stripped)
    if not preferred_lines:
        return []
    preferred_text = "\n".join(preferred_lines)
    return _extract_skills_nlp(preferred_text)