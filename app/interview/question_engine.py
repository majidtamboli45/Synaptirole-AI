from app.utils import get_logger
from app.llm.question_generator import generate_questions

logger = get_logger("question_engine")


class QuestionEngine:
    def __init__(self):
        self.questions: list[dict] = []
        self.current: int = 0

    def generate(self, role: str, skills: list[str], difficulty: str = "Medium", count: int = 10) -> list[dict]:
        self.questions = generate_questions(role, skills, difficulty, count)
        self.current = 0
        return self.questions

    def next(self) -> dict | None:
        if self.current < len(self.questions):
            q = self.questions[self.current]
            self.current += 1
            return q
        return None

    def current_question(self) -> dict | None:
        if 0 <= self.current < len(self.questions):
            return self.questions[self.current]
        return None

    def progress(self) -> float:
        return self.current / len(self.questions) * 100 if self.questions else 0
