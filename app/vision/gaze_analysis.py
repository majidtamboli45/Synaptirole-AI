import numpy as np
from app.utils import get_logger

logger = get_logger("gaze_analysis")


def analyze_gaze(frame: np.ndarray) -> dict:
    try:
        import cv2
        import mediapipe as mp
        face_mesh = mp.solutions.face_mesh.FaceMesh(static_image_mode=False, max_num_faces=1)
        rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = face_mesh.process(rgb)
        if not results.multi_face_landmarks:
            return {"detected": False, "gaze": "unknown"}
        landmarks = results.multi_face_landmarks[0]
        left_iris = landmarks.landmark[468]
        right_iris = landmarks.landmark[473]
        iris_x = (left_iris.x + right_iris.x) / 2
        if abs(iris_x - 0.5) < 0.05:
            gaze = "center"
        elif iris_x < 0.5:
            gaze = "left"
        else:
            gaze = "right"
        return {"detected": True, "gaze": gaze, "iris_x": round(iris_x, 3)}
    except ImportError:
        return {"detected": False, "gaze": "unknown"}
    except Exception as e:
        logger.error("Gaze analysis failed: %s", e)
        return {"detected": False, "gaze": "unknown"}
