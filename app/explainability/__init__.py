import numpy as np
from app.utils import get_logger

logger = get_logger("explainability")


def compute_shap_values(features: np.ndarray, feature_names: list[str] = None) -> dict:
    if feature_names is None:
        feature_names = [
            "answer_avg", "answer_std", "relevance", "technical_accuracy", "completeness",
            "fluency", "volume", "filler_rate", "pitch_consistency",
            "eye_contact", "posture", "stability", "skill_match"
        ]
    try:
        import shap
        from app.scoring.xgboost_model import get_model
        model = get_model()
        if model is not None:
            explainer = shap.TreeExplainer(model)
            shap_values = explainer.shap_values(features.reshape(1, -1))
            values = shap_values[0] if len(shap_values.shape) > 1 else shap_values
            result = {name: round(float(val), 4) for name, val in zip(feature_names[:len(values)], values)}
            logger.info("SHAP values computed for %d features", len(result))
            return result
    except ImportError:
        logger.warning("shap not installed, using heuristic explanation")
    except Exception as e:
        logger.warning("SHAP computation failed: %s", e)

    importance = {}
    for i, name in enumerate(feature_names[:len(features)]):
        importance[name] = round(float(features[i]) / 100, 4)
    return importance


def generate_explanation(shap_values: dict, final_score: float) -> dict:
    sorted_features = sorted(shap_values.items(), key=lambda x: abs(x[1]), reverse=True)
    positive = [(k, v) for k, v in sorted_features if v > 0][:3]
    negative = [(k, v) for k, v in sorted_features if v < 0][:3]

    return {
        "final_score": final_score,
        "positive_factors": [{"feature": k, "impact": v} for k, v in positive],
        "negative_factors": [{"feature": k, "impact": v} for k, v in negative],
        "summary": f"Score of {final_score:.1f} driven by {len(positive)} positive and {len(negative)} negative factors.",
    }
