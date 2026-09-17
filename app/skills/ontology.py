"""Skill ontology backed by official ESCO and O*NET datasets.

This module loads real, official skill-ontology data from::

    data/knowledge_base/O_NET/*.csv      O*NET 31.0 (U.S. Dept. of Labor)
    data/knowledge_base/ESCO/skills_*.csv   ESCO v1.2.x (European Commission)

and exposes ``standardize_skill()`` which maps an extracted resume/JD skill to a
canonical concept from the ontology (preferred label + source + identifier).

Lookup is alias-based: every canonical preferred label and every alternative
label/alias from the datasets is indexed under a normalized key (lowercased,
punctuation-normalized, version suffix stripped). The shortest canonical label
wins when several concepts match the same key, keeping canonical forms compact.

The legacy occupation-dictionary API (``get_skills_for_occupation`` /
``get_occupations_for_skill``) is preserved and is now also fed from the O*NET
occupation -> skill linkages in the CSV files.
"""

from __future__ import annotations

import csv
import json
import re
import threading
from pathlib import Path

from app.config import ONET_DIR, ESCO_DIR
from app.utils import get_logger

logger = get_logger("ontology")

# ---------------------------------------------------------------------------
# Data directories / inputs (official datasets)
# ---------------------------------------------------------------------------

ONET_FILES = {
    "software_skills.csv": "Software skill",
    "essential_skills.csv": "Essential skill",
    "transferable_skills.csv": "Transferable skill",
    "knowledge.csv": "Knowledge",
}

# Official ESCO CSV files (English classification): skills_en.csv, skillGroups_en.csv, ...
# We only consume skills_en.csv (leaf skill/competence concepts).
ESCO_SKILLS_FILE = "skills_en.csv"

# ---------------------------------------------------------------------------
# Normalization helpers (mirror synonym_map's cleaning so keys stay consistent)
# ---------------------------------------------------------------------------

# Trailing version suffixes: "Python 3", "Python 3.x", "Angular 12" -> base name.
_VERSION_SUFFIX = re.compile(r"\s*(?:-\s*)?\d+(?:[.,]\d+)*(?:[xX])?\s*$")
# Attached version digits: "Python3", "HTML5", "Java17" -> base name.
_ATTACHED_VERSION = re.compile(r"(?<=\w)-?\d+(?:\.\d+)*\s*$")


def normalize_label(text: str) -> str:
    """Normalize any skill/label to a lookup key (lowercase, punctuation-normalized)."""
    s = (text or "").lower().strip()
    s = s.replace(".", "").replace("-", " ").replace("_", " ")
    return " ".join(s.split())


def strip_version(text: str) -> str:
    """Strip a trailing version suffix so 'Python 3' / 'Python3' -> 'Python'."""
    s = (text or "").strip()
    s = _VERSION_SUFFIX.sub("", s).strip()
    s = _ATTACHED_VERSION.sub("", s).strip()
    return s


def lookup_keys(skill: str) -> list[str]:
    """Keys tried for an input skill during ontology lookup (raw + version-stripped)."""
    keys = {normalize_label(skill)}
    base = strip_version(skill)
    if base.strip():
        keys.add(normalize_label(base))
    return sorted(keys, key=len, reverse=True)


# ---------------------------------------------------------------------------
# In-memory ontology state
# ---------------------------------------------------------------------------

_lock = threading.Lock()
_built = False

# normalized alias key -> list of concept records
_alias_index: dict[str, list[dict]] = {}
# concept uri / identifier -> concept record (for reverse lookups / diagnostics)
_concepts: dict[str, dict] = {}

# O*NET occupation linkages (legacy API, now backed by the CSV data)
_occupation_skills: dict[str, list[str]] = {}
_skill_occupations: dict[str, set] = {}
_occupation_titles: dict[str, str] = {}

_count_esco = 0
_count_onet = 0


def _record_key(rec: dict) -> tuple:
    return (len(rec["canonical"]), rec["canonical"], rec["source"], rec["domain"])


def _add_concept(canonical: str, source: str, uri: str, identifier: str,
                 domain: str, aliases: list[str], occupations: list[str] | None = None):
    """Index a canonical concept under its preferred label and all alternative labels."""
    global _count_esco, _count_onet
    canonical = (canonical or "").strip()
    if not canonical:
        return
    if source == "ESCO":
        _count_esco += 1
    elif source == "O*NET":
        _count_onet += 1

    aliases = [a for a in (aliases or []) if a and a.strip()]
    labels = {canonical, *aliases}
    rec = {
        "canonical": canonical,
        "source": source,
        "uri": uri or "",
        "identifier": identifier or uri or canonical,
        "domain": domain or "",
        "alt_labels": sorted(a for a in labels if a != canonical),
        "occupations": sorted({str(o) for o in (occupations or [])}),
    }
    _concepts[rec["identifier"]] = rec
    for label in labels:
        key = normalize_label(label)
        if not key:
            continue
        _alias_index.setdefault(key, []).append(rec)


def _add_occupancy(occ_code: str, title: str, skill_names: list[str]):
    """Link an occupation to the ontology skill names found on its rows."""
    occ_key_new = str(occ_code or "").lower().strip()
    title_key = str(title or "").lower().strip()
    for skill in set(skill_names):
        skill_key = skill.lower().strip()
        if not skill_key:
            continue
        _skill_occupations.setdefault(skill_key, set()).update(k for k in (occ_key_new, title_key) if k)
    if not occ_key_new:
        return
    merged = list(dict.fromkeys(_occupation_skills.get(occ_key_new, []) + list(skill_names)))
    _occupation_skills[occ_key_new] = merged
    if title_key:
        _occupation_skills[title_key] = merged


# ---------------------------------------------------------------------------
# Loaders
# ---------------------------------------------------------------------------

def _read_csv(path: Path):
    with path.open("r", encoding="utf-8-sig", newline="") as fh:
        for row in csv.DictReader(fh):
            yield row


def _load_legacy_json():
    """Legacy: JSON dict files {occupation: [skills]} dropped into either folder."""
    for data_dir in (ONET_DIR, ESCO_DIR):
        if not data_dir.is_dir():
            continue
        for f in sorted(data_dir.glob("*.json")):
            if f.name.endswith("_state.json"):
                continue
            try:
                data = json.loads(f.read_text(encoding="utf-8"))
                if not isinstance(data, dict):
                    continue
                for occ, skills in data.items():
                    if not isinstance(skills, list):
                        continue
                    safe_skills = [str(s) for s in skills if isinstance(s, str)]
                    key = occ.lower()
                    _occupation_skills[key] = list(dict.fromkeys(_occupation_skills.get(key, []) + safe_skills))
                    for s in safe_skills:
                        _skill_occupations.setdefault(s.lower(), set()).add(key)
                logger.info("Legacy occupation ontology loaded from %s", f)
            except Exception as e:
                logger.warning("Skipping legacy ontology file %s: %s", f, e)


def _load_onet():
    """Load O*NET 31.0 official CSV skill files into the alias index."""
    if not ONET_DIR.is_dir():
        logger.warning("O*NET data dir missing: %s", ONET_DIR)
        return
    found = False

    # --- Software Skills: one row per (occupation, technology) ---
    f_soft = ONET_DIR / "software_skills.csv"
    if f_soft.is_file():
        found = True
        buckets: dict[str, dict] = {}
        try:
            for row in _read_csv(f_soft):
                tech = (row.get("Workplace Example") or "").strip()
                if not tech:
                    continue
                b = buckets.setdefault(tech, {
                    "canonical": tech,
                    "domain_counts": {},
                    "hot": False,
                    "in_demand": False,
                    "occ_codes": set(),
                })
                dom = (row.get("Element Name") or "").strip()
                if dom:
                    b["domain_counts"][dom] = b["domain_counts"].get(dom, 0) + 1
                if (row.get("Hot Technology") or "").strip().upper() == "Y":
                    b["hot"] = True
                if (row.get("In Demand") or "").strip().upper() == "Y":
                    b["in_demand"] = True
                occ = (row.get("O*NET-SOC Code") or "").strip()
                title = (row.get("Title") or "").strip()
                if occ:
                    b["occ_codes"].add(occ)
                    _occupation_titles.setdefault(occ, title)
            for tech, b in buckets.items():
                domain = max(b["domain_counts"], key=lambda k: b["domain_counts"][k]) if b["domain_counts"] else "Software skill"
                identifier = ""
                if b["hot"]:
                    identifier = "hot-technology"
                rec_occ = sorted(b["occ_codes"])
                _add_concept(tech, "O*NET", "", identifier, domain or "Software skill", [], rec_occ)
                _add_occupancy(rec_occ[0] if rec_occ else "", ", ".join(_occupation_titles.get(c, "") for c in rec_occ[:1]), [tech])
            logger.info("O*NET software skills loaded: %d technologies", len(buckets))
        except Exception as e:
            logger.warning("Failed to load %s: %s", f_soft, e)

    # --- Essential / Transferable / Knowledge: one row per (occupation, element) ---
    for fname, domain in ONET_FILES.items():
        if fname == "software_skills.csv":
            continue
        f = ONET_DIR / fname
        if not f.is_file():
            continue
        found = True
        buckets: dict[str, dict] = {}
        try:
            for row in _read_csv(f):
                name = (row.get("Element Name") or "").strip()
                if not name:
                    continue
                el_id = (row.get("Element ID") or "").strip()
                occ = (row.get("O*NET-SOC Code") or "").strip()
                title = (row.get("Title") or "").strip()
                b = buckets.setdefault(el_id or name, {
                    "name": name,
                    "el_id": el_id,
                    "occ_codes": set(),
                })
                if occ:
                    b["occ_codes"].add(occ)
                    _occupation_titles.setdefault(occ, title)
            for el_id, b in buckets.items():
                rec_occ = sorted(b["occ_codes"])
                _add_concept(b["name"], "O*NET", "", el_id, domain, [], rec_occ)
                _add_occupancy(rec_occ[0] if rec_occ else "", ", ".join(_occupation_titles.get(c, "") for c in rec_occ[:1]), [b["name"]])
            logger.info("O*NET %s loaded: %d elements", domain, len(buckets))
        except Exception as e:
            logger.warning("Failed to load %s: %s", f, e)

    if not found:
        logger.warning(
            "No O*NET data files found in %s. Place the official O*NET 31.0 CSVs "
            "(software_skills.csv, essential_skills.csv, transferable_skills.csv, "
            "knowledge.csv) there; see Implementation_docs/phase4.md.", ONET_DIR)

    # --- Occupations ---
    f_occ = ONET_DIR / "occupation_data.csv"
    if f_occ.is_file():
        try:
            for row in _read_csv(f_occ):
                code = (row.get("O*NET-SOC Code") or "").strip()
                title = (row.get("Title") or "").strip()
                if code and title:
                    _occupation_titles[code] = title
            logger.info("O*NET occupations loaded: %d", len(_occupation_titles))
        except Exception as e:
            logger.warning("Failed to load %s: %s", f_occ, e)


def _load_esco():
    """Load the official ESCO skills CSV (skills_en.csv) into the alias index."""
    if not ESCO_DIR.is_dir():
        logger.warning(
            "ESCO data dir missing: %s. Place the official ESCO v1.2.x English CSV "
            "(skills_en.csv) there to enable ESCO standardization; see "
            "Implementation_docs/phase4.md.", ESCO_DIR)
        return

    csv_files = list(ESCO_DIR.glob("skills_*.csv"))
    found = False
    for f in csv_files:
        found = True
        n = 0
        try:
            for row in _read_csv(f):
                concept_type = (row.get("conceptType") or "").strip()
                if concept_type and "G" in concept_type:
                    continue  # skill group: index leaf skills/competences only
                pref = (row.get("preferredLabel") or "").strip()
                if not pref:
                    continue
                alt_raw = (row.get("altLabels") or "").strip()
                hidden_raw = (row.get("hiddenLabels") or "").strip()
                aliases = [a.strip() for a in alt_raw.split(";") if a.strip()]
                aliases += [a.strip() for a in hidden_raw.split(";") if a.strip()]
                uri = (row.get("conceptUri") or "").strip()
                _add_concept(pref, "ESCO", uri, uri, "ESCO skill/competence", aliases)
                n += 1
            logger.info("ESCO loaded from %s: %d skills/competences", f, n)
        except Exception as e:
            logger.warning("Failed to load ESCO file %s: %s", f, e)

    # JSON snapshot with the same official schema (e.g. fetched via the ESCO API)
    if not found:
        for f in sorted(ESCO_DIR.glob("*.json")):
            if f.name.endswith("_state.json"):
                continue
            try:
                data = json.loads(f.read_text(encoding="utf-8"))
                if isinstance(data, dict):
                    data = data.get("results", data.get("skills", [data]))
                if not isinstance(data, list):
                    continue
                n = 0
                for item in data:
                    concept_type = str(item.get("conceptType", ""))
                    if concept_type and "G" in concept_type:
                        continue
                    pref = str(item.get("preferredLabel", "")).strip()
                    if not pref:
                        continue
                    aliases = [str(a) for a in (item.get("altLabels") or []) if str(a).strip()]
                    uri = str(item.get("conceptUri", item.get("uri", ""))).strip()
                    _add_concept(pref, "ESCO", uri, uri, "ESCO skill/competence", aliases)
                    n += 1
                if n:
                    found = True
                    logger.info("ESCO loaded from %s: %d skills/competences", f, n)
            except Exception as e:
                logger.warning("Failed to load ESCO JSON %s: %s", f, e)

    if not found:
        logger.warning(
            "ESCO data not present in %s. ESCO standardization will be inactive until the "
            "official dataset (skills_en.csv) is installed; O*NET remains active. "
            "See Implementation_docs/phase4.md for the exact install steps.", ESCO_DIR)


# ---------------------------------------------------------------------------
# Public API
# ---------------------------------------------------------------------------

def load_ontology():
    global _built
    if _built:
        return
    with _lock:
        if _built:
            return
        _load_legacy_json()
        _load_onet()
        _load_esco()
        _built = True
        n = len(_alias_index)
        logger.info(
            "Ontology ready: %d alias keys, %d ESCO + %d O*NET concepts",
            n, _count_esco, _count_onet)


def is_loaded() -> bool:
    return _built


def status() -> dict:
    """Summary of what ontology data is loaded and where it came from."""
    load_ontology()
    esco_files = [f.name for f in ESCO_DIR.glob("*") if f.is_file()] if ESCO_DIR.is_dir() else []
    onet_files = [f.name for f in ONET_DIR.glob("*.csv")] if ONET_DIR.is_dir() else []
    return {
        "esco_loaded": _count_esco > 0,
        "esco_concepts": _count_esco,
        "esco_files": esco_files,
        "esco_dir": str(ESCO_DIR),
        "onet_loaded": _count_onet > 0,
        "onet_concepts": _count_onet,
        "onet_files": onet_files,
        "onet_dir": str(ONET_DIR),
        "alias_keys": len(_alias_index),
        "occupations": len(_occupation_skills),
    }


def lookup(skill: str) -> dict | None:
    """Ontology-only lookup. Returns the best-matching concept record or None.

    Tries the raw normalized skill first, then the version-stripped form, so
    'Python 3' resolves to the 'Python' concept. The shortest canonical label
    wins when several ontology concepts share a key.
    """
    load_ontology()
    for key in lookup_keys(skill):
        recs = _alias_index.get(key)
        if not recs:
            continue
        best = min(recs, key=_record_key)
        return dict(best)
    return None


def standardize_skill(skill: str) -> dict | None:
    """Standardize a skill against the ESCO/O*NET ontology.

    Returns a dict with ``original``, ``key``, ``canonical``, ``source``,
    ``uri``, ``identifier``, ``domain`` and ``alt_labels``, or None when the
    skill is not present in any loaded ontology dataset.
    """
    rec = lookup(skill)
    if rec is None:
        return None
    return {
        "original": skill,
        "key": normalize_label(rec["canonical"]),
        "canonical": rec["canonical"],
        "source": rec["source"],
        "uri": rec["uri"],
        "identifier": rec["identifier"],
        "domain": rec["domain"],
        "alt_labels": rec["alt_labels"],
    }


def get_skills_for_occupation(occupation: str) -> list[str]:
    load_ontology()
    return list(_occupation_skills.get(str(occupation).lower().strip(), []))


def get_occupations_for_skill(skill: str) -> list[str]:
    load_ontology()
    return sorted(_skill_occupations.get(str(skill).lower().strip(), set()))


def get_skill_concepts(source: str | None = None) -> list[dict]:
    """All indexed concepts, optionally filtered by source ('ESCO' / 'O*NET')."""
    load_ontology()
    out = []
    seen = set()
    for recs in _alias_index.values():
        for rec in recs:
            if rec["identifier"] in seen:
                continue
            if source and rec["source"] != source:
                continue
            seen.add(rec["identifier"])
            out.append(dict(rec))
    return out


def _demo():
    logger.info("=== Skill ontology (ESCO/O*NET) — status ===")
    st = status()
    logger.info(
        "ESCO concepts=%d files=%s | O*NET concepts=%d files=%s | aliases=%d | occupations=%d",
        st["esco_concepts"], st["esco_files"], st["onet_concepts"],
        st["onet_files"], st["alias_keys"], st["occupations"])
    for sample in ["Python", "Python 3", "JavaScript", "JS", "NLP", "Docker",
                   "Time Management", "Complex Problem Solving", "Node.js", "R"]:
        s = standardize_skill(sample)
        if s:
            logger.info("  %-28s -> %-28s source=%-8s uri=%s",
                        sample, s["canonical"], s["source"], s["uri"])
        else:
            logger.info("  %-28s -> <no ontology concept>", sample)


if __name__ == "__main__":
    _demo()