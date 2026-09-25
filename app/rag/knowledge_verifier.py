import json

from app.config import ROLE_SKILLS
from app.llm.llm_manager import generate
from app.rag.retriever import retrieve_context
from app.utils import get_logger

logger = get_logger("knowledge_verifier")


def _skills_for_role(role: str | None, expected_skills: list[str] | None) -> list[str]:
    skills = list(ROLE_SKILLS.get(role, []))
    if expected_skills:
        for s in expected_skills:
            if s not in skills:
                skills.append(s)
    return skills or ["python"]


def verify_answer(
    question: str,
    answer: str,
    role: str | None = None,
    expected_skills: list[str] | None = None,
) -> dict:
    skills = _skills_for_role(role, expected_skills)
    context_results = retrieve_context(question, skills=skills, top_k=3)
    if not context_results:
        return {
            "is_correct": False,
            "confidence": 0.0,
            "verified_concepts": [],
            "missing_concepts": [],
            "feedback": "No knowledge-base evidence found for this topic.",
            "sources": [],
        }
    context_text = "\n".join([f"({r.get('source','?')}) {r['text'][:300]}" for r in context_results])

    prompt = f"""Verify if this interview answer is factually correct and complete.

Question: {question}
Candidate Answer: {answer}
Reference Knowledge: {context_text[:1000]}
{('Expected skills: ' + ', '.join(expected_skills)) if expected_skills else ''}

Return a JSON object with:
- "is_correct": boolean
- "confidence": float 0-1
- "verified_concepts": list of strings (concepts that are correct)
- "missing_concepts": list of strings (concepts that should be covered but are missing)
- "feedback": string

Return ONLY valid JSON."""
    result = generate(prompt, temperature=0.2)
    try:
        data = json.loads(result)
        logger.info(
            "Verification[role=%s]: correct=%s, confidence=%.2f",
            role,
            data.get("is_correct"),
            data.get("confidence", 0),
        )
    except Exception:
        data = {
            "is_correct": False,
            "confidence": 0.5,
            "verified_concepts": [],
            "missing_concepts": [],
            "feedback": "Verification unavailable",
        }
    data["sources"] = [r.get("source") for r in context_results]
    return data