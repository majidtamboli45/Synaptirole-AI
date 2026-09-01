from app.utils import get_logger
from app.scoring.score_fusion import fuse_scores, fuse_with_model
from app.scoring.feature_engineering import extract_features

logger = get_logger("final_score")


def compute_final_score(answer_scores: list[dict], audio_features: list[dict], video_features: list[dict], skill_match_score: float = 0.0) -> dict:
    avg_answer = sum(s.get("score", 0) for s in answer_scores) / len(answer_scores) if answer_scores else 0
    avg_audio = sum(s.get("overall_audio_score", 0) for s in audio_features) / len(audio_features) if audio_features else 0
    avg_video = sum(s.get("scores", {}).get("overall_video", 0) for s in video_features) / len(video_features) if video_features else 0

    weighted_score = fuse_scores(avg_answer, avg_audio, avg_video, skill_match_score)

    features = extract_features(answer_scores, audio_features, video_features, skill_match_score)
    model_score = fuse_with_model(features)

    final_score = round((weighted_score + model_score) / 2, 1)

    logger.info("Final score: %.1f (weighted=%.1f, model=%.1f)", final_score, weighted_score, model_score)
    return {
        "final_score": final_score,
        "answer_score": round(avg_answer, 1),
        "audio_score": round(avg_audio, 1),
        "video_score": round(avg_video, 1),
        "skill_match_score": round(skill_match_score, 1),
        "weighted_score": round(weighted_score, 1),
        "model_score": round(model_score, 1),
    }
