import numpy as np
from app.utils import get_logger

logger = get_logger("score_fusion")


def fuse_scores(answer_score: float, audio_score: float, video_score: float, skill_match_score: float, weights: dict = None) -> float:
    if weights is None:
        weights = {"answer": 0.35, "audio": 0.20, "video": 0.20, "skill_match": 0.25}

    fused = (
        answer_score * weights["answer"] +
        audio_score * weights["audio"] +
        video_score * weights["video"] +
        skill_match_score * weights["skill_match"]
    )

    return round(float(np.clip(fused, 0, 100)), 1)


def fuse_with_model(features: np.ndarray) -> float:
    from app.scoring.xgboost_model import predict
    return predict(features)
