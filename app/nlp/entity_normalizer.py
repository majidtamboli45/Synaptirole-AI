"""Entity normalization & deduplication.

Provides helpers to normalize raw named-entity strings (education, projects,
companies, roles) and to deduplicate extracted entity records by a canonical
key so the analyzer never returns duplicate entries.
"""

import re

_WS_RE = re.compile(r"\s+")


def normalize_entity(value: str) -> str:
    """Trim, collapse whitespace, and clean punctuation noise."""
    if not value:
        return ""
    value = _WS_RE.sub(" ", value)
    value = value.strip(" |,.;:\t\n")
    return value


def title_case(value: str) -> str:
    """Human-friendly title casing (keeps acronyms uppercase)."""
    if not value:
        return ""
    words = value.split()
    out = []
    for word in words:
        if word.isupper() and len(word) <= 4:
            out.append(word)
        elif re.fullmatch(r"[A-Za-z0-9.#+/-]+", word):
            out.append(word.capitalize())
        else:
            out.append(word)
    return " ".join(out)


def deduplicate(items: list[dict], key_field: str) -> list[dict]:
    """Remove records that share the same normalized ``key_field`` value."""
    seen = set()
    result = []
    for item in items:
        key = normalize_entity(str(item.get(key_field, ""))).lower()
        if not key:
            continue
        if key in seen:
            continue
        seen.add(key)
        result.append(item)
    return result


def canonical_token(value: str) -> str:
    """Return a lowercase, non-alphanumeric-stripped token for comparisons."""
    if not value:
        return ""
    return re.sub(r"[^a-z0-9]", "", value.lower())