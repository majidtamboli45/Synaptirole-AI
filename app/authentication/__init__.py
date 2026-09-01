import bcrypt
from app.database.models import User
from app.database.repository import UserRepository
from app.utils import get_logger

logger = get_logger("auth")


def hash_password(password: str) -> str:
    return bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt()).decode("utf-8")


def verify_password(password: str, password_hash: str) -> bool:
    return bcrypt.checkpw(password.encode("utf-8"), password_hash.encode("utf-8"))


def register_user(name: str, email: str, password: str, role: str = "") -> tuple[bool, str]:
    existing = UserRepository.get_by_email(email)
    if existing:
        return False, "Email already registered"
    user = User(name=name, email=email, password_hash=hash_password(password), role=role)
    user_id = UserRepository.create(user)
    logger.info("User registered: %s (id=%d)", email, user_id)
    return True, f"Account created. User ID: {user_id}"


def authenticate_user(email: str, password: str) -> tuple[bool, str, User | None]:
    user = UserRepository.get_by_email(email)
    if not user:
        return False, "User not found", None
    if not verify_password(password, user.password_hash):
        return False, "Invalid password", None
    logger.info("User authenticated: %s", email)
    return True, "Login successful", user
