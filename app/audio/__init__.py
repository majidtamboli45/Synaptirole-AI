import numpy as np
from pathlib import Path
from app.utils import get_logger

logger = get_logger("audio")


def record_audio(duration: int = 30, sample_rate: int = 16000, output_path: Path = None) -> np.ndarray | None:
    try:
        import sounddevice as sd
        audio = sd.rec(int(duration * sample_rate), samplerate=sample_rate, channels=1, dtype="float32")
        sd.wait()
        if output_path:
            import soundfile as sf
            sf.write(str(output_path), audio.flatten(), sample_rate)
            logger.info("Audio recorded: %s", output_path)
        return audio.flatten()
    except ImportError:
        logger.warning("sounddevice not installed")
        return None
    except Exception as e:
        logger.error("Recording failed: %s", e)
        return None
