from pathlib import Path

from app.config import RAG_CHUNK_OVERLAP, RAG_CHUNK_SIZE
from app.rag import load_documents
from app.utils import get_logger

logger = get_logger("document_loader")


def chunk_text(
    text: str,
    chunk_size: int = RAG_CHUNK_SIZE,
    overlap: int = RAG_CHUNK_OVERLAP,
) -> list[str]:
    if chunk_size <= overlap:
        raise ValueError("chunk_size must be greater than overlap")
    chunks = []
    start = 0
    while start < len(text):
        end = min(start + chunk_size, len(text))
        if end < len(text):
            back = text.rfind(". ", start, end)
            newline = text.rfind("\n", start, end)
            cut = max(back, newline)
            if cut > start:
                end = cut + 1
        chunk = text[start:end].strip()
        if chunk:
            chunks.append(chunk)
        if end >= len(text):
            break
        start = max(end - overlap, start + 1)
    return chunks


def load_knowledge_base(folder: Path, topic: str | None = None) -> list[dict]:
    docs = load_documents(folder)
    topic = topic or (folder.name if folder else "unknown")
    chunks = []
    for doc in docs:
        for piece in chunk_text(doc["text"]):
            chunks.append(
                {
                    "text": piece,
                    "source": doc["source"],
                    "path": doc["path"],
                    "topic": topic,
                    "kind": "book" if doc["path"].lower().endswith(".pdf") else "tutorial",
                }
            )
    logger.info(
        "Split %d documents into %d chunks (size=%d, overlap=%d, topic=%s)",
        len(docs),
        len(chunks),
        RAG_CHUNK_SIZE,
        RAG_CHUNK_OVERLAP,
        topic,
    )
    return chunks