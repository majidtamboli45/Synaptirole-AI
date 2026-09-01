import numpy as np
from app.config import XGBOOST_MODEL_PATH
from app.utils import get_logger

logger = get_logger("xgboost_model")

_model = None


def get_model():
    global _model
    if _model is not None:
        return _model
    if XGBOOST_MODEL_PATH.exists():
        try:
            import joblib
            _model = joblib.load(str(XGBOOST_MODEL_PATH))
            logger.info("XGBoost model loaded")
            return _model
        except Exception as e:
            logger.warning("Failed to load XGBoost model: %s", e)
    return None


def train_model(X: np.ndarray, y: np.ndarray):
    try:
        from xgboost import XGBRegressor
        model = XGBRegressor(n_estimators=100, max_depth=6, learning_rate=0.1)
        model.fit(X, y)
        XGBOOST_MODEL_PATH.parent.mkdir(parents=True, exist_ok=True)
        import joblib
        joblib.dump(model, str(XGBOOST_MODEL_PATH))
        logger.info("XGBoost model trained and saved")
        return model
    except ImportError:
        logger.warning("xgboost not installed")
        return None


def predict(features: np.ndarray) -> float:
    model = get_model()
    if model is not None:
        try:
            prediction = model.predict(features.reshape(1, -1))[0]
            return float(np.clip(prediction, 0, 100))
        except Exception as e:
            logger.error("Prediction failed: %s", e)
    weighted = np.mean(features[:5]) * 0.4 + np.mean(features[5:9]) * 0.3 + np.mean(features[9:12]) * 0.2 + features[12] * 0.1 if len(features) >= 13 else np.mean(features)
    return float(np.clip(weighted, 0, 100))
