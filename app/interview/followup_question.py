from app.llm.llm_manager import generate
from app.utils import get_logger

logger = get_logger("followup")


def generate_followup(question: str, answer: str, context: str = "") -> str:
    prompt = f"""Generate a follow-up interview question based on the candidate's answer.

Previous Question: {question}
Candidate Answer: {answer}
{f'Context: {context}' if context else ''}

The follow-up should probe deeper into the candidate's response.
Return ONLY the follow-up question text."""
    result = generate(prompt, temperature=0.6)
    logger.info("Follow-up generated for question: %s...", question[:50])
    return result
