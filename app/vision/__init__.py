import numpy as np
from app.utils import get_logger

logger = get_logger("vision")


def capture_frame() -> np.ndarray | None:
    try:
        import cv2
        cap = cv2.VideoCapture(0)
        if not cap.isOpened():
            logger.warning("Camera not available")
            return None
        ret, frame = cap.read()
        cap.release()
        if ret:
            return frame
        return None
    except ImportError:
        logger.warning("opencv not installed")
        return None
