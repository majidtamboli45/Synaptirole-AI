"""NLP module: spaCy pipeline, custom NER and entity normalization."""

from app.nlp.pipeline import get_nlp, process_text, extract_skill_spans
from app.nlp.entity_extractor import extract_resume_entities
from app.nlp.entity_normalizer import normalize_entity, deduplicate, canonical_token

__all__ = [
    "get_nlp",
    "process_text",
    "extract_skill_spans",
    "extract_resume_entities",
    "normalize_entity",
    "deduplicate",
    "canonical_token",
]