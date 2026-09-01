import numpy as np
from app.utils import get_logger

logger = get_logger("head_pose")


def estimate_head_pose(frame: np.ndarray) -> dict:
    try:
        import cv2
        import mediapipe as mp
        face_mesh = mp.solutions.face_mesh.FaceMesh(static_image_mode=False, max_num_faces=1)
        rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = face_mesh.process(rgb)
        if not results.multi_face_landmarks:
            return {"detected": False, "pitch": 0, "yaw": 0, "roll": 0}
        landmarks = results.multi_face_landmarks[0]
        nose_tip = landmarks.landmark[1]
        left_eye = landmarks.landmark[33]
        right_eye = landmarks.landmark[263]
        chin = landmarks.landmark[152]
        forehead = landmarks.landmark[10]
        h, w = frame.shape[:2]
        nose_x = nose_tip.x * w
        eye_center_x = ((left_eye.x + right_eye.x) / 2) * w
        yaw = (nose_x - eye_center_x) / w * 100
        nose_y = nose_tip.y * h
        forehead_y = forehead.y * h
        chin_y = chin.y * h
        pitch = ((nose_y - forehead_y) / (chin_y - forehead_y) - 0.5) * 100 if chin_y != forehead_y else 0
        eye_diff_y = (left_eye.y - right_eye.y) * h
        roll = np.degrees(np.arctan2(eye_diff_y, (right_eye.x - left_eye.x) * w))
        return {
            "detected": True,
            "pitch": round(float(pitch), 1),
            "yaw": round(float(yaw), 1),
            "roll": round(float(roll), 1),
        }
    except ImportError:
        return {"detected": False, "pitch": 0, "yaw": 0, "roll": 0}
    except Exception as e:
        logger.error("Head pose estimation failed: %s", e)
        return {"detected": False, "pitch": 0, "yaw": 0, "roll": 0}
