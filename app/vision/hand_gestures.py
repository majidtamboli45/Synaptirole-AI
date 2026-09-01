import numpy as np
from app.utils import get_logger

logger = get_logger("hand_gestures")


def detect_hand_gestures(frame: np.ndarray) -> dict:
    try:
        import cv2
        import mediapipe as mp
        hands = mp.solutions.hands.Hands(static_image_mode=False, max_num_hands=2)
        rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = hands.process(rgb)
        if not results.multi_hand_landmarks:
            return {"detected": False, "hands_count": 0, "gestures": []}
        gestures = []
        for hand_landmarks in results.multi_hand_landmarks:
            wrist = hand_landmarks.landmark[0]
            index_tip = hand_landmarks.landmark[8]
            middle_tip = hand_landmarks.landmark[12]
            thumb_tip = hand_landmarks.landmark[4]
            fingers_up = sum([
                index_tip.y < hand_landmarks.landmark[6].y,
                middle_tip.y < hand_landmarks.landmark[10].y,
                thumb_tip.x < hand_landmarks.landmark[3].x if wrist.x > 0.5 else thumb_tip.x > hand_landmarks.landmark[3].x,
            ])
            if fingers_up >= 3:
                gestures.append("open_hand")
            elif fingers_up == 0:
                gestures.append("fist")
            else:
                gestures.append("partial")
        return {"detected": True, "hands_count": len(results.multi_hand_landmarks), "gestures": gestures}
    except ImportError:
        return {"detected": False, "hands_count": 0, "gestures": []}
    except Exception as e:
        logger.error("Hand gesture detection failed: %s", e)
        return {"detected": False, "hands_count": 0, "gestures": []}
