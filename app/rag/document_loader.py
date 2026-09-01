from pathlib import Path
from app.utils import get_logger
from app.rag import load_documents

logger = get_logger("document_loader")


def load_knowledge_base(folder: Path) -> list[dict]:
    docs = load_documents(folder)
    chunks = []
    for doc in docs:
        text = doc["text"]
        chunk_size = 500
        for i in range(0, len(text), chunk_size):
            chunk = text[i:i+chunk_size]
            if chunk.strip():
                chunks.append({"text": chunk, "source": doc["source"], "path": doc["path"]})
    logger.info("Split into %d chunks from %d documents", len(chunks), len(docs))
    return chunks
