import os
import shutil
import uuid
from pathlib import Path
from typing import Optional
from app.config import UPLOAD_DIR, JD_DIR
from app.utils import get_logger

logger = get_logger("file_handler")

ALLOWED_RESUME_EXTENSIONS = {".pdf", ".docx", ".doc", ".txt"}
ALLOWED_JD_EXTENSIONS = {".pdf", ".docx", ".doc", ".txt"}
MAX_FILE_SIZE_MB = 10


class FileValidationError(Exception):
    pass


def validate_file(
    filename: str,
    file_size: int,
    allowed_extensions: Optional[set[str]] = None,
    max_size_mb: int = MAX_FILE_SIZE_MB,
) -> None:
    ext = Path(filename).suffix.lower()

    if not ext:
        raise FileValidationError("File has no extension")

    if allowed_extensions and ext not in allowed_extensions:
        raise FileValidationError(
            f"Unsupported file type '{ext}'. "
            f"Allowed: {', '.join(sorted(allowed_extensions))}"
        )

    max_bytes = max_size_mb * 1024 * 1024
    if file_size > max_bytes:
        raise FileValidationError(
            f"File too large ({file_size / (1024 * 1024):.1f} MB). "
            f"Maximum allowed: {max_size_mb} MB"
        )

    if file_size == 0:
        raise FileValidationError("File is empty")


def save_upload(
    file_bytes: bytes,
    filename: str,
    subfolder: str = "resumes",
    max_size_mb: int = MAX_FILE_SIZE_MB,
) -> Path:
    allowed = (
        ALLOWED_RESUME_EXTENSIONS
        if subfolder == "resumes"
        else ALLOWED_JD_EXTENSIONS
    )

    validate_file(filename, len(file_bytes), allowed, max_size_mb)

    folder = UPLOAD_DIR if subfolder == "resumes" else JD_DIR
    folder.mkdir(parents=True, exist_ok=True)

    safe_name = f"{uuid.uuid4().hex}_{filename}"
    dest = folder / safe_name
    dest.write_bytes(file_bytes)

    logger.info(
        "Saved upload: %s -> %s (%d bytes)",
        filename,
        dest.name,
        len(file_bytes),
    )
    return dest


def read_file_text(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="ignore")


def delete_file(path: Path) -> bool:
    try:
        path.unlink(missing_ok=True)
        logger.info("Deleted file: %s", path)
        return True
    except Exception as exc:
        logger.warning("Failed to delete file %s: %s", path, exc)
        return False


def list_files(folder: Path, extensions: Optional[list[str]] = None) -> list[Path]:
    if not folder.exists():
        return []
    files = list(folder.iterdir())
    if extensions:
        files = [f for f in files if f.suffix.lower() in extensions]
    return sorted(files)


def ensure_dir(path: Path) -> Path:
    path.mkdir(parents=True, exist_ok=True)
    return path


def get_file_size_mb(path: Path) -> float:
    if not path.exists():
        return 0.0
    return path.stat().st_size / (1024 * 1024)


def get_file_info(path: Path) -> dict:
    if not path.exists():
        return {"exists": False}
    stat = path.stat()
    return {
        "exists": True,
        "name": path.name,
        "size_bytes": stat.st_size,
        "size_mb": round(stat.st_size / (1024 * 1024), 2),
        "extension": path.suffix.lower(),
    }
