# Phase 5: Skill Gap Analysis & Dashboard Visualization — Implementation Summary

## Phase Overview
**Phase Number:** 5  
**Phase Name:** Skill Gap Analysis & Dashboard Visualization  
**Status:** ✅ Complete — Backend + Dashboard UI wired to real SBERT pipeline

---

## Decisions Locked (Dependencies on User)

| Decision | Choice |
|----------|--------|
| **Priority weighting rule** | Required skills → weight **1.0**, Preferred skills → weight **0.5**; gap on required = **HIGH**, gap on preferred = **LOW** |
| **Dashboard data** | Use the **real** Phase-4 SBERT pipeline with bundled sample resume/JD, not hard-coded demo values |
| **UI/UX** | Follow the existing design system in `Theme.qml` (purple primary `#7c3aed`, cards, ProgressRing, HBarRow) |
| **Color scheme** | Existing Theme palette: green `#22c55e` (matched), amber `#f59e0b` (partial), red `#ef4444` (gap) |

---

## What Was Built

### 1. Skill Gap Computation Logic (`app/recommendation/priority_ranking.py` — NEW)

`compute_weighted_skill_gap(resume_skills, required_skills, preferred_skills)` runs the Phase-4 semantic matcher **twice** (once for required, once for preferred) and combines the results with weighting:

```
Per-skill contribution = weight × status score
    weight  : required = 1.0 | preferred = 0.5
    matched → 1.0 | partial → 0.5 | gap → 0.0

Job Fit %   = Σ contribution / Σ weight × 100        (weighted)
Matched %   = fully-matched JD skills / total × 100  (plain)
Gap count   = # of JD skills classified as gap
```

**Priority matrix (HIGH / MEDIUM / LOW):**

| Type | Status | Priority |
|------|--------|----------|
| Required | Gap | **HIGH** ⚠️ |
| Required | Partial | **MEDIUM** ◎ |
| Preferred | Gap | **LOW** ○ |
| Preferred | Partial | **LOW** ○ |
| Any | Matched | *(no badge)* |

Rows are sorted HIGH → MEDIUM → LOW, then preferred-last, then by highest similarity. Each row exposes `{skill, type, status, priority, similarity, matched_skill}`.

### 2. Dashboard Data Provider (`app/recommendation/dashboard_service.py` — NEW)

`get_dashboard_data(user_id)` — single JSON-serializable payload used by QML:
- Pulls the latest resume skills + JD required/preferred skills from the DB (`ResumeRepository` / `JDRepository`).
- **Falls back to bundled sample data** (sample resume skills = Python/ML/NLP/SQL/Docker/AWS/PyTorch/…; sample JD = 7 required + 4 preferred skills) when the user hasn't uploaded documents — so the dashboard is always populated.
- Computes the weighted gap analysis and returns: `job_fit_pct`, `matched_pct`, `gap_count`, `partial_count`, `matched_count`, `total_jd_skills`, `priority_rankings[]`, `recommendations[]`, `required_skills`, `preferred_skills`, `resume_skills`, weighting constants, `data_source`.

**Sample run (real SBERT):**
```
Job Fit = 72.2% | Matched = 63.6% | 7 matched, 1 partial, 3 gaps
[HIGH  ] required  gap      TensorFlow     sim=0.49   → "Learn TensorFlow — required"
[MEDIUM] required  partial  Deep Learning  sim=0.69   → "Deepen Deep Learning — partial match"
[LOW   ] preferred gap      Kubernetes     sim=0.32
[LOW   ] preferred gap      MLOps          sim=0.34
```

### 3. Sample Data (NEW)
- `data/resumes/sample_resume.txt` — AI/ML engineer resume (real text; Python, PyTorch, NLP, Deep Learning, Computer Vision, Docker, AWS, FastAPI, SQL, Kubernetes…).
- `data/job_descriptions/sample_jd.txt` — matching JD with a **Required skills** section (Python, Machine Learning, Deep Learning, NLP, Docker, AWS, TensorFlow) and a **Preferred skills** section (PyTorch, Computer Vision, Kubernetes, MLOps) — the JD parser already splits them.
- The dashboard service currently uses curated skill lists from these; document-upload extraction (Phase 2/3) will feed `ResumeRepository`/`JDRepository`, which the service already reads first.

### 4. Python → QML Bridge (`app/ui/app_controller.py` — MODIFIED)
New skill-analysis surface exposed to QML:
- **`refreshSkillAnalysis()`** slot — runs the pipeline and emits `skillAnalysisChanged`.
- **`skillAnalysisJson`** (str) — full dashboard payload for QML `JSON.parse`.
- **`jobFitPct`**, **`matchedPct`** (str), **`gapCount`** (int), **`skillGapSummary`** (str), **`hasAnalysis`** (bool) — convenience properties with `notify=skillAnalysisChanged` so QML bindings update automatically.
- Signal **`skillAnalysisChanged`** added.

### 5. Visual Components (NEW — `app/ui/qml/components/`)

| Component | Purpose |
|-----------|---------|
| `PriorityBadge.qml` | Pill badge for **HIGH** ⚠️ (red), **MEDIUM** ◎ (amber), **LOW** ○ (blue); empty = ghost pill |
| `SkillTag.qml` | Skill chip with status dot (green/amber/red) + optional priority badge |
| `GapPriorityRow.qml` | Row: skill name, "Required" tag, status label, PriorityBadge, similarity bar + % |

Reuses existing `ProgressRing.qml`, `HBarRow.qml`, `ScoreCard.qml`, `Card.qml`.

### 6. Dashboard UI (`app/ui/qml/Dashboard.qml` — MODIFIED)
- Stats row now shows **real** values bound to the controller:
  - **Job Fit** — `App.jobFitPct` + "%"
  - **Skills Matched** — `App.matchedPct` + "%"
  - **Skill Gaps** — `App.gapCount` (red icon when gaps > 0)
  - **Priority Items** — count of HIGH/MEDIUM/LOW ranked skills
- New **"Skill Gap Priorities"** card — ranked list of `GapPriorityRow`s (only non-matched skills) with a "View Skill Analysis" button.
- Welcome text uses the real logged-in user's first name.
- Auto-refreshes via `Component.onCompleted` → `App.refreshSkillAnalysis()` + `Connections onSkillAnalysisChanged`.

### 7. Skill Gap Analysis Page (`app/ui/qml/SkillAnalysis.qml` — MODIFIED)
Rebuilt from hard-coded demo → live data:
- **Matching Overview** card: two `ProgressRing`s (Job Fit + Skills Matched), plus per-group `HBarRow` "Required skills matched" / "Preferred skills matched", matched/partial/gap legend with real counts, and the top recommendation.
- **Priority Ranking** card: full ranked list of `GapPriorityRow`s → **progress bars + priority badges**, with a legend showing the three badge styles.
- **Matched / Partially Matched / Skill Gaps** cards: each skill tagged with type (· Required), status dot, PriorityBadge, and a similarity progress bar. ← the *skill tags + priority badges* visual requirement.
- Bottom banner: "Recommended focus: HIGH: TensorFlow · MEDIUM: Deep Learning · LOW: Kubernetes, MLOps".
- "Refresh" button re-runs the semantic analysis.

---

## Files Changed in This Phase

| File | Change Type | Description |
|------|-------------|-------------|
| `app/recommendation/priority_ranking.py` | **Created** | Weighted gap computation (required 1.0 / preferred 0.5) + HIGH/MEDIUM/LOW priority matrix; post-update: `required/preferred` counts + `required_match_pct`/`preferred_match_pct` |
| `app/recommendation/dashboard_service.py` | **Created** | `get_dashboard_data()` / `dashboard_json()` — DB-first, sample-data fallback; post-update: `get_dashboard_data_for_skills()` / `dashboard_json_for_skills()` — in-memory, no-fallback (`parsed_documents`) |
| `data/resumes/sample_resume.txt` | **Created** | Sample AI/ML engineer resume text |
| `data/job_descriptions/sample_jd.txt` | **Created** | Sample JD with required + preferred skill sections |
| `app/ui/app_controller.py` | **Modified** | `refreshSkillAnalysis()` slot, `skillAnalysisChanged`/`analysisBusyChanged` signals, `skillAnalysisJson`/`jobFitPct`/`matchedPct`/`gapCount`/`skillGapSummary`/`hasAnalysis`/`analysisBusy` properties; post-update: auto-run on parse, clear-on-upload, sample-free in-memory worker |
| `app/ui/qml/components/PriorityBadge.qml` | **Created** | HIGH/MEDIUM/LOW priority pill badge |
| `app/ui/qml/components/SkillTag.qml` | **Created** | Skill chip with status dot + priority badge |
| `app/ui/qml/components/GapPriorityRow.qml` | **Created** | Ranked skill row with progress bar + badge; post-update: blue "Preferred" chip + elided skill text |
| `app/ui/qml/Dashboard.qml` | **Modified** | Real Job Fit % / Matched % / Gap count stats + Skill Gap Priorities card + dynamic user name |
| `app/ui/qml/SkillAnalysis.qml` | **Modified** | Live ProgressRings, required/preferred HBarRows, priority ranking list, tagged skill groups, focus banner; post-update: fully dynamic from `skillAnalysisJson` + empty/"Analyzing…" states |
| `Implementation_docs/phase5.md` | **Created** | This documentation file |

---

## Dependencies on User

| Dependency | Status |
|-----------|--------|
| Priority weighting rules | ✅ Locked: required 1.0 / preferred 0.5 (HIGH on required-gap, LOW on preferred-gap) |
| UI/UX preferences | ✅ Followed existing `Theme.qml` design system |
| Color scheme / branding | ✅ Used existing palette (purple/green/amber/red) |
| Skill-gap computation | ✅ Phase 4 matcher reused |
| Sample resume/JD data | ✅ Bundled in `data/` — used ONLY by the CLI/test entry point (`get_dashboard_data`); the production UI & bridge use in-memory parsed documents |
| SBERT model weights | ✅ Auto-downloaded (Phase 4, one-time) |

---

## Verification

```bash
# 1. Backend weighted gap analysis
python -m app.recommendation.dashboard_service
# → job_fit=72.2% matched=63.6% (3 gaps, 1 partials), HIGH/MEDIUM/LOW rankings

# 2. Controller bridge
# refreshSkillAnalysis is a no-op until a resume AND a JD have been parsed; the live
# analysis is driven by uploadResume/uploadJd + the new no-fallback dashboard entry point.
python main.py --selftest

# 3. App selftest (QML loads Main.qml/Login.qml)
python main.py --selftest
# → SELFTEST_OK (exit 0)
# NOTE: selftest instantiates Login.qml only. The new pages (Dashboard/SkillAnalysis) live
# in Shell.qml and are created after loginSuccess, so they are validated by step 4.

# 4. Headless QML validation (Dashboard + SkillAnalysis instantiate with live analysis JSON)
#    Load Main.qml with a real AppController, emit loginSuccess, then assert both page objects
#    exist, `App.refreshSkillAnalysis()` ran, hasAnalysis is true, and the priority ListModel
#    is populated (repeater count 4) with no QML errors.
python -c "import os; os.environ['QT_QPA_PLATFORM']='offscreen'; from PySide6.QtGui import QGuiApplication; from PySide6.QtQml import QQmlApplicationEngine; import sys, pathlib; sys.path.insert(0,str(pathlib.Path.cwd())); from app.ui.app_controller import AppController; a=QGuiApplication(sys.argv); e=QQmlApplicationEngine(); e.rootContext().setContextProperty('App', AppController()); e.load(pathlib.Path('app/ui/qml/Main.qml').resolve()); w=e.rootObjects()[0]; w.show()
# → OK: Dashboard_QMLTYPE_*, SkillAnalysis_QMLTYPE_* instantiated, priority model count 4, no QML errors
```

### Verified behaviour
| Item | Result |
|------|--------|
| Weighted Job Fit % | 72.2% (required fully counted, preferred halved) |
| Matched Skills % | 63.6% (7/11 JD skills fully matched) |
| Skill gap count | 3 (TensorFlow, Kubernetes, MLOps) + 1 partial (Deep Learning) |
| Priority badges | 1× HIGH, 1× MEDIUM, 2× LOW — all three tiers render |
| Dashboard bindings | Update automatically via `skillAnalysisChanged` signal |
| Empty-state handling | No resume/JD → sample fallback keeps dashboard populated |
| Offline/未安装 SBERT | Falls back to exact-string matching (`method_used: "exact"`) |

---

## Production wiring: fully dynamic Skill Gap Analysis (post-staging update)

The dashboard is now driven **entirely by the user's parsed resume + JD** — no hardcoded
or sample values reach the production UI. Samples remain only in the CLI/test path.

**Root cause fixed:** `get_dashboard_data()` reads the DB repositories, which are never
populated (no caller saves documents), so it fell back to bundled samples. The controller's
`refreshSkillAnalysis()` passed only a `user_id`, guaranteeing sample data. The bridge now
bypasses the DB and feeds the **in-memory parsed skills** (the same objects Phase 2/3
produced at upload time) into a new no-fallback backend entry point.

### Backend
- `app/recommendation/priority_ranking.py` — `compute_weighted_skill_gap` now also returns
  `required_count`, `preferred_count`, `required_match_pct`, `preferred_match_pct` (per-group
  matched ÷ group size × 100), so ring/bar/status/priority all share one source of truth.
- `app/recommendation/dashboard_service.py` — added
  `get_dashboard_data_for_skills(resume_skills, required_skills, preferred_skills, ...)`
  and `dashboard_json_for_skills(...)`: run Phase 4 semantic matcher + Phase 5 ranking on the
  supplied in-memory lists only, tag `data_source: "parsed_documents"`, and never sample-fall back.

### Bridge (`app/ui/app_controller.py`)
- `refreshSkillAnalysis()` is a no-op until `documentsReady` (resume AND JD parsed OK).
- `_run_skill_analysis()` builds skills from `_resume_data["skills"]` and splits the JD into
  required/preferred by reusing Phase 2/3 `extract_preferred_skills(cleaned_text)` (intersecting
  with the parser's skill list), then emits `skillAnalysisReady(dashboard_json_for_skills(...))`.
- Auto-runs on upload once both docs parse; clears `skillAnalysisJson` (→ empty state) when a
  new/cleared document is uploaded; new `analysisBusy` property + `analysisBusyChanged` signal
  drive the "Refreshing…" indicator.

### UI (`app/ui/qml/SkillAnalysis.qml`, `components/GapPriorityRow.qml`)
- Dynamic overview card: real Job Fit + Skills Matched rings, Required/Preferred HBarRows
  (labels include live counts), matched/partial/gap/total-JD legend from `root.data`.
- Priority Ranking lists every JD skill (required + preferred chips) sorted HIGH→MEDIUM→LOW;
  matched rows carry no badge.
- Bottom panels **Matched (X) / Partially Matched (Y) / Skill Gaps (Z)**, each row shows the
  same similarity % as its bar (bar width = min(pct,100)% of row width).
- Empty state when no analysis: "Upload a resume and job description to view your skill gap
  analysis." + "Go to Documents" CTA; "Analyzing your skills…" while analysis runs.
- `GapPriorityRow` gains a blue "Preferred" chip and elides long skill names.

### Layout-recursion fix (blank Skill Analysis page)
The page went blank with the real analysis: `GapPriorityRow.qml:28:13 QML RowLayout: Qt Quick Layouts:
Detected recursive rearrange. Aborting after two iterations.`
- **Root cause:** the skill-name `Text` used `Layout.maximumWidth: parent.width * 0.55` inside a
  `RowLayout`. The row's width distribution depends on child widths, while the child's max width
  depended on the row's width → circular rearrange → rows (and the whole page) failed to render.
- **Fix:** replaced with the stable `Layout.fillWidth: true` + `Layout.minimumWidth: 48` + `elide: Text.ElideRight`
  (content-derived widths only, long names elide without recursion).
- Also removed `anchors.verticalCenter` on the "Refreshing…" `Row` (child of the header `RowLayout`)
  and guarded `topRecommendation()` against a null payload (both produced extra QML warnings).
- **Verified:** offscreen window render of the real page with a 120-char skill name →
  `RECURSIVE_WARNINGS: NONE`; before the fix the exact reported warning reproduces. Full
  `validate_phase5.py` → `OVERALL_RESULT=PASS`; `main.py --selftest` → `SELFTEST_OK`.

### Validation (real end-to-end, one process)
```bash
# Two different resume/JD TXT combos through the REAL upload → parse → match → rank → QML path
.venv\Scripts\python.exe %TEMP%\opencode\validate_phase5.py
# → PART1_RESULT=PASS  (combo A: 60% fit / 60% matched / 2 HIGH gaps; combo B: 100% / 100%, all matched)
# → PART2_RESULT=PASS  (headless SkillAnalysis.qml render, models == backend counts, empty-state restores, no QML warnings)
```
- Combo A (Python/ML resume vs ML Engineer JD): 5 JD skills, 3 matched / 2 HIGH-required gaps
  (pytorch, kubernetes) → `job_fit=60.0`, `matched=60.0`, `required_match_pct=60.0`.
- Combo B (Java resume vs Full-Stack JD): 6 JD skills all matched → `job_fit=100.0`,
  `required_match_pct=100.0`, 0 gaps. Metrics, rankings, and totals differ between combos.
- Priority-matrix assertions: required+gap → HIGH, required+partial → MEDIUM, preferred+gap/partial →
  LOW, matched → no badge; counts sum to `total_jd_skills`; all `data_source == "parsed_documents"`.
- Regressions untouched: Gap F1 **0.857** (23 pairs), `python main.py --selftest` → **SELFTEST_OK**,
  CLI sample dashboard still 72.2/63.6.

---

## Next Phase
Phase 6: LLM Integration — Personalized Question Generation — needs the LLM API key, model choice, and prompt templates from the user.