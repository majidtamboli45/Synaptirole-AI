"""Shared spaCy NLP pipeline (singleton).

Loads the configured spaCy model once, registers a rule-based EntityRuler
built from the skill taxonomy, and exposes a module-level ``get_nlp()`` /
``process_text()`` API used across the application.

The model falls back through a list of installed models so the rest of the
code never has to know which one is actually available.
"""

import re
import threading
import os
from app.config import SPACY_MODEL, SPACY_MODEL_FALLBACKS, RESUME_NER_MODEL
from app.utils import get_logger
from app.skills.skill_taxonomy import SKILL_TAXONOMY

logger = get_logger("nlp_pipeline")

_nlp = None
_lock = threading.Lock()

SKILL_LABEL_PREFIX = "SKILL_"


def _term_to_patterns(term: str) -> list[dict]:
    """Convert a skill term into spaCy EntityRuler token patterns.

    Handles single words, multi-word phrases, and symbols (. + / #) so that
    things like ``node.js`` / ``c++`` / ``ci/cd`` still match.
    """
    term = term.strip()
    if not term:
        return []
    patterns: list[list[dict]] = []
    words = re.split(r"\s+", term)
    if len(words) == 1:
        token = words[0]
        patterns.append([{"LOWER": token.lower()}])
        parts = [p for p in re.split(r"([.+/#])", token) if p]
        if len(parts) > 1:
            patterns.append([{"LOWER": p.lower()} for p in parts])
    else:
        patterns.append([{"LOWER": w.lower()} for w in words if w])
    return patterns


def build_skill_ruler_patterns() -> list[dict]:
    """Build EntityRuler patterns from the skill taxonomy.

    Each pattern label is ``SKILL_<canonical_id>``. Labels are converted back
    to canonical names downstream via ``skill_label_to_canonical``.
    """
    patterns: list[dict] = []
    for canonical, meta in SKILL_TAXONOMY.items():
        terms = {canonical, canonical.lower()}
        for alias in meta.get("aliases", ()):
            terms.add(alias)
        for term in sorted(terms, key=len, reverse=True):
            for token_pattern in _term_to_patterns(term):
                patterns.append(
                    {
                        "label": f"{SKILL_LABEL_PREFIX}{canonical}",
                        "pattern": token_pattern,
                    }
                )
    return patterns


def skill_label_to_canonical(label: str) -> str:
    if label and label.startswith(SKILL_LABEL_PREFIX):
        return label[len(SKILL_LABEL_PREFIX):]
    return ""


def _load_resume_ner_model():
    """Load the fine-tuned resume NER model if present, else (None, None).

    Tries ``<RESUME_NER_MODEL>/model-last`` first, then the configured path
    itself, so both `spacy train --output` layouts work.
    """
    import spacy

    candidates = [os.path.join(RESUME_NER_MODEL, "model-last"), RESUME_NER_MODEL]
    for path in candidates:
        try:
            return spacy.load(path), path
        except OSError as exc:
            logger.debug(
                "Resume NER model path '%s' not loadable (%s)", path, exc
            )
    return None, None


def get_nlp():
    """Load (once) and return the spaCy pipeline with the skill ruler attached."""
    global _nlp
    if _nlp is not None:
        return _nlp

    with _lock:
        if _nlp is not None:
            return _nlp

        import spacy

        pipeline = None
        loaded_from = None
        resume_nlp, resume_path = _load_resume_ner_model()
        if resume_nlp is not None:
            pipeline = resume_nlp
            loaded_from = resume_path
            logger.info("Loaded resume NER model: %s", resume_path)

        if pipeline is None:
            candidates = [SPACY_MODEL] + [
                m for m in SPACY_MODEL_FALLBACKS if m != SPACY_MODEL
            ]
            for model_name in candidates:
                try:
                    pipeline = spacy.load(model_name)
                    loaded_from = model_name
                    logger.info("Loaded spaCy model: %s", model_name)
                    break
                except OSError as exc:
                    logger.warning(
                        "spaCy model '%s' unavailable (%s); trying next",
                        model_name,
                        exc,
                    )
        if pipeline is None:
            logger.warning("No spaCy model installed; creating blank 'en' pipeline")
            pipeline = spacy.blank("en")

        ruler = None
        if "ner" in pipeline.pipe_names:
            ruler = pipeline.add_pipe("entity_ruler", name="skill_ruler", after="ner")
        else:
            ruler = pipeline.add_pipe("entity_ruler", name="skill_ruler")
        ruler.overwrite = True  # spaCy 3.8 stores the flag as ``.overwrite``
        ruler.overwrite_ents = True
        ruler.add_patterns(build_skill_ruler_patterns())

        _nlp = pipeline
        return _nlp


def process_text(text: str):
    """Run text through the shared pipeline and return the spacy Doc."""
    return get_nlp()(text or "")


def extract_skill_spans(text: str):
    """Return a list of (canonical_skill, start, end, raw_text, label) matches."""
    if not text:
        return []
    doc = process_text(text)
    spans = []
    for ent in doc.ents:
        canonical = skill_label_to_canonical(ent.label_)
        if canonical:
            spans.append((canonical, ent.start_char, ent.end_char, ent.text))
    return spans