from app.config import EMBEDDING_MODEL
from app.utils import get_logger

logger = get_logger("embedding_model")

_model = None


def get_embedding_model():
    global _model
    if _model is None:
        try:
            from sentence_transformers import SentenceTransformer
            _model = SentenceTransformer(EMBEDDING_MODEL)
            logger.info("Embedding model loaded: %s", EMBEDDING_MODEL)
        except ImportError:
            logger.warning("sentence-transformers not installed")
            return None
    return _model


def embed_text(text: str):
    model = get_embedding_model()
    if model is None:
        return None
    return model.encode([text])[0]


def embed_texts(texts: list[str]):
    model = get_embedding_model()
    if model is None:
        return None
    return model.encode(texts)
