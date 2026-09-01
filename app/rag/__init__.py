from pathlib import Path
from app.utils import get_logger

logger = get_logger("rag")


def load_documents(folder: Path) -> list[dict]:
    docs = []
    if not folder.exists():
        return docs
    for f in folder.glob("**/*"):
        if f.suffix.lower() in (".txt", ".md", ".pdf", ".docx"):
            try:
                if f.suffix == ".txt":
                    text = f.read_text(encoding="utf-8", errors="ignore")
                elif f.suffix == ".md":
                    text = f.read_text(encoding="utf-8", errors="ignore")
                elif f.suffix == ".pdf":
                    from app.resume.pdf_parser import extract_text_from_pdf
                    text = extract_text_from_pdf(f)
                elif f.suffix == ".docx":
                    from app.resume.docx_parser import extract_text_from_docx
                    text = extract_text_from_docx(f)
                else:
                    text = ""
                if text.strip():
                    docs.append({"path": str(f), "text": text, "source": f.name})
            except Exception as e:
                logger.warning("Failed to load %s: %s", f, e)
    logger.info("Loaded %d documents from %s", len(docs), folder)
    return docs
