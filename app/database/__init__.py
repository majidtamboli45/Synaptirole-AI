import sqlite3
from contextlib import contextmanager
from pathlib import Path
from app.config import DB_PATH
from app.utils import get_logger

logger = get_logger("database")

_connection: sqlite3.Connection | None = None


def get_connection() -> sqlite3.Connection:
    global _connection
    if _connection is None:
        _connection = sqlite3.connect(str(DB_PATH), check_same_thread=False)
        _connection.row_factory = sqlite3.Row
        _connection.execute("PRAGMA journal_mode=WAL")
        _connection.execute("PRAGMA foreign_keys=ON")
        logger.info("Database connected: %s", DB_PATH)
    return _connection


def close_connection():
    global _connection
    if _connection is not None:
        _connection.close()
        _connection = None
        logger.info("Database connection closed")


@contextmanager
def get_cursor():
    conn = get_connection()
    cur = conn.cursor()
    try:
        yield cur
        conn.commit()
    except Exception:
        conn.rollback()
        raise
    finally:
        cur.close()


def init_db():
    conn = get_connection()
    conn.executescript("""
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            password_hash TEXT NOT NULL,
            role TEXT DEFAULT '',
            phone TEXT DEFAULT '',
            location TEXT DEFAULT '',
            avatar_path TEXT DEFAULT '',
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );

        CREATE TABLE IF NOT EXISTS resumes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER NOT NULL,
            filename TEXT NOT NULL,
            file_path TEXT NOT NULL,
            raw_text TEXT DEFAULT '',
            skills_json TEXT DEFAULT '[]',
            education_json TEXT DEFAULT '[]',
            experience_json TEXT DEFAULT '[]',
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
        );

        CREATE TABLE IF NOT EXISTS job_descriptions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER NOT NULL,
            title TEXT NOT NULL,
            company TEXT DEFAULT '',
            file_path TEXT DEFAULT '',
            raw_text TEXT DEFAULT '',
            required_skills_json TEXT DEFAULT '[]',
            preferred_skills_json TEXT DEFAULT '[]',
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
        );

        CREATE TABLE IF NOT EXISTS interviews (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER NOT NULL,
            resume_id INTEGER,
            jd_id INTEGER,
            title TEXT NOT NULL,
            role TEXT DEFAULT '',
            difficulty TEXT DEFAULT 'Medium',
            total_questions INTEGER DEFAULT 10,
            status TEXT DEFAULT 'pending',
            score REAL DEFAULT 0.0,
            duration_seconds INTEGER DEFAULT 0,
            started_at TIMESTAMP,
            completed_at TIMESTAMP,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
            FOREIGN KEY (resume_id) REFERENCES resumes(id),
            FOREIGN KEY (jd_id) REFERENCES job_descriptions(id)
        );

        CREATE TABLE IF NOT EXISTS interview_questions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            interview_id INTEGER NOT NULL,
            question_index INTEGER NOT NULL,
            question_text TEXT NOT NULL,
            difficulty TEXT DEFAULT 'Medium',
            candidate_answer TEXT DEFAULT '',
            answer_audio_path TEXT DEFAULT '',
            answer_video_path TEXT DEFAULT '',
            transcript TEXT DEFAULT '',
            answer_score REAL DEFAULT 0.0,
            audio_score REAL DEFAULT 0.0,
            video_score REAL DEFAULT 0.0,
            rag_verification TEXT DEFAULT '',
            response_duration_seconds INTEGER DEFAULT 0,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (interview_id) REFERENCES interviews(id) ON DELETE CASCADE
        );

        CREATE TABLE IF NOT EXISTS skill_analyses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER NOT NULL,
            resume_id INTEGER,
            jd_id INTEGER,
            matched_skills_json TEXT DEFAULT '[]',
            missing_skills_json TEXT DEFAULT '[]',
            partial_skills_json TEXT DEFAULT '[]',
            match_score REAL DEFAULT 0.0,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
        );

        CREATE TABLE IF NOT EXISTS reports (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            interview_id INTEGER NOT NULL,
            user_id INTEGER NOT NULL,
            overall_score REAL DEFAULT 0.0,
            answer_score REAL DEFAULT 0.0,
            audio_score REAL DEFAULT 0.0,
            video_score REAL DEFAULT 0.0,
            skill_match_score REAL DEFAULT 0.0,
            strengths_json TEXT DEFAULT '[]',
            weaknesses_json TEXT DEFAULT '[]',
            recommendations_json TEXT DEFAULT '[]',
            shap_values_json TEXT DEFAULT '{}',
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (interview_id) REFERENCES interviews(id) ON DELETE CASCADE,
            FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
        );
    """)
    logger.info("Database tables initialized")
