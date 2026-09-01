import os
import shutil
import uuid
from pathlib import Path
from typing import Optional
from app.config import UPLOAD_DIR, JD_DIR


def save_upload(file_bytes: bytes, filename: str, subfolder: str = "resumes") -> Path:
    folder = UPLOAD_DIR if subfolder == "resumes" else JD_DIR
    folder.mkdir(parents=True, exist_ok=True)
    safe_name = f"{uuid.uuid4().hex}_{filename}"
    dest = folder / safe_name
    dest.write_bytes(file_bytes)
    return dest


def read_file_text(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="ignore")


def delete_file(path: Path) -> bool:
    try:
        path.unlink(missing_ok=True)
        return True
    except Exception:
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
