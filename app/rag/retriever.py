from app.rag.embedding_model import embed_text
from app.rag.vector_database import search
from app.utils import get_logger

logger = get_logger("retriever")


def retrieve_context(query: str, top_k: int = 5) -> list[dict]:
    embedding = embed_text(query)
    if embedding is None:
        logger.warning("Could not embed query, returning empty results")
        return []
    results = search(embedding, top_k=top_k)
    logger.info("Retrieved %d results for query", len(results))
    return results
