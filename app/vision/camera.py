import numpy as np
from app.utils import get_logger

logger = get_logger("camera")


class Camera:
    def __init__(self, device_id: int = 0):
        self.device_id = device_id
        self._cap = None

    def open(self) -> bool:
        try:
            import cv2
            self._cap = cv2.VideoCapture(self.device_id)
            if self._cap.isOpened():
                logger.info("Camera %d opened", self.device_id)
                return True
            logger.warning("Camera %d failed to open", self.device_id)
            return False
        except ImportError:
            logger.warning("opencv not installed")
            return False

    def read(self) -> np.ndarray | None:
        if self._cap and self._cap.isOpened():
            ret, frame = self._cap.read()
            return frame if ret else None
        return None

    def release(self):
        if self._cap:
            self._cap.release()
            self._cap = None

    def is_opened(self) -> bool:
        return self._cap is not None and self._cap.isOpened()
