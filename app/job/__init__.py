from pathlib import Path
from app.utils import get_logger
from app.resume.text_extractor import extract_text, TextExtractionError

logger = get_logger("jd_parser")


def parse_jd(file_path: Path) -> dict:
    try:
        extraction = extract_text(file_path)
    except TextExtractionError as exc:
        logger.error("Failed to parse JD %s: %s", file_path.name, exc)
        return {
            "raw_text": "",
            "cleaned_text": "",
            "title": "",
            "company": "",
            "error": str(exc),
        }

    raw_text = extraction["raw_text"]
    cleaned_text = extraction["cleaned_text"]

    lines = [line.strip() for line in cleaned_text.split("\n") if line.strip()]
    title = lines[0] if lines else "Untitled Position"
    company = ""
    for line in lines[1:6]:
        if any(kw in line.lower() for kw in ["inc", "ltd", "llc", "corp", "technologies", "solutions", "labs", "company", "group"]):
            company = line
            break
    if not company and len(lines) > 1:
        company = lines[1]

    logger.info("JD parsed: title='%s', company='%s'", title, company)
    return {
        "raw_text": raw_text,
        "cleaned_text": cleaned_text,
        "title": title,
        "company": company,
        "char_count": extraction["char_count"],
        "word_count": extraction["word_count"],
        "page_count": extraction["page_count"],
        "file_name": extraction["file_name"],
    }
