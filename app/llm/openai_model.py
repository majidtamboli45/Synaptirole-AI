from app.llm.llm_manager import generate
from app.utils import get_logger

logger = get_logger("openai_model")


def chat(prompt: str, system_prompt: str = "", **kwargs) -> str:
    messages = []
    if system_prompt:
        messages.append({"role": "system", "content": system_prompt})
    messages.append({"role": "user", "content": prompt})
    return generate(prompt, **kwargs)
