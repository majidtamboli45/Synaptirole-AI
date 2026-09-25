# Latency Issue Fix

Date: 2026-09-21
Scope: First-run Resume/JD upload latency + Skill Analysis page latency in CareerPilot AI.

---

## 1. Issues Fixed

### 1.1 Repeated full spaCy parses of the same document (upload latency)
**Symptom:** Uploading a Resume or JD took seconds to minutes. Each upload ran the
resume/JD analysis pipeline, and inside that pipeline the **same cleaned text was
passed through the full spaCy pipeline multiple times**, every time producing a brand-
new `Doc`:

- `extract_skill_spans` (`app/nlp/pipeline.py`)
- `extract_resume_entities` (`app/nlp/entity_extractor.py`)
- `extract_people` / name-NER fallback (`app/resume/resume_analyzer.py`)
- `_ner_current_role` NER fallback (`app/resume/resume_analyzer.py`)
- JD required + preferred skill extraction, repeated again by the Skill-Analysis worker

So one document caused **4–6 independent pipeline runs** before analysis even started.

### 1.2 ESCO/O*NET ontology index rebuilt from CSV every time (Skill Analysis latency)
**Symptom:** The Skill Analysis page ("Analyzing…") stalled for many seconds. The first
analysis run triggered `ontology.load_ontology()`, which parsed **~19 MB of official
O*NET CSV rows (8,753 technologies + essential/transferable/knowledge elements) and
1,016 occupations** into a fresh alias index — on **every** application launch.

### 1.3 Heavy model loads happened inline, with no warm start
**Symptom:** The spaCy resume-NER model (~12.8 s to load with the ~396-term skill ruler,
see benchmark below) and the Sentence-BERT embedding model (`all-MiniLM-L6-v2`, ~90 MB)
were loaded **for the first time exactly when the user uploaded/analysed**, blocking the
document-parsing / skill-analysis path with a long synchronous load.

---

## 2. Solutions

| # | Issue | Solution |
|---|-------|----------|
| 1.1 | Repeated spaCy parses | Content-addressed `Doc` cache inside `process_text()` — one parse per distinct document, reused by all extractors. |
| 1.2 | Ontology rebuilt each launch | Persist the built index to a pickle on disk; restore it in ~0.08 s instead of rebuilding. Invalidated automatically when source datasets change. |
| 1.3 | Inline model loads | Background daemon-thread warm-up: spaCy + ontology pre-loaded at app start; SBERT pre-loaded as soon as both documents are parsed. |

---

## 3. File Changes

### `app/nlp/pipeline.py`
- Added a thread-safe, content-addressed cache of parsed `Doc` objects
  (`_doc_cache`, hashed with `sha1` of the text, bounded to 8 docs with FIFO eviction).
- `process_text()` now returns the cached `Doc` when the same text was parsed before,
  so all extractors (skills / entities / people / role / JD preferred-skills re-run)
  share a single pipeline run per document.
- Added `clear_doc_cache()` (public, safe to call any time).
- Because the cache key is the document **content**, a cached `Doc` can never go stale
  even when a user clears and re-uploads documents.

### `app/skills/ontology.py`
- Added disk cache helpers `_save_onn_disk_cache()` / `_load_onn_disk_cache()` writing
  `data/ontology_index_cache.pkl` (pickle of the fully built alias index,
  concepts, occupation linkages and counts).
- `load_ontology()` now restores from the cache first and only rebuilds from CSV when
  the cache is missing/invalid; after a full build it persists the cache.
- Cache invalidation: `_source_signature()` fingerprints every source file
  (name + size + mtime) in `O_NET/` and `ESCO/`. Installing or updating any CSV/JSON
  dataset automatically triggers a correct rebuild. Any cache read/write failure
  degrades gracefully to the original CSV-loading behaviour.
- Imported `pickle` and `DATA_DIR` from `app.config`.

### `app/ui/app_controller.py`
- `__init__` now calls `self._start_background_warmup()` → daemon threads that
  pre-load `get_nlp()` (spaCy + resume-NER + skill ruler) and `load_ontology()`
  right after the UI starts. UI is never blocked; failures are logged.
- New `_warm_sbert()` pre-loads the Sentence-BERT model in a daemon thread and is
  invoked (`_parse_resume` / `_parse_jd`) the moment both documents are ready,
  *before* `refreshSkillAnalysis()` — hiding the model-load latency behind the parse UI.
  `sbert_model.get_model` is lock-guarded, idempotent and exception-safe, so racing
  with the analysis worker thread is harmless.

### `.gitignore`
- Added `data/ontology_index_cache.pkl` and its `.tmp` variant (generated artifact,
  rebuilt automatically on demand).

---

## 4. Measurements (Windows 11, same machine / venv)

| Operation | Before | After |
|-----------|--------|-------|
| Full resume extraction run on same text (skills/entities/people/role) | ~4 parses × `0.042 s` ≈ **0.17 s** + repeated re-parses | **0.036 s** (run 1), **0.021 s** (cached) |
| `ontology.load_ontology()` | **0.68 s** CSV parse + index build (per launch) | **0.078 s** from disk cache |
| spaCy resumed-NER model load (once per launch) | inline on first upload ≈ **12.8 s** | moved to startup background warm-up (0 s on the user path) |
| SBERT `all-MiniLM-L6-v2` load | inline on first analysis ≈ 5–15 s | pre-warmed in background when documents finish parsing |

Notes: spaCy parse costs are proportional to document size; the multi-pass collapse
shows the typical gain. First-ever run additionally pays one-time model downloads
(spaCy model / SBERT weights) which are cached on disk by the frameworks afterwards.

---

## 5. Why other features are not affected

- **Doc cache is content-addressed** — it returns the identical `spacy.Doc` the
  extractors already consumed; extraction output is byte-for-byte the same (verified).
- **Ontology cache restores the exact same in-memory structures** — a comparison of
  `standardize_skill` results, occupation lookups and concept counts (8,646 concepts)
  across a cold CSV build vs a warm cache load in the same environment returned
  **IDENTICAL** results. Cache auto-invalidates on dataset changes, so new ESCO /
  O*NET data is always picked up.
- **Warm-up is fully background and failure-tolerant** — daemon threads never touch the
  GUI; any load error is logged and the code falls straight back to the original
  lazy-load path, preserving existing behaviour (e.g. TF-IDF fallback when SBERT is
  unavailable).
- **No public API changed** — `process_text`, `extract_skill_spans`,
  `load_ontology()`, `status()`, `lookup`, `standardize_skill` and the occupation APIs
  keep their signatures and semantics.
- Regression gate: `python main.py --selftest` passes (`SELFTEST_OK`) after the change.

---

## 6. Verification performed

- `python main.py --selftest` → `SELFTEST_OK`.
- Benchmark script (parse + ontology paths) vs pre/post timings above.
- Equivalence check: cold CSV build vs disk-cache load → **IDENTICAL** ontology data.
- Functional smoke test: ontology standardization, occupation lookups, semantic skill
  matching (`compute_match_score`), skill/people/entity extraction all produce correct
  results.