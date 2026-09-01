from app.config import OPENAI_API_KEY, OPENAI_MODEL
from app.utils import get_logger

logger = get_logger("llm_manager")

_client = None


def _get_client():
    global _client
    if _client is None:
        if not OPENAI_API_KEY:
            logger.warning("No OPENAI_API_KEY set")
            return None
        try:
            from openai import OpenAI
            _client = OpenAI(api_key=OPENAI_API_KEY)
            logger.info("OpenAI client initialized")
        except ImportError:
            logger.warning("openai package not installed")
            return None
    return _client


def generate(prompt: str, model: str = "", temperature: float = 0.7, max_tokens: int = 1024) -> str:
    client = _get_client()
    if client is None:
        return _fallback_generate(prompt)
    try:
        response = client.chat.completions.create(
            model=model or OPENAI_MODEL,
            messages=[{"role": "user", "content": prompt}],
            temperature=temperature,
            max_tokens=max_tokens,
        )
        return response.choices[0].message.content.strip()
    except Exception as e:
        logger.error("LLM generation failed: %s", e)
        return _fallback_generate(prompt)


def _fallback_generate(prompt: str) -> str:
    logger.info("Using fallback generator (no API key)")
    return f"[Fallback] Generated response for: {prompt[:100]}..."
