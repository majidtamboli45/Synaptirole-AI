import numpy as np
from app.utils import get_logger
from app.explainability import compute_shap_values, generate_explanation

logger = get_logger("shap_analysis")


def analyze(features: np.ndarray, final_score: float) -> dict:
    shap_values = compute_shap_values(features)
    explanation = generate_explanation(shap_values, final_score)
    logger.info("SHAP analysis complete: score=%.1f", final_score)
    return explanation
