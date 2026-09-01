import numpy as np
from app.utils import get_logger
from app.vision.face_orientation import detect_face_orientation
from app.vision.gaze_analysis import analyze_gaze
from app.vision.head_pose import estimate_head_pose
from app.vision.hand_gestures import detect_hand_gestures
from app.vision.posture_analysis import analyze_posture

logger = get_logger("video_analyzer")


def analyze_video_frame(frame: np.ndarray) -> dict:
    face = detect_face_orientation(frame)
    gaze = analyze_gaze(frame)
    head = estimate_head_pose(frame)
    hands = detect_hand_gestures(frame)
    posture = analyze_posture(frame)

    eye_contact_score = 100 if gaze.get("gaze") == "center" else 50 if gaze.get("detected") else 0
    posture_score = posture.get("score", 0)
    stability_score = 100 - min(100, abs(head.get("yaw", 0)) * 2 + abs(head.get("roll", 0)) * 2)
    gesture_score = 80 if hands.get("hands_count", 0) <= 1 else 60

    overall = (eye_contact_score * 0.3 + posture_score * 0.3 + stability_score * 0.25 + gesture_score * 0.15)

    result = {
        "face": face,
        "gaze": gaze,
        "head_pose": head,
        "hands": hands,
        "posture": posture,
        "scores": {
            "eye_contact": round(eye_contact_score, 1),
            "posture": round(posture_score, 1),
            "stability": round(stability_score, 1),
            "gesture": round(gesture_score, 1),
            "overall_video": round(overall, 1),
        },
    }
    return result
