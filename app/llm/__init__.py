from app.utils import get_logger

logger = get_logger("llm")


def generate_question(role: str, difficulty: str, context: str = "") -> str:
    from app.llm.llm_manager import generate
    prompt = f"""Generate a single interview question for a {role} position.
Difficulty: {difficulty}
{f'Context from resume/JD: {context}' if context else ''}
Return ONLY the question text, nothing else."""
    return generate(prompt)


def evaluate_answer(question: str, answer: str, context: str = "") -> dict:
    from app.llm.llm_manager import generate
    prompt = f"""Evaluate this interview answer.
Question: {question}
Candidate Answer: {answer}
{f'Context: {context}' if context else ''}
Return a JSON object with:
- "score" (0-100)
- "strengths" (list of strings)
- "weaknesses" (list of strings)
- "feedback" (string)
Return ONLY valid JSON."""
    result = generate(prompt)
    try:
        import json
        return json.loads(result)
    except Exception:
        return {"score": 50, "strengths": [], "weaknesses": [], "feedback": result}
