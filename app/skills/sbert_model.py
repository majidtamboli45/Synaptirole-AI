from __future__ import annotations

import threading

import numpy as np
from app.config import EMBEDDING_MODEL
from app.utils import get_logger

logger = get_logger("sbert_model")

_model = None
_model_lock = threading.Lock()
_embedding_cache: dict[str, np.ndarray] = {}
_cache_size_limit = 4096


def get_model():
    global _model
    if _model is not None:
        return _model
    with _model_lock:
        if _model is not None:
            return _model
        try:
            from sentence_transformers import SentenceTransformer
            _model = SentenceTransformer(EMBEDDING_MODEL)
            logger.info("SBERT model loaded: %s", EMBEDDING_MODEL)
        except Exception as e:
            logger.warning("SBERT model unavailable (%s); falling back to TF-IDF", e)
            _model = None
    return _model


def is_available() -> bool:
    return get_model() is not None


def encode(texts: list[str]):
    model = get_model()
    if model is None:
        return None
    return model.encode(texts, convert_to_tensor=True)


def clear_cache():
    _embedding_cache.clear()


def encode_skills(skills: list[str]) -> np.ndarray:
    """Batch-encode a list of skills. Returns an (N, dim) normalized float32 array.

    Uses an internal cache keyed by the normalized skill string so repeated
    skill lists (e.g. the same JD in many runs) are not re-encoded.
    """
    if not skills:
        return np.zeros((0, 0), dtype=np.float32)

    keys = [_default_key(s) for s in skills]
    uncached_ids = [i for i, k in enumerate(keys) if k not in _embedding_cache]

    if uncached_ids:
        uncached_texts = [skills[i] for i in uncached_ids]
        model = get_model()
        if model is None:
            return np.zeros((0, 0), dtype=np.float32)
        encoded = model.encode(uncached_texts, convert_to_numpy=True, normalize_embeddings=True)
        for offset, i in enumerate(uncached_ids):
            if len(_embedding_cache) >= _cache_size_limit:
                _embedding_cache.pop(next(iter(_embedding_cache)))
            _embedding_cache[keys[i]] = encoded[offset]

    return np.vstack([_embedding_cache[k] for k in keys]).astype(np.float32)


def _default_key(skill: str) -> str:
    return skill.strip().lower()


def compute_similarity_matrix(resume_skills: list[str], jd_skills: list[str]) -> np.ndarray:
    """Cosine similarity matrix between resume skills (rows) and JD skills (columns).

    Returns a (R, J) float32 matrix. Empty on either side, or when the model
    is unavailable, returns an identity-like matrix relying on exact matches.
    """
    if not resume_skills or not jd_skills:
        return np.zeros((len(resume_skills), len(jd_skills)), dtype=np.float32)

    r_emb = encode_skills(resume_skills)
    j_emb = encode_skills(jd_skills)
    if r_emb.size == 0 or j_emb.size == 0 or r_emb.shape[1] != j_emb.shape[1]:
        return np.zeros((len(resume_skills), len(jd_skills)), dtype=np.float32)

    sims = np.dot(r_emb, j_emb.T)
    return np.clip(sims, 0.0, 1.0)


def compute_similarity(text_a: str, text_b: str) -> float:
    model = get_model()
    if model is None:
        return 0.0
    s = text_a.strip().lower()
    t = text_b.strip().lower()
    if s == t:
        return 1.0
    keys_a = _default_key(text_a), _default_key(text_b)
    cached = all(k in _embedding_cache for k in keys_a)
    if cached:
        a, b = _embedding_cache[keys_a[0]], _embedding_cache[keys_a[1]]
        return float(np.dot(a, b))
    embeddings = model.encode([text_a, text_b], convert_to_numpy=True, normalize_embeddings=True)
    return float(np.dot(embeddings[0], embeddings[1]))


def compute_similarity_text_batch(source: str, targets: list[str]) -> np.ndarray:
    """Compute similarity of `source` against every target string."""
    model = get_model()
    if model is None or not targets:
        return np.zeros(len(targets), dtype=np.float32)
    emb_a = model.encode([source], convert_to_numpy=True, normalize_embeddings=True)[0]
    embs_b = model.encode(targets, convert_to_numpy=True, normalize_embeddings=True)
    return np.clip(np.dot(embs_b, emb_a), 0.0, 1.0)