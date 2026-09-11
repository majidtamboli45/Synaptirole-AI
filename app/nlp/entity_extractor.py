"""Custom NER for resume entities: education, experience, and projects.

Blends spaCy's statistical NER (persons, organizations, dates) with
rule-based extraction so each major resume section yields structured records.
"""

import re
from datetime import date
from app.utils import get_logger
from app.nlp.pipeline import process_text
from app.nlp.entity_normalizer import (
    deduplicate,
    normalize_entity,
    title_case,
)
from app.skills.skill_taxonomy import all_terms

logger = get_logger("entity_extractor")

_EDUCATION_DEGREE_RE = re.compile(
    r"(?<![A-Za-z])(?P<degree>"
    r"Bachelor(?:'s)?(?: of (?:Engineering|Science|Arts|Technology|Computer Applications))?"
    r"|Master(?:'s)?(?: of (?:Engineering|Science|Arts|Technology|Business Administration|Computer Applications))?"
    r"|Doctor of Philosophy|Ph\.?D\.?"
    r"|B\.?Tech(?:nology)?|M\.?Tech(?:nology)?"
    r"|B\.?E\.?|M\.?E\.?"
    r"|B\.?A\.?|B\.?S\.?|B\.?Sc\.?(?: Engineering)?|Post\s?graduation"
    r"|M\.?A\.?|M\.?S\.?|M\.?Sc\.?(?: Engineering)?|M\.?B\.?A\.?|M\.?C\.?A\.?"
    r"|MBA|MCA|BCA|BBA|MMS|PGDM"
    r")(?=$|[^\w])",
    re.IGNORECASE,
)

_EDUCATION_FIELD_PATTERN = re.compile(
    r"(?:in|of)\s+([A-Za-z][\w\s&]+?)(?=\s*\||\s*[,(]|$)",
    re.IGNORECASE,
)

_YEAR_RANGE_RE = re.compile(
    r"(?:[A-Za-z]{3,9}\s+)?(20\d{2})\s*(?:to|[–—\-])\s*"
    r"(?:[A-Za-z]{3,9}\s+)?(20\d{2}|present|current)",
    re.IGNORECASE,
)

_YEAR_RE = re.compile(r"\b(20\d{2})\b")

_ROLE_LINE_RE = re.compile(r"^(?P<role>.{2,60}?)\s*(?:[|]|[–—]|�)\s*(?P<remainder>.+)$")

_PERSONAL_SEP_RE = re.compile(r"\s*[|]\s*")

_BULLET_RE = re.compile(r"^\s*(?:[•\-\*]|\d+[).])\s*(.*)")


_SECTION_START_RE = re.compile(
    r"^\s*(?:education|projects?|academic\s+projects|technical\s+skills|core\s+skills|"
    r"skills\s+summary|skills|certifications?|courses?|training|achievements?|"
    r"internships?|publications?|awards?\b|awards\s*&\s*honors|languages?|interests?|"
    r"references?|volunteer(?:ing)?|additional\s+information|personal\s+details|"
    r"hobbies?|objective|profile|summary)\b",
    re.IGNORECASE,
)

_EXPERIENCE_HEADER_RE = re.compile(
    r"^\s*(?:professional\s+experience|work\s+experience|employment\s+history|"
    r"work\s+history|career\s+history|work\s+summary|experience)\s*:?\s*$",
    re.IGNORECASE,
)

_EDUCATION_HEADER_RE = re.compile(
    r"^\s*(?:education|academic\s+background|academic\s+details|educational\s+qualification)"
    r"\s*:?\s*$",
    re.IGNORECASE,
)

_PROJECTS_HEADER_RE = re.compile(
    r"^\s*(?:projects?|academic\s+projects)\s*:?\s*$",
    re.IGNORECASE,
)


def extract_resume_entities(text: str) -> dict:
    """Extract structured education / experience / project records."""
    entities = {
        "education": extract_education(text),
        "experience": extract_experience(text),
        "projects": extract_projects(text),
        "people": extract_people(text),
    }
    return entities


def _lines(text: str) -> list[str]:
    return text.split("\n")


def _section_window(text: str, header_re: re.Pattern) -> str:
    lines = _lines(text)
    start = None
    for idx, line in enumerate(lines):
        if header_re.match(line.strip()):
            start = idx
            break
    if start is None:
        return ""
    end = len(lines)
    for idx in range(start + 1, len(lines)):
        if _SECTION_START_RE.match(lines[idx].strip()):
            end = idx
            break
    return "\n".join(lines[start:end])


# ----------------------------------------------------------------------
# Education
# ----------------------------------------------------------------------
def extract_education(text: str) -> list[dict]:
    section = _section_window(text, _EDUCATION_HEADER_RE)
    window = section or text

    records: list[dict] = []
    for line in _lines(window):
        degree_match = _EDUCATION_DEGREE_RE.search(line)
        if not degree_match:
            continue
        degree = normalize_entity(degree_match.group("degree"))

        year = ""
        year_match = _YEAR_RE.search(line)
        if year_match:
            year = year_match.group(1)
        line_no_year = _YEAR_RE.sub("", line)

        remainder = normalize_entity(line_no_year[degree_match.end():].strip(" ,|"))
        field = ""
        field_match = _EDUCATION_FIELD_PATTERN.match(remainder)
        if field_match:
            field = normalize_entity(field_match.group(1))
            institution_raw = remainder[field_match.end():].strip(" ,|")
        else:
            institution_raw = remainder

        if not institution_raw:
            institution_raw = normalize_entity(line_no_year[: degree_match.start()].strip(" ,|"))

        institution = title_case(institution_raw.strip().replace("()", ""))

        records.append(
            {
                "degree": title_case(degree),
                "field": title_case(field),
                "institution": institution,
                "year": year,
                "raw": normalize_entity(line),
                "source": "ner",
            }
        )

    return deduplicate(records, "raw")


def _dedupe_case(values) -> list[str]:
    seen = set()
    out = []
    for value in values:
        low = value.lower()
        if low in seen:
            continue
        seen.add(low)
        out.append(value)
    return out


# ----------------------------------------------------------------------
# Experience
# ----------------------------------------------------------------------
def extract_experience(text: str) -> list[dict]:
    section = _section_window(text, _EXPERIENCE_HEADER_RE)
    if not section:
        return []

    records: list[dict] = []
    current: dict | None = None

    for raw_line in _lines(section):
        line = _BULLET_RE.sub(r"\1", raw_line).strip()
        if not line:
            continue

        year_range = _YEAR_RANGE_RE.search(line)
        if year_range:
            if current:
                current["start_year"] = int(year_range.group(1))
                end_text = year_range.group(2).lower()
                current["end_year"] = (
                    date.today().year if end_text in ("present", "current") else int(end_text)
                )
            continue

        if _ROLE_LINE_RE.match(line):
            match = _ROLE_LINE_RE.match(line)
            role = normalize_entity(match.group("role"))
            company, location = _split_company_location(match.group("remainder"))

            if current:
                records.append(current)
            current = {
                "role": title_case(role) if role else "",
                "company": title_case(company),
                "location": title_case(location),
                "start_year": None,
                "end_year": None,
                "bullets": [],
            }
            continue

        if current:
            current["bullets"].append(line)

    if current:
        records.append(current)

    for rec in records:
        years = _diff_years(rec.get("start_year"), rec.get("end_year"))
        rec["years"] = years
        if rec["start_year"] is None:
            rec["start_year"] = ""
        if rec["end_year"] is None:
            rec["end_year"] = ""
    return records


def _is_role_line(line: str) -> bool:
    return bool(_ROLE_LINE_RE.match(line))


def _split_company_location(company_raw: str) -> tuple[str, str]:
    if not company_raw:
        return "", ""
    comma = company_raw.split(",", maxsplit=1)
    if len(comma) == 2 and _is_location(comma[1].strip()):
        return comma[0].strip(), comma[1].strip()
    return company_raw.strip(), ""


def _is_location(value: str) -> bool:
    if len(value) < 2 or len(value) > 30:
        return False
    if re.search(r"\d", value):
        return False
    return bool(re.search(r"\b[A-Z]", value))


def _diff_years(start, end) -> str:
    if not start:
        return ""
    end = end or date.today().year
    try:
        years = int(end) - int(start)
    except (TypeError, ValueError):
        return ""
    if years < 1:
        return "Less than 1 year"
    return f"{years} year{'s' if years > 1 else ''}"


# ----------------------------------------------------------------------
# Projects
# ----------------------------------------------------------------------
def extract_projects(text: str) -> list[dict]:
    section = _section_window(text, _PROJECTS_HEADER_RE)
    if not section:
        return []

    records: list[dict] = []
    for raw_line in _lines(section):
        stripped = raw_line.strip()
        bullet = _BULLET_RE.sub(r"\1", stripped).strip()
        if not bullet or bullet.lower() in ("projects", "academic projects"):
            continue

        parts = _PERSONAL_SEP_RE.split(bullet, maxsplit=1)
        name_part = normalize_entity(parts[0])
        tech_after = normalize_entity(parts[1]) if len(parts) > 1 else ""

        name, tech_inline = _split_project_name_tech(name_part)
        tech = tech_inline or tech_after

        records.append(
            {
                "name": title_case(name),
                "tech": tech,
                "description": normalize_entity(bullet),
            }
        )

    return deduplicate(records, "name")


def _split_project_name_tech(name_part: str) -> tuple[str, str]:
    match = re.search(r"\s+[-–—]\s+", name_part)
    if match:
        return name_part[: match.start()].strip(), name_part[match.end():].strip()
    return name_part, ""


# ----------------------------------------------------------------------
# People (statistical NER)
# ----------------------------------------------------------------------
_SKILL_TERMS_CACHE: set[str] | None = None


def _skill_terms() -> set[str]:
    global _SKILL_TERMS_CACHE
    if _SKILL_TERMS_CACHE is None:
        _SKILL_TERMS_CACHE = {term.casefold() for term in all_terms()}
    return _SKILL_TERMS_CACHE


def extract_people(text: str) -> list[str]:
    doc = process_text(text or "")
    skill_terms = _skill_terms()
    people = []
    for entity in doc.ents:
        if entity.label_ != "PERSON":
            continue
        clean = re.sub(r"\s+", " ", entity.text).strip()
        if not clean or clean.casefold() in skill_terms:
            continue
        if len(clean) > 40 or re.search(r"\d", clean):
            continue
        if " - " in clean or " – " in clean:
            continue
        tokens = clean.split()
        if any(token.casefold() in skill_terms for token in tokens):
            continue
        if len(tokens) > 3:
            continue
        people.append(clean)
    return _dedupe_case(people)[:5]