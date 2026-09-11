import re
from pathlib import Path
from app.utils import get_logger
from app.resume.text_extractor import extract_text, TextExtractionError

logger = get_logger("jd_parser")

_COMPANY_SUFFIX_RE = re.compile(
    r"\b(inc|inc\.|incorporation|ltd|ltd\.|limited|llc|corp|corp\.|corporation|"
    r"technologies|technology|solutions?|systems|services?|labs?|lab|consulting|"
    r"group|enterprises?|enterprise|pvt\.?|private|infotech|software|communications|"
    r"industries|ventures|analytics|networks|holdings|studio(s)?)\b",
    re.IGNORECASE,
)

_NON_COMPANY_SIGNALS = {
    "full-time", "full time", "part-time", "part time", "contract",
    "internship", "freelance", "temporary", "remote", "hybrid",
    "on-site", "onsite", "work from home", "work-from-home",
}

_SECTION_HEADERS = [
    "job summary", "job description", "about the company", "about us",
    "about", "overview", "company overview", "role overview", "the role",
    "responsibilities", "what you'll do", "what you will do", "duties",
    "qualifications", "requirements", "what we're looking for",
    "position", "position summary", "summary", "description", "who we are",
    "we are", "our company", "the company", "key responsibilities",
    "key skills", "skills", "nice to have", "preferred qualifications",
    "benefits", "salary", "location", "apply", "posted", "experience",
]

_SECTION_STARTS = [
    "job summary", "job description", "about", "who we are", "we are",
    "role", "position", "responsib", "qualif", "requir", "what you",
    "overview", "summary", "key responsib", "key skills", "nice to",
    "preferred", "benefits", "salary", "apply", "posted", "located",
    "location", "experience", "education", "skills", "employment type",
]


def parse_job_description(file_path: Path) -> dict:
    try:
        extraction = extract_text(file_path)
    except TextExtractionError as exc:
        logger.error("Failed to parse JD %s: %s", file_path.name, exc)
        return {
            "raw_text": "",
            "cleaned_text": "",
            "title": "",
            "company": "",
            "skills": [],
            "experience_required": "",
            "employment_type": "",
            "error": str(exc),
            "file_name": file_path.name,
        }

    cleaned_text = extraction["cleaned_text"]

    lines = [line.strip() for line in cleaned_text.split("\n") if line.strip()]
    title = _extract_title(cleaned_text, lines)
    company = _extract_company(lines, cleaned_text)

    from app.job.job_analyzer import extract_required_skills
    skills = extract_required_skills(cleaned_text)
    experience_required = _extract_experience_required(cleaned_text)
    employment_type = _extract_employment_type(cleaned_text)

    logger.info(
        "JD parsed: title='%s', company='%s', %d skills",
        title,
        company,
        len(skills),
    )

    return {
        "raw_text": extraction["raw_text"],
        "cleaned_text": cleaned_text,
        "title": title,
        "company": company,
        "skills": skills,
        "experience_required": experience_required,
        "employment_type": employment_type,
        "char_count": extraction["char_count"],
        "word_count": extraction["word_count"],
        "page_count": extraction["page_count"],
        "file_name": extraction["file_name"],
    }


_TITLE_NOISE = {
    "confidential", "misc", "miscellaneous", "draft", "untitled", "job description",
    "job posting", "position", "role", "summary", "job summary", "description",
    "about", "about us", "hiring", "now hiring", "we are hiring", "join our team",
    "career", "opportunity", "apply", "curriculum vitae", "cv", "resume", "location",
    "skills", "qualifications", "responsibilities", "experience", "employment type",
    "employment", "salary", "benefits", "posted", "buzzword", "misc",
}

_TITLE_BAD_START_RE = re.compile(
    r"(?i)^(about|at|we|our|join|you|the|a|an|this|as|to|with|for|in|on|if|please|look)"
    r"\b"
)

_ROLE_KEYWORD_RE = re.compile(
    r"(?i)(engineer|developer|analyst|scientist|architect|consultant|specialist|"
    r"manager|designer|director|lead|officer|strategist|administrator|researcher|"
    r"coordinator|executive|intern)\b"
)

_ROLE_PHRASE_LEVEL = (
    r"(?:Junior|Senior|Sr\.?|Jr\.?|Lead|Staff|Principal|Chief|Head|Associate|Mid|"
    r"Entry[ -]?Level|Executive|Graduate|Trainee|Intern)?\s*"
)
_ROLE_PHRASE_FIELD = (
    r"(?:AI/ML|AI|ML|Machine[ -]Learning|Deep[ -]Learning|Data[ -]Science|Data|"
    r"Software|Full[ -]?Stack|Back[ -]?End|Front[ -]?End|DevOps|Dev[ -]?Ops|Cloud|"
    r"Systems|Platform|Web|Mobile|QA|MLOps|NLP|Security|Product|Project|Business|"
    r"Site[ -]Reliability|SRE|Testing|Automation|Applied|Generative[ -]?AI|GenAI|"
    r"Embedded|Game|Research|Machine)\s*"
)
_ROLE_PHRASE_NOUN = (
    r"(?:Engineer|Developer|Analyst|Scientist|Architect|Consultant|Specialist|Manager|"
    r"Designer|Director|Intern|Administrator|Officer|Strategist|Researcher|Coordinator|Head)\b"
)
_ROLE_PHRASE_RE = re.compile(
    rf"{_ROLE_PHRASE_LEVEL}{_ROLE_PHRASE_FIELD}{_ROLE_PHRASE_NOUN}",
    re.IGNORECASE,
)


def _extract_title(text: str, lines: list[str]) -> str:
    """A title that survives real-world JD noise (Confidential, site headers...)."""
    best, best_score = None, -80
    for line in lines[:25]:
        score = _title_line_score(line)
        if score > best_score:
            best, best_score = line.strip(), score
    if best is not None and best_score >= 0:
        return re.sub(r"\s+", " ", best)

    phrase = _find_role_phrase(text[:2500])
    if phrase:
        return " ".join(w.capitalize() if w.lower() != "ai/ml" else "AI/ML" for w in phrase.split())

    if best is not None:
        return re.sub(r"\s+", " ", best)
    return "Untitled Position"


def _title_line_score(line: str) -> int:
    if not line or len(line) > 45:
        return -99
    lowered = line.strip().lower()
    if lowered in _TITLE_NOISE:
        return -99
    if ":" in line or "|" in line or "!" in line or "?" in line:
        return -99
    if "@" in line or "http" in lowered or "www." in lowered:
        return -99
    if not line[0].isupper():
        return -99
    if _TITLE_BAD_START_RE.match(line):
        return -99
    score = 3 if _ROLE_KEYWORD_RE.search(line) else -2
    words = line.split()
    if 1 <= len(words) <= 6:
        score += 1
    if re.match(r"(?i)^(senior|junior|lead|principal|staff)\b", line):
        score += 1
    if re.search(r"\d", line):
        score -= 1
    if re.match(r"_+|=+", line):
        score -= 10
    return score


def _find_role_phrase(text: str) -> str:
    for match in _ROLE_PHRASE_RE.finditer(text):
        phrase = re.sub(r"\s+", " ", match.group(0)).strip()
        if 2 <= len(phrase.split()) <= 5:
            return phrase
    return ""


def _is_non_company_segment(segment: str) -> bool:
    if not segment:
        return True
    lowered = segment.lower()
    if lowered in _NON_COMPANY_SIGNALS:
        return True
    if re.search(r"\d", segment):
        return True
    if re.fullmatch(r"[A-Za-z]+,\s*[A-Za-z]+", segment):
        return True
    if re.match(
        r"^(?:experience|experience required|salary|pay|compensation|location|"
        r"employment type|type|work mode|remote)\b",
        lowered,
    ):
        return True
    return False


def _extract_company(lines: list[str], text: str = "") -> str:
    candidates: list[str] = []
    for line in lines[1:10]:
        stripped = line.strip()
        if not stripped:
            continue
        if "|" in stripped:
            candidates.extend(seg.strip() for seg in stripped.split("|") if seg.strip())
        else:
            candidates.append(stripped)

    for candidate in candidates:
        lowered = candidate.lower()
        if len(candidate) > 60:
            continue
        if lowered in _SECTION_HEADERS:
            continue
        if any(lowered.startswith(start) for start in _SECTION_STARTS):
            continue
        if re.match(r"[^a-z0-9]*[a-z]", candidate[0:1]):
            continue
        if any(punct in candidate for punct in [":", "!", "?"]):
            continue
        if _is_non_company_segment(candidate):
            continue
        if _COMPANY_SUFFIX_RE.search(lowered):
            return candidate

    for candidate in candidates:
        lowered = candidate.lower()
        if len(candidate) > 60:
            continue
        if lowered in _SECTION_HEADERS:
            continue
        if any(lowered.startswith(start) for start in _SECTION_STARTS):
            continue
        if _is_non_company_segment(candidate):
            continue
        if not re.match(r"^[A-Z0-9]", candidate):
            continue
        words = re.findall(r"\w+", candidate)
        if 2 <= len(words) <= 6:
            title_case = all(
                w[:1].isupper() or w[:1].isdigit() for w in words
            )
            if title_case:
                return candidate

    if text:
        labeled = _company_from_label(text)
        if labeled:
            return labeled
        about = _company_from_about(text)
        if about:
            return about

    return ""


def _company_from_label(text: str) -> str:
    match = re.search(
        r"(?mi)^[^a-z0-9]*(?:company|organisation|organization|employer|"
        r"hiring\s+company)\s*[:.]\s*([^\n]{2,40})",
        text,
    )
    if not match:
        return ""
    candidate = match.group(1).strip(" .,;:")
    if (
        candidate
        and len(candidate.split()) <= 6
        and re.match(r"^[A-Z]", candidate)
        and not re.search(r"\b(experience|salary|location|type)\b", candidate, re.IGNORECASE)
    ):
        return candidate
    return ""


def _company_from_about(text: str) -> str:
    heading = re.search(
        r"(?im)^[^a-z0-9]*(?:about\s+(?:us|the\s+company)|who\s+we\s+are|our\s+company)\s*:?\s*$",
        text,
    )
    if not heading:
        heading = re.search(
            r"(?im)^[^a-z0-9]*about(?:\s+(?:the\s+)?role)?\s*:?\s*$",
            text,
        )
    if not heading:
        return ""
    window = text[heading.end(): heading.end() + 500]
    for pattern in (
        r"\b(?:At|at|Being|being|With|with)\s+([A-Z][\w&.'-]+(?:\s+[A-Z][\w&.'-]{2,})?)",
        r"\b([A-Z][\w&.'-]+(?:\s+[A-Z][\w&.'-]{2,})?)\s+(?:is|are)\s+(?:a|an|the|our)\b",
    ):
        for em in re.finditer(pattern, window):
            candidate = em.group(1).strip(" .,;")
            first = candidate.split()[0].casefold() if candidate.split() else ""
            if first in ("the", "our", "this", "that", "we", "at", "a", "an"):
                continue
            if re.fullmatch(r"[A-Za-z]{2}\.?", candidate):
                continue
            if len(candidate) < 3 or len(candidate) > 30 or len(candidate.split()) > 4:
                continue
            return candidate
    return ""


def _extract_experience_required(text: str) -> str:
    patterns = [
        r"(\d{1,2})\+?\s*(?:years?|yrs?)\s*(?:of)?\s*(?:experience|exp)",
        r"experience\s*[:\-]?\s*(\d{1,2})\+?\s*(?:years?|yrs?)",
        r"(\d{1,2})\s*(?:to|-|–|—|�)\s*(\d{1,2})\s*(?:years?|yrs?)",
    ]
    text_lower = text.lower()
    for pattern in patterns:
        match = re.search(pattern, text_lower)
        if match:
            groups = match.groups()
            if len(groups) == 2:
                return f"{groups[0]}-{groups[1]} Years"
            return f"{groups[0]}+ Years"

    level = _infer_experience_from_level(text)
    if level:
        logger.info("Inferred JD experience from level/seniority words: %s", level)
    return level


def _infer_experience_from_level(text: str) -> str:
    """Best-effort experience from seniority words when no explicit value exists."""
    head = re.sub(r"\s+", " ", text[:1800].lower())
    if re.search(r"\b(entry[ -]?level|fresher|new\s*grad|0[-–—]?1\s+years?|less\s+than\s+1\s+year)\b", head):
        return "0-1 Years"
    if re.search(r"\bjr\b|junior|student|trainee", head):
        return "0-2 Years"
    if re.search(r"\bmid[ -]?level\b|intermediate", head):
        return "3-5 Years"
    if re.search(r"\b(?:senior|principal|staff|head|director|vp|chief)\b", head):
        return "8+ Years"
    return ""


def _extract_employment_type(text: str) -> str:
    types = [
        "full-time", "full time", "part-time", "part time",
        "contract", "internship", "freelance", "temporary",
    ]
    text_lower = text.lower()
    for etype in types:
        if etype in text_lower:
            parts = etype.split()
            return " ".join(p.capitalize() for p in parts)
    return "Full-Time"
