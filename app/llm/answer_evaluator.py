import json
from app.llm.llm_manager import generate
from app.utils import get_logger

logger = get_logger("answer_evaluator")


def evaluate_answer(question: str, answer: str, expected_skills: list[str] = None) -> dict:
    skills_str = ", ".join(expected_skills) if expected_skills else "general"
    prompt = f"""Evaluate this interview answer on a scale of 0-100.

Question: {question}
Candidate Answer: {answer}
Expected skill areas: {skills_str}

Return a JSON object with:
- "score": integer 0-100
- "relevance": integer 0-100
- "technical_accuracy": integer 0-100
- "completeness": integer 0-100
- "strengths": list of strings
- "weaknesses": list of strings
- "feedback": overall feedback string

Return ONLY valid JSON."""
    result = generate(prompt, temperature=0.3)
    try:
        data = json.loads(result)
        logger.info("Answer evaluated: score=%d", data.get("score", 0))
        return data
    except Exception:
        logger.warning("Failed to parse evaluation, using defaults")
        return {
            "score": 50,
            "relevance": 50,
            "technical_accuracy": 50,
            "completeness": 50,
            "strengths": [],
            "weaknesses": [],
            "feedback": result[:500] if result else "Evaluation unavailable",
        }
