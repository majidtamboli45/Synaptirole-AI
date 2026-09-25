# Phase 10: RAG — Technical Knowledge Verification — Implementation Summary

## Phase Overview
**Phase Number:** 10  
**Phase Name:** RAG — Technical Knowledge Verification  
**Assigned To:** Majid  
**Status:** ✅ Python KB Built — Retrieval Verified | ✅ Java KB Built — Retrieval Verified | ✅ C++ KB Built — Retrieval Verified | ✅ JavaScript KB Built — Retrieval Verified | ✅ SQL KB Built — Retrieval Verified | ✅ Docker KB Built — Retrieval Verified | ✅ PostgreSQL KB Built — Retrieval Verified | ✅ MongoDB KB Built — Retrieval Verified | ✅ MySQL KB Built — Retrieval Verified | ✅ Machine Learning KB Built — Retrieval Verified | ✅ Deep Learning KB Built — Retrieval Verified | ✅ NLP KB Built — Retrieval Verified | ✅ Data Science KB Built — Retrieval Verified | ✅ React KB Built — Retrieval Verified | ✅ LLM KB Built — Retrieval Verified | ✅ OOPS KB Built — Retrieval Verified | ✅ DBMS KB Built — Retrieval Verified | ✅ GCP KB Built — Retrieval Verified | ✅ Jenkins KB Built — Retrieval Verified | LLM verdict pending API key

---

## Factors Built / Implemented

### 1. Per-Skill Knowledge Base Structure (`data/knowledge_base/`)
- `data/knowledge_base/Technical_Docs/<skill>/` — source of truth (`.md` + `.pdf`), never modified by builds.
- **Python covered:** 88 GeeksforGeeks tutorial `.md` files + `Learning Python, 5th Edition.pdf` (20 MB / 1594 pages).
- **Java covered:** 136 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/Java/`, 985 KB) — **complete coverage** (all 135 sublinks on the tutorial page captured; 1 title-collision resolved via URL-hashed filename) — crawled from `https://www.geeksforgeeks.org/java/java/` with `gfg_` prefix + `/java/` path filter + `Java Language Specification (JLS).pdf` (5.08 MB, user-provided).
- **C++ covered:** 77 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/C++`, 543.2 KB) — **complete coverage** (all 76 sublinks on the tutorial page captured; 1 title-collision resolved) — crawled from `https://www.geeksforgeeks.org/cpp/c-plus-plus/` with `gfg_` prefix + `/cpp/` path filter + `The C++ Programming Language, 4th Edition (Bjarne Stroustrup).pdf` (18.76 MB, user-provided). Skill id **`cpp`** (registered in `ROLE_SKILLS` → `software_developer`).
- **JavaScript covered:** 126 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/JavaScript`, 782.7 KB) — **complete coverage** (all 125 sublinks on the tutorial page captured; 1 title-collision resolved) — crawled from `https://www.geeksforgeeks.org/javascript/javascript-tutorial/` with `gfg_` prefix + `/javascript/` path filter + `JavaScript: The Definitive Guide (2020).pdf` (17.09 MB, user-provided). Skill id **`javascript`** (already in `ROLE_SKILLS` → `frontend_developer`).
- **SQL covered:** 113 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/SQL`, 455 KB) — **complete coverage** (all 111 sublinks on the tutorial page captured; 2 title-collisions resolved) — crawled from `https://www.geeksforgeeks.org/sql/sql-tutorial/` with `gfg_` prefix + `/sql/` path filter + `Learning SQL (Alan Beaulieu).pdf` (1.81 MB, user-provided). Skill id **`sql`** (already in `ROLE_SKILLS` → `data_scientist`; matches `database` skill group).
- **Docker covered:** 36 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/Docker`, 248.8 KB) — **complete coverage** (all 36 Docker sub-article links on the tutorial page captured) — crawled from `https://www.geeksforgeeks.org/devops/docker-tutorial/` using the tutorial page's Docker sub-article links (articles span multiple GfG sections: `/devops/`, `/cloud-computing/`, `/linux-unix/`, `/software-engineering/`, `/computer-networks/`, so an explicit link-list crawl was used instead of a single path-prefix) + `Docker Deep Dive (Nigel Poulton).pdf` (14.82 MB, 419 pages, user-provided). Skill id **`docker`** (already in `ROLE_SKILLS` → `ml_engineer`, `ai_engineer`, `backend_developer`, `devops_engineer`).
- **PostgreSQL covered:** 120 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/PostgreSQL`, 359.8 KB) — **complete coverage** (all sublinks on the tutorial page captured; title collisions now resolved with URL-hashed filenames instead of being dropped) — crawled from `https://www.geeksforgeeks.org/postgresql/postgresql-tutorial/` with `gfg_` prefix + `/postgresql/` path filter + `PostgreSQL: Up and Running, 3rd Edition.pdf` (41.1 MB, user-provided). Skill id **`postgresql`** (newly registered in `ROLE_SKILLS` → `software_developer`, `backend_developer`, replacing the `database` placeholder). **Crawler fix:** GfG titles are `"PostgreSQL - Topic"` style; `_extract_title` now picks the longest title segment instead of truncating at `-`/`|`/`:` (saved files jumped 15 → 74). **Recovery pass:** added title-collision disambiguation (URL-hash suffix) — second crawl captured every distinct page (74 → 120 files).
- **MongoDB covered:** 164 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/MongoDB`, 724.2 KB) — **complete coverage** (161 distinct sublinks captured + 1 title-collision resolved; tutorial page lists 179 MongoDB articles, 161 of which are distinct pages) — crawled from `https://www.geeksforgeeks.org/mongodb/mongodb-tutorial/` with `gfg_` prefix + `/mongodb/` path filter in **two passes** (`--max-pages 100` then `--max-pages 200` into the same folder, crawler skips already-saved files) to capture the full 179-article section (161 distinct pages after title-dedup — the extra 3 files are title-collision disambiguations) + `MongoDB: The Definitive Guide.pdf` (3.89 MB, user-provided). Skill id **`mongodb`** (newly registered in `ROLE_SKILLS` → `software_developer`, `backend_developer`).
- **MySQL covered:** 99 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/MySQL`, 308.6 KB) — **complete coverage** (all sublinks on the tutorial page captured; 5 title-collisions resolved with URL-hash suffixes; **1878-byte `gfg_mysql_cursors.md` page excluded permanently** — it reliably crashes `chunk_text` with a `MemoryError` (corrupted-doc/allocator artifact, confirmed in isolation with gigs free), so the URL is now in the crawler's `POISONED_URLS` blocklist and re-crawls never recreate it) — crawled from `https://www.geeksforgeeks.org/mysql/mysql-tutorial/` with `gfg_` prefix + `/mysql/` path filter + `MySQL Cookbook, 4th Edition.pdf` (6.86 MB, user-provided). Skill id **`mysql`** (newly registered in `ROLE_SKILLS` → `software_developer`, `backend_developer`).
- `data/knowledge_base/Q&A Pairs/qa_pairs_python.jsonl` — 35 Python evaluation pairs (27 correct + 8 intentionally wrong) for Phase 10 accuracy measurement.
- `data/knowledge_base/Q&A Pairs/qa_pairs_java.jsonl` — 35 Java evaluation pairs (27 correct + 8 intentionally wrong, same format) — all verified: answers technically correct, wrong pairs are genuinely false (e.g. #8 multiple class inheritance, #15 can only implement one interface, #18 constructors have `void` return type).
- `data/knowledge_base/Q&A Pairs/qa_pairs_cpp.jsonl` — 45 C++ evaluation pairs (36 correct + 9 intentionally wrong) — all verified; wrong pairs genuinely false (e.g. #6 references can be reseated, #17 no multiple inheritance, #35 references can be NULL, #42 `std::list` has constant-time random access).
- `data/knowledge_base/Q&A Pairs/qa_pairs_javascript.jsonl` — 25 JavaScript evaluation pairs (19 correct + 6 intentionally wrong) — all verified; wrong pairs genuinely false (e.g. #5 `typeof` returns the variable name, #12 `===` coerces types, #14 objects can't store functions, #15 DOM is a database, #25 `push()` returns the array). **Note:** first drafted version had reversed ✅/❌ labels — corrected before saving.
- `data/knowledge_base/Q&A Pairs/qa_pairs_sql.jsonl` — 30 SQL evaluation pairs (20 correct + 10 intentionally wrong) — all verified; wrong pairs genuinely false (e.g. #10 multiple primary keys, #20 RIGHT JOIN like INNER, #27 indexes speed up writes, #28 normalization adds redundancy). **Note:** first drafted version had reversed ✅/❌ labels — corrected with 10 genuine false variants before saving.
- `data/knowledge_base/Q&A Pairs/qa_pairs_docker.jsonl` — 20 Docker evaluation pairs (8 correct + 12 intentionally wrong) — all verified; wrong pairs genuinely false (e.g. #12 volumes auto-delete on stop, #17 `docker rm` removes images, #19 COPY copies from the internet, #20 stopped containers can never restart). **Note:** first drafted version marked 4 technically-correct answers as Wrong (#10, #11, #15, #18) — corrected with genuinely false variants before saving.
- `data/knowledge_base/Q&A Pairs/qa_pairs_postgresql.jsonl` — 20 PostgreSQL evaluation pairs (10 correct + 10 intentionally wrong) — all verified; wrong pairs genuinely false (e.g. #11 SERIAL stores fractional decimals, #12 indexes always speed all ops, #15 VACUUM deletes the database, #17 COMMIT cancels changes, #19 PostgreSQL has no transactions).
- `data/knowledge_base/Q&A Pairs/qa_pairs_mongodb.jsonl` — 20 MongoDB evaluation pairs (10 correct + 10 intentionally wrong) — all verified; wrong pairs genuinely false (e.g. #11 MongoDB never requires `_id`, #13 `deleteMany()` deletes exactly one document, #16 `$match` deletes non-matching docs, #18 replication reduces availability, #20 sharding prevents horizontal scaling). **Note:** first drafted version marked 8 technically-correct answers as Wrong (#9–15, #18–20) — corrected with genuinely false variants before saving.
- `data/knowledge_base/Q&A Pairs/qa_pairs_mysql.jsonl` — 20 MySQL evaluation pairs (10 correct + 10 intentionally wrong) — all verified; wrong pairs genuinely false (e.g. #11 ORDER BY reorders rows on disk, #12 DISTINCT duplicates rows, #15 LEFT JOIN only matching rows, #17 COUNT() averages values, #19 indexes always speed all queries).
- **Machine Learning covered:** 324 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/Machine_Learning`, 2.37 MB) — **complete coverage**: crawled from `https://www.geeksforgeeks.org/machine-learning/machine-learning/` with `--path-prefix /machine-learning/` and **new `--max-depth 2`** (the section's 5 category hub pages — Python for ML, Algorithms, Math, Interview Questions, Projects — link to the real articles, so depth-1 alone would have stopped at 103 pages; depth-2 BFS captured the full 324-page section; title collisions disambiguated with URL-hash suffixes). Skill id **`machine_learning`** (already in `ROLE_SKILLS` → `data_scientist`, `ml_engineer`, `ai_engineer`). **PDF note:** first user-provided copy of *Hands-On ML* was a 172 MB **image-only scan** (0/851 pages extracted) — replaced by a 43.88 MB text-based copy that parsed fully.
- **Deep Learning covered:** 132 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/Deep Learning`, complete depth-2 BFS crawl from `https://www.geeksforgeeks.org/deep-learning/deep-learning-tutorial/` with `--path-prefix /deep-learning/`) + `Deep Learning (Ian Goodfellow et al.).pdf` (20.08 MB uncompressed / 801 pages / user-provided, parsed 1,779,420 chars). Depth-2 captured the full `/deep-learning/` section (TensorFlow + PyTorch + Keras sub-content pulled in automatically — this is why TF/PyTorch do **not** get their own KB, per design decision). Skill id **`deep_learning`** (newly registered → `data_scientist`, `ml_engineer`, `ai_engineer`). 3 poisonous pages found during chunk sanity (`understanding-gradient-clipping`, `sentiment-classification-using-bert`, `text-preprocessing-for-nlp-tasks`) — removed and blocklisted in `POISONED_URLS`.
- **NLP covered:** 96 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/NLP`, complete depth-2 BFS crawl from `https://www.geeksforgeeks.org/nlp/natural-language-processing-nlp-tutorial/` with `--path-prefix /nlp/`) + `NLP.pdf` (26.5 MB / 646 pages / user-provided, parsed 1,864,094 chars). Skill id **`nlp`** (already in `ROLE_SKILLS` → `ai_engineer`). 2 poisonous pages found during chunk sanity (`sentiment-classification-using-bert`, `text-preprocessing-for-nlp-tasks`) — removed and blocklisted in `POISONED_URLS`.
- **Data Science covered:** 75 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/Data Science`, complete depth-2 BFS crawl from `https://www.geeksforgeeks.org/data-science/data-science-for-beginners/` with `--path-prefix /data-science/`) + **two** user-provided PDFs: `Data Science.pdf` (13.3 MB / 441 pages / parsed 985,314 chars) and `Python-for-Data-Analysis.pdf` (9.4 MB / 582 pages / parsed 947,525 chars). Skill id **`data_science`** (newly registered → `data_scientist`). No poisonous pages.
- **React covered:** 362 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/React`, complete depth-2 BFS crawl from `https://www.geeksforgeeks.org/reactjs/react/` with `--path-prefix /reactjs/`) + `Learning React - Modern Patterns for Developing React Apps (Alex Banks, Eve Porcello).pdf` (310 pages / parsed 523,907 chars, user-provided). Skill id **`react`** (already in `ROLE_SKILLS` → `frontend_developer`). 1 poisonous page found during chunk sanity (`job-board-using-react`) — removed and blocklisted in `POISONED_URLS`.
- **LLM covered:** 127 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/LLM`, 15.8 MB incl. book) — **curated keyword crawl** from `https://www.geeksforgeeks.org/deep-learning/large-language-model-llm-tutorial/` (filter keeps only LLM/AI-relevant article URLs; recovered links span `/artificial-intelligence/`, `/deep-learning/`, `/nlp/`, `/machine-learning/`, `/data-science/` — 127 files after the final scoped pass) + `Build-a-large-language-models.pdf` (14.72 MB, 299 pages / parsed 571,211 chars, user-provided). Skill id **`llm`** (already in `ROLE_SKILLS` → `ai_engineer`). No poisonous pages.
- **OOPS covered:** 31 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/OOPS`, 291 KB) — **explicit curated link-list crawl** of GfG OOPs articles spanning multiple sections (`/cpp/`, `/java/`, `/python/`, `/system-design/`, `/interview-prep/`, `/software-engineering/`), captured per-URL with `follow_children=False` (same pattern as Docker/GCP/Jenkins) + `OOP_10122018.pdf` (2.12 MB, 93 pages / parsed 116,803 chars, user-provided). Skill id **`oops`** (newly registered in `ROLE_SKILLS` → `software_developer`, `backend_developer`). No poisonous pages.
- **DBMS covered:** 87 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/DBMS`, 537 KB) — **complete coverage** crawled from `https://www.geeksforgeeks.org/dbms/dbms/` (`--name-prefix gfg --path-prefix /dbms/`) + `Abraham Silberschatz — Database System Concepts, 7th Ed..pdf` (15.53 MB, 1373 pages / parsed 3,296,972 chars, user-provided). Skill id **`dbms`** (newly registered in `ROLE_SKILLS` → `software_developer`, `backend_developer`). No poisonous pages.
- **GCP covered:** 54 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/GCP`, 426 KB) — **explicit curated link-list crawl** from `https://www.geeksforgeeks.org/devops/google-cloud-platform-tutorial/` (curated 54 GCP-specific links from 75 visible child links; 21 generic hub articles — AWS/Docker/Azure/Terraform/K8s/CI-CD — excluded, they belong to their own skills) + `Data Engineering With Google Cloud Platform (Adi Widjaja).pdf` (8.89 MB, 440 pages / parsed 654,733 chars, user-provided). Skill id **`gcp`** (newly registered in `ROLE_SKILLS` → `devops_engineer`). No poisonous pages.
- **Jenkins covered:** 46 GeeksforGeeks tutorial `.md` files (`data/knowledge_base/Technical_Docs/Jenkins`, 240.7 KB) — **explicit curated link-list crawl** from `https://www.geeksforgeeks.org/devops/jenkins-tutorial/` (71 child links filtered to 46 Jenkins-specific articles; URLs span `/devops/`, `/git/`, `/installation-guide/`) + `jenkins2_upandrunning.pdf` (30.76 MB, 604 pages / parsed 894,759 chars, user-provided). Skill id **`jenkins`** (newly registered in `ROLE_SKILLS` → `devops_engineer`). No poisonous pages.
- `data/knowledge_base/Q&A Pairs/qa_pairs_machine_learning.jsonl` — **80 ML evaluation pairs (60 correct + 20 intentionally wrong, authored by Majid)** — all verified; wrong pairs are genuinely false (e.g. #4 RL = labeled error-minimization, #17 underfitting = memorization, #33 multiclass = multi-label, #43 decision trees require normal distribution, #47 KNN is unsupervised, #66 K-Means finds global optimum in one pass, #79 MDP is supervised).
- `data/knowledge_base/Q&A Pairs/qa_pairs_deep_learning.jsonl` — 40 Deep Learning evaluation pairs (30 correct + 10 intentionally wrong, authored by Majid) — all verified; wrong pairs genuinely false (e.g. #4 weights are fixed, #8 sigmoid range −1..1, #13 gradient descent increases loss, #21 CNNs only for tabular data, #26 RNNs retain no state, #28 LSTM is a CNN, #33 GAN has no generator, #40 dropout removes neurons permanently).
- `data/knowledge_base/Q&A Pairs/qa_pairs_nlp.jsonl` — 50 NLP evaluation pairs (40 correct + 10 intentionally wrong, authored by Majid) — all verified; wrong pairs genuinely false (e.g. #41 tokenization = vector-to-text, #43 TF-IDF boosts common words, #44 embeddings = one-hot, #47 sentiment = translation, #48 Transformer is recurrent, #49 BERT = BoW, #50 fine-tuning = from scratch).
- `data/knowledge_base/Q&A Pairs/qa_pairs_data_science.jsonl` — 75 Data Science evaluation pairs (56 correct + 19 intentionally wrong, authored by Majid) — all verified; wrong pairs genuinely false (e.g. #57 data cleaning = delete dataset, #63 NumPy = database, #64 Pandas = DL framework, #66 groupby deletes rows, #69 one-hot = mean imputation, #70 train-test same data, #72 outlier always removed, #75 small p-value proves null).
- `data/knowledge_base/Q&A Pairs/qa_pairs_react.jsonl` — 35 React evaluation pairs (26 correct + 9 intentionally wrong, authored by Majid) — all verified; wrong pairs genuinely false (e.g. #27 React = database, #28 props mutable, #29 useState = HTTP only, #31 Virtual DOM = real DOM, #32/33 useMemo/useCallback swapped, #34 hooks callable anywhere, #35 keys = CSS).
- `data/knowledge_base/Q&A Pairs/qa_pairs_llm.jsonl` — 25 LLM evaluation pairs (19 correct + 6 intentionally wrong, authored by Majid) — all verified; wrong pairs genuinely false (e.g. attention = word frequency, tokenization = BoW, LLM = rule-based, vectors = weights-squashing).
- `data/knowledge_base/Q&A Pairs/qa_pairs_oops.jsonl` — 45 OOPS evaluation pairs (34 correct + 11 intentionally wrong, authored by Majid) — all verified; wrong pairs genuinely false (e.g. encapsulation = public fields, polymorphism = single type, abstract = instantiable, diamond = leaf class).
- `data/knowledge_base/Q&A Pairs/qa_pairs_dbms.jsonl` — 45 DBMS evaluation pairs (34 correct + 11 intentionally wrong, authored by Majid) — all verified; wrong pairs genuinely false (e.g. ACID = no constraints, primary key = nullable, normalization = redundancy, index = no writes).
- `data/knowledge_base/Q&A Pairs/qa_pairs_gcp.jsonl` — 25 GCP evaluation pairs (20 correct + 5 intentionally wrong, authored by Majid) — all verified; wrong pairs genuinely false (e.g. BigQuery = row-level OLTP, Dataflow = no ETL, partitioning = no query pruning).
- `data/knowledge_base/Q&A Pairs/qa_pairs_jenkins.jsonl` — 25 Jenkins evaluation pairs (19 correct + 6 intentionally wrong, authored by Majid) — all verified; wrong pairs genuinely false (e.g. pipeline = GUI only, Jenkinsfile = YAML, credentials = plaintext, agent = always master).

### 2. Web Crawler (`scripts/crawl_docs_to_md.py`) — **NEW FILE**
- Converts tutorial/website pages into clean `.md` with `# Title` + `> Source: <url>` headers.
- Recursive child-link following with domain/path prefix filtering, polite rate limiting, deduplication.
- HTML entity unescaping + `.md`/`.pdf` parity for mixed corpora.
- **Bugs fixed during integration:**
  - `&#8212;` entity-encoded em-dash in `<title>` broke filename generation → `html.unescape()`.
  - Links with in-page `#anchor` fragments were being skipped → strip fragment, keep page.
  - docs.python.org pages serve UTF-8 without declaring a charset → decode `resp.content.decode("utf-8")`.
  - Strips Sphinx `¶` anchors, non-breaking spaces, mojibake artifacts.
- **Complete-coverage upgrade:** `--max-pages` no longer silently drops links — re-crawls with a high cap (300) plus three new safeguards capture **every** distinct sublink:
  - `_dedupe_file()` — if a title-derived filename already exists for a *different* URL, writes a URL-hash-suffixed variant instead of dropping the page (fixes GfG title collisions that previously lost PostgreSQL copies, e.g. `gfg_postgresql_c480b2.md`).
  - `_index_saved_urls()` — pre-scans saved `> Source:` headers so an already-saved URL is skipped *without* re-fetching page content (fast idempotent re-crawls).
  - `POISONED_URLS` blocklist — permanently excludes known-crashing pages (the MySQL `cursors` page that `MemoryError`s in `chunk_text`), added at crawl time so a poisoned page can never be (re)written to disk.

### 3. Config additions (`app/config.py`) — **ENHANCED**
- `RAG_INDEX_ROOT = DATA_DIR / "rag" / "indexes"` — per-skill index storage.
- `RAG_CHUNK_SIZE` (600) / `RAG_CHUNK_OVERLAP` (100) / `RAG_TOP_K` (3) — env-configurable via `CP_RAG_*`.
- `ROLE_SKILLS` — role → list of skill index names (current, final):
  - `software_developer` → python, java, cpp, oops, dbms, dsa, mysql, nodejs, spring, fastapi, django, git, github_actions, system_design
  - `data_scientist` → python, statistics, machine_learning, deep_learning, data_science, sql
  - `ml_engineer` → python, machine_learning, deep_learning, mlops, docker, git
  - `ai_engineer` → python, nlp, llm, machine_learning, deep_learning, docker, git
  - `frontend_developer` → javascript, react, html_css, git
  - `backend_developer` → java, python, mysql, dbms, docker, oops, nodejs, spring, fastapi, django, git, system_design
  - `devops_engineer` → docker, kubernetes, terraform, linux, ci_cd, aws, gcp, jenkins, git, github_actions

### 4. Document Loader (`app/rag/document_loader.py`) — **REWRITTEN**
- `chunk_text(text, chunk_size, overlap)` — overlapping chunks (default 600/100) with sentence/newline boundary backoff so passages are not split mid-sentence.
- `load_knowledge_base(folder, topic)` — loads docs, chunks, and tags each chunk with `topic` (skill) and `kind` (`book` for PDFs, `tutorial` for `.md`).

### 5. Per-Skill Vector Store (`app/rag/vector_database.py`) — **REWRITTEN**
- Replaces the single global index with per-skill dicts keyed by skill name.
- `build_index(skill, documents, embeddings)` — builds FAISS `IndexFlatL2`, persists `index.faiss` **and** `index.meta.json` (chunk text + source + topic + kind sidecar) under `data/rag/indexes/<skill>/`.
- `load_index(skill)` — lazy load with metadata sidecar, so retrieval works after restart (fixes old behavior where index restored without document metadata).
- `search(skill, query_embedding, top_k)` — per-skill search returning chunks with `distance`.

### 6. Skill-Aware Retriever (`app/rag/retriever.py`) — **REWRITTEN**
- `retrieve_context(query, skills=None, top_k=3)` — embeds the query once, searches each skill index, merges + sorts by distance, returns nearest chunks. Defaults to `["python"]`.

### 7. Role-Aware Knowledge Verifier (`app/rag/knowledge_verifier.py`) — **REWRITTEN**
- `verify_answer(question, answer, role=None, expected_skills=None)`:
  - Resolves skills from `ROLE_SKILLS` (plus optional `expected_skills` override).
  - Retrieves evidence from the relevant skill indexes only.
  - Prompts the LLM (`temperature=0.2`) for structured JSON: `is_correct`, `confidence`, `verified_concepts`, `missing_concepts`, `feedback`.
  - **No-evidence branch** — returns `is_correct=False, confidence=0.0` with a clear message instead of hallucinating.
  - Attaches `sources` (evidence trail) to the result for citations.
  - Graceful JSON-parse fallback so an LLM hiccup never crashes the call.

### 8. Index Build Tool (`scripts/build_rag_index.py`) — **NEW FILE**
- One-shot pipeline per skill: `load_documents → chunk → embed (all-MiniLM-L6-v2) → build_index`.
- Entry point: `python scripts/build_rag_index.py <skill> [--folder <path>]`.
- Idempotent per-skill: rebuilding one skill never touches other skills' indexes.

### 9. Python Index Built & Persisted (`data/rag/indexes/python/`)
- 89 documents → **8,827 chunks** (7,774 book + 1,053 tutorial).
- `index.faiss` (12.9 MB) + `index.meta.json` (6.6 MB).
- Retrieval smoke-tested against 3 sample questions — relevant evidence surfaces in top-3.

### 10. Java Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/Java/` → `data/rag/indexes/java/`)
- 136 GfG tutorial `.md` files downloaded from `https://www.geeksforgeeks.org/java/java/` using the same crawler args as Python (`--name-prefix gfg --path-prefix /java/`).
- **Complete coverage:** all 135 sublinks on the tutorial page captured (1 title-collision disambiguated to `gfg_*.md` with URL-hash suffix) — up from the original 100-file `--max-pages 100` crawl.
- Each file follows the Python convention: `# Title` + `> Source: <url>` header, full detail body.
- Coverage includes: identifiers/keywords, data types, OOP (classes, inheritance, interfaces, generics), collections, strings vs StringBuilder/Buffer, exception handling, regex, JVM memory & garbage collection, multithreading, Java 8 lambdas/Streams/Optional/Collectors, file I/O, and mini-projects (e.g. Tic-Tac-Toe).
- User added `Java Language Specification (JLS).pdf` (5.08 MB) → built via `python scripts/build_rag_index.py java`.
- **Result:** 137 documents → **5,703 chunks** → `data/rag/indexes/java/`.
- Retrieval smoke-tested — evidence surfaces correctly (e.g. `==` vs `equals()` → matching GfG article; exceptions → `gfg_java_exception_handling.md` + JLS book).

### 11. C++ Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/C++` → `data/rag/indexes/cpp/`)
- 77 GfG tutorial `.md` files downloaded from `https://www.geeksforgeeks.org/cpp/c-plus-plus/` (`--name-prefix gfg --path-prefix /cpp/`).
- **Complete coverage:** all 76 sublinks on the tutorial page captured (1 title-collision disambiguated).
- Coverage: data types, OOP (classes/objects, abstraction, encapsulation, constructors, unions), STL (containers + algorithm library), pointers/references, smart pointers, memory, I/O & file handling, multithreading (threads, mutex), exceptions, recursion, preprocessor/macros, DSA.
- User added `The C++ Programming Language, 4th Edition (Bjarne Stroustrup).pdf` (18.76 MB) → built via `python scripts/build_rag_index.py cpp --folder data/knowledge_base/Technical_Docs/C++`.
- **Result:** 78 documents → **6,938 chunks** → `data/rag/indexes/cpp/`.
- Retrieval smoke-tested — evidence surfaces correctly (smart pointers, refs vs pointers, exceptions, STL containers all hit the right GfG articles).

### 12. JavaScript Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/JavaScript` → `data/rag/indexes/javascript/`)
- 126 GfG tutorial `.md` files downloaded from `https://www.geeksforgeeks.org/javascript/javascript-tutorial/` (`--name-prefix gfg --path-prefix /javascript/`).
- **Complete coverage:** all 125 sublinks on the tutorial page captured (1 title-collision disambiguated) — up from the original 100-file crawl.
- Coverage: syntax, variables (var/let/const), data types, functions & closures, classes/objects, prototype, async (promises, async/await), DOM manipulation, events & delegation, JSON parsing, form/email validation, regex, web APIs, mini-projects (quiz app, expense tracker, palindrome checker), Jest testing.
- User added `JavaScript: The Definitive Guide (2020).pdf` (17.09 MB) → built via `python scripts/build_rag_index.py javascript` (skill id already in `ROLE_SKILLS.frontend_developer`).
- **Result:** 127 documents → **5,226 chunks** → `data/rag/indexes/javascript/`.
- Retrieval smoke-tested — evidence surfaces correctly (closures, var/let/const, promises, event delegation hit book + the right GfG articles).

### 13. SQL Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/SQL` → `data/rag/indexes/sql/`)
- 113 GfG tutorial `.md` files downloaded from `https://www.geeksforgeeks.org/sql/sql-tutorial/` (`--name-prefix gfg --path-prefix /sql/`).
- **Complete coverage:** all 111 sublinks on the tutorial page captured (2 title-collisions disambiguated) — up from the original 100-file crawl.
- Coverage: DML/DQL (SELECT/INSERT/UPDATE/DELETE), clauses (WHERE, ORDER BY, GROUP BY, HAVING), joins (inner/left/right/full/self + UPDATE/DELETE joins), subqueries & correlated queries, views, keys & constraints, aggregate functions, ER diagrams, indexes.
- User added `Learning SQL (Alan Beaulieu).pdf` (1.81 MB) → built via `python scripts/build_rag_index.py sql` (skill id already in `ROLE_SKILLS.data_scientist`).
- **Result:** 114 documents → **2,489 chunks** → `data/rag/indexes/sql/`.
- Retrieval smoke-tested — evidence surfaces correctly (inner vs left join, subqueries, GROUP BY, primary keys hit the right GfG articles / book).

### 14. Docker Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/Docker` → `data/rag/indexes/docker/`)
- 36 GfG tutorial `.md` files downloaded from `https://www.geeksforgeeks.org/devops/docker-tutorial/` (all 36 Docker sub-article links on the tutorial page captured; articles span `/devops/`, `/cloud-computing/`, `/linux-unix/`, `/software-engineering/`, `/computer-networks/` — crawled via explicit link list, not a single path-prefix).
- Coverage: architecture, images vs containers, Dockerfile (syntax, instructions, best practices), registry/Hub (pull/push/private registries/public repos), networking (bridge, default bridge, multi-container same network, managing ports), volumes & bind mounts (mount, share data, CLI management, backup), docker compose, Swarm (scalable cluster), security best practices & tools, image optimization, CLI, installing Docker on Ubuntu, web-server Dockerfile.
- **Pre-build safety pass:** all 37 docs chunk-tested per file — **no poisoned documents** (fix from the MySQL `cursors` issue: a per-file chunk check now runs before embedding).
- User added `Docker Deep Dive (Nigel Poulton).pdf` (14.82 MB, 419 pages) → built via `python scripts/build_rag_index.py docker` (skill id already in `ROLE_SKILLS` → `ml_engineer`, `ai_engineer`, `backend_developer`, `devops_engineer`).
- **Result:** 37 documents → **1,703 chunks** → `data/rag/indexes/docker/`.
- Retrieval smoke-tested — evidence surfaces correctly (volume mounting, image vs container, Swarm nodes hit the right GfG articles / book).

### 15. PostgreSQL Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/PostgreSQL` → `data/rag/indexes/postgresql/`)
- 120 GfG tutorial `.md` files downloaded from `https://www.geeksforgeeks.org/postgresql/postgresql-tutorial/` (`--name-prefix gfg --path-prefix /postgresql/`).
- **Complete coverage:** every distinct sublink on the tutorial page captured. Title collisions that previously collapsed to a single `gfg_postgresql.md` are now disambiguated with URL-hash suffixes (e.g. `gfg_postgresql_c480b2.md`), so no distinct page is dropped. 74 → 120 files.
- Coverage: installs (Linux/Mac/Windows), data types (JSON/JSONB, numeric, boolean, char, date/time), DML (INSERT/UPDATE/DELETE/UPSERT), joins (left/full/self), CTEs, window functions, transactions, triggers, PL/pgSQL (blocks, loops, if/case, functions, stored procedures, overloading), indexes (create/list/multicolumn/unique), constraints, roles & permissions (grant/revoke/create role), operators, cheat sheet, exercises, Q&A.
- **Crawler title fix note:** GfG PostgreSQL titles use `"PostgreSQL - Topic"` format; `_extract_title` was truncating at the first `-`/`|`/`:`, collapsing most pages to `gfg_postgresql.md` (only 15 saved). Patched to pick the longest title segment → 74 files saved.
- **Pre-build safety pass:** 0 poisoned documents.
- User added `PostgreSQL: Up and Running, 3rd Edition.pdf` (41.1 MB) → built via `python scripts/build_rag_index.py postgresql` (skill id **`postgresql`** newly registered in `ROLE_SKILLS.software_developer` + `backend_developer`, replacing the `database` placeholder).
- **Result:** 121 documents → **2,047 chunks** → `data/rag/indexes/postgresql/`.
- Retrieval smoke-tested — evidence surfaces correctly (CTE, JSONB data type, UPSERT hit the right GfG articles / book).

### 16. MongoDB Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/MongoDB` → `data/rag/indexes/mongodb/`)
- 164 GfG tutorial `.md` files downloaded from `https://www.geeksforgeeks.org/mongodb/mongodb-tutorial/` (`--name-prefix gfg --path-prefix /mongodb/`) — full section capture in **two passes**: the tutorial links to 179 MongoDB articles, so run #1 (`--max-pages 100`) saved 100 and run #2 (`--max-pages 200` into the same folder) saved 62 more → **161 distinct pages**; re-crawl with collision disambiguation recovered 3 more → **164 files** (remaining links are URL duplicates).
- Coverage: databases/collections (create/drop/rename), documents CRUD (insert/find/update/delete), query operators ($eq/$ne/$gt/$in/etc., comparison & logical), aggregation commands & pipeline, indexes (create/drop/multicolumn), data types (ObjectId/BSON), replication (replica set members/deployment), sharding, security (authentication, RBAC, access control), import/export, administration, exercises + Q&A + quiz.
- **Pre-build safety pass:** 0 poisoned documents.
- User added `MongoDB: The Definitive Guide.pdf` (3.89 MB) → built via `python scripts/build_rag_index.py mongodb` (skill id **`mongodb`** newly registered in `ROLE_SKILLS.software_developer` + `backend_developer`).
- **Result:** 165 documents → **2,445 chunks** → `data/rag/indexes/mongodb/`.
- Retrieval smoke-tested — evidence surfaces correctly (aggregation pipeline, replica sets, create index hit the right GfG articles / book).

### 17. MySQL Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/MySQL` → `data/rag/indexes/mysql/`)
- 99 GfG tutorial `.md` files downloaded from `https://www.geeksforgeeks.org/mysql/mysql-tutorial/` (`--name-prefix gfg --path-prefix /mysql/`) — **complete coverage**: all sublinks captured (5 title-collisions disambiguated with URL-hash suffixes). The poisoned `gfg_mysql_cursors.md` page is **permanently excluded** — its URL is in the crawler `POISONED_URLS` blocklist, so it is never written to disk again.
- Coverage: DML (INSERT/UPDATE/DELETE), SELECT & clauses (WHERE/ORDER BY/GROUP BY/HAVING), joins (inner/left/right/full/outer/cross + UPDATE join), subqueries, aggregate/math/JSON/date functions, window functions, transactions (ACID/InnoDB), stored procedures & cursors, triggers, views, indexes (create/drop/list), constraints (primary/foreign/check/composite/unique), locking & backup, user management, SQL injection, common queries.
- **Pre-build safety pass:** `gfg_mysql_cursors.md` still MemoryErrors `chunk_text` in isolation → now blocked at crawl time; 0 failures remain in the corpus.
- User added `MySQL Cookbook, 4th Edition.pdf` (6.86 MB) → built via `python scripts/build_rag_index.py mysql` (skill id **`mysql`** newly registered in `ROLE_SKILLS.software_developer` + `backend_developer`).
- **Result:** 100 documents → **4,752 chunks** → `data/rag/indexes/mysql/`.
- Retrieval smoke-tested — evidence surfaces correctly (joins, stored procedures, InnoDB transactions hit the right GfG articles / book).

### 18. Machine Learning Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/Machine_Learning` → `data/rag/indexes/machine_learning/`)
- 324 GfG tutorial `.md` files downloaded from `https://www.geeksforgeeks.org/machine-learning/machine-learning/` (`--name-prefix gfg --path-prefix /machine-learning/ --max-pages 400 --max-depth 2`).
- **Complete coverage via depth-2 BFS:** the tutorial page lists 103 links, but 5 of them are category hubs (`python-for-machine-learning`, `machine-learning-algorithms`, `machine-learning-mathematics`, `machine-learning-interview-questions`, `machine-learning-projects`) whose children are the real articles — depth-1 only saves 103 pages; depth-2 recursion walked the hubs and captured the **full 324-page section** (title collisions resolved with URL-hash suffixes).
- Coverage: intro/types/applications, Python for ML & scikit-learn, math for ML (linear algebra, calculus, probability), feature engineering/scaling/selection/extraction, supervised learning (linear/logistic regression, decision trees, random forest, KNN, SVM, naive Bayes), ensembles (bagging/boosting/AdaBoost/XGBoost/LightGBM/CatBoost), unsupervised (K-Means, hierarchical, DBSCAN, fuzzy/spectral clustering, association rules Apriori/FP-Growth/ECLAT), dimensionality reduction (PCA, LDA, t-SNE, LLE, NMF, ICA, Isomap), evaluation metrics (confusion matrix, precision/recall, F1, AUC-ROC), bias-variance & regularization, cross-validation/hyperparameter tuning, reinforcement learning (MDPs, Q-learning, SARSA, policy gradients, A3C, PPO), time series (ARIMA/SARIMA, seasonality, prophet), deployment/MLOps (Flask, FastAPI, Streamlit, Gradio, CI/CD), interview questions & projects.
- **Pre-build safety pass:** all 324 tutorial files chunk-tested — **no poisoned documents**; PDF parsed cleanly (1,069,858 chars / 570 pages).
- User added `Hands-On Machine Learning with Scikit-Learn and TensorFlow.pdf` (43.88 MB — replaced after the 172 MB scanned copy extracted 0 chars) → built via `python scripts/build_rag_index.py machine_learning`.
- **Result:** 325 documents → **7,590 chunks** → `data/rag/indexes/machine_learning/`. Chunk split: book **2,288** / tutorial **5,302**.
- Retrieval smoke-tested — evidence surfaces correctly (supervised vs unsupervised, gradient descent, random forest, overfitting, Q-learning, SVM hit the right GfG articles / book).

### 19. LLM Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/LLM` → `data/rag/indexes/llm/`)
- 127 GfG tutorial `.md` files — curated keyword crawl from `https://www.geeksforgeeks.org/deep-learning/large-language-model-llm-tutorial/`; filter keeps only LLM/AI-relevant URLs, spanning `/artificial-intelligence/`, `/deep-learning/`, `/nlp/`, `/machine-learning/`, `/data-science/`.
- **Pre-build safety pass:** all 128 docs chunk-tested — **no poisoned documents**; PDF parsed cleanly (571,211 chars / 299 pages).
- User added `Build-a-large-language-models.pdf` (14.72 MB, 299 pages) → built via `python scripts/build_rag_index.py llm` (skill id **`llm`** already in `ROLE_SKILLS.ai_engineer`).
- **Result:** 128 documents → **3,620 chunks** → `data/rag/indexes/llm/`. Chunk split: book **1,214** / tutorial **2,406**.
- Retrieval smoke-tested — evidence surfaces correctly (transformer, self-attention, fine-tuning hit `gfg_transformers_in_machine_learning.md`, `gfg_how_do_self_attention_masks_work.md`, `gfg_fine_tuning_large_model_llm.md` + book).

### 20. OOPS Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/OOPS` → `data/rag/indexes/oops/`)
- 31 GfG tutorial `.md` files — explicit curated link-list crawl of GfG OOPs articles spanning `/cpp/`, `/java/`, `/python/`, `/system-design/`, `/interview-prep/`, `/software-engineering/` (per-URL `follow_children=False`).
- **Pre-build safety pass:** all 32 docs chunk-tested — **no poisoned documents**; PDF parsed cleanly (116,803 chars / 93 pages).
- User added `OOP_10122018.pdf` (2.12 MB, 93 pages) → built via `python scripts/build_rag_index.py oops` (skill id **`oops`** newly registered in `ROLE_SKILLS.software_developer` + `backend_developer`).
- **Result:** 32 documents → **880 chunks** → `data/rag/indexes/oops/`. Chunk split: book **245** / tutorial **635**.
- Retrieval smoke-tested — evidence surfaces correctly (encapsulation, constructor, inheritance, polymorphism, SOLID hit `gfg_oop_concepts.md`, `gfg_oop_questions_and_answers.md`, `gfg_java_oop_object_oriented_concepts.md`).

### 21. DBMS Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/DBMS` → `data/rag/indexes/dbms/`)
- 87 GfG tutorial `.md` files downloaded from `https://www.geeksforgeeks.org/dbms/dbms/` (`--name-prefix gfg --path-prefix /dbms/`) — complete section capture.
- Coverage: DBMS intro/architecture, ER & relational model, keys (primary/foreign/candidate/super), relational algebra, SQL DDL/DML, normalization (1NF-5NF, BCNF, denormalization), transactions & ACID, concurrency control, indexing (B/B+ trees), hashing, deadlocks, crash recovery, distributed DBMS, interview questions.
- **Pre-build safety pass:** all 88 docs chunk-tested — **no poisoned documents**; book parsed cleanly (3,296,972 chars / 1373 pages).
- User added `Database System Concepts (Silberschatz, Korth, Sudarshan).pdf` (15.53 MB, 1373 pages) → built via `python scripts/build_rag_index.py dbms` (skill id **`dbms`** newly registered in `ROLE_SKILLS.software_developer` + `backend_developer`).
- **Result:** 88 documents → **8,271 chunks** → `data/rag/indexes/dbms/`. Chunk split: book **7,049** / tutorial **1,222**.
- Retrieval smoke-tested — evidence surfaces correctly (ACID, primary key, normalization, transactions, indexes hit `gfg_acid_properties_in_dbms.md`, `gfg_keys_in_relational_model.md`, `gfg_to_database_normalization.md`).

### 22. GCP Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/GCP` → `data/rag/indexes/gcp/`)
- 54 GfG tutorial `.md` files — explicit curated link-list crawl from `https://www.geeksforgeeks.org/devops/google-cloud-platform-tutorial/` (54 GCP-specific links curated from 75 visible child links; 21 generic hub articles for AWS/Docker/Azure/Terraform/K8s/CI-CD excluded — each belongs to its own skill).
- Coverage: GCP overview/setup, compute (Compute Engine, VMs, autoscaling), storage (Cloud Storage, Cloud SQL, Cloud Spanner, Cloud Bigtable), data & analytics (BigQuery, Dataflow, Dataproc, Pub/Sub, Cloud Dataprep, Looker, real-time ingestion), networking (VPC, load balancing, DNS), IAM/security (identity, KMS, security best practices), DevOps (Cloud Build, deployment), pricing/regions, interview questions.
- **Pre-build safety pass:** all 55 docs chunk-tested — **no poisoned documents**; PDF parsed cleanly (654,733 chars / 440 pages). Safety flags (storage/security tables, code) verified as artifacts, not poison.
- User added `Data Engineering With Google Cloud Platform (Adi Widjaja).pdf` (8.89 MB, 440 pages) → built via `python scripts/build_rag_index.py gcp` (skill id **`gcp`** newly registered in `ROLE_SKILLS.devops_engineer`).
- **Result:** 55 documents → **2,477 chunks** → `data/rag/indexes/gcp/`. Chunk split: book **1,397** / tutorial **1,080**.
- Retrieval smoke-tested — evidence surfaces correctly (BigQuery, Dataflow/partitioning, partitioning, Cloud Storage hit `gfg_to_bigquery.md`, `gfg_building_data_pipelines_with_google_cloud_dataflow_etl_processing.md` + book).

### 23. Jenkins Knowledge Base Crawled + Indexed (`data/knowledge_base/Technical_Docs/Jenkins` → `data/rag/indexes/jenkins/`)
- 46 GfG tutorial `.md` files — explicit curated link-list crawl from `https://www.geeksforgeeks.org/devops/jenkins-tutorial/` (71 child links filtered to 46 Jenkins-specific articles; URLs span `/devops/`, `/git/`, `/installation-guide/`).
- Coverage: installation & setup, pipeline basics (Jenkinsfile, stages/steps, declarative vs scripted), freestyle jobs, SCM integration (Git/GitHub), credentials & secrets, plugins, agents/controllers, builds & artifacts, notifications, security, troubleshooting, interview questions.
- **Pre-build safety pass:** all 47 docs chunk-tested — **no poisoned documents**; PDF parsed cleanly (894,759 chars / 604 pages).
- User added `jenkins2_upandrunning.pdf` (30.76 MB, 604 pages) → built via `python scripts/build_rag_index.py jenkins` (skill id **`jenkins`** newly registered in `ROLE_SKILLS.devops_engineer`).
- **Result:** 47 documents → **2,460 chunks** → `data/rag/indexes/jenkins/`. Chunk split: book **1,909** / tutorial **551**.
- Retrieval smoke-tested — evidence surfaces correctly (pipeline, Jenkinsfile, Git credentials, agents hit `jenkins2_upandrunning.pdf`, `gfg_adding_git_credentials_in_jenkins.md`).

---

## Changes Made in This Phase

| File | Change Type | Description |
|------|-------------|-------------|
| `app/config.py` | **Enhanced** | `RAG_INDEX_ROOT`, `RAG_CHUNK_SIZE/OVERLAP/TOP_K`, `ROLE_SKILLS` mapping |
| `app/rag/document_loader.py` | **Rewritten** | Overlapping chunking with boundaries + `topic`/`kind` tagging |
| `app/rag/vector_database.py` | **Rewritten** | Per-skill FAISS index + `index.meta.json` metadata sidecar, lazy load |
| `app/rag/retriever.py` | **Rewritten** | Multi-skill retrieval merged by distance |
| `app/rag/knowledge_verifier.py` | **Rewritten** | Role-aware verification, no-evidence branch, `sources` citation, JSON fallback |
| `scripts/build_rag_index.py` | **Created** | Per-skill chunk → embed → FAISS build tool |
| `scripts/crawl_docs_to_md.py` | **Created** | Recursive web → clean `.md` crawler for knowledge base construction |
| `scripts/crawl_docs_to_md.py` | **Enhanced** | Title split picks longest segment (fixes GfG `"PostgreSQL - Topic"` titles collapsing to one filename) |
| `scripts/crawl_docs_to_md.py` | **Enhanced** | `_dedupe_file()` disambiguates title collisions with URL-hash suffixes; `_index_saved_urls()` skips already-saved URLs without re-fetch; `POISONED_URLS` blocklist permanently excludes the MySQL `cursors` page |
| `scripts/crawl_docs_to_md.py` | **Enhanced** | `--max-depth` BFS crawl option (expands section hub pages; needed for GfG `/machine-learning/`) |
| `data/knowledge_base/Technical_Docs/Machine_Learning/` | **Created** | 324 GfG ML `.md` tutorial files (complete depth-2 BFS crawl from `geeksforgeeks.org/machine-learning/machine-learning/`) |
| `data/rag/indexes/machine_learning/` | **Created** | Built FAISS index + metadata sidecar for ML skill (7,590 vectors) |
| `data/knowledge_base/Technical_Docs/Java/` | **Enhanced** | Full re-crawl: 100 → **136** GfG `.md` files (complete sublink coverage) + index rebuilt → **5,703 vectors** |
| `data/rag/indexes/java/` | **Rebuilt** | Complete-corpus FAISS index for Java skill (5,703 vectors) |
| `data/knowledge_base/Technical_Docs/C++/` | **Enhanced** | Full re-crawl: 76 → **77** GfG `.md` files (complete coverage) + index rebuilt → **6,938 vectors** |
| `data/rag/indexes/cpp/` | **Rebuilt** | Complete-corpus FAISS index for C++ skill (6,938 vectors) |
| `data/knowledge_base/Technical_Docs/JavaScript/` | **Enhanced** | Full re-crawl: 100 → **126** GfG `.md` files (complete coverage) + index rebuilt → **5,226 vectors** |
| `data/rag/indexes/javascript/` | **Rebuilt** | Complete-corpus FAISS index for JavaScript skill (5,226 vectors) |
| `data/knowledge_base/Technical_Docs/SQL/` | **Enhanced** | Full re-crawl: 100 → **113** GfG `.md` files (complete coverage) + index rebuilt → **2,489 vectors** |
| `data/rag/indexes/sql/` | **Rebuilt** | Complete-corpus FAISS index for SQL skill (2,489 vectors) |
| `data/knowledge_base/Technical_Docs/PostgreSQL/` | **Enhanced** | Full re-crawl: 74 → **120** GfG `.md` files (complete coverage) + index rebuilt → **2,047 vectors** |
| `data/rag/indexes/postgresql/` | **Rebuilt** | Complete-corpus FAISS index for PostgreSQL skill (2,047 vectors) |
| `data/knowledge_base/Technical_Docs/MongoDB/` | **Enhanced** | Full re-crawl: 161 → **164** GfG `.md` files (complete coverage) + index rebuilt → **2,445 vectors** |
| `data/rag/indexes/mongodb/` | **Rebuilt** | Complete-corpus FAISS index for MongoDB skill (2,445 vectors) |
| `data/knowledge_base/Technical_Docs/MySQL/` | **Enhanced** | Full re-crawl: 94 → **99** GfG `.md` files (complete coverage; poisoned cursor page blocklisted) + index rebuilt → **4,752 vectors** |
| `data/rag/indexes/mysql/` | **Rebuilt** | Complete-corpus FAISS index for MySQL skill (4,752 vectors) |
| `data/knowledge_base/Technical_Docs/Docker/` | **Enhanced** | Full re-crawl: 30 → **36** GfG `.md` files (complete coverage) + index rebuilt → **1,703 vectors** |
| `data/rag/indexes/docker/` | **Rebuilt** | Complete-corpus FAISS index for Docker skill (1,703 vectors) |
| `app/config.py` | **Enhanced** | `cpp`, `postgresql`, `mongodb`, `mysql` registered in `ROLE_SKILLS` mapping |
| `data/knowledge_base/Q&A Pairs/qa_pairs_python.jsonl` | **Created** | 35 QA pairs (27 correct + 8 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Q&A Pairs/qa_pairs_java.jsonl` | **Created** | 35 Java QA pairs (27 correct + 8 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Q&A Pairs/qa_pairs_cpp.jsonl` | **Created** | 45 C++ QA pairs (36 correct + 9 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Q&A Pairs/qa_pairs_javascript.jsonl` | **Created** | 25 JavaScript QA pairs (19 correct + 6 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Q&A Pairs/qa_pairs_sql.jsonl` | **Created** | 30 SQL QA pairs (20 correct + 10 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Q&A Pairs/qa_pairs_docker.jsonl` | **Created** | 20 Docker QA pairs (8 correct + 12 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Q&A Pairs/qa_pairs_postgresql.jsonl` | **Created** | 20 PostgreSQL QA pairs (10 correct + 10 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Q&A Pairs/qa_pairs_mongodb.jsonl` | **Created** | 20 MongoDB QA pairs (10 correct + 10 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Q&A Pairs/qa_pairs_mysql.jsonl` | **Created** | 20 MySQL QA pairs (10 correct + 10 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Q&A Pairs/qa_pairs_machine_learning.jsonl` | **Created** | 80 ML QA pairs (60 correct + 20 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Technical_Docs/Deep Learning/` | **Created** | 132 GfG Deep Learning tutorial `.md` files (complete depth-2 BFS crawl from `deep-learning/deep-learning-tutorial`) + `Deep Learning (Ian Goodfellow).pdf` |
| `data/rag/indexes/deep_learning/` | **Created** | Built FAISS index + metadata sidecar for Deep Learning skill (6,294 vectors) |
| `data/knowledge_base/Q&A Pairs/qa_pairs_deep_learning.jsonl` | **Created** | 40 Deep Learning QA pairs (30 correct + 10 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Technical_Docs/NLP/` | **Created** | 96 GfG NLP tutorial `.md` files (complete depth-2 BFS crawl from `nlp/natural-language-processing-nlp-tutorial`) + `NLP.pdf` |
| `data/rag/indexes/nlp/` | **Created** | Built FAISS index + metadata sidecar for NLP skill (5,837 vectors) |
| `data/knowledge_base/Q&A Pairs/qa_pairs_nlp.jsonl` | **Created** | 50 NLP QA pairs (40 correct + 10 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Technical_Docs/Data Science/` | **Created** | 75 GfG Data Science tutorial `.md` files (complete depth-2 BFS crawl from `data-science/data-science-for-beginners`) + `Data Science.pdf` + `Python-for-Data-Analysis.pdf` |
| `data/rag/indexes/data_science/` | **Created** | Built FAISS index + metadata sidecar for Data Science skill (5,426 vectors) |
| `data/knowledge_base/Q&A Pairs/qa_pairs_data_science.jsonl` | **Created** | 75 Data Science QA pairs (56 correct + 19 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Technical_Docs/React/` | **Created** | 362 GfG React tutorial `.md` files (complete depth-2 BFS crawl from `reactjs/react`) + `Learning React (Banks & Porcello).pdf` |
| `data/rag/indexes/react/` | **Created** | Built FAISS index + metadata sidecar for React skill (6,258 vectors) |
| `data/knowledge_base/Q&A Pairs/qa_pairs_react.jsonl` | **Created** | 35 React QA pairs (26 correct + 9 wrong) for Phase 10 evaluation |
| `scripts/crawl_docs_to_md.py` | **Enhanced** | `POISONED_URLS` +1 entry (job-board-using-react) |
| `scripts/crawl_docs_to_md.py` | **Enhanced** | `POISONED_URLS` +3 entries (gradient-clipping, BERT sentiment, text-preprocessing) |
| `data/knowledge_base/Technical_Docs/LLM/` | **Created** | 127 GfG LLM tutorial `.md` files (curated keyword crawl from `deep-learning/large-language-model-llm-tutorial`) + `Build-a-large-language-models.pdf` |
| `data/rag/indexes/llm/` | **Created** | Built FAISS index + metadata sidecar for LLM skill (3,620 vectors) |
| `data/knowledge_base/Q&A Pairs/qa_pairs_llm.jsonl` | **Created** | 25 LLM QA pairs (19 correct + 6 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Technical_Docs/OOPS/` | **Created** | 31 GfG OOPs tutorial `.md` files (explicit curated link-list crawl) + `OOP_10122018.pdf` |
| `data/rag/indexes/oops/` | **Created** | Built FAISS index + metadata sidecar for OOPS skill (880 vectors) |
| `data/knowledge_base/Q&A Pairs/qa_pairs_oops.jsonl` | **Created** | 45 OOPS QA pairs (34 correct + 11 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Technical_Docs/DBMS/` | **Created** | 87 GfG DBMS tutorial `.md` files (complete crawl from `dbms/dbms`) + `Database System Concepts (Silberschatz).pdf` |
| `data/rag/indexes/dbms/` | **Created** | Built FAISS index + metadata sidecar for DBMS skill (8,271 vectors) |
| `data/knowledge_base/Q&A Pairs/qa_pairs_dbms.jsonl` | **Created** | 45 DBMS QA pairs (34 correct + 11 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Technical_Docs/GCP/` | **Created** | 54 GfG GCP tutorial `.md` files (explicit curated link-list crawl from `devops/google-cloud-platform-tutorial`) + `Data Engineering With Google Cloud Platform (Adi Widjaja).pdf` |
| `data/rag/indexes/gcp/` | **Created** | Built FAISS index + metadata sidecar for GCP skill (2,477 vectors) |
| `data/knowledge_base/Q&A Pairs/qa_pairs_gcp.jsonl` | **Created** | 25 GCP QA pairs (20 correct + 5 wrong) for Phase 10 evaluation |
| `data/knowledge_base/Technical_Docs/Jenkins/` | **Created** | 46 GfG Jenkins tutorial `.md` files (explicit curated link-list crawl from `devops/jenkins-tutorial`) + `jenkins2_upandrunning.pdf` |
| `data/rag/indexes/jenkins/` | **Created** | Built FAISS index + metadata sidecar for Jenkins skill (2,460 vectors) |
| `data/knowledge_base/Q&A Pairs/qa_pairs_jenkins.jsonl` | **Created** | 25 Jenkins QA pairs (19 correct + 6 wrong) for Phase 10 evaluation |
| `app/config.py` | **Enhanced** | `oops`, `dbms` registered in `ROLE_SKILLS` (`software_developer`, `backend_developer`); `gcp`, `jenkins` registered in `devops_engineer` |

---

## Architecture

```
data/knowledge_base/Technical_Docs/<skill>/          data/knowledge_base/Q&A Pairs/
   (.md + .pdf)                                          qa_pairs_<skill>.jsonl
        │                                                        │
        ▼                                                        ▼
scripts/build_rag_index.py <skill>                    evaluation (once LLM key added)
        │
   load_documents() → chunk_text() (overlap 600/100, topic+kind tags)
        │
   SentenceTransformer (all-MiniLM-L6-v2)  ── merge+sort by distance ──┐
        │                                                            │
        ▼                                                            ▼
   FAISS IndexFlatL2 ──► data/rag/indexes/<skill>/index.faiss   retrieve_context(query, skills)
     + index.meta.json (text+source sidecar)                           │
                                                                       ▼
                                     verify_answer(question, answer, role)
                                          skills = ROLE_SKILLS[role]
                                          context → LLM → is_correct/confidence/
                                                     verified_concepts/missing_concepts/feedback
                                                     + sources
```

---

## Dependency Handling

| Dependency | Status |
|------------|--------|
| `sentence-transformers` + `all-MiniLM-L6-v2` (384-d) | ✅ Installed, lazy-loaded singleton |
| `faiss-cpu` | ✅ Installed, per-skill `IndexFlatL2` |
| `trafilatura` | ✅ Installed (web crawler HTML → clean text) |
| GfG Python tutorial `.md` files | ✅ 88 files (`Technical_Docs/Python`) |
| `Learning Python, 5th Edition.pdf` | ✅ Ingested into the index (user-provided) |
| GfG Java tutorial `.md` files | ✅ 136 files (`Technical_Docs/Java`, crawled) |
| `Java Language Specification (JLS).pdf` | ✅ Ingested into the Java index (user-provided, 5.08 MB) |
| GfG C++ tutorial `.md` files | ✅ 77 files (`Technical_Docs/C++`, crawled) |
| `The C++ Programming Language, 4th Ed. (Stroustrup).pdf` | ✅ Ingested into the C++ index (user-provided, 18.76 MB) |
| GfG JavaScript tutorial `.md` files | ✅ 126 files (`Technical_Docs/JavaScript`, crawled) |
| `JavaScript: The Definitive Guide (2020).pdf` | ✅ Ingested into the JavaScript index (user-provided, 17.09 MB) |
| GfG SQL tutorial `.md` files | ✅ 113 files (`Technical_Docs/SQL`, crawled) |
| `Learning SQL (Alan Beaulieu).pdf` | ✅ Ingested into the SQL index (user-provided, 1.81 MB) |
| GfG Docker tutorial `.md` files | ✅ 36 files (`Technical_Docs/Docker`, crawled from `devops/docker-tutorial`) |
| `Docker Deep Dive (Nigel Poulton).pdf` | ✅ Ingested into the Docker index (user-provided, 14.82 MB) |
| GfG PostgreSQL tutorial `.md` files | ✅ 120 files (`Technical_Docs/PostgreSQL`, crawled from `postgresql/postgresql-tutorial`) |
| `PostgreSQL: Up and Running, 3rd Ed. (O'Reilly).pdf` | ✅ Ingested into the PostgreSQL index (user-provided, 41.1 MB) |
| GfG MongoDB tutorial `.md` files | ✅ 164 files (`Technical_Docs/MongoDB`, crawled from `mongodb/mongodb-tutorial`) |
| `MongoDB: The Definitive Guide.pdf` | ✅ Ingested into the MongoDB index (user-provided, 3.89 MB) |
| GfG MySQL tutorial `.md` files | ✅ 99 files (`Technical_Docs/MySQL`, crawled from `mysql/mysql-tutorial`; poisoned cursor page blocklisted) |
| `MySQL Cookbook, 4th Edition.pdf` | ✅ Ingested into the MySQL index (user-provided, 6.86 MB) |
| GfG Machine Learning tutorial `.md` files | ✅ 324 files (`Technical_Docs/Machine_Learning`, complete depth-2 BFS crawl from `machine-learning/machine-learning`) |
| `Hands-On Machine Learning with Scikit-Learn and TensorFlow.pdf` | ✅ Ingested into the ML index (user-provided, 43.88 MB; replaced the 172 MB scanned copy that extracted 0 chars) |
| GfG Deep Learning tutorial `.md` files | ✅ 132 files (`Technical_Docs/Deep Learning`, complete depth-2 BFS crawl from `deep-learning/deep-learning-tutorial`) |
| `Deep Learning (Ian Goodfellow et al.).pdf` | ✅ Ingested into the Deep Learning index (user-provided, 801 pages / 1.78M chars) |
| GfG NLP tutorial `.md` files | ✅ 96 files (`Technical_Docs/NLP`, complete depth-2 BFS crawl from `nlp/natural-language-processing-nlp-tutorial`) |
| `NLP.pdf` | ✅ Ingested into the NLP index (user-provided, 26.5 MB / 646 pages / 1.86M chars) |
| GfG Data Science tutorial `.md` files | ✅ 75 files (`Technical_Docs/Data Science`, complete depth-2 BFS crawl from `data-science/data-science-for-beginners`) |
| `Data Science.pdf` | ✅ Ingested into the Data Science index (user-provided, 13.3 MB / 441 pages / 985K chars) |
| `Python-for-Data-Analysis.pdf` | ✅ Ingested into the Data Science index (user-provided, 9.4 MB / 582 pages / 948K chars) |
| GfG React tutorial `.md` files | ✅ 362 files (`Technical_Docs/React`, complete depth-2 BFS crawl from `reactjs/react`) |
| `Learning React (Banks & Porcello).pdf` | ✅ Ingested into the React index (user-provided, 310 pages / 524K chars) |
| GfG LLM tutorial `.md` files | ✅ 127 files (`Technical_Docs/LLM`, curated keyword crawl from `deep-learning/large-language-model-llm-tutorial`) |
| `Build-a-large-language-models.pdf` | ✅ Ingested into the LLM index (user-provided, 14.72 MB / 299 pages / 571K chars) |
| GfG OOPs tutorial `.md` files | ✅ 31 files (`Technical_Docs/OOPS`, explicit curated link-list crawl) |
| `OOP_10122018.pdf` | ✅ Ingested into the OOPS index (user-provided, 2.12 MB / 93 pages / 117K chars) |
| GfG DBMS tutorial `.md` files | ✅ 87 files (`Technical_Docs/DBMS`, complete crawl from `dbms/dbms`) |
| `Database System Concepts (Silberschatz, Korth, Sudarshan).pdf` | ✅ Ingested into the DBMS index (user-provided, 15.53 MB / 1373 pages / 3.3M chars) |
| GfG GCP tutorial `.md` files | ✅ 54 files (`Technical_Docs/GCP`, explicit curated link-list crawl from `devops/google-cloud-platform-tutorial`) |
| `Data Engineering With Google Cloud Platform (Adi Widjaja).pdf` | ✅ Ingested into the GCP index (user-provided, 8.89 MB / 440 pages / 655K chars) |
| GfG Jenkins tutorial `.md` files | ✅ 46 files (`Technical_Docs/Jenkins`, explicit curated link-list crawl from `devops/jenkins-tutorial`) |
| `jenkins2_upandrunning.pdf` | ✅ Ingested into the Jenkins index (user-provided, 30.76 MB / 604 pages / 895K chars) |
| LLM provider (OpenAI / Together / local) | ⚠️ **Missing** — `knowledge_verifier` prompt is wired but needs an API key/model (Phase 6 prerequisite) |

---

## Verification

### Index build
- `python scripts/build_rag_index.py python` → ✅ 89 docs → **8,827 chunks** → `data/rag/indexes/python/`.
- Retained metadata: `topic=python` on all chunks; `kind` split book **7,774** / tutorial **1,053**.

### Retrieval smoke test (`retrieve_context`)
| Query | Top sources retrieved |
|-------|----------------------|
| "What is the difference between a list and a tuple?" | `Learning Python, 5th Edition.pdf`, `gfg_data_types.md` |
| "What does the break statement do in Python?" | `gfg_questions_and_answers.md`, book |
| "What is a lambda function?" | book passages |

### Java Index build
- `python scripts/build_rag_index.py java` → ✅ 137 docs → **5,703 chunks** → `data/rag/indexes/java/`.

### Java retrieval smoke test (`retrieve_context` — skill=`java`)
| Query | Top source retrieved |
|-------|----------------------|
| "Can a Java class implement multiple interfaces?" | `gfg_java_interface.md` |
| "Does a constructor have a return type?" | `Java Language Specification (JLS).pdf` |
| "Does HashMap guarantee insertion order?" | `gfg_map_interface_in_java.md` |
| "What is the heap in Java?" | `gfg_how_are_java_objects_stored_in_memory.md` |

### C++ Index build
- `python scripts/build_rag_index.py cpp --folder data/knowledge_base/Technical_Docs/C++` → ✅ 78 docs → **6,938 chunks** → `data/rag/indexes/cpp/`.

### C++ retrieval smoke test (`retrieve_context` — skill=`cpp`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is a smart pointer in C++?" | `gfg_c_pointers.md` |
| "Difference between references and pointers?" | `gfg_pointers_and_references_in_c.md` |
| "What is exception handling in C++?" | `gfg_exception_handling_in_c.md` |
| "What are STL containers in C++?" | `gfg_standard_template_library_stl_in_c.md` |

### JavaScript Index build
- `python scripts/build_rag_index.py javascript` → ✅ 127 docs → **5,226 chunks** → `data/rag/indexes/javascript/`.

### JavaScript retrieval smoke test (`retrieve_context` — skill=`javascript`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is a closure in JavaScript?" | `gfg_closure_in_javascript.md`, book |
| "Difference between var, let and const?" | `JavaScript: The Definitive Guide (2020).pdf` |
| "What are promises in JavaScript?" | book |
| "What is event delegation in JavaScript?" | `gfg_event_delegation_in_javascript.md`, book |

### SQL Index build
- `python scripts/build_rag_index.py sql` → ✅ 114 docs → **2,489 chunks** → `data/rag/indexes/sql/`.

### SQL retrieval smoke test (`retrieve_context` — skill=`sql`)
| Query | Top source retrieved |
|-------|----------------------|
| "Difference between inner join and left join?" | `gfg_sql_joins_inner_left_right_and_full_join.md` |
| "What is a subquery in SQL?" | `gfg_sql_subquery.md` |
| "What does GROUP BY do?" | `gfg_sql_questions.md` |
| "What is a primary key?" | `gfg_sql_alternate_key.md` |

### Docker index build
- Per-file chunk sanity pass → ✅ 37 docs, **no poisoned documents**.
- `python scripts/build_rag_index.py docker` → ✅ 37 docs → **1,703 chunks** → `data/rag/indexes/docker/`.

### Docker retrieval smoke test (`retrieve_context` — skill=`docker`)
| Query | Top source retrieved |
|-------|----------------------|
| "How do you mount a volume in a Docker container?" | `gfg_mounting_a_volume_inside_docker_container.md`, `gfg_using_cli_to_manage_docker_volumes.md`, `gfg_how_to_use_bind_mounts_and_volumes_in_docker.md` |
| "What is the difference between a Docker image and a container?" | `gfg_architecture_of_docker.md`, `Docker Deep Dive (Nigel Poulton).pdf` |
| "How do Docker Swarm nodes work?" | `gfg_docker_swarm.md`, `Docker Deep Dive (Nigel Poulton).pdf` |

### PostgreSQL index build
- Per-file chunk sanity pass → ✅ 121 docs, **no poisoned documents**.
- `python scripts/build_rag_index.py postgresql` → ✅ 121 docs → **2,047 chunks** → `data/rag/indexes/postgresql/`.

### PostgreSQL retrieval smoke test (`retrieve_context` — skill=`postgresql`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is a CTE in PostgreSQL?" | book + `gfg_postgresql_questions_and_answers.md` |
| "How do JSONB data types work in PostgreSQL?" | `gfg_json_data_type.md`, book |
| "What is an UPSERT and how do you do it?" | `PostgreSQL: Up and Running, 3rd Ed.` (book) |
| "What is a window function in PostgreSQL?" | book |

### MongoDB index build
- Per-file chunk sanity pass → ✅ 165 docs, **no poisoned documents**.
- `python scripts/build_rag_index.py mongodb` → ✅ 165 docs → **2,445 chunks** → `data/rag/indexes/mongodb/`.

### MongoDB retrieval smoke test (`retrieve_context` — skill=`mongodb`)
| Query | Top source retrieved |
|-------|----------------------|
| "How does the aggregation pipeline work in MongoDB?" | `gfg_aggregation_commands.md`, `gfg_mongodb_questions_with_answers.md` |
| "What is a replica set in MongoDB?" | `gfg_replica_set_members_in_mongodb.md`, `gfg_replica_set_deployment_in_mongodb.md`, book |
| "How do you create an index in MongoDB?" | book, `gfg_mongodb_questions_with_answers.md` |

### MySQL index build
- Per-file chunk sanity pass → ✅ 100 docs, **no poisoned documents** (`gfg_mysql_cursors.md` permanently blocklisted in the crawler).
- `python scripts/build_rag_index.py mysql` → ✅ 100 docs → **4,752 chunks** → `data/rag/indexes/mysql/`.

### MySQL retrieval smoke test (`retrieve_context` — skill=`mysql`)
| Query | Top source retrieved |
|-------|----------------------|
| "How do joins work in MySQL?" | `gfg_mysql_outer_join.md`, `MySQL Cookbook 4th Edition.pdf` |
| "What is a stored procedure in MySQL?" | `gfg_different_types_of_procedures_in_mysql.md`, `gfg_mysql_questions.md`, book |
| "How do transactions work with InnoDB?" | book, `gfg_mysql_transaction.md` |

### ML index build
- Per-file chunk sanity pass → ✅ 325 docs, **no poisoned documents**; PDF parsed cleanly (1,069,858 chars / 570 pages, image-only scanned copy rejected).
- `python scripts/build_rag_index.py machine_learning` → ✅ 325 docs → **7,590 chunks** → `data/rag/indexes/machine_learning/`.
- Retained metadata: `topic=machine_learning` on all chunks; `kind` split book **2,288** / tutorial **5,302**.

### ML retrieval smoke test (`retrieve_context` — skill=`machine_learning`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is the difference between supervised and unsupervised learning?" | `gfg_supervised_learning.md`, `gfg_unsupervised_machine_learning.md` |
| "How does gradient descent work?" | `gfg_what_is_gradient_descent.md`, `gfg_gradient_descent_algorithm_in_machine_learning.md` |
| "What is a random forest?" | `gfg_random_forest_algorithm_in_machine_learning.md`, `gfg_machine_learning_questions_and_answers.md` |
| "What is overfitting and how do you prevent it?" | `Hands-On ML with Scikit-Learn and TensorFlow.pdf`, book |
| "What is Q-learning?" | `gfg_learning_in_reinforcement.md`, `gfg_bellman_equation.md` |
| "How does a support vector machine classify data?" | `gfg_support_vector_machine_svm_algorithm.md`, book |

### Deep Learning index build
- Per-file chunk sanity pass → ✅ 132 tutorial docs, **no poisoned documents** (3 poisonous pages removed and blocklisted: `understanding-gradient-clipping`, `sentiment-classification-using-bert`, `text-preprocessing-for-nlp-tasks`); PDF parsed cleanly (1,779,420 chars / 801 pages).
- `python scripts/build_rag_index.py deep_learning --folder "data/knowledge_base/Technical_Docs/Deep Learning"` → ✅ 133 docs → **6,294 chunks** → `data/rag/indexes/deep_learning/`.
- Retained metadata: `topic=deep_learning` on all chunks; `kind` split book **3,758** / tutorial **2,536**.

### Deep Learning retrieval smoke test (`retrieve_context` — skill=`deep_learning`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is gradient descent in deep learning?" | `gfg_deep_learning_questions.md`, `Deep Learning (Ian Goodfellow).pdf` |
| "What is a convolutional neural network?" | book, `gfg_deep_learning_questions.md` |
| "What is backpropagation?" | `gfg_weights_and_bias_in_neural_networks.md`, `gfg_feedforward_neural_network.md` |
| "What is a ReLU activation function?" | `gfg_relu_activation_function_in_deep_learning.md` |
| "What is a recurrent neural network used for?" | `gfg_recurrent_layers_in_tensorflow.md`, `gfg_deep_learning_questions.md` |

### NLP index build
- Per-file chunk sanity pass → ✅ 96 tutorial docs, **no poisoned documents**; PDF parsed cleanly (1,864,094 chars / 646 pages).
- `python scripts/build_rag_index.py nlp --folder "data/knowledge_base/Technical_Docs/NLP"` → ✅ 97 docs → **5,837 chunks** → `data/rag/indexes/nlp/`.
- Retained metadata: `topic=nlp` on all chunks; `kind` split book **3,953** / tutorial **1,884**.

### NLP retrieval smoke test (`retrieve_context` — skill=`nlp`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is tokenization in NLP?" | `gfg_what_is_tokenization.md`, `gfg_tokenization_in_nlp.md` |
| "What is word embedding?" | `gfg_tokenization_vs_embeddings.md`, `gfg_word_embeddings_in_nlp.md` |
| "What is a language model?" | `NLP.pdf` (book) |
| "What is named entity recognition?" | `NLP.pdf` (book) |
| "What is TF-IDF?" | `gfg_natural_processing_question.md`, `gfg_plagiarism_detection_using.md` |

### Data Science index build
- Per-file chunk sanity pass → ✅ 75 tutorial docs, **no poisoned documents**; both PDFs parsed cleanly (`Data Science.pdf` 985,314 chars / 441 pages; `Python-for-Data-Analysis.pdf` 947,525 chars / 582 pages).
- `python scripts/build_rag_index.py data_science --folder "data/knowledge_base/Technical_Docs/Data Science"` → ✅ 77 docs → **5,426 chunks** → `data/rag/indexes/data_science/`.
- Retained metadata: `topic=data_science` on all chunks; `kind` split book **4,082** / tutorial **1,344** (book = `Data Science.pdf` 2,078 + `Python-for-Data-Analysis.pdf` 2,004 chunks).

### Data Science retrieval smoke test (`retrieve_context` — skill=`data_science`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is data science?" | `gfg_what_is_data_science.md`, `gfg_to_data_science.md` |
| "Difference between descriptive and inferential statistics?" | `gfg_statistics_for_data_science.md`, `gfg_descriptive_statistic_for_data_science.md` |
| "What is hypothesis testing?" | `gfg_hypothesis_testing.md`, `gfg_to_inferential_statistics.md` |
| "What is a Pandas DataFrame used for?" | `gfg_data_science_questions_and_answers.md`, `Python-for-Data-Analysis.pdf` |
| "What is regression analysis?" | `gfg_statsmodel_library.md`, `gfg_statistics_for_data_science.md` |

### React index build
- Per-file chunk sanity pass → ✅ 362 tutorial docs, **no poisoned documents** (1 poisonous page removed and blocklisted: `job-board-using-react`); PDF parsed cleanly (523,907 chars / 310 pages).
- `python scripts/build_rag_index.py react --folder "data/knowledge_base/Technical_Docs/React"` → ✅ 363 docs → **6,258 chunks** → `data/rag/indexes/react/`.
- Retained metadata: `topic=react` on all chunks; `kind` split tutorial **5,150** / book **1,108**.

### React retrieval smoke test (`retrieve_context` — skill=`react`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is a React component?" | `gfg_react_questions_and_answers.md` |
| "What is the useState hook?" | `gfg_react_questions_and_answers.md` |
| "What is JSX?" | `gfg_react_questions_and_answers.md` |
| "What is the virtual DOM?" | `gfg_difference_between_virtual_dom_and_real.md`, `gfg_virtual_dom_in_react_js.md` |
| "What is props in React?" | `gfg_reactjs_props.md`, `gfg_how_to_access_props_inside_a_functional_component.md` |

### LLM index build
- Per-file chunk sanity pass → ✅ 128 docs, **no poisoned documents**.
- `python scripts/build_rag_index.py llm` → ✅ 128 docs → **3,620 chunks** → `data/rag/indexes/llm/`.
- Retained metadata: `topic=llm` on all chunks; `kind` split book **1,214** / tutorial **2,406**.

### LLM retrieval smoke test (`retrieve_context` — skill=`llm`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is a transformer architecture?" | `Build-a-large-language-models.pdf`, `gfg_transformers_in_machine_learning.md` |
| "What is self-attention?" | `gfg_how_do_self_attention_masks_work.md`, `gfg_generative_ai_and_llm_question_with_answer.md` |
| "What is fine-tuning a language model?" | `gfg_fine_tuning_large_model_llm.md`, `Build-a-large-language-models.pdf` |

### OOPS index build
- Per-file chunk sanity pass → ✅ 32 docs, **no poisoned documents**.
- `python scripts/build_rag_index.py oops` → ✅ 32 docs → **880 chunks** → `data/rag/indexes/oops/`.
- Retained metadata: `topic=oops` on all chunks; `kind` split book **245** / tutorial **635**.

### OOPS retrieval smoke test (`retrieve_context` — skill=`oops`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is encapsulation in OOP?" | `gfg_c_questions_and_answers.md`, `gfg_oop_concepts.md` |
| "What is a constructor?" | `gfg_oop_questions_and_answers.md`, `gfg_java_oop_object_oriented_concepts.md` |
| "What is inheritance in OOP?" | `gfg_oop_concepts.md`, `gfg_object_oriented_in_c.md` |

### DBMS index build
- Per-file chunk sanity pass → ✅ 88 docs, **no poisoned documents**.
- `python scripts/build_rag_index.py dbms` → ✅ 88 docs → **8,271 chunks** → `data/rag/indexes/dbms/`.
- Retained metadata: `topic=dbms` on all chunks; `kind` split book **7,049** / tutorial **1,222**.

### DBMS retrieval smoke test (`retrieve_context` — skill=`dbms`)
| Query | Top source retrieved |
|-------|----------------------|
| "What are ACID properties in DBMS?" | `gfg_acid_properties_in_dbms.md` |
| "What is a primary key?" | `gfg_keys_in_relational_model.md` |
| "What is normalization in databases?" | `gfg_to_database_normalization.md`, `gfg_denormalization_in_databases.md` |

### GCP index build
- Per-file chunk sanity pass → ✅ 55 docs, **no poisoned documents** (safety flags verified as tables/code artifacts).
- `python scripts/build_rag_index.py gcp` → ✅ 55 docs → **2,477 chunks** → `data/rag/indexes/gcp/`.
- Retained metadata: `topic=gcp` on all chunks; `kind` split book **1,397** / tutorial **1,080**.

### GCP retrieval smoke test (`retrieve_context` — skill=`gcp`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is BigQuery?" | `gfg_google_cloud_platform_bigquery_running_queries_advantage_and_disadvantage.md`, `gfg_to_bigquery.md` |
| "How do Dataflow pipelines work? What is partitioning?" | `gfg_building_data_pipelines_with_google_cloud_dataflow_etl_processing.md`, book |
| "What is a Cloud Dataflow template?" | `gfg_google_cloud_platform_networking_services.md`, `gfg_google_cloud_platform_gcp_questions.md` |

### Jenkins index build
- Per-file chunk sanity pass → ✅ 47 docs, **no poisoned documents**.
- `python scripts/build_rag_index.py jenkins` → ✅ 47 docs → **2,460 chunks** → `data/rag/indexes/jenkins/`.
- Retained metadata: `topic=jenkins` on all chunks; `kind` split book **1,909** / tutorial **551**.

### Jenkins retrieval smoke test (`retrieve_context` — skill=`jenkins`)
| Query | Top source retrieved |
|-------|----------------------|
| "What is a Jenkins pipeline?" | `jenkins2_upandrunning.pdf` |
| "What is a Jenkinsfile?" | `jenkins2_upandrunning.pdf` |
| "How do you add Git credentials in Jenkins?" | `gfg_adding_git_credentials_in_jenkins.md` |

### Python 3.13 runtime
- All modified modules compile (`py_compile`) ✅
- Lazy embedding-model + per-skill index load works in a fresh process (restart-safe metadata) ✅

---

## Dependencies on User

**Provided & consumed:**
- `Learning Python, 5th Edition.pdf` (20 MB) — ingested into the Python index.
- `Java Language Specification (JLS).pdf` (5.08 MB) — ingested into the Java index.
- `The C++ Programming Language, 4th Ed. (Bjarne Stroustrup).pdf` (18.76 MB) — ingested into the C++ index.
- `JavaScript: The Definitive Guide (2020).pdf` (17.09 MB) — ingested into the JavaScript index.
- `Learning SQL (Alan Beaulieu).pdf` (1.81 MB) — ingested into the SQL index.
- `Docker Deep Dive (Nigel Poulton).pdf` (14.82 MB, 419 pages) — ingested into the Docker index.
- `PostgreSQL: Up and Running, 3rd Edition.pdf` (41.1 MB) — ingested into the PostgreSQL index.
- `MongoDB: The Definitive Guide.pdf` (3.89 MB) — ingested into the MongoDB index.
- `MySQL Cookbook, 4th Edition.pdf` (6.86 MB) — ingested into the MySQL index.
- `Hands-On Machine Learning with Scikit-Learn and TensorFlow.pdf` (43.88 MB) — ingested into the ML index (replaced a 172 MB scanned copy that extracted 0 chars).
- `Deep Learning (Ian Goodfellow et al.).pdf` (20.08 MB, 801 pages) — ingested into the Deep Learning index.
- `NLP.pdf` (26.5 MB, 646 pages) — ingested into the NLP index.
- `Data Science.pdf` (13.3 MB, 441 pages) — ingested into the Data Science index.
- `Python-for-Data-Analysis.pdf` (9.4 MB, 582 pages) — ingested into the Data Science index.
- `Learning React - Modern Patterns for Developing React Apps (2020).pdf` (310 pages) — ingested into the React index.
- `Build-a-large-language-models.pdf` (14.72 MB, 299 pages) — ingested into the LLM index.
- `OOP_10122018.pdf` (2.12 MB, 93 pages) — ingested into the OOPS index.
- `Database System Concepts (Silberschatz, Korth, Sudarshan).pdf` (15.53 MB, 1373 pages) — ingested into the DBMS index.
- `Data Engineering With Google Cloud Platform (Adi Widjaja).pdf` (8.89 MB, 440 pages) — ingested into the GCP index.
- `jenkins2_upandrunning.pdf` (30.76 MB, 604 pages) — ingested into the Jenkins index.
- 35 Python evaluation QA pairs → `data/knowledge_base/Q&A Pairs/qa_pairs_python.jsonl`.
- 35 Java evaluation QA pairs → `data/knowledge_base/Q&A Pairs/qa_pairs_java.jsonl`.
- 45 C++ evaluation QA pairs → `data/knowledge_base/Q&A Pairs/qa_pairs_cpp.jsonl`.
- 25 JavaScript evaluation QA pairs → `data/knowledge_base/Q&A Pairs/qa_pairs_javascript.jsonl`.
- 30 SQL evaluation QA pairs → `data/knowledge_base/Q&A Pairs/qa_pairs_sql.jsonl`.
- 20 Docker evaluation QA pairs → `data/knowledge_base/Q&A Pairs/qa_pairs_docker.jsonl`.
- 20 PostgreSQL evaluation QA pairs → `data/knowledge_base/Q&A Pairs/qa_pairs_postgresql.jsonl`.
- 20 MongoDB evaluation QA pairs → `data/knowledge_base/Q&A Pairs/qa_pairs_mongodb.jsonl`.
- 20 MySQL evaluation QA pairs → `data/knowledge_base/Q&A Pairs/qa_pairs_mysql.jsonl`.
- 80 ML evaluation QA pairs (60 correct + 20 wrong) → `data/knowledge_base/Q&A Pairs/qa_pairs_machine_learning.jsonl`.
- 40 Deep Learning evaluation QA pairs (30 correct + 10 wrong) → `data/knowledge_base/Q&A Pairs/qa_pairs_deep_learning.jsonl`.
- 50 NLP evaluation QA pairs (40 correct + 10 wrong) → `data/knowledge_base/Q&A Pairs/qa_pairs_nlp.jsonl`.
- 75 Data Science evaluation QA pairs (56 correct + 19 wrong) → `data/knowledge_base/Q&A Pairs/qa_pairs_data_science.jsonl`.
- 35 React evaluation QA pairs (26 correct + 9 wrong) → `data/knowledge_base/Q&A Pairs/qa_pairs_react.jsonl`.
- 25 LLM evaluation QA pairs (19 correct + 6 wrong) → `data/knowledge_base/Q&A Pairs/qa_pairs_llm.jsonl`.
- 45 OOPS evaluation QA pairs (34 correct + 11 wrong) → `data/knowledge_base/Q&A Pairs/qa_pairs_oops.jsonl`.
- 45 DBMS evaluation QA pairs (34 correct + 11 wrong) → `data/knowledge_base/Q&A Pairs/qa_pairs_dbms.jsonl`.
- 25 GCP evaluation QA pairs (20 correct + 5 wrong) → `data/knowledge_base/Q&A Pairs/qa_pairs_gcp.jsonl`.
- 25 Jenkins evaluation QA pairs (19 correct + 6 wrong) → `data/knowledge_base/Q&A Pairs/qa_pairs_jenkins.jsonl`.

**Still required for full Phase 10 completion:**
- **LLM API key / provider selection** (OpenAI / Together.ai / HuggingFace / local Llama) — unlocks `verify_answer()` verdict + the accuracy runs. All 19 skill indexes and their QA pair sets are otherwise complete.

---

## Next Phase
Once the LLM key is available:
1. Run the **Python** (35), **Java** (35), **C++** (45), **JavaScript** (25), **SQL** (30), **Docker** (20), **PostgreSQL** (20), **MongoDB** (20), **MySQL** (20), **Machine Learning** (80), **Deep Learning** (40), **NLP** (50), **Data Science** (75), **React** (35), **LLM** (25), **OOPS** (45), **DBMS** (45), **GCP** (25) and **Jenkins** (25) pair evaluations → report verification accuracy (`is_correct` vs `ground_truth`).
2. Tune `RAG_TOP_K`, similarity threshold, prompt if accuracy is below target.
3. Wire `verify_answer(role=...)` into the Phase 7 adaptive interview flow.