import numpy as np
from app.utils import get_logger

logger = get_logger("posture_analysis")


def analyze_posture(frame: np.ndarray) -> dict:
    try:
        import cv2
        import mediapipe as mp
        pose = mp.solutions.pose.Pose(static_image_mode=False)
        rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = pose.process(rgb)
        if not results.pose_landmarks:
            return {"detected": False, "posture": "unknown", "score": 0}
        landmarks = results.pose_landmarks.landmark
        left_shoulder = landmarks[mp.solutions.pose.PoseLandmark.LEFT_SHOULDER]
        right_shoulder = landmarks[mp.solutions.pose.PoseLandmark.RIGHT_SHOULDER]
        left_hip = landmarks[mp.solutions.pose.PoseLandmark.LEFT_HIP]
        right_hip = landmarks[mp.solutions.pose.PoseLandmark.RIGHT_HIP]
        nose = landmarks[mp.solutions.pose.PoseLandmark.NOSE]
        h, w = frame.shape[:2]
        shoulder_diff = abs(left_shoulder.y - right_shoulder.y) * h
        shoulder_center_y = (left_shoulder.y + right_shoulder.y) / 2
        hip_center_y = (left_hip.y + right_hip.y) / 2
        spine_angle = abs(shoulder_center_y - hip_center_y)
        head_forward = abs(nose.x - (left_shoulder.x + right_shoulder.x) / 2)
        score = 100
        if shoulder_diff > 20:
            score -= 20
        if head_forward > 0.15:
            score -= 25
        if spine_angle < 0.2:
            score -= 15
        posture = "good" if score >= 70 else "fair" if score >= 50 else "poor"
        return {
            "detected": True,
            "posture": posture,
            "score": max(0, score),
            "shoulder_tilt": round(float(shoulder_diff), 1),
            "head_forward": round(float(head_forward), 3),
        }
    except ImportError:
        return {"detected": False, "posture": "unknown", "score": 0}
    except Exception as e:
        logger.error("Posture analysis failed: %s", e)
        return {"detected": False, "posture": "unknown", "score": 0}
