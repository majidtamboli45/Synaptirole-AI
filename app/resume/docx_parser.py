from pathlib import Path
from app.utils import get_logger

logger = get_logger("docx_parser")


def extract_text_from_docx(docx_path: Path) -> str:
    try:
        from docx import Document
        doc = Document(str(docx_path))
        text = "\n".join([para.text for para in doc.paragraphs])
        logger.info("Extracted %d chars from DOCX: %s", len(text), docx_path.name)
        return text
    except ImportError:
        logger.warning("python-docx not installed")
        return ""
