import numpy as np
from app.utils import get_logger

logger = get_logger("feature_engineering")


def extract_features(answer_scores: list[dict], audio_features: list[dict], video_features: list[dict], skill_match_score: float = 0.0) -> np.ndarray:
    feature_vector = []

    if answer_scores:
        feature_vector.extend([
            np.mean([s.get("score", 0) for s in answer_scores]),
            np.std([s.get("score", 0) for s in answer_scores]) if len(answer_scores) > 1 else 0,
            np.mean([s.get("relevance", 0) for s in answer_scores]),
            np.mean([s.get("technical_accuracy", 0) for s in answer_scores]),
            np.mean([s.get("completeness", 0) for s in answer_scores]),
        ])
    else:
        feature_vector.extend([0, 0, 0, 0, 0])

    if audio_features:
        feature_vector.extend([
            np.mean([s.get("fluency_score", 0) for s in audio_features]),
            np.mean([s.get("volume_score", 0) for s in audio_features]),
            np.mean([s.get("filler_rate_percent", 0) for s in audio_features]),
            np.mean([s.get("pitch_consistency", 0) for s in audio_features]),
        ])
    else:
        feature_vector.extend([0, 0, 0, 0])

    if video_features:
        feature_vector.extend([
            np.mean([s.get("scores", {}).get("eye_contact", 0) for s in video_features]),
            np.mean([s.get("scores", {}).get("posture", 0) for s in video_features]),
            np.mean([s.get("scores", {}).get("stability", 0) for s in video_features]),
        ])
    else:
        feature_vector.extend([0, 0, 0])

    feature_vector.append(skill_match_score)

    logger.info("Feature vector length: %d", len(feature_vector))
    return np.array(feature_vector, dtype=np.float32)
