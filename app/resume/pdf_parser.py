from pathlib import Path
from app.utils import get_logger

logger = get_logger("pdf_parser")


class PDFParseError(Exception):
    pass


def extract_text_from_pdf(pdf_path: Path) -> str:
    if not pdf_path.exists():
        logger.error("PDF file not found: %s", pdf_path)
        raise PDFParseError(f"File not found: {pdf_path.name}")

    if pdf_path.stat().st_size == 0:
        logger.error("PDF file is empty: %s", pdf_path)
        raise PDFParseError(f"File is empty: {pdf_path.name}")

    try:
        import pymupdf
    except ImportError:
        logger.error("pymupdf is not installed. Install with: pip install pymupdf")
        raise PDFParseError("PDF library (pymupdf) is not installed")

    try:
        doc = pymupdf.open(str(pdf_path))
    except Exception as exc:
        logger.error("Failed to open PDF %s: %s", pdf_path.name, exc)
        raise PDFParseError(f"Cannot open PDF: {pdf_path.name} — {exc}") from exc

    try:
        if doc.is_encrypted:
            logger.warning("PDF is encrypted, attempting unlock: %s", pdf_path.name)
            try:
                doc.authenticate("")
            except Exception:
                doc.close()
                raise PDFParseError(
                    f"PDF is password-protected: {pdf_path.name}"
                )

        text = ""
        page_count = len(doc)
        for page_num in range(page_count):
            page = doc[page_num]
            page_text = page.get_text()
            text += page_text

        if not text.strip():
            logger.warning(
                "No text extracted from PDF (may be image-only): %s",
                pdf_path.name,
            )

        logger.info(
            "Extracted %d chars from %d pages: %s",
            len(text),
            page_count,
            pdf_path.name,
        )
        return text

    except PDFParseError:
        raise
    except Exception as exc:
        logger.error("Failed to extract text from PDF %s: %s", pdf_path.name, exc)
        raise PDFParseError(f"Text extraction failed: {exc}") from exc
    finally:
        doc.close()
