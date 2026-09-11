"""Skill alias / synonym normalization.

Map every variation of a skill (abbreviation, casing, spacing) to a single
canonical form so that e.g. "NLP", "nlp" and "Natural Language Processing"
all resolve to the same skill.
"""

import re
from app.skills.skill_taxonomy import SKILL_TAXONOMY, all_terms

_normalize_re = re.compile(r"[^a-z0-9+#.]+")
_lookup: dict[str, str] | None = None


def _get_lookup() -> dict[str, str]:
    global _lookup
    if _lookup is None:
        _lookup = {}
        for term, canonical in all_terms().items():
            normalized = _normalize_re.sub("-", term).strip("-")
            _lookup[normalized] = canonical
        for canonical in SKILL_TAXONOMY:
            normalized = _normalize_re.sub("-", canonical.lower()).strip("-")
            _lookup.setdefault(normalized, canonical)
    return _lookup


def normalize_key(raw: str) -> str:
    """Return a canonical skill id for a raw skill mention (or '' if unknown)."""
    if not raw:
        return ""
    key = _normalize_re.sub("-", raw.lower()).strip("-")
    if not key:
        return ""
    return _get_lookup().get(key, "")


def canonical_list(raw_terms) -> list[str]:
    """Map a list of raw skill mentions to deduplicated canonical names."""
    seen = set()
    out = []
    for term in raw_terms or []:
        key = normalize_key(str(term))
        if key and key not in seen:
            seen.add(key)
            out.append(key)
    return out


def category_for(skill: str) -> str:
    """Return the category id for a canonical skill name."""
    meta = SKILL_TAXONOMY.get(skill, {})
    return meta.get("category", "other")