from dataclasses import dataclass, field
from typing import Optional
import json


@dataclass
class User:
    id: int = 0
    name: str = ""
    email: str = ""
    password_hash: str = ""
    role: str = ""
    phone: str = ""
    location: str = ""
    avatar_path: str = ""
    created_at: str = ""
    updated_at: str = ""


@dataclass
class Resume:
    id: int = 0
    user_id: int = 0
    filename: str = ""
    file_path: str = ""
    raw_text: str = ""
    skills: list[str] = field(default_factory=list)
    education: list[dict] = field(default_factory=list)
    experience: list[dict] = field(default_factory=list)
    created_at: str = ""


@dataclass
class JobDescription:
    id: int = 0
    user_id: int = 0
    title: str = ""
    company: str = ""
    file_path: str = ""
    raw_text: str = ""
    required_skills: list[str] = field(default_factory=list)
    preferred_skills: list[str] = field(default_factory=list)
    created_at: str = ""


@dataclass
class Interview:
    id: int = 0
    user_id: int = 0
    resume_id: int = 0
    jd_id: int = 0
    title: str = ""
    role: str = ""
    difficulty: str = "Medium"
    total_questions: int = 10
    status: str = "pending"
    score: float = 0.0
    duration_seconds: int = 0
    started_at: str = ""
    completed_at: str = ""
    created_at: str = ""


@dataclass
class InterviewQuestion:
    id: int = 0
    interview_id: int = 0
    question_index: int = 0
    question_text: str = ""
    difficulty: str = "Medium"
    candidate_answer: str = ""
    answer_audio_path: str = ""
    answer_video_path: str = ""
    transcript: str = ""
    answer_score: float = 0.0
    audio_score: float = 0.0
    video_score: float = 0.0
    rag_verification: str = ""
    response_duration_seconds: int = 0
    created_at: str = ""


@dataclass
class SkillAnalysis:
    id: int = 0
    user_id: int = 0
    resume_id: int = 0
    jd_id: int = 0
    matched_skills: list[str] = field(default_factory=list)
    missing_skills: list[str] = field(default_factory=list)
    partial_skills: list[str] = field(default_factory=list)
    match_score: float = 0.0
    created_at: str = ""


@dataclass
class Report:
    id: int = 0
    interview_id: int = 0
    user_id: int = 0
    overall_score: float = 0.0
    answer_score: float = 0.0
    audio_score: float = 0.0
    video_score: float = 0.0
    skill_match_score: float = 0.0
    strengths: list[str] = field(default_factory=list)
    weaknesses: list[str] = field(default_factory=list)
    recommendations: list[str] = field(default_factory=list)
    shap_values: dict = field(default_factory=dict)
    created_at: str = ""
