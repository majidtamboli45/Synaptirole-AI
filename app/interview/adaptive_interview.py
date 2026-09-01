from app.utils import get_logger

logger = get_logger("adaptive_interview")


class AdaptiveInterviewEngine:
    def __init__(self):
        self.history: list[dict] = []

    def record_answer(self, question: str, answer: str, score: float):
        self.history.append({"question": question, "answer": answer, "score": score})

    def get_difficulty_adjustment(self) -> str:
        if not self.history:
            return "Medium"
        recent = self.history[-3:]
        avg_score = sum(h["score"] for h in recent) / len(recent)
        if avg_score >= 80:
            return "Hard"
        elif avg_score >= 50:
            return "Medium"
        return "Easy"

    def should_continue(self, max_questions: int = 10) -> bool:
        return len(self.history) < max_questions
