import numpy as np
from app.utils import get_logger

logger = get_logger("scoring")


def engineer_features(answer_scores: list[dict], audio_scores: list[dict], video_scores: list[dict]) -> dict:
    features = {}

    if answer_scores:
        features["avg_answer_score"] = np.mean([s.get("score", 0) for s in answer_scores])
        features["max_answer_score"] = max(s.get("score", 0) for s in answer_scores)
        features["min_answer_score"] = min(s.get("score", 0) for s in answer_scores)
        features["answer_score_std"] = np.std([s.get("score", 0) for s in answer_scores])
        features["avg_relevance"] = np.mean([s.get("relevance", 0) for s in answer_scores])
        features["avg_technical_accuracy"] = np.mean([s.get("technical_accuracy", 0) for s in answer_scores])
        features["avg_completeness"] = np.mean([s.get("completeness", 0) for s in answer_scores])

    if audio_scores:
        features["avg_fluency"] = np.mean([s.get("fluency_score", 0) for s in audio_scores])
        features["avg_volume"] = np.mean([s.get("volume_score", 0) for s in audio_scores])
        features["avg_filler_rate"] = np.mean([s.get("filler_rate_percent", 0) for s in audio_scores])
        features["avg_pitch_consistency"] = np.mean([s.get("pitch_consistency", 0) for s in audio_scores])
        features["avg_speech_rate"] = np.mean([s.get("speech_rate_proxy", 0) for s in audio_scores])

    if video_scores:
        features["avg_eye_contact"] = np.mean([s.get("scores", {}).get("eye_contact", 0) for s in video_scores])
        features["avg_posture"] = np.mean([s.get("scores", {}).get("posture", 0) for s in video_scores])
        features["avg_stability"] = np.mean([s.get("scores", {}).get("stability", 0) for s in video_scores])

    features["total_questions"] = len(answer_scores)
    logger.info("Engineered %d features", len(features))
    return features
