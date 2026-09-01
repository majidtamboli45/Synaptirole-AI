from pathlib import Path
from app.utils import get_logger
from app.resume.pdf_parser import extract_text_from_pdf
from app.resume.docx_parser import extract_text_from_docx

logger = get_logger("jd_parser")


def parse_job_description(file_path: Path) -> dict:
    ext = file_path.suffix.lower()
    if ext == ".pdf":
        text = extract_text_from_pdf(file_path)
    elif ext in (".docx", ".doc"):
        text = extract_text_from_docx(file_path)
    elif ext == ".txt":
        text = file_path.read_text(encoding="utf-8", errors="ignore")
    else:
        text = ""

    lines = [l.strip() for l in text.split("\n") if l.strip()]
    title = lines[0] if lines else "Untitled Position"
    company = lines[1] if len(lines) > 1 else ""

    logger.info("JD parsed: '%s' at '%s'", title, company)
    return {"raw_text": text, "title": title, "company": company}
