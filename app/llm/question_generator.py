import json
from app.llm.llm_manager import generate
from app.utils import get_logger

logger = get_logger("question_generator")


def generate_questions(role: str, skills: list[str], difficulty: str = "Medium", count: int = 10, context: str = "") -> list[dict]:
    skills_str = ", ".join(skills[:10]) if skills else "general"
    prompt = f"""Generate exactly {count} interview questions for a {role} position.
Required skills: {skills_str}
Difficulty level: {difficulty}
{f'Additional context: {context}' if context else ''}

Return a JSON array of objects, each with:
- "question": the interview question text
- "difficulty": Easy/Medium/Hard
- "category": the skill category

Return ONLY valid JSON array. No extra text."""
    result = generate(prompt, temperature=0.8)
    try:
        questions = json.loads(result)
        if isinstance(questions, list):
            logger.info("Generated %d questions for %s", len(questions), role)
            return questions
    except Exception:
        pass
    logger.warning("Failed to parse generated questions, using fallback")
    return _fallback_questions(role, skills, count)


def _fallback_questions(role: str, skills: list[str], count: int) -> list[dict]:
    questions = []
    templates = [
        f"Tell me about your experience with {role} roles.",
        f"What are your strongest technical skills relevant to {role}?",
        f"Describe a challenging project you worked on as a {role}.",
        f"How do you approach problem-solving in {role}?",
        f"What tools and technologies do you use daily as a {role}?",
    ]
    for i in range(min(count, len(templates))):
        questions.append({
            "question": templates[i],
            "difficulty": "Medium",
            "category": skills[i % len(skills)] if skills else "general",
        })
    return questions
