import json
from app.rag.retriever import retrieve_context
from app.llm.llm_manager import generate
from app.utils import get_logger

logger = get_logger("knowledge_verifier")


def verify_answer(question: str, answer: str, expected_skills: list[str] = None) -> dict:
    context_results = retrieve_context(question, top_k=3)
    context_text = "\n".join([r.get("text", "")[:300] for r in context_results])

    prompt = f"""Verify if this interview answer is factually correct and complete.

Question: {question}
Candidate Answer: {answer}
Reference Knowledge: {context_text[:1000]}
{f'Expected skills: {", ".join(expected_skills)}' if expected_skills else ''}

Return a JSON object with:
- "is_correct": boolean
- "confidence": float 0-1
- "verified_concepts": list of strings (concepts that are correct)
- "missing_concepts": list of strings (concepts that should be covered)
- "feedback": string

Return ONLY valid JSON."""
    result = generate(prompt, temperature=0.2)
    try:
        data = json.loads(result)
        logger.info("Verification: correct=%s, confidence=%.2f", data.get("is_correct"), data.get("confidence", 0))
        return data
    except Exception:
        return {
            "is_correct": False,
            "confidence": 0.5,
            "verified_concepts": [],
            "missing_concepts": [],
            "feedback": "Verification unavailable",
        }
