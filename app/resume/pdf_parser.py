from pathlib import Path
from app.utils import get_logger

logger = get_logger("pdf_parser")


def extract_text_from_pdf(pdf_path: Path) -> str:
    try:
        import pymupdf
        doc = pymupdf.open(str(pdf_path))
        text = ""
        for page in doc:
            text += page.get_text()
        doc.close()
        logger.info("Extracted %d chars from PDF: %s", len(text), pdf_path.name)
        return text
    except ImportError:
        logger.warning("pymupdf not installed")
        return ""
