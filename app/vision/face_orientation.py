import numpy as np
from app.utils import get_logger

logger = get_logger("face_orientation")


def detect_face_orientation(frame: np.ndarray) -> dict:
    try:
        import cv2
        import mediapipe as mp
        face_mesh = mp.solutions.face_mesh.FaceMesh(static_image_mode=False, max_num_faces=1)
        rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = face_mesh.process(rgb)
        if not results.multi_face_landmarks:
            return {"detected": False, "orientation": "unknown"}
        landmarks = results.multi_face_landmarks[0]
        nose = landmarks.landmark[1]
        left_eye = landmarks.landmark[33]
        right_eye = landmarks.landmark[263]
        h, w = frame.shape[:2]
        center_x = w / 2
        face_center = (left_eye.x + right_eye.x) / 2 * w
        offset = (face_center - center_x) / w
        if abs(offset) < 0.05:
            orientation = "center"
        elif offset < 0:
            orientation = "left"
        else:
            orientation = "right"
        return {"detected": True, "orientation": orientation, "offset": round(offset, 3)}
    except ImportError:
        return {"detected": False, "orientation": "unknown"}
    except Exception as e:
        logger.error("Face orientation detection failed: %s", e)
        return {"detected": False, "orientation": "unknown"}
