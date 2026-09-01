from pathlib import Path
from app.config import WHISPER_MODEL
from app.utils import get_logger

logger = get_logger("speech_to_text")

_model = None


def transcribe(audio_path: Path) -> str:
    global _model
    try:
        import whisper
        if _model is None:
            _model = whisper.load_model(WHISPER_MODEL)
            logger.info("Whisper model loaded: %s", WHISPER_MODEL)
        result = _model.transcribe(str(audio_path))
        text = result.get("text", "")
        logger.info("Transcribed %d chars from %s", len(text), audio_path.name)
        return text
    except ImportError:
        logger.warning("whisper not installed")
        return ""
    except Exception as e:
        logger.error("Transcription failed: %s", e)
        return ""


def transcribe_audio_data(audio_data, sample_rate: int = 16000) -> str:
    import tempfile
    import numpy as np
    try:
        import soundfile as sf
        with tempfile.NamedTemporaryFile(suffix=".wav", delete=False) as f:
            sf.write(f.name, audio_data.astype(np.float32), sample_rate)
            return transcribe(Path(f.name))
    except Exception:
        return ""
