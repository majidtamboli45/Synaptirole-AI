from app.utils import get_logger

logger = get_logger("improvement")


def generate_improvements(scores: dict, skill_gap: dict) -> list[str]:
    improvements = []

    if skill_gap.get("missing_skills"):
        for skill in skill_gap["missing_skills"][:5]:
            improvements.append(f"Learn {skill} — required for this role")

    audio_score = scores.get("audio_score", 100)
    if audio_score < 60:
        improvements.append("Practice speaking more clearly and reduce filler words")
        improvements.append("Work on maintaining consistent volume and pace")

    video_score = scores.get("video_score", 100)
    if video_score < 60:
        improvements.append("Maintain better eye contact with the camera")
        improvements.append("Improve posture — sit upright and avoid excessive movement")

    answer_score = scores.get("answer_score", 100)
    if answer_score < 60:
        improvements.append("Provide more structured and detailed answers")
        improvements.append("Use the STAR method for behavioral questions")

    if not improvements:
        improvements.append("Continue practicing to maintain your strong performance")

    logger.info("Generated %d improvement recommendations", len(improvements))
    return improvements
