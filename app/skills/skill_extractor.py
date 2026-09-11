"""Skill extraction powered by spaCy NER + the skill taxonomy.

Combines:
  1. Rule-based NER (spaCy EntityRuler) built from the taxonomy
  2. A regex fallback over normalized text (for tokenization edge cases)
  3. Synonym normalization + deduplication (canonical names)
  4. Section-aware context (where each skill was found)

Public API:
  ``extract_skills(text) -> list[str]``        (backward compatible)
  ``extract_skills_detailed(text) -> list[dict]``
"""

from app.utils import get_logger
from app.nlp.pipeline import extract_skill_spans, process_text
from app.skills.skill_taxonomy import SKILL_TAXONOMY, all_terms
from app.skills.skill_synonyms import canonical_list, category_for

logger = get_logger("skill_extractor")

_SECTION_HEADERS = [
    "technical skills", "skills", "core competencies", "core skills",
    "toolbox", "technologies", "proficiencies", "professional summary",
    "summary", "professional experience", "work experience", "experience",
    "projects", "academic projects", "education", "certifications",
    "languages", "courses", "interests",
]


def _section_for_line(lines, idx) -> str:
    """Return the nearest section header above ``lines[idx]``."""
    current = "body"
    for i in range(idx, -1, -1):
        stripped = lines[i].strip().lower().rstrip(":")
        for header in _SECTION_HEADERS:
            if stripped == header:
                current = header
                break
    return current


def extract_skills_detailed(text: str) -> list[dict]:
    """Extract skills with canonical name, category, confidence and context.

    Each returned dict:
        { "skill": canonical name, "category": category id, "aliases": seen forms,
          "count": number of occurrences, "sections": sections it appeared in,
          "confidence": 0.0-1.0 }
    """
    if not text:
        return []

    terms_map = all_terms()
    cleaned = text.lower()

    # 1) spaCy EntityRuler spans -> raw mentions
    raw_mentions: list[str] = []
    for _canonical, _start, _end, raw in extract_skill_spans(text):
        raw_mentions.append(raw)

    # 2) regex fallback over the normalized text (handles tokenization edge cases)
    for term in terms_map:
        if len(term) >= 2:
            for match in _regex_matches(cleaned, term):
                raw_mentions.append(match)

    # 3) canonicalize + count
    lines = text.split("\n")
    seen: dict[str, dict] = {}
    for mention in raw_mentions:
        canonical = terms_map.get(_normalize(mention)) or _match_substring(cleaned, mention)
        if not canonical:
            continue
        entry = seen.setdefault(
            canonical,
            {
                "skill": canonical,
                "category": category_for(canonical),
                "aliases": [],
                "count": 0,
                "sections": [],
                "confidence": 0.0,
            },
        )
        entry["count"] += 1
        if mention not in entry["aliases"]:
            entry["aliases"].append(mention)

    # 4) section context
    for entry in seen.values():
        sections_found = []
        for i, line in enumerate(lines):
            if _line_mentions_skill(line, entry["skill"]):
                section = _section_for_line(lines, i)
                if section not in sections_found:
                    sections_found.append(section)
        entry["sections"] = sections_found

    # 5) confidence: skills section + multiple mentions -> high confidence
    for entry in seen.values():
        score = 0.4
        if any("skill" in s or "competenc" in s or "technolog" in s for s in entry["sections"]):
            score += 0.3
        if "summary" in entry["sections"] or "experience" in entry["sections"]:
            score += 0.1
        if entry["count"] > 1:
            score += 0.2
        entry["confidence"] = round(min(score, 1.0), 2)

    return list(seen.values())


def extract_skills(text: str) -> list[str]:
    """Return the deduplicated, canonical skill list (compat API)."""
    return [entry["skill"] for entry in extract_skills_detailed(text)]


def _normalize(term: str) -> str:
    import re
    return re.sub(r"[^a-z0-9+#.]+", "-", term.lower()).strip("-")


def _regex_matches(cleaned: str, term: str) -> list[str]:
    """Case-insensitive word-boundary matches of ``term`` inside ``cleaned``."""
    import re
    escaped = re.escape(term)
    return re.findall(r"(?<![a-z0-9])" + escaped + r"(?![a-z0-9])", cleaned)


def _match_substring(cleaned: str, mention: str) -> str:
    """Best-effort map of a raw mention to a canonical taxonomy term."""
    normalized = _normalize(mention)
    if not normalized or len(normalized) < 2:
        return ""
    terms_map = all_terms()
    exact = terms_map.get(normalized)
    if exact:
        return exact
    for term in sorted(terms_map, key=len, reverse=True):
        if normalized.find(_normalize(term)) != -1:
            return terms_map[term]
    return ""


def _line_mentions_skill(line: str, canonical: str) -> bool:
    lowered = line.lower()
    if canonical.lower() in lowered:
        return True
    meta = SKILL_TAXONOMY.get(canonical, {})
    for alias in meta.get("aliases", ()):
        if alias.lower() in lowered:
            return True
    return False


def extract_skills_with_names(text: str) -> list[str]:
    """Alias kept for compatibility with older callers."""
    return extract_skills(text)


def profile_text_skills(text: str) -> dict:
    """Return {category_id: [skill names]} grouped view used by visualizations."""
    grouped: dict[str, list[str]] = {}
    for entry in extract_skills_detailed(text):
        grouped.setdefault(entry["category"], []).append(entry["skill"])
    return grouped