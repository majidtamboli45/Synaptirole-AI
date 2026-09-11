import re
from datetime import date
from pathlib import Path
from app.utils import get_logger
from app.resume.text_extractor import extract_text, TextExtractionError

logger = get_logger("resume_analyzer")

EXPERIENCE_PATTERNS = [
    r"(\d{1,2})\+?\s*(?:years?|yrs?)\s*(?:of)?\s*(?:experience|exp)",
    r"experience\s*[:\-]?\s*(\d{1,2})\+?\s*(?:years?|yrs?)",
    r"(\d{1,2})\s*(?:to|-|–|—|�)\s*(\d{1,2})\s*(?:years?|yrs?)",
    r"(\d{1,2})\+?\s*(?:years?|yrs?)\s+of\s+(?:professional|relevant|hands-on|working|work)?\s*(?:experience|exp)",
    r"experience\s+(?:of|in)\s+(\d{1,2})\+?\s*(?:years?|yrs?)",
]

def extract_skills(text: str) -> list[str]:
    """Extract canonical, deduplicated skills via the NLP skill extractor."""
    from app.skills.skill_extractor import extract_skills as _extract_skills_nlp
    return _extract_skills_nlp(text)


def extract_education(text: str) -> list[str]:
    """Education as display strings, sourced from the structured NLP extractor."""
    try:
        from app.nlp.entity_extractor import extract_education as _structured_education
        records = [r for r in _structured_education(text) if r]
    except Exception:
        logger.warning("Structured education extraction failed", exc_info=True)
        return []

    seen = set()
    results = []
    for rec in records:
        parts = [
            rec.get("degree"),
            f"in {rec['field']}" if rec.get("field") else "",
            rec.get("institution"),
            f"({rec['year']})" if rec.get("year") else "",
        ]
        label = " ".join(p for p in parts if p)
        key = label.strip().lower()
        if key and key not in seen:
            seen.add(key)
            results.append(label)
    return results


_EXPERIENCE_SECTION_RE = re.compile(
    r"^(?:professional\s+experience|work\s+experience|employment\s+history|"
    r"work\s+history|career\s+history|work\s+summary|professional\s+background|"
    r"working\s+experience|employment|experience)"
    r"(?:\s*[&|]\s*(?:projects?|internships?|achievements?))?\s*:?\s*$",
    re.IGNORECASE,
)

_EXPERIENCE_HEADER_RE = re.compile(
    r"^\s*experience\s*:?\s*$",
    re.IGNORECASE,
)

_EXPERIENCE_END_SECTION_RE = re.compile(
    r"^\s*(?:education|projects?|academic\s+projects|technical\s+skills|core\s+skills|"
    r"skills\s+summary|skills|certifications?|courses?|training|achievements?|"
    r"internships?|publications?|awards\s*&\s*honors|awards?|languages?|interests?|"
    r"references?|volunteer(?:ing)?|additional\s+information|personal\s+details|"
    r"hobbies?|objective|profile|summary)\b",
    re.IGNORECASE,
)


def _extract_experience_section(text: str) -> str:
    """Return only the text under the work-experience heading(s)."""
    lines = text.split("\n")
    start = None
    for index, line in enumerate(lines):
        stripped = line.strip()
        if _EXPERIENCE_SECTION_RE.match(line):
            start = index
            break
        if _EXPERIENCE_HEADER_RE.match(stripped) and len(stripped) <= 24:
            start = index
            break
    if start is None:
        return ""
    end = len(lines)
    for index in range(start + 1, len(lines)):
        if _EXPERIENCE_END_SECTION_RE.match(lines[index]):
            end = index
            break
    return "\n".join(lines[start:end])


def _infer_experience_years_from_dates(text: str) -> int:
    if not text:
        return 0
    current_year = date.today().year
    range_re = re.compile(
        r"(20\d{2})\s*(?:to|[–—\-�])\s*(20\d{2}|present|current)",
        re.IGNORECASE,
    )
    spans: list[list[int]] = []
    for match in range_re.finditer(text):
        start = int(match.group(1))
        end_text = match.group(2).strip().lower()
        end = current_year if end_text in ("present", "current") else int(end_text)
        if 2000 <= start < end:
            spans.append([start, end])
    if not spans:
        return 0

    spans.sort()
    merged = [spans[0]]
    for span_start, span_end in spans[1:]:
        if span_start <= merged[-1][1]:
            if span_end > merged[-1][1]:
                merged[-1][1] = span_end
        else:
            merged.append([span_start, span_end])
    return sum(end - start for start, end in merged)


def extract_experience_years(text: str) -> str:
    text_lower = text.lower()
    for pattern in EXPERIENCE_PATTERNS:
        match = re.search(pattern, text_lower)
        if match:
            groups = match.groups()
            if len(groups) == 2:
                return f"{groups[0]}-{groups[1]} Years"
            years = match.group(1)
            return f"{years}+ Years"

    inferred = _infer_experience_years_from_dates(
        _extract_experience_section(text)
    )
    if inferred:
        return f"{inferred}+ Years"

    level = _infer_experience_from_level(text)
    if level:
        logger.info("Inferred experience from level/seniority words: %s", level)
    return level


def _infer_experience_from_level(text: str) -> str:
    """Best-effort experience estimate from seniority words (no full rewrite)."""
    head = re.sub(r"\s+", " ", text[:1200].lower())
    if re.search(r"\b(student|intern(?:ship)?|fresher|new\s*grad|entry[ -]?level|0[-–—]?1\s+years?)\b", head[:800]):
        return "0-1 Years"
    if re.search(r"\bjr\b|junior", head):
        return "0-2 Years"
    if re.search(r"\bmid[ -]?level\b|intermediate", head):
        return "3-5 Years"
    if re.search(r"\b(?:senior|principal|staff|head|director|vp|chief)\b", head):
        return "8+ Years"
    if re.search(r"\blead\s+(?:engineer|developer|analyst|scientist|architect|consultant|manager|designer)\b", head):
        return "8+ Years"
    return ""


def extract_experience(text: str) -> list[dict]:
    experiences = []
    lines = text.split("\n")
    for i, line in enumerate(lines):
        if re.search(
            r"\b(years?|experience|worked at|positioned as|role as|employed at)\b",
            line,
            re.IGNORECASE,
        ):
            context = " ".join(lines[max(0, i - 1) : min(len(lines), i + 2)])
            experiences.append({"context": context.strip()[:200]})
    return experiences[:10]


def extract_name(text: str) -> str:
    """Extract the candidate's name.

    Strategy:
      1. Heuristic over the first few lines (fast, safe for simple layouts).
      2. Trained-NER ``PERSON`` entities as fallback (handles headers/logos,
         contact-first or section-heading first lines).
    """
    heuristic = _heuristic_name(text)
    if heuristic:
        return heuristic

    try:
        from app.nlp.entity_extractor import extract_people
        for candidate in extract_people(text):
            candidate = re.sub(r"\s+", " ", candidate).strip()
            if _is_valid_person_name(candidate):
                return candidate
    except Exception:
        logger.warning("NER name extraction failed", exc_info=True)
    return ""


_NAME_NOISE_RE = re.compile(
    r"^(?:resume|cv|curriculum\s+vitae|curriculum|professional\s+summary|career\s+summary|"
    r"summary|objective|career\s+objective|profile|professional\s+profile|contact|"
    r"contact\s+information|personal\s+details|personal\s+information|work\s+experience|"
    r"experience|education|technical\s+skills|skills|certifications?|projects?|"
    r"references?|languages?|hobbies?|interests?|confidential|name)\b",
    re.IGNORECASE,
)

_NAME_TITLE_CASE_RE = re.compile(r"^[A-Z][A-Za-z]+(?:[ '-][A-Z][A-Za-z]+)+$")
_NAME_ALL_CAPS_RE = re.compile(r"^[A-Z][A-Z]*(?:[ -][A-Z][A-Z]*)+$")

_ROLE_NOUN_RE = re.compile(
    r"(?i)(engineer|developer|analyst|scientist|architect|consultant|specialist|"
    r"manager|director|lead|intern|administrator|officer|strategist|researcher|"
    r"coordinator|executive|designer)\b"
)

_SENIORITY_WORD_RE = re.compile(
    r"(?i)^(?:senior|junior|lead|staff|principal|chief|mid|entry|associate)$"
)


def _heuristic_name(text: str) -> str:
    lines = [l.strip() for l in text.split("\n") if l.strip()]
    for index in range(min(6, len(lines))):
        candidate = lines[index]
        if _NAME_NOISE_RE.match(candidate):
            continue
        if re.search(r"@|https?://|www\.|linkedin", candidate, re.IGNORECASE):
            continue
        if re.search(r"\d", candidate[:40]):
            continue
        if ":" in candidate:
            continue
        if "|" in candidate:
            candidate = candidate.split("|")[0].strip().rstrip(",")
        if not candidate:
            continue
        tokens = candidate.split()
        if len(tokens) > 4:
            continue
        if _NAME_TITLE_CASE_RE.match(candidate) or _NAME_ALL_CAPS_RE.match(candidate):
            return candidate
    return ""


def _is_valid_person_name(name: str) -> bool:
    if not name or len(name) > 30 or re.search(r"\d", name):
        return False
    if _NAME_NOISE_RE.match(name):
        return False
    tokens = [t for t in re.split(r"[^A-Za-z]+", name) if t]
    if not tokens or len(tokens) > 4:
        return False
    role_hits = [
        t
        for t in tokens
        if _ROLE_NOUN_RE.search(t) or _SENIORITY_WORD_RE.match(t)
    ]
    if len(role_hits) == len(tokens) and len(tokens) >= 2:
        return False
    return True


def extract_current_role(text: str, entities: dict | None = None) -> str:
    """Extract the current/latest role.

    Heuristic phrase scan first (stable on typical layouts), then the trained
    NER model as a fallback for resume variants the heuristics miss.
    Finally, fall back to the first role from structured experience entities.
    As a last resort, check for "Intern" in the text (common for fresher resumes).
    """
    heuristic = _heuristic_role(text)
    if heuristic:
        return heuristic

    ner_role = _ner_current_role(text)
    if ner_role:
        return ner_role

    if entities and entities.get("experience"):
        first_exp = entities["experience"][0]
        role = first_exp.get("role", "").strip()
        if role:
            return role

    # Fallback: check for intern in text (fresher resumes)
    if re.search(r"\bintern\b", text, re.IGNORECASE):
        return "Intern"

    return ""


def _ner_current_role(text: str) -> str:
    try:
        from app.nlp.pipeline import process_text
        doc = process_text(text)
    except Exception:
        return ""
    for entity in doc.ents[:60]:
        if entity.label_ != "JOB_TITLE":
            continue
        value = re.sub(r"[•*|·]+", " ", entity.text)
        value = re.sub(r"[–—\-:]+$", "", value.strip())
        value = re.sub(r"\s+", " ", value).strip(" .")
        if not value or len(value) > 50:
            continue
        if re.search(r"\d", value):
            continue
        if not re.search(r"[A-Za-z]", value):
            continue
        if ":" in value or re.search(r"@|linkedin|linked\.in", value, re.IGNORECASE):
            continue
        if _NAME_NOISE_RE.match(value) or re.match(
            r"(?i)^(?:job|position|role|summary|responsib|qualif|skills|education)\b",
            value,
        ):
            continue
        if _ROLE_NOUN_RE.search(value) or _ROLE_PHRASE_RE.search(value):
            return _title_case_role(value)
    return ""


def _title_case_role(value: str) -> str:
    return " ".join(w[:1].upper() + w[1:] if w else w for w in value.split())


_ROLE_PHRASE_RE = re.compile(
    r"(?<![A-Za-z])"
    r"(?:(?:Senior|Lead|Staff|Principal|Chief|Head|Associate|Junior|Mid|Entry|Sr\.?|Jr\.?)\s+)?"
    r"(?:AI|ML|AI/ML|Machine\s+Learning|Deep\s+Learning|Data\s+[Ss]cience|Data|Software|Front.?end|Back.?end|"
    r"Full.?[Ss]tack|DevOps|Cloud|Systems|Platform|Web|Mobile|QA|MLOps|NLP|Security|Product|"
    r"Project|Business|Support|Site\s+Reliability|SRE|Testing|Automation|Applied|Generative|"
    r"Artificial\s+Intelligence|Gen\s*AI|Embedded|Game|Research)\s*"
    r"(?:Engineer|Developer|Analyst|Scientist|Architect|Consultant|Specialist|Manager|Designer|"
    r"Director|Intern|Administrator|Officer|Strategist|Researcher|Coordinator|SDE|Student|Fresher)\b",
    re.IGNORECASE,
)


def _heuristic_role(text: str) -> str:
    lines = [l.strip() for l in text.split("\n") if l.strip()]
    for line in lines[:20]:
        if _NAME_NOISE_RE.match(line):
            continue
        if re.search(r"@|https?://|linkedin", line, re.IGNORECASE):
            continue
        match = _ROLE_PHRASE_RE.search(line)
        if match and len(match.group(0)) <= 30:
            return _title_case_role(re.sub(r"\s+", " ", match.group(0)))
    return ""


def analyze_resume(file_path: Path) -> dict:
    try:
        extraction = extract_text(file_path)
    except TextExtractionError as exc:
        logger.error("Failed to extract text from resume %s: %s", file_path.name, exc)
        return {
            "raw_text": "",
            "cleaned_text": "",
            "skills": [],
            "education": [],
            "experience": [],
            "experience_years": "",
            "name": "",
            "current_role": "",
            "error": str(exc),
            "file_name": file_path.name,
            "char_count": 0,
            "word_count": 0,
        }

    cleaned_text = extraction["cleaned_text"]

    skills = extract_skills(cleaned_text)
    education = extract_education(cleaned_text)
    experience = extract_experience(cleaned_text)
    experience_years = extract_experience_years(cleaned_text)
    name = extract_name(cleaned_text)

    entities = _extract_structured_entities(cleaned_text)
    current_role = extract_current_role(cleaned_text, entities)

    logger.info(
        "Resume analysis: name='%s', %d skills, %d education entries, experience=%s",
        name,
        len(skills),
        len(education),
        experience_years or "unknown",
    )

    return {
        "raw_text": extraction["raw_text"],
        "cleaned_text": cleaned_text,
        "skills": skills,
        "education": education,
        "experience": experience,
        "experience_years": experience_years,
        "name": name,
        "current_role": current_role,
        "entities": entities,
        "file_name": extraction["file_name"],
        "char_count": extraction["char_count"],
        "word_count": extraction["word_count"],
        "page_count": extraction["page_count"],
    }


def _extract_structured_entities(text: str) -> dict:
    """Structured NER records (education / experience / projects / people)."""
    try:
        from app.nlp.entity_extractor import extract_resume_entities
        return extract_resume_entities(text)
    except Exception as exc:
        logger.warning("Structured entity extraction failed: %s", exc)
        return {"education": [], "experience": [], "projects": [], "people": []}
