import json

import numpy as np

from app.config import RAG_INDEX_ROOT
from app.utils import get_logger

logger = get_logger("vector_database")

_indexes: dict[str, object] = {}
_documents: dict[str, list[dict]] = {}


def _skill_dir(skill: str):
    return RAG_INDEX_ROOT / skill


def build_index(skill: str, documents: list[dict], embeddings: np.ndarray) -> bool:
    try:
        import faiss
        dim = embeddings.shape[1]
        index = faiss.IndexFlatL2(dim)
        index.add(embeddings.astype(np.float32))
        skill_dir = _skill_dir(skill)
        skill_dir.mkdir(parents=True, exist_ok=True)
        faiss.write_index(index, str(skill_dir / "index.faiss"))
        (skill_dir / "index.meta.json").write_text(
            json.dumps(documents, ensure_ascii=False), encoding="utf-8"
        )
        _indexes[skill] = index
        _documents[skill] = documents
        logger.info(
            "Built FAISS index for '%s' with %d vectors -> %s",
            skill,
            len(documents),
            skill_dir,
        )
        return True
    except ImportError:
        logger.warning("faiss not installed; storing for brute-force fallback")
        _documents[skill] = documents
        return False


def load_index(skill: str) -> bool:
    if skill in _indexes and skill in _documents:
        return True
    skill_dir = _skill_dir(skill)
    faiss_path = skill_dir / "index.faiss"
    meta_path = skill_dir / "index.meta.json"
    if not faiss_path.exists() or not meta_path.exists():
        logger.warning("No index found for skill '%s'", skill)
        return False
    try:
        import faiss
        _indexes[skill] = faiss.read_index(str(faiss_path))
        _documents[skill] = json.loads(meta_path.read_text(encoding="utf-8"))
        logger.info("Loaded FAISS index for '%s' (%d vectors)", skill, len(_documents[skill]))
        return True
    except Exception as exc:
        logger.error("Failed to load index for '%s': %s", skill, exc)
        return False


def search(skill: str, query_embedding, top_k: int = 3) -> list[dict]:
    if not load_index(skill):
        return []
    docs = _documents[skill]
    if not docs:
        return []
    try:
        import faiss
        index = _indexes[skill]
        k = min(top_k, len(docs))
        distances, indices = index.search(
            query_embedding.reshape(1, -1).astype(np.float32), k
        )
        results = []
        for idx, dist in zip(indices[0], distances[0]):
            if idx < len(docs):
                results.append({**docs[idx], "distance": float(dist)})
        return results
    except Exception as exc:
        logger.error("FAISS search failed for '%s': %s", skill, exc)
        return docs[:top_k]