import numpy as np
from app.utils import get_logger
from app.audio.audio_features import extract_features, detect_filler_words

logger = get_logger("audio_analyzer")


def analyze_audio(audio_data: np.ndarray, transcript: str = "", sample_rate: int = 16000) -> dict:
    features = extract_features(audio_data, sample_rate)
    fillers = detect_filler_words(transcript) if transcript else {"fillers": {}, "total_fillers": 0, "filler_rate_percent": 0}

    fluency_score = max(0, 100 - fillers["filler_rate_percent"] * 5)
    volume_score = min(100, features["volume"] * 500) if features["volume"] > 0 else 0
    pitch_consistency = max(0, 100 - features["pitch_std"]) if features["pitch_std"] > 0 else 50

    overall = (fluency_score * 0.4 + volume_score * 0.3 + pitch_consistency * 0.3)

    result = {
        **features,
        **fillers,
        "fluency_score": round(fluency_score, 1),
        "volume_score": round(volume_score, 1),
        "pitch_consistency": round(pitch_consistency, 1),
        "overall_audio_score": round(overall, 1),
    }
    logger.info("Audio analysis: overall=%.1f, fluency=%.1f", overall, fluency_score)
    return result
