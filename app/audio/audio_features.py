import numpy as np
from app.utils import get_logger

logger = get_logger("audio_features")


def extract_features(audio_data: np.ndarray, sample_rate: int = 16000) -> dict:
    try:
        import librosa
        features = {}

        duration = len(audio_data) / sample_rate
        features["duration"] = round(duration, 2)

        rms = np.sqrt(np.mean(audio_data ** 2))
        features["volume"] = round(float(rms), 4)

        pitches, magnitudes = librosa.piptrack(y=audio_data, sr=sample_rate)
        pitch_values = pitches[magnitudes > 0]
        features["avg_pitch"] = round(float(np.mean(pitch_values)) if len(pitch_values) > 0 else 0, 2)
        features["pitch_std"] = round(float(np.std(pitch_values)) if len(pitch_values) > 0 else 0, 2)

        tempo, _ = librosa.beat.beat_track(y=audio_data, sr=sample_rate)
        features["tempo"] = round(float(tempo) if isinstance(tempo, (int, float, np.floating)) else float(tempo[0]) if hasattr(tempo, '__len__') else 0, 2)

        zero_crossings = np.sum(np.abs(np.diff(np.sign(audio_data)))) / 2
        features["speech_rate_proxy"] = round(float(zero_crossings / duration) if duration > 0 else 0, 2)

        logger.info("Audio features extracted: duration=%.1fs, pitch=%.1f", features["duration"], features["avg_pitch"])
        return features
    except ImportError:
        logger.warning("librosa not installed")
        return {"duration": 0, "volume": 0, "avg_pitch": 0, "pitch_std": 0, "tempo": 0, "speech_rate_proxy": 0}


def detect_filler_words(transcript: str) -> dict:
    fillers = ["um", "uh", "like", "you know", "basically", "actually", "literally", "sort of", "kind of", "so"]
    text_lower = transcript.lower()
    found = {}
    for filler in fillers:
        count = text_lower.count(filler)
        if count > 0:
            found[filler] = count
    total = sum(found.values())
    words = len(transcript.split())
    rate = total / words * 100 if words > 0 else 0
    return {"fillers": found, "total_fillers": total, "filler_rate_percent": round(rate, 2)}
