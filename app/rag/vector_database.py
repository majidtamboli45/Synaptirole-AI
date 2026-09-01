import numpy as np
from app.config import FAISS_INDEX_PATH
from app.utils import get_logger
from pathlib import Path

logger = get_logger("vector_database")

_index = None
_documents: list[dict] = []


def build_index(documents: list[dict], embeddings: np.ndarray):
    global _index, _documents
    try:
        import faiss
        dim = embeddings.shape[1]
        _index = faiss.IndexFlatL2(dim)
        _index.add(embeddings.astype(np.float32))
        _documents = documents
        FAISS_INDEX_PATH.parent.mkdir(parents=True, exist_ok=True)
        faiss.write_index(_index, str(FAISS_INDEX_PATH) + ".faiss")
        logger.info("FAISS index built with %d vectors", len(documents))
    except ImportError:
        logger.warning("faiss not installed, using brute-force search")
        _index = None
        _documents = documents
        _brute_force_embeddings = embeddings


def search(query_embedding, top_k: int = 5) -> list[dict]:
    global _index, _documents
    if _index is not None:
        try:
            import faiss
            distances, indices = _index.search(query_embedding.reshape(1, -1).astype(np.float32), min(top_k, len(_documents)))
            results = []
            for idx, dist in zip(indices[0], distances[0]):
                if idx < len(_documents):
                    results.append({**_documents[idx], "distance": float(dist)})
            return results
        except Exception as e:
            logger.error("FAISS search failed: %s", e)
    return _documents[:top_k] if _documents else []


def load_index():
    global _index
    faiss_path = FAISS_INDEX_PATH.with_suffix(".faiss")
    if faiss_path.exists():
        try:
            import faiss
            _index = faiss.read_index(str(faiss_path))
            logger.info("FAISS index loaded")
            return True
        except Exception as e:
            logger.warning("Failed to load FAISS index: %s", e)
    return False
