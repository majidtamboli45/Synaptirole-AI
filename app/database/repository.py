import json
from typing import Any, Optional
from app.database import get_cursor
from app.database.models import User, Resume, JobDescription, Interview, InterviewQuestion, SkillAnalysis, Report
from app.utils import get_logger

logger = get_logger("repository")


class UserRepository:
    @staticmethod
    def create(user: User) -> int:
        with get_cursor() as cur:
            cur.execute("INSERT INTO users (name, email, password_hash, role, phone, location) VALUES (?, ?, ?, ?, ?, ?)",
                        (user.name, user.email, user.password_hash, user.role, user.phone, user.location))
            return cur.lastrowid

    @staticmethod
    def get_by_id(user_id: int) -> Optional[User]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM users WHERE id=?", (user_id,))
            row = cur.fetchone()
            return User(**dict(row)) if row else None

    @staticmethod
    def get_by_email(email: str) -> Optional[User]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM users WHERE email=?", (email,))
            row = cur.fetchone()
            return User(**dict(row)) if row else None

    @staticmethod
    def update(user: User):
        with get_cursor() as cur:
            cur.execute("UPDATE users SET name=?, role=?, phone=?, location=?, avatar_path=?, updated_at=CURRENT_TIMESTAMP WHERE id=?",
                        (user.name, user.role, user.phone, user.location, user.avatar_path, user.id))

    @staticmethod
    def delete(user_id: int):
        with get_cursor() as cur:
            cur.execute("DELETE FROM users WHERE id=?", (user_id,))


class ResumeRepository:
    @staticmethod
    def create(resume: Resume) -> int:
        with get_cursor() as cur:
            cur.execute("INSERT INTO resumes (user_id, filename, file_path, raw_text, skills_json, education_json, experience_json) VALUES (?, ?, ?, ?, ?, ?, ?)",
                        (resume.user_id, resume.filename, resume.file_path, resume.raw_text,
                         json.dumps(resume.skills), json.dumps(resume.education), json.dumps(resume.experience)))
            return cur.lastrowid

    @staticmethod
    def get_by_user(user_id: int) -> list[Resume]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM resumes WHERE user_id=? ORDER BY created_at DESC", (user_id,))
            return [Resume(**dict(r), skills=json.loads(r["skills_json"]), education=json.loads(r["education_json"]), experience=json.loads(r["experience_json"])) for r in cur.fetchall()]

    @staticmethod
    def get_by_id(resume_id: int) -> Optional[Resume]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM resumes WHERE id=?", (resume_id,))
            row = cur.fetchone()
            if row:
                return Resume(**dict(row), skills=json.loads(row["skills_json"]), education=json.loads(row["education_json"]), experience=json.loads(row["experience_json"]))
            return None

    @staticmethod
    def delete(resume_id: int):
        with get_cursor() as cur:
            cur.execute("DELETE FROM resumes WHERE id=?", (resume_id,))


class JDRepository:
    @staticmethod
    def create(jd: JobDescription) -> int:
        with get_cursor() as cur:
            cur.execute("INSERT INTO job_descriptions (user_id, title, company, file_path, raw_text, required_skills_json, preferred_skills_json) VALUES (?, ?, ?, ?, ?, ?, ?)",
                        (jd.user_id, jd.title, jd.company, jd.file_path, jd.raw_text,
                         json.dumps(jd.required_skills), json.dumps(jd.preferred_skills)))
            return cur.lastrowid

    @staticmethod
    def get_by_user(user_id: int) -> list[JobDescription]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM job_descriptions WHERE user_id=? ORDER BY created_at DESC", (user_id,))
            return [JobDescription(**dict(r), required_skills=json.loads(r["required_skills_json"]), preferred_skills=json.loads(r["preferred_skills_json"])) for r in cur.fetchall()]

    @staticmethod
    def get_by_id(jd_id: int) -> Optional[JobDescription]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM job_descriptions WHERE id=?", (jd_id,))
            row = cur.fetchone()
            if row:
                return JobDescription(**dict(row), required_skills=json.loads(row["required_skills_json"]), preferred_skills=json.loads(row["preferred_skills_json"]))
            return None

    @staticmethod
    def delete(jd_id: int):
        with get_cursor() as cur:
            cur.execute("DELETE FROM job_descriptions WHERE id=?", (jd_id,))


class InterviewRepository:
    @staticmethod
    def create(interview: Interview) -> int:
        with get_cursor() as cur:
            cur.execute("INSERT INTO interviews (user_id, resume_id, jd_id, title, role, difficulty, total_questions, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                        (interview.user_id, interview.resume_id, interview.jd_id, interview.title, interview.role, interview.difficulty, interview.total_questions, interview.status))
            return cur.lastrowid

    @staticmethod
    def get_by_user(user_id: int) -> list[Interview]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM interviews WHERE user_id=? ORDER BY created_at DESC", (user_id,))
            return [Interview(**dict(r)) for r in cur.fetchall()]

    @staticmethod
    def get_by_id(interview_id: int) -> Optional[Interview]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM interviews WHERE id=?", (interview_id,))
            row = cur.fetchone()
            return Interview(**dict(row)) if row else None

    @staticmethod
    def update(interview: Interview):
        with get_cursor() as cur:
            cur.execute("UPDATE interviews SET status=?, score=?, duration_seconds=?, started_at=?, completed_at=? WHERE id=?",
                        (interview.status, interview.score, interview.duration_seconds, interview.started_at, interview.completed_at, interview.id))

    @staticmethod
    def delete(interview_id: int):
        with get_cursor() as cur:
            cur.execute("DELETE FROM interviews WHERE id=?", (interview_id,))


class InterviewQuestionRepository:
    @staticmethod
    def create(q: InterviewQuestion) -> int:
        with get_cursor() as cur:
            cur.execute("INSERT INTO interview_questions (interview_id, question_index, question_text, difficulty) VALUES (?, ?, ?, ?)",
                        (q.interview_id, q.question_index, q.question_text, q.difficulty))
            return cur.lastrowid

    @staticmethod
    def get_by_interview(interview_id: int) -> list[InterviewQuestion]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM interview_questions WHERE interview_id=? ORDER BY question_index", (interview_id,))
            return [InterviewQuestion(**dict(r)) for r in cur.fetchall()]

    @staticmethod
    def update_answer(q: InterviewQuestion):
        with get_cursor() as cur:
            cur.execute("UPDATE interview_questions SET candidate_answer=?, transcript=?, answer_score=?, audio_score=?, video_score=?, rag_verification=?, response_duration_seconds=? WHERE id=?",
                        (q.candidate_answer, q.transcript, q.answer_score, q.audio_score, q.video_score, q.rag_verification, q.response_duration_seconds, q.id))


class SkillAnalysisRepository:
    @staticmethod
    def create(sa: SkillAnalysis) -> int:
        with get_cursor() as cur:
            cur.execute("INSERT INTO skill_analyses (user_id, resume_id, jd_id, matched_skills_json, missing_skills_json, partial_skills_json, match_score) VALUES (?, ?, ?, ?, ?, ?, ?)",
                        (sa.user_id, sa.resume_id, sa.jd_id, json.dumps(sa.matched_skills), json.dumps(sa.missing_skills), json.dumps(sa.partial_skills), sa.match_score))
            return cur.lastrowid

    @staticmethod
    def get_latest_by_user(user_id: int) -> Optional[SkillAnalysis]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM skill_analyses WHERE user_id=? ORDER BY created_at DESC LIMIT 1", (user_id,))
            row = cur.fetchone()
            if row:
                return SkillAnalysis(**dict(row), matched_skills=json.loads(row["matched_skills_json"]), missing_skills=json.loads(row["missing_skills_json"]), partial_skills=json.loads(row["partial_skills_json"]))
            return None


class ReportRepository:
    @staticmethod
    def create(report: Report) -> int:
        with get_cursor() as cur:
            cur.execute("INSERT INTO reports (interview_id, user_id, overall_score, answer_score, audio_score, video_score, skill_match_score, strengths_json, weaknesses_json, recommendations_json, shap_values_json) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                        (report.interview_id, report.user_id, report.overall_score, report.answer_score, report.audio_score, report.video_score, report.skill_match_score,
                         json.dumps(report.strengths), json.dumps(report.weaknesses), json.dumps(report.recommendations), json.dumps(report.shap_values)))
            return cur.lastrowid

    @staticmethod
    def get_by_interview(interview_id: int) -> Optional[Report]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM reports WHERE interview_id=?", (interview_id,))
            row = cur.fetchone()
            if row:
                return Report(**dict(row), strengths=json.loads(row["strengths_json"]), weaknesses=json.loads(row["weaknesses_json"]), recommendations=json.loads(row["recommendations_json"]), shap_values=json.loads(row["shap_values_json"]))
            return None

    @staticmethod
    def get_by_user(user_id: int) -> list[Report]:
        with get_cursor() as cur:
            cur.execute("SELECT * FROM reports WHERE user_id=? ORDER BY created_at DESC", (user_id,))
            return [Report(**dict(r), strengths=json.loads(r["strengths_json"]), weaknesses=json.loads(r["weaknesses_json"]), recommendations=json.loads(r["recommendations_json"]), shap_values=json.loads(r["shap_values_json"])) for r in cur.fetchall()]
