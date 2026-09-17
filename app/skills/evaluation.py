from __future__ import annotations

import json
import time
from pathlib import Path

from app.utils import get_logger
from app.skills.skill_matcher import compute_match_score, MATCH_THRESHOLD, PARTIAL_THRESHOLD
from app.skills.synonym_map import normalize_skill
from app.skills import sbert_model

logger = get_logger("skills_eval")


class GroundTruthPair:
    def __init__(self, resume_skills, jd_skills, expected_gaps, expected_partials, note=""):
        self.resume_skills = list(resume_skills)
        self.jd_skills = list(jd_skills)
        self.expected_gaps = set(expected_gaps)
        self.expected_partials = set(expected_partials)
        self.note = note


GROUND_TRUTH_PAIRS: list[GroundTruthPair] = [
    GroundTruthPair(
        ["Python", "Machine Learning", "SQL", "Pandas", "NLP"],
        ["Python", "SQL", "Machine Learning", "Docker"],
        expected_gaps=["Docker"],
        expected_partials=[],
        note="Basic overlap with one gap",
    ),
    GroundTruthPair(
        ["Python", "Pytorch", "Computer Vision"],
        ["Python", "PyTorch", "Deep Learning", "TensorFlow"],
        expected_gaps=["Deep Learning"],
        expected_partials=[],
        note="Case insensitive, framework overlap",
    ),
    GroundTruthPair(
        ["C++", "Embedded Systems", "Linux"],
        ["C/C++", "Embedded systems", "RTOS"],
        expected_gaps=["RTOS"],
        expected_partials=["C/C++"],
        note="C++ vs C/C++ partial",
    ),
    GroundTruthPair(
        ["React", "Node.js", "MongoDB"],
        ["React", "Express", "Node.js", "PostgreSQL"],
        expected_gaps=["PostgreSQL"],
        expected_partials=["Express"],
        note="Full stack JS roles",
    ),
    GroundTruthPair(
        ["Java", "Spring Boot", "MySQL"],
        ["Java", "Spring", "REST APIs", "Redis"],
        expected_gaps=["REST APIs", "Redis"],
        expected_partials=["Spring"],
        note="Java enterprise stack",
    ),
    GroundTruthPair(
        ["AWS", "Terraform", "Kubernetes", "CI/CD"],
        ["AWS", "Terraform", "Kubernetes", "Docker", "Jenkins", "Python"],
        expected_gaps=["Docker", "Jenkins", "Python"],
        expected_partials=[],
        note="Cloud ops with missing pieces",
    ),
    GroundTruthPair(
        ["Machine Learning", "Pandas", "NumPy", "SciPy"],
        ["Machine Learning", "Data Analysis", "Statistics"],
        expected_gaps=["Statistics"],
        expected_partials=["Data Analysis"],
        note="ML engineer role",
    ),
    GroundTruthPair(
        ["Kotlin", "Android", "Firebase"],
        ["Kotlin", "Android SDK", "Jetpack Compose", "Firebase"],
        expected_gaps=[],
        expected_partials=["Android SDK", "Jetpack Compose"],
        note="Android developer role",
    ),
    GroundTruthPair(
        ["Python", "FastAPI", "PostgreSQL"],
        ["Python", "FastAPI", "RESTful APIs", "NoSQL"],
        expected_gaps=["RESTful APIs", "NoSQL"],
        expected_partials=[],
        note="Backend API role",
    ),
    GroundTruthPair(
        ["JavaScript", "HTML", "CSS"],
        ["JavaScript", "TypeScript", "React", "Redux"],
        expected_gaps=["React", "Redux"],
        expected_partials=["TypeScript"],
        note="Frontend with framework gaps",
    ),
    GroundTruthPair(
        ["SQL", "Power BI", "Tableau", "Excel"],
        ["SQL", "Data Visualization", "Tableau"],
        expected_gaps=["Data Visualization"],
        expected_partials=["Data Visualization"],
        note="Data analyst role",
    ),
    GroundTruthPair(
        ["SQL", "Python", "ETL", "Airflow"],
        ["SQL", "Python", "ETL", "Airflow", "Data Warehousing", "Spark"],
        expected_gaps=["Data Warehousing", "Spark"],
        expected_partials=[],
        note="Data engineer role",
    ),
    GroundTruthPair(
        ["Product Management", "Agile", "User Research"],
        ["Product Management", "Agile", "Data Analysis", "A/B Testing"],
        expected_gaps=["Data Analysis", "A/B Testing"],
        expected_partials=[],
        note="Product manager role",
    ),
    GroundTruthPair(
        ["Selenium", "Test Automation", "Java", "Maven"],
        ["Selenium", "Java", "CI/CD"],
        expected_gaps=["CI/CD"],
        expected_partials=[],
        note="QA automation role",
    ),
    GroundTruthPair(
        ["Node.js", "Express", "MongoDB"],
        ["Node.js", "GraphQL", "PostgreSQL"],
        expected_gaps=["GraphQL", "PostgreSQL"],
        expected_partials=["Express"],
        note="Backend with graph API gap",
    ),
    GroundTruthPair(
        ["Go", "Microservices", "gRPC", "Docker"],
        ["Go", "gRPC", "Kafka", "Kubernetes"],
        expected_gaps=["Kafka", "Kubernetes"],
        expected_partials=["Microservices"],
        note="Go backend engineer",
    ),
    GroundTruthPair(
        ["Machine Learning", "LLM", "RAG", "LangChain"],
        ["Machine Learning", "LLM", "Fine-tuning", "RAG"],
        expected_gaps=["Fine-tuning"],
        expected_partials=[],
        note="AI engineer LLM stack",
    ),
    GroundTruthPair(
        ["Swift", "iOS", "Xcode"],
        ["Swift", "iOS", "Combine", "Core Data"],
        expected_gaps=[],
        expected_partials=["Combine", "Core Data"],
        note="iOS developer role",
    ),
    GroundTruthPair(
        ["NLP", "Transformers", "Sentence-BERT"],
        ["Natural Language Processing", "Transformers", "Docker"],
        expected_gaps=["Docker"],
        expected_partials=[],
        note="NLP semantic synonym",
    ),
    GroundTruthPair(
        ["PyTorch", "Computer Vision", "OpenCV"],
        ["PyTorch", "Deep Learning", "Computer Vision"],
        expected_gaps=["Deep Learning"],
        expected_partials=[],
        note="CV engineer role",
    ),
    GroundTruthPair(
        ["System Design", "Python", "Distributed Systems"],
        ["System Design", "Python", "Kubernetes"],
        expected_gaps=["Kubernetes"],
        expected_partials=["Distributed Systems"],
        note="Systems engineer role",
    ),
    GroundTruthPair(
        ["Ruby", "Rails", "PostgreSQL"],
        ["Ruby on Rails", "Ruby", "Redis"],
        expected_gaps=[],
        expected_partials=["Redis"],
        note="Rails developer",
    ),
    GroundTruthPair(
        ["Machine Learning", "TensorFlow"],
        ["Machine Learning", "PyTorch"],
        expected_gaps=[],
        expected_partials=["PyTorch"],
        note="Framework-only partial",
    ),
]


def evaluate_matcher(detailed: bool = True) -> dict:
    if not sbert_model.is_available():
        logger.warning("SBERT unavailable — evaluation will run in exact-match mode")
    start = time.time()
    pair_metrics = []
    scores = []
    gap_hits = 0
    gap_total = 0
    partial_hits = 0
    partial_total = 0
    false_negatives = []
    false_positives = []

    for i, pair in enumerate(GROUND_TRUTH_PAIRS, start=1):
        result = compute_match_score(pair.resume_skills, pair.jd_skills)
        predicted_gaps = set(result["gap"])
        predicted_partials = set(result["partial"])

        gap_tp = len(predicted_gaps & pair.expected_gaps)
        gap_fp = len(predicted_gaps - pair.expected_gaps)
        gap_fn = len(pair.expected_gaps - predicted_gaps)
        gap_total += len(pair.expected_gaps)
        gap_hits += gap_tp
        for fn in pair.expected_gaps - predicted_gaps:
            false_negatives.append((i, fn, pair.note))
        for fp in predicted_gaps - pair.expected_gaps:
            false_positives.append((i, fp, pair.note, "gap"))

        partial_tp = len(predicted_partials & pair.expected_partials)
        partial_fp = len(predicted_partials - pair.expected_partials)
        partial_fn = len(pair.expected_partials - predicted_partials)
        partial_total += len(pair.expected_partials)
        partial_hits += partial_tp
        for fp in predicted_partials - pair.expected_partials:
            false_positives.append((i, fp, pair.note, "partial"))

        if detailed:
            logger.info(
                "[pair %02d] %s | score=%.1f | gaps=%s | partials=%s | expected_gaps=%s",
                i,
                pair.note,
                result["match_score"],
                sorted(predicted_gaps),
                sorted(predicted_partials),
                sorted(pair.expected_gaps),
            )
        scores.append(result["match_score"])
        pair_metrics.append({
            "pair": i,
            "note": pair.note,
            "match_score": result["match_score"],
            "method_used": result["method_used"],
            "predicted_gaps": sorted(predicted_gaps),
            "predicted_partials": sorted(predicted_partials),
            "expected_gaps": sorted(pair.expected_gaps),
            "gap_tp": gap_tp,
            "gap_fp": gap_fp,
            "gap_fn": gap_fn,
            "partial_tp": partial_tp,
            "partial_fp": partial_fp,
            "partial_fn": partial_fn,
        })

    gap_precision = gap_hits / max((gap_hits + sum(pm["gap_fp"] for pm in pair_metrics)), 1) * 100
    gap_recall = gap_hits / max(gap_total, 1) * 100
    gap_f1 = 2 * gap_precision * gap_recall / max((gap_precision + gap_recall), 1e-9)

    total_partial_fp = sum(pm["partial_fp"] for pm in pair_metrics)
    partial_precision = partial_hits / max(partial_hits + total_partial_fp, 1) * 100
    partial_recall = partial_hits / max(partial_total, 1) * 100
    partial_f1 = 2 * partial_precision * partial_recall / max((partial_precision + partial_recall), 1e-9)

    last_method = pair_metrics[-1]["method_used"] if pair_metrics else "none"

    summary = {
        "total_pairs": len(pair_metrics),
        "avg_match_score": round(sum(scores) / max(len(scores), 1), 1),
        "min_match_score": min(scores) if scores else 0,
        "max_match_score": max(scores) if scores else 0,
        "version": "v1",
        "matched_threshold": MATCH_THRESHOLD,
        "partial_threshold": PARTIAL_THRESHOLD,
        "method_used": last_method,
        "elapsed_seconds": round(time.time() - start, 2),
        "gap_precision": round(gap_precision, 1),
        "gap_recall": round(gap_recall, 1),
        "gap_f1": round(gap_f1, 2),
        "partial_precision": round(partial_precision, 1),
        "partial_recall": round(partial_recall, 1),
        "partial_f1": round(partial_f1, 2),
        "false_negatives": [list(fn) for fn in false_negatives],
        "false_positives": [list(fp) for fp in false_positives],
    }
    summary["pair_metrics"] = pair_metrics

    logger.info(
        "Evaluation: %d pairs, avg score=%.1f, gap precision=%.1f%% recall=%.1f%% F1=%.2f",
        len(pair_metrics),
        summary["avg_match_score"],
        summary["gap_precision"],
        summary["gap_recall"],
        summary["gap_f1"],
    )
    return summary


def write_evaluation_report(path: Path | None = None) -> Path:
    report_path = path or (Path("output") / "skill_matching_evaluation.json")
    report_path.parent.mkdir(parents=True, exist_ok=True)
    summary = evaluate_matcher()
    report_path.write_text(
        json.dumps(summary, indent=2, ensure_ascii=False), encoding="utf-8"
    )
    logger.info("Evaluation report written to %s", report_path)
    return report_path


def _demo():
    logger.info("=== Phase 4 Semantic Skill Matching — Self Test ===")
    logger.info("SBERT available: %s", sbert_model.is_available())
    logger.info("Exact exemplar: NLP vs Natural Language Processing -> %.3f",
                sbert_model.compute_similarity("Natural Language Processing", "NLP") if sbert_model.is_available() else 0.0)
    logger.info("Normalize: 'Natural Language Processing' -> '%s'", normalize_skill("Natural Language Processing"))

    result = compute_match_score(
        ["Python", "Machine Learning", "NLP", "Docker"],
        ["Python", "Deep Learning", "Natural Language Processing", "Kubernetes"],
    )
    logger.info("Semantic match demo: score=%.1f%% (matched=%s partial=%s gap=%s)",
                result["match_score"], result["matched"], result["partial"], result["gap"])
    for d in result["details"]:
        logger.info("  JD skill %-30s -> %-30s sim=%.2f [%s]", d["jd_skill"], d["matched_skill"], d["best_similarity"], d["status"])

    summary = evaluate_matcher(detailed=False)
    print(json.dumps({k: v for k, v in summary.items() if k != "pair_metrics"}, indent=2, ensure_ascii=False))
    logger.info("=== Self test complete ===")


if __name__ == "__main__":
    _demo()