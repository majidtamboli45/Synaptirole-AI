"""Evaluate ``extract_skills`` against the annotated resume dataset.

Ground truth: char-span SKILL annotations in the annotated dataset
(default ``Documents/Data_for_Project/resumes_annotated.jsonl``; override with
``CP_RESUME_DATASET`` env var or ``--dataset``).
Evaluation is token-set based per canonical skill (not char-span exact).

Usage:
    python scripts/evaluate_skills_annotated.py
    python scripts/evaluate_skills_annotated.py --dataset /path/to/resumes_annotated.jsonl
"""

import argparse
import json
import os
import sys
from collections import defaultdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from app.skills.skill_taxonomy import all_terms
from app.skills.skill_extractor import extract_skills

DEFAULT_DATASET = (
    Path.home()
    / "OneDrive"
    / "Documents"
    / "Data_for_Project"
    / "resumes_annotated.jsonl"
)


def load_records():
    records = []
    with open(DATASET_PATH, encoding="utf-8-sig") as fh:
        for line in fh:
            line = line.strip()
            if line:
                records.append(json.loads(line))
    return records


def canonicalize(mention: str) -> str:
    terms = all_terms()
    key = _normalize(mention)
    if key in terms:
        return terms[key]
    match = _match_substring("", mention)
    return match if match else key


def _normalize(term: str) -> str:
    import re
    return re.sub(r"[^a-z0-9+#.]+", "-", term.lower()).strip("-")


def _match_substring(_cleaned: str, mention: str) -> str:
    normalized = _normalize(mention)
    if not normalized or len(normalized) < 2:
        return ""
    terms = all_terms()
    for term in sorted(terms, key=len, reverse=True):
        if normalized.find(_normalize(term)) != -1:
            return terms[term]
    return ""


def main() -> int:
    parser = argparse.ArgumentParser(description="Evaluate skill extraction precision/recall")
    default = os.getenv("CP_RESUME_DATASET", str(DEFAULT_DATASET))
    parser.add_argument("--dataset", default=default, help="Path to resumes_annotated.jsonl")
    args = parser.parse_args()

    global DATASET_PATH
    DATASET_PATH = Path(args.dataset)

    records = load_records()
    per_domain = defaultdict(lambda: {"tp": 0, "fp": 0, "fn": 0})
    false_positives: list[tuple[str, str]] = []
    false_negatives: list[tuple[str, str]] = []

    for record in records:
        doc_id = record["id"]
        domain = record.get("domain", "unknown")
        text = record["text"]
        gold = {canonicalize(e["text"]) for e in record["entities"] if e["label"] == "SKILL"}
        predicted = set(extract_skills(text))

        tp = gold & predicted
        fp = predicted - gold
        fn = gold - predicted

        for ifp in fp:
            false_positives.append((doc_id, ifp))
        for ifn in fn:
            false_negatives.append((doc_id, ifn))

        stats = per_domain[domain]
        stats["tp"] += len(tp)
        stats["fp"] += len(fp)
        stats["fn"] += len(fn)

    print("Dataset:", DATASET_PATH)
    print(f"Records evaluated: {len(records)}")

    def line(tp, fp, fn):
        prec = tp / (tp + fp) if tp + fp else 0.0
        rec = tp / (tp + fn) if tp + fn else 0.0
        f1 = 2 * prec * rec / (prec + rec) if prec + rec else 0.0
        return prec, rec, f1

    micro = {"tp": 0, "fp": 0, "fn": 0}
    print("\nPer-domain results")
    print(f"{'Domain':<28}{'P':>8}{'R':>8}{'F1':>8}  (TP/FP/FN)")
    for dom in sorted(per_domain):
        s = per_domain[dom]
        p, r, f = line(s["tp"], s["fp"], s["fn"])
        for k in micro:
            micro[k] += s[k]
        print(f"{dom:<28}{p:>8.3f}{r:>8.3f}{f:>8.3f}  ({s['tp']}/{s['fp']}/{s['fn']})")

    p, r, f = line(micro["tp"], micro["fp"], micro["fn"])
    print("\nMicro-average across all resumes")
    print(f"Precision: {p:.3f}  Recall: {r:.3f}  F1: {f:.3f}  (TP={micro['tp']}, FP={micro['fp']}, FN={micro['fn']})")

    print(f"\nSample of false positives (predicted but not gold): {len(false_positives)} total")
    for fp_doc, fp_skill in false_positives[:15]:
        print(f"  {fp_doc}: {fp_skill}")

    print(f"\nFalse negatives (gold but not predicted): {len(false_negatives)} total")
    for fn_doc, fn_skill in false_negatives[:20]:
        print(f"  {fn_doc}: {fn_skill}")

    return 0


if __name__ == "__main__":
    sys.exit(main())