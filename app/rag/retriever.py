from app.config import RAG_TOP_K
from app.rag.embedding_model import embed_text
from app.rag.vector_database import search
from app.utils import get_logger

logger = get_logger("retriever")


def retrieve_context(
    query: str,
    skills: list[str] | None = None,
    top_k: int = RAG_TOP_K,
) -> list[dict]:
    embedding = embed_text(query)
    if embedding is None:
        logger.warning("Could not embed query, returning empty results")
        return []
    skills = skills or ["python"]
    if isinstance(skills, str):
        skills = [skills]
    results = []
    for skill in skills:
        results.extend(search(skill, embedding, top_k=top_k))
    results.sort(key=lambda r: r.get("distance", float("inf")))
    results = results[:top_k]
    logger.info("Retrieved %d results across %d skill(s)", len(results), len(skills))
    return results