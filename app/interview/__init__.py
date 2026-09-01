from app.utils import get_logger
from app.llm.question_generator import generate_questions
from app.database.models import Interview, InterviewQuestion
from app.database.repository import InterviewRepository, InterviewQuestionRepository

logger = get_logger("interview")


class InterviewManager:
    def __init__(self):
        self.current_interview: Interview | None = None
        self.questions: list[InterviewQuestion] = []
        self.current_index: int = 0

    def start_interview(self, user_id: int, role: str, skills: list[str], difficulty: str = "Medium", total_questions: int = 10, resume_id: int = 0, jd_id: int = 0) -> Interview:
        interview = Interview(user_id=user_id, role=role, difficulty=difficulty, total_questions=total_questions, resume_id=resume_id, jd_id=jd_id, title=f"{role} Mock Interview", status="active")
        interview.id = InterviewRepository.create(interview)

        generated = generate_questions(role, skills, difficulty, total_questions)
        self.questions = []
        for i, q in enumerate(generated[:total_questions]):
            iq = InterviewQuestion(interview_id=interview.id, question_index=i + 1, question_text=q.get("question", ""), difficulty=q.get("difficulty", difficulty))
            iq.id = InterviewQuestionRepository.create(iq)
            self.questions.append(iq)

        self.current_interview = interview
        self.current_index = 0
        logger.info("Interview started: %d questions for %s", len(self.questions), role)
        return interview

    def get_current_question(self) -> InterviewQuestion | None:
        if self.questions and self.current_index < len(self.questions):
            return self.questions[self.current_index]
        return None

    def submit_answer(self, answer: str, audio_path: str = "", video_path: str = "", transcript: str = "", score: float = 0.0, audio_score: float = 0.0, video_score: float = 0.0, rag_verification: str = "", duration: int = 0):
        q = self.get_current_question()
        if q:
            q.candidate_answer = answer
            q.answer_audio_path = audio_path
            q.answer_video_path = video_path
            q.transcript = transcript
            q.answer_score = score
            q.audio_score = audio_score
            q.video_score = video_score
            q.rag_verification = rag_verification
            q.response_duration_seconds = duration
            InterviewQuestionRepository.update_answer(q)
            self.current_index += 1

    def end_interview(self) -> Interview | None:
        if self.current_interview:
            self.current_interview.status = "completed"
            scores = [q.answer_score for q in self.questions if q.answer_score > 0]
            self.current_interview.score = sum(scores) / len(scores) if scores else 0.0
            InterviewRepository.update(self.current_interview)
            logger.info("Interview ended: score=%.1f", self.current_interview.score)
            return self.current_interview
        return None

    def get_progress(self) -> dict:
        total = len(self.questions)
        completed = self.current_index
        return {
            "total": total,
            "completed": completed,
            "percentage": round(completed / total * 100, 1) if total > 0 else 0,
            "current_question": self.current_index + 1 if self.current_index < total else total,
        }
