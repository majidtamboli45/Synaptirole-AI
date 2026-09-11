from pathlib import Path
from app.utils import get_logger
from app.resume.pdf_parser import extract_text_from_pdf, PDFParseError
from app.resume.docx_parser import extract_text_from_docx, DOCXParseError

logger = get_logger("text_extractor")

SUPPORTED_EXTENSIONS = {".pdf", ".docx", ".doc", ".txt"}


class TextExtractionError(Exception):
    pass


def extract_text(file_path: Path) -> dict:
    ext = file_path.suffix.lower()

    if ext not in SUPPORTED_EXTENSIONS:
        raise TextExtractionError(
            f"Unsupported file type: '{ext}'. "
            f"Supported: {', '.join(sorted(SUPPORTED_EXTENSIONS))}"
        )

    try:
        if ext == ".pdf":
            raw_text = extract_text_from_pdf(file_path)
        elif ext in (".docx", ".doc"):
            raw_text = extract_text_from_docx(file_path)
        elif ext == ".txt":
            raw_text = file_path.read_text(encoding="utf-8", errors="ignore")
        else:
            raw_text = ""
    except (PDFParseError, DOCXParseError) as exc:
        raise TextExtractionError(str(exc)) from exc
    except Exception as exc:
        logger.error("Unexpected error extracting text from %s: %s", file_path.name, exc)
        raise TextExtractionError(f"Extraction failed: {exc}") from exc

    cleaned_text = _clean_text(raw_text)

    char_count = len(cleaned_text)
    word_count = len(cleaned_text.split())
    page_count = _estimate_pages(file_path, ext)

    logger.info(
        "Extraction complete: %s (%d chars, %d words)",
        file_path.name,
        char_count,
        word_count,
    )

    return {
        "raw_text": raw_text,
        "cleaned_text": cleaned_text,
        "char_count": char_count,
        "word_count": word_count,
        "page_count": page_count,
        "file_extension": ext,
        "file_name": file_path.name,
    }


def _clean_text(text: str) -> str:
    import re

    text = re.sub(r"[ \t]+", " ", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    text = text.strip()
    return text


def _estimate_pages(file_path: Path, ext: str) -> int:
    if ext == ".pdf":
        try:
            import pymupdf
            doc = pymupdf.open(str(file_path))
            count = len(doc)
            doc.close()
            return count
        except Exception:
            pass
    return 1
