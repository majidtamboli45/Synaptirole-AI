from pathlib import Path
from app.config import ONET_DIR, ESCO_DIR
from app.utils import get_logger
import json

logger = get_logger("ontology")

_occupation_skills: dict = {}
_skill_occupations: dict = {}


def load_ontology():
    global _occupation_skills, _skill_occupations
    if _occupation_skills:
        return
    for data_dir in [ONET_DIR, ESCO_DIR]:
        if not data_dir.exists():
            continue
        for f in data_dir.glob("*.json"):
            try:
                data = json.loads(f.read_text(encoding="utf-8"))
                if isinstance(data, dict):
                    for occ, skills in data.items():
                        if isinstance(skills, list):
                            _occupation_skills[occ.lower()] = [s.lower() for s in skills]
                            for s in skills:
                                _skill_occupations.setdefault(s.lower(), set()).add(occ.lower())
            except Exception:
                pass
    logger.info("Loaded %d occupations from ontology", len(_occupation_skills))


def get_skills_for_occupation(occupation: str) -> list[str]:
    load_ontology()
    return _occupation_skills.get(occupation.lower(), [])


def get_occupations_for_skill(skill: str) -> list[str]:
    load_ontology()
    return sorted(_skill_occupations.get(skill.lower(), set()))
