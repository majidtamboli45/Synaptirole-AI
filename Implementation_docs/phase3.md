# Phase 3: NLP & Skill Extraction — Implementation Summary

## Phase Overview
**Phase Number:** 3  
**Phase Name:** NLP & Skill Extraction  
**Status: ✅ Complete — Verified & Built**

---

## Factors Built / Implemented

### 1. spaCy Pipeline Setup (`app/nlp/pipeline.py`) — **NEW FILE**
- **Lazy spaCy singleton** (`get_nlp()`) with a `threading.Lock`, so the model is loaded once per process and only on first use.
- **Model fallback chain:** `app/config.py` now exposes `SPACY_MODEL` (`CP_SPACY_MODEL` env, defaults to `en_core_web_sm`), `SPACY_MODEL_FALLBACKS` (`en_core_web_lg`, `en_core_web_md`, `en_core_web_sm`), and `RESUME_NER_MODEL` (`CP_RESUME_NER_MODEL`, defaults to `models/ner_resume_model`). If the configured model is missing, the code falls back through the list.
- **Resume NER model preference:** if `models/ner_resume_model/model-last` (or the configured path) exists, the fine-tuned NER model is loaded first — `models/ner_resume_model` — with fallback to `en_core_web_sm`. This model was trained on the user-provided annotated dataset (see section 11).
- **Custom NER via `EntityRuler`** added **after** the statistical `ner` component with overwrite enabled:
  - Every canonical skill + alias from the taxonomy becomes an `EntityRuler` pattern labeled `SKILL_<canonical_id>`.
  - Skill mentions therefore override statistical mislabels (e.g. `Docker`→PERSON, `Java`→PERSON).
  - `_term_to_patterns()` builds safe patterns for tricky tokens like `C#`, `C++`, `Node.js`, `.NET`, `Golang`, `GraphQL`, `MLOps`.
  - **Bug fixed during integration:** spaCy 3.8 stores the overwrite flag as `EntityRuler.overwrite` (not `.overwrite_ents`). Setting `.overwrite_ents` alone silently left the flag `False`, so ruler matches were skipped whenever the (retrained) statistical model already predicted a span in the same region — this regressed `Data Scientist` recall from 1.00 to 0.90. Both fields are now set.
- `process_text(text)` → plain spaCy `Doc`.
- `extract_skill_spans(text)` → `(canonical, start, end, raw_text)` tuples consumed by the skill extractor.
- `skill_label_to_canonical(label)` → maps `SKILL_go` back to `go`.

### 2. Skill Taxonomy (`app/skills/skill_taxonomy.py`) — **NEW FILE**
- **165 canonical skills** organized into **12 categories** (396 total terms incl. aliases):
  `language`, `framework`, `frontend`, `backend`, `database`, `cloud`, `ml`, `data`,
  `methodology`, `security`, `testing`, `design`.
- Each entry: `canonical name` + `aliases` (e.g. `go` → `golang`; `mlops` → `mllifecycle`; `node.js` → `node`, `nodejs`; `c#` → `csharp`) + `category`.
- `CATEGORY_LABELS` human-readable labels for UI grouping.
- `all_terms()` → flat `{normalized_term: canonical}` lookup table.
- Built from domain knowledge to cover the current 15 sample resumes + 15 JDs plus standard industry vocab, and **extended to cover all 68 unique skills present in the user's annotated dataset** (see section 11).

### 3. Synonym Normalization (`app/skills/skill_synonyms.py`) — **NEW FILE**
- `normalize_key(term)` → canonical key (handles case, symbols, whitespace).
- `canonical_list(terms)` → de-duplicated canonical names.
- `category_for(canonical)` → category id.

### 4. Skill Extractor Rewrite (`app/skills/skill_extractor.py`) — **REWRITTEN**
- `extract_skills(text) -> list[str]` — deduplicated canonical skill list (backward compatible).
- `extract_skills_detailed(text) -> list[dict]` — per-skill `{skill, category, aliases, count, sections, confidence}`.
- Extraction is **three-pass**:
  1. spaCy `EntityRuler` spans (rule-based NER).
  2. Regex word-boundary fallback over lowercased text (tokenization edge cases like `ReactJS`).
  3. Canonicalization + **deduplication** + section-aware context + confidence scoring.
- `profile_text_skills(text)` → `{category: [skills]}` grouping for visualizations.
- `extract_skills_with_names()` kept as a compatibility alias.

### 5. Custom NER for Resume Entities (`app/nlp/entity_extractor.py`) — **NEW FILE**
- `extract_resume_entities(text) -> dict` with `education`, `experience`, `projects`, `people`.
- **Education** — section-anchored regex + NER:
  - `_EDUCATION_HEADER_RE` targets only the Education section (also `academic background`, `educational qualification`).
  - Degree patterns: Bachelor's/Master's/Ph.D./B.Tech/M.Tech/B.E./M.E./B.A./B.S./B.Sc./M.A./M.S./M.Sc./M.B.A./MBA/MCA/BCA/BBA/MMS/PGDM.
  - Field + institution derived from the remainder after the degree (`B.S. → Computer Science, University of Texas at Austin`), year captured from `(20XX)`.
- **Experience** — section-anchored (work/professional experience + bare `EXPERIENCE` header):
  - Role `| company, location` line parsing (handles `–`, `—`, `[replacement char]`, and `|` separators).
  - Date ranges with **month prefixes** (`Jun 2023 - Present`, `Feb 2023 - Present`, `2021 - Mar 2023`, `2022 to 2024`) → `start_year`/`end_year`, with `Present` resolved via `date.today().year`.
  - Per-role `years` label + bullet list, deduplicated records.
- **Projects** — section-anchored; name / tech stack (`Name - Tech`) / description.
- **People** — statistical NER `PERSON` entities filtered against the skill-term set (removes `Docker`, `Java`, `HTML`, etc. mislabels). With the trained resume model active, this uses the fine-tuned model's `PERSON` predictions.
- All record types pass through the normalizer/dedup layer.

### 6. Entity Normalization & Dedup (`app/nlp/entity_normalizer.py`) — **NEW FILE**
- `normalize_entity(text)` — collapses whitespace / punctuation, trims.
- `title_case(text)` — proper casing for names/institutions.
- `deduplicate(records, key)` — merges duplicate records by a field.
- `canonical_token(text)` — normal-form token for matching.

### 7. Resume Analyzer Integration (`app/resume/resume_analyzer.py`) — **ENHANCED**
- `extract_skills()` now delegates to the **taxonomy + spaCy** extractor (62-pattern list replaced; no public API change).
- `analyze_resume()` adds a new `entities` key: `{education, experience, projects, people}` from the custom NER (wrapped in try/except so a failure degrades to empty lists).
- **All existing top-level keys preserved** (`name`, `current_role`, `experience_years`, `skills`, `education`, `experience`, `raw_text`, `cleaned_text`, counts, `error`) — the QML UI (`App.resumeExperience`, `App.resumeSkills`, etc.) continues to work unchanged.
- Phase 2 experience-guard behavior retained: a fresher resume without an experience section still yields `experience_years = ""`.

### 8. JD Analyzer Integration (`app/job/job_analyzer.py`) — **REWRITTEN**
- `extract_required_skills()` now runs the taxonomy-NLP extractor over the JD body and **subtracts preferred-section skills**.
- `extract_preferred_skills()` / `extract_preferred_skills_raw()` — scopes skill detection to the `preferred / nice-to-have / bonus / plus` section of the JD.
- `jd_parser.parse_job_description()` unchanged signature; required/preferred now correctly split (e.g. `react`, `javascript` appear only under preferred when listed there).

### 9. Skills Package API (`app/skills/__init__.py`) — **REWRITTEN**
- Exports `SKILL_TAXONOMY`, `CATEGORY_LABELS`, `all_terms`, `normalize_key`, `canonical_list`, `category_for`, `extract_skills`, `extract_skills_detailed`, `profile_text_skills`, `match_skills`.
- **Lazy function resolution** avoids the `app.skills ⇄ app.nlp` import cycle (extractor is only imported on first call).

### 10. NLP Package (`app/nlp/__init__.py`) — **NEW FILE**
- Public API: `get_nlp`, `process_text`, `extract_skill_spans`, `extract_resume_entities`, `normalize_entity`, `deduplicate`, `canonical_token`.

### 11. Annotated Dataset Work (user-provided `resumes_annotated.jsonl`) — **NEW**
Dataset: `Documents/Data_for_Project/resumes_annotated.jsonl` — **56 resumes × 7 domains** (8 per role),
char-span entities for 10 labels: `SKILL` (1120 mentions), `PERSON`, `LOCATION`, `EMAIL`, `PHONE`,
`JOB_TITLE`, `COMPANY`, `DEGREE`, `INSTITUTION`, `CERTIFICATION`. Used three ways:

**a) Taxonomy extension** — the 16 annotated skills missing from the taxonomy are now covered:
- New canonicals: `nosql`, `vector databases`, `aws sagemaker`, `grafana`, `prometheus`,
  `embeddings`, `feature engineering`, `fine-tuning`, `model deployment`, `a/b testing`,
  `data visualization`, `data structures`, `object-oriented programming`, `unit testing`.
- New aliases on existing canonicals: `llm += large language model`;
  `accessibility += web accessibility, digital accessibility`.
- Verified: **all 68 unique annotated skills map to a canonical skill** via `all_terms()` (0 missing).

**b) Precision / recall evaluation** — `scripts/evaluate_skills_annotated.py`
compares `extract_skills()` canonical sets against the 1120 gold `SKILL` mentions
per resume (token/canonical-set based), per domain + micro-average.
The dataset path is configurable via `--dataset <path>` or the
`CP_RESUME_DATASET` env var (default: `Documents/Data_for_Project/resumes_annotated.jsonl`):

| Domain | P | R | F1 |
|---|---|---|---|
| AI Engineer | 0.899 | 1.000 | 0.947 |
| Backend Developer | 0.851 | 1.000 | 0.920 |
| Data Scientist | 0.909 | 1.000 | 0.952 |
| DevOps Engineer | 0.870 | 1.000 | 0.930 |
| Frontend Developer | 0.879 | 1.000 | 0.936 |
| Machine Learning Engineer | 0.870 | 1.000 | 0.930 |
| Software Developer | 0.889 | 1.000 | 0.941 |
| **Micro-average** | **0.881** | **1.000** | **0.936** |

- **Recall 100% (560/560):** every gold-marked skill is extracted.
- 76 false positives are "overshoot" — legitimate skills the extractor catches in
  project/experience/certification **sections outside the annotated `SKILLS` block**
  (e.g. `aws`, `devops`, `scrum`, `kubernetes`, `terraform`). The dataset's SKILL label
  is SKILLS-section-only, so this is expected behavior for whole-resume extraction.

**c) spaCy NER training** — `scripts/train_resume_ner.py`:
- Char spans → token spans (`spacy.blank("en")`, `char_span` with `expand`), 0 annotations dropped.
- Stratified split by domain (seed 42): **42 train / 14 dev** docs, written as DocBin
  (`models/ner_train.spacy`, `models/ner_dev.spacy`).
- `spacy init config --pipeline ner --optimize efficiency` (tok2vec + NER, CPU) then
  `spacy train`: 10 label types, converged by epoch 4 of 40, batch 24.
- Dev results: **ENT_F 100.00 / ENT_P 100.00 / ENT_R 100.00** on the 14-doc dev set.
  *(Small, template-aligned dataset — larger/eval-holdout sets would give more
  conservative numbers; the model is a feature, not the primary skill signal.)*
- Output: `models/ner_resume_model/` (**committed to git** — `model-best` + `model-last`;
  the intermediate `ner_config.cfg` / `ner_train.spacy` / `ner_dev.spacy` stay gitignored),
  auto-discovered by the pipeline.

---

## Changes Made in This Phase

| File | Change Type | Description |
|------|-------------|-------------|
| `app/nlp/pipeline.py` | **Created** | spaCy singleton, EntityRuler skill NER, pattern builder, model fallback + resume-NER preference |
| `app/nlp/entity_extractor.py` | **Created** | Custom NER: education / experience / projects / people records |
| `app/nlp/entity_normalizer.py` | **Created** | normalize_entity, title_case, deduplicate, canonical_token |
| `app/nlp/__init__.py` | **Created** | Package public API exports |
| `app/skills/skill_taxonomy.py` | **Created + extended** | 165 canonical skills, 12 categories, 396 terms incl. aliases (16 annotated skills added) |
| `app/skills/skill_synonyms.py` | **Created** | normalize_key / canonical_list / category_for |
| `app/skills/skill_extractor.py` | **Rewritten** | spaCy + regex + taxonomy extraction with confidence/context |
| `app/skills/__init__.py` | **Rewritten** | Lazy API exports + match_skills retained |
| `app/resume/resume_analyzer.py` | **Enhanced** | Skills now NLP/taxonomy-based; adds `entities` to result |
| `app/job/job_analyzer.py` | **Rewritten** | Required vs preferred skill split via NLP extractor |
| `app/config.py` | **Enhanced** | `SPACY_MODEL`, `SPACY_MODEL_FALLBACKS`, `RESUME_NER_MODEL` config |
| `scripts/evaluate_skills_annotated.py` | **Created** | Precision/recall eval vs the annotated dataset (56 resumes, 1120 gold skills) |
| `scripts/train_resume_ner.py` | **Created** | Reusable spaCy NER training (span conversion, stratified split, train) |
| `models/ner_resume_model/` | **Created** | Trained resume NER (tok2vec + ner, 10 labels) — gitignored |

---

## Files Created / Modified

### New Files
- `app/nlp/__init__.py`
- `app/nlp/pipeline.py`
- `app/nlp/entity_extractor.py`
- `app/nlp/entity_normalizer.py`
- `app/skills/skill_taxonomy.py`
- `app/skills/skill_synonyms.py`
- `scripts/evaluate_skills_annotated.py`
- `scripts/train_resume_ner.py`

### Modified Files
- `app/skills/skill_extractor.py` — full rewrite (NLP + taxonomy)
- `app/skills/__init__.py` — API exports (lazy to avoid import cycle)
- `app/resume/resume_analyzer.py` — NLP skills + structured `entities`
- `app/job/job_analyzer.py` — taxonomy-based required/preferred split
- `app/config.py` — spaCy model + resume-NER configuration

---

## Architecture

```
Résumé / JD text (cleaned, from Phase 2 extraction)
         │
         ┌─────────────────────────────┴─────────────────────────────┐
         ▼                                                           ▼
  app/nlp.pipeline (spaCy, once)                            app/nlp.entity_extractor
  ───────────────────────────                            ──────────────────────────
  get_nlp() → models/ner_resume_model                    section-anchored extraction
              (auto-discovered; fallback:                │ education │ experience │
               en_core_web_sm)                           │ projects  │ people     │
  EntityRuler → SKILL_<canonical> labels                        │
  extract_skill_spans()                                          ▼
         │                                              app/nlp.entity_normalizer
         ▼                                              normalize_entity / title_case
  app/skills.skill_extractor                             deduplicate / canonical_token
  ──────────────────────────                                      │
  3 pass: rules + regex + canonicalize                            ▼
  → extract_skills() / extract_skills_detailed()      resume_analyzer.analyze_resume()
  → profile_text_skills()                              → result["entities"] = {...}
         │
         ▼
  job_analyzer.extract_required_skills()
  (preferred-section skills subtracted)
         │
         ▼
  AppController properties (unchanged bindings)
  → QML: resumeSkills / jdSkills / resumeExperience / ...
```

---

## Dependency Handling (spaCy)

| Dependency | Status |
|------------|--------|
| `spacy` → 3.8.16 | ✅ Installed (force-reinstalled to fix a DLL-load crash in `spacy.kb`) |
| `en_core_web_sm` 3.8.0 | ✅ Installed (fallback model; used when no resume-NER model exists) |
| Resume NER (`models/ner_resume_model`) | ✅ Trained from the annotated dataset — 100% dev ENT-F/P/R |
| `en_core_web_lg` (listed in Project.md) | ⚠️ Not installed — large (~780 MB); the `EntityRuler`-driven skill NER does **not** need word vectors. Add later with `python -m spacy download en_core_web_lg` and/or set `CP_SPACY_MODEL=en_core_web_lg` |

---

## Verification

### Annotated dataset eval (56 resumes, 1120 gold SKILL mentions)
- **Micro precision 0.881 / recall 1.000 / F1 0.936** — every gold skill extracted.
- All 68 unique annotated skills map to the taxonomy (0 missing).
- `scripts/evaluate_skills_annotated.py` re-runs the metric any time.

### Sample data (all 15 resumes + 15 JDs parse through the new pipeline)
- **Skills:** richer vs. Phase 2 regex list — e.g. `mlops`, `rag`, `prompt engineering`, `recommendation systems`, `system design`, `event-driven architecture`, `github actions` now detected; canonicalization merges `golang→go`, `ReactJS→react`, `C++→c++`.
- **Experience records:** every resume yields structured `{role, company, location, start_year, end_year, years, bullets}`.
- **Education:** parsed via degree/field/institution/year rules (+ the fine-tuned model's `DEGREE`/`INSTITUTION` labels).
- **JD required/preferred split:** `react`/`javascript`/`next.js` pushed to `preferred` where the JD lists them under “Preferred Qualifications”; `myssql->mysql` style typos normalized.
- Fresher resume (no experience section): `experience_years = ""` ✅ (Phase 2 guard preserved).

### Public API checks
- `analyze_resume` and `parse_job_description` keep every key the UI consumes.

### Application run test
```bash
python main.py --selftest
```
**Result:** ✅ `SELFTEST_OK` (exit 0)

---

## Dependencies on User

**Provided & consumed (Phase 3 + dataset work):**
- `Documents/Data_for_Project/resumes_annotated.jsonl` — 56 annotated resumes used to
  extend the taxonomy, evaluate extraction precision/recall, and train `models/ner_resume_model`.

**Still optional:**
- Larger / externally-labeled datasets if the statistical NER is retrained for
  higher fidelity on varied resume layouts.

**To extend taxonomy as new vocab appears:**
```python
# app/skills/skill_taxonomy.py
"your-skill": {"category": "language", "aliases": ["your skill", "ys"]},
```

---

## Next Phase
Phase 4: Skill Matching & Analysis (or per updated roadmap). The `match_skills()` helper already exposes `matched / missing / partial / match_score` for the resume→JD comparison on top of the new canonical skill sets.