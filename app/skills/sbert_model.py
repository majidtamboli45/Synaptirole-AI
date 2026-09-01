from app.config import EMBEDDING_MODEL
from app.utils import get_logger

logger = get_logger("sbert_model")

_model = None


def get_model():
    global _model
    if _model is None:
        try:
            from sentence_transformers import SentenceTransformer
            _model = SentenceTransformer(EMBEDDING_MODEL)
            logger.info("SBERT model loaded: %s", EMBEDDING_MODEL)
        except ImportError:
            logger.warning("sentence-transformers not installed")
            return None
    return _model


def encode(texts: list[str]):
    model = get_model()
    if model is None:
        return None
    return model.encode(texts, convert_to_tensor=True)


def compute_similarity(text_a: str, text_b: str) -> float:
    model = get_model()
    if model is None:
        return 0.0
    embeddings = model.encode([text_a, text_b])
    from torch.nn.functional import cosine_similarity
    sim = cosine_similarity(embeddings[0].unsqueeze(0), embeddings[1].unsqueeze(0))
    return float(sim.item())
