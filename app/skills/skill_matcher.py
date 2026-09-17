from __future__ import annotations

import numpy as np
from app.utils import get_logger
from app.skills.synonym_map import normalize_skill, standardize_skill
from app.skills import sbert_model

logger = get_logger("skill_matcher")

MATCH_THRESHOLD = 0.8
PARTIAL_THRESHOLD = 0.5

_EMPTY = {
    "matched": [],
    "partial": [],
    "gap": [],
    "match_score": 0.0,
    "coverage": 0.0,
    "details": [],
    "exact_matched": [],
    "synonym_matched": [],
    "semantic_matched": [],
    "method_used": "none",
    "standardize_summary": {},
}


def compute_match_score(
    resume_skills: list[str],
    jd_skills: list[str],
    matched_threshold: float | None = None,
    partial_threshold: float | None = None,
) -> dict:
    """Semantic skill matching between resume skills and JD skills.

    Pipeline:
      1. Normalize every skill to a canonical form (synonyms + aliases).
      2. Encode resume + JD skill names with Sentence-BERT.
      3. Compute a cosine-similarity matrix (resume x JD).
      4. For each JD skill, find the best-matching resume skill score.
      5. Classify each JD skill as:
            Matched  -> sim >= matched_threshold  (default 0.8)
            Partial  -> sim >= partial_threshold  (default 0.5)
            Gap      -> sim <  partial_threshold
      6. match_score = fraction of JD skills that are Matched or Partial.

    Falls back to pure exact-string matching when Sentence-BERT is
    unavailable (cleanly handles offline / build-machine scenarios).
    """
    match_th = MATCH_THRESHOLD if matched_threshold is None else matched_threshold
    partial_th = PARTIAL_THRESHOLD if partial_threshold is None else partial_threshold

    jd_skills = list(dict.fromkeys(jd_skills or []))
    resume_skills = list(dict.fromkeys(resume_skills or []))

    if not jd_skills:
        _EMPTY["matched_threshold"] = match_th
        _EMPTY["partial_threshold"] = partial_th
        return dict(_EMPTY)

    normalized_jd = [normalize_skill(s) for s in jd_skills]
    normalized_resume = [normalize_skill(s) for s in resume_skills]

    standardize_jd = {s: standardize_skill(s) for s in jd_skills}

    details = []
    matched = []
    partial = []
    gap = []
    exact_matched = []
    synonym_matched = []
    semantic_matched = []
    method_used = "exact"

    resume_idx_by_canonical = {c: i for i, c in enumerate(normalized_resume)}

    if resume_skills and sbert_model.is_available():
        sim_matrix = sbert_model.compute_similarity_matrix(resume_skills, jd_skills)
        method_used = "semantic"

    for j in range(len(jd_skills)):
        std = standardize_jd[jd_skills[j]]
        canonical = std["key"]
        best_sim = -1.0
        best_idx = -1
        exact_match = False
        syn_match = False

        if canonical in resume_idx_by_canonical:
            best_idx = resume_idx_by_canonical[canonical]
            best_sim = 1.0
            exact_match = True
        else:
            if method_used == "semantic":
                sims = sim_matrix[:, j]
                idx = int(np.argmax(sims))
                best_sim = float(sims[idx])
                best_idx = idx if best_sim > 0 else -1
                if best_sim > 0:
                    syn_match = True
            else:
                best_sim = 0.0

        sim = best_sim
        resume_skill = resume_skills[best_idx] if 0 <= best_idx < len(resume_skills) else ""

        if sim >= match_th:
            status = "matched"
            matched.append(jd_skills[j])
            if exact_match:
                exact_matched.append(jd_skills[j])
            elif syn_match:
                synonym_matched.append(jd_skills[j])
            else:
                semantic_matched.append(jd_skills[j])
        elif sim >= partial_th:
            status = "partial"
            partial.append(jd_skills[j])
        else:
            status = "gap"
            gap.append(jd_skills[j])

        details.append({
            "jd_skill": jd_skills[j],
            "canonical": canonical,
            "matched_skill": resume_skill,
            "best_similarity": round(sim, 4) if sim > 0 else 0.0,
            "method": "exact" if exact_match else "semantic",
            "status": status,
            "standardize_source": std["source"],
            "standardize_canonical": std["canonical"],
            "standardize_uri": std["uri"],
            "standardize_identifier": std["identifier"],
        })

    total = len(jd_skills)
    score = (len(matched) + len(partial)) / total * 100
    coverage = len(matched) / total * 100

    standardize_summary = {"ESCO": 0, "O*NET": 0, "synonym_fallback": 0, "none": 0}
    for std in standardize_jd.values():
        source = std["source"]
        if source in standardize_summary:
            standardize_summary[source] += 1
        else:
            standardize_summary[source] = 1

    return {
        "matched": matched,
        "partial": partial,
        "gap": gap,
        "match_score": round(score, 1),
        "coverage": round(coverage, 1),
        "details": details,
        "exact_matched": exact_matched,
        "synonym_matched": synonym_matched,
        "semantic_matched": semantic_matched,
        "method_used": method_used,
        "matched_threshold": match_th,
        "partial_threshold": partial_th,
        "resume_skills_normalized": normalized_resume,
        "jd_skills_normalized": normalized_jd,
        "standardize_summary": standardize_summary,
    }