from app.utils import get_logger

logger = get_logger("explanation")


def format_explanation(explanation: dict) -> str:
    lines = [f"Final Score: {explanation.get('final_score', 0):.1f}", ""]
    lines.append("Strengths:")
    for f in explanation.get("positive_factors", []):
        lines.append(f"  + {f['feature']}: +{f['impact']:.3f}")
    lines.append("")
    lines.append("Areas for Improvement:")
    for f in explanation.get("negative_factors", []):
        lines.append(f"  - {f['feature']}: {f['impact']:.3f}")
    return "\n".join(lines)
