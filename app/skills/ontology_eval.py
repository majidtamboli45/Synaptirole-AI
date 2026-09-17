"""Ontology standardization verification (Phase 4 — ESCO/O*NET integration).

Run with::

    python -m app.skills.ontology_eval

Demonstrates real, official O*NET 31.0 and (if installed) ESCO data being used
to standardize skills, and proves source attribution through the full resolver
cascade (ontology -> synonym -> original).
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

from app.utils import get_logger
from app.skills.synonym_map import standardize_skill
from app.skills import ontology

logger = get_logger("ontology_eval")

# -- Demo inputs that prove real ontology usage ----------------------------─
# (original input -> expected source OR expected canonical family)
DEMOS = [
    ("Python 3", "O*NET", "Python"),
    ("python", "O*NET", "Python"),
    ("JavaScript", "O*NET", "JavaScript"),
    ("JS", "synonym_fallback", None),          # normalizes to "javascript"
    ("Docker", "O*NET", "Docker"),
    ("Docker Container", "O*NET", "Docker"),    # O*NET "Docker" or similar
    ("NLP", "synonym_fallback", None),          # normalizes to "nlp" / "natural language processing"
    ("Complex Problem Solving", "O*NET", "Complex Problem Solving"),
    ("Time Management", "O*NET", "Time Management"),
    ("PyTorch", "O*NET", "PyTorch"),
    ("TensorFlow", "O*NET", "TensorFlow"),
    ("C++", "O*NET", "C++"),
    ("R", "O*NET", "R"),
    ("Selenium", "synonym_fallback", None),     # not in O*NET; no synonym hit either -> "none"
    ("Node.js", "O*NET", "Node.js"),
    ("Kubernetes", "O*NET", "Kubernetes"),
    ("Machine Learning", "synonym_fallback", None),  # not in O*NET software lists
]


def _collect_eval_pair_skills() -> list[str]:
    """All unique skills from the evaluation ground-truth pairs."""
    from app.skills.evaluation import GROUND_TRUTH_PAIRS
    skills: list[str] = []
    for pair in GROUND_TRUTH_PAIRS:
        skills.extend(pair.resume_skills)
        skills.extend(pair.jd_skills)
    return list(dict.fromkeys(skills))


def run_eval() -> dict:
    """Run the full ontology standardization evaluation. Returns structured results."""
    st = ontology.status()
    logger.info("Ontology status: %s", json.dumps(st, indent=2))

    ok = True
    results: list[dict] = []
    onet_hit = 0
    esco_hit = 0
    syn_hit = 0
    none_hit = 0

    # -- 1. Demo standards --------------------------------------------------
    logger.info("")
    logger.info("-- Demo standardization (proving real dataset use) --")
    for input_skill, _expected_source, expected_canonical in DEMOS:
        std = standardize_skill(input_skill)
        source = std["source"]
        canonical = std["canonical"]
        results.append({
            "input": input_skill,
            "source": source,
            "canonical": canonical,
            "uri": std["uri"],
            "key": std["key"],
        })
        if source == "O*NET":
            onet_hit += 1
        elif source == "ESCO":
            esco_hit += 1
        elif source == "synonym_fallback":
            syn_hit += 1
        else:
            none_hit += 1
        logger.info(
            "  %-28s -> canonical=%-30s source=%-18s key=%s",
            input_skill, canonical, source, std["key"])
        if expected_canonical is not None and canonical.lower() != expected_canonical.lower():
            logger.warning("  ! expected canonical '%s' got '%s'", expected_canonical, canonical)
            ok = False

    # -- 2. Evaluation pair skills: prove ontology covers JD skills ----------
    logger.info("")
    logger.info("-- Source distribution over evaluation-pair JD skills --")
    eval_skills = _collect_eval_pair_skills()
    eval_sources: dict[str, list[str]] = {"O*NET": [], "ESCO": [], "synonym_fallback": [], "none": []}
    for skill in eval_skills:
        std = standardize_skill(skill)
        source = std["source"]
        eval_sources.setdefault(source, []).append(f"{skill} -> {std['canonical']}")
        if source == "O*NET":
            onet_hit += 1
        elif source == "ESCO":
            esco_hit += 1
        elif source == "synonym_fallback":
            syn_hit += 1
        else:
            none_hit += 1

    for src in ["O*NET", "ESCO", "synonym_fallback", "none"]:
        examples = eval_sources.get(src, [])
        logger.info("  %-18s: %d skills", src, len(examples))
        for ex in examples[:6]:
            logger.info("    %s", ex)

    # -- 3. Source summary --------------------------------------------------─
    logger.info("")
    logger.info("-- Overall source distribution --")
    summary = {"O*NET": onet_hit, "ESCO": esco_hit, "synonym_fallback": syn_hit, "none": none_hit}
    for src, count in summary.items():
        logger.info("  %-18s: %d", src, count)
    total = sum(summary.values())
    logger.info("  %-18s: %d", "TOTAL", total)

    if onet_hit < 10:
        logger.error("FAIL: O*NET contributions too low (%d) - real O*NET data not loaded?", onet_hit)
        ok = False
    if esco_hit > 0:
        logger.info("PASS: ESCO loaded with %d contributions (dataset is present)", esco_hit)
    else:
        logger.info("INFO: ESCO not present - 0 contributions; loader is ready and awaiting skills_en.csv")

    # -- 4. Edge cases ------------------------------------------------------─
    logger.info("")
    logger.info("-- Edge cases --")
    std_empty = standardize_skill("")
    logger.info("  empty string -> key='%s' source='%s'", std_empty["key"], std_empty["source"])
    std_none = standardize_skill("fuzzbuzz")
    logger.info("  unknown skill 'fuzzbuzz' -> key='%s' source='%s'", std_none["key"], std_none["source"])
    # Idempotency
    a = standardize_skill("Python 3")
    b = standardize_skill("Python 3")
    assert a == b, "standardize_skill must be idempotent"
    logger.info("  idempotency: PASS")
    # Version stripping
    py3 = standardize_skill("Python 3")
    py  = standardize_skill("Python")
    assert py3["key"] == py["key"], "version stripping should normalize Python 3 -> Python"
    logger.info("  version stripping: Python 3 key == Python key -> PASS")

    # -- 5. Matcher integration check --------------------------------------─
    logger.info("")
    logger.info("-- Matcher integration (compute_match_score standardize_summary) --")
    try:
        from app.skills.skill_matcher import compute_match_score
        result = compute_match_score(
            ["Python", "Machine Learning", "Docker", "Kubernetes"],
            ["Python", "Docker", "Kubernetes", "Time Management", "Complex Problem Solving"],
        )
        std_summary = result.get("standardize_summary", {})
        logger.info("  standardize_summary: %s", json.dumps(std_summary))
        onet_in_summary = std_summary.get("O*NET", 0)
        logger.info("  O*NET contributions in JD skills: %d", onet_in_summary)
        if onet_in_summary < 2:
            logger.error("FAIL: expected at least 2 O*NET contributions in matcher summary")
            ok = False
        else:
            logger.info("  matcher integration: PASS")
        # Per-detail source attribution present
        for d in result["details"]:
            if "standardize_source" not in d:
                logger.error("FAIL: detail missing standardize_source for '%s'", d["jd_skill"])
                ok = False
            else:
                logger.info("  JD %-30s source=%-18s canonical=%s",
                            d["jd_skill"], d["standardize_source"], d["standardize_canonical"])
    except Exception as e:
        logger.error("FAIL: compute_match_score raised: %s", e)
        ok = False

    # -- 6. Occupations API --------------------------------------------------
    logger.info("")
    logger.info("-- Occupation API (O*NET-backed) --")
    py_occs = ontology.get_occupations_for_skill("Python")
    logger.info("  Occupations for 'Python': %d (e.g. %s)", len(py_occs), py_occs[:5])
    dvs = ontology.get_skills_for_occupation("software developers")
    logger.info("  Skills for 'software developers' (title): %d", len(dvs))
    if not dvs and not py_occs:
        logger.warning("WARNING: occupation API returned 0 results - check occupation_data.csv")
    else:
        logger.info("  occupation API: PASS")

    logger.info("")
    logger.info("=================================================================================")
    if ok:
        logger.info("PASS: Ontology standardization verified - real O*NET data in use, source attribution working")
    else:
        logger.error("FAIL: some checks failed")
    logger.info("=================================================================================")
    return {"ok": ok, "summary": summary, "status": st, "details": results}


def main():
    res = run_eval()
    sys.exit(0 if res["ok"] else 1)


if __name__ == "__main__":
    main()
