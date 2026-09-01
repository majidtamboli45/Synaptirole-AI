# CareerPilot AI — Prototype Development Plan

## Prototype Goal
End-to-end working demo: Upload resume + JD → See skill gaps → Answer 3-5 LLM-generated questions → Get a scored report. **Text-only, no audio/video, no ML training.**

---

## Prototype Scope (5 Phases)

### Phase 1: App Shell & Navigation (2-3 days)
- PySide6 + QML project structure
- Screens: Login → Dashboard → Resume/JD Upload → Interview → Report
- Basic state management (user session, current interview)
- PyInstaller build config

**Dependencies:** None

---

### Phase 2: Document Parsing (2-3 days)
- File picker (PDF/DOCX) for resume and JD
- PyMuPDF + python-docx extraction
- Display extracted text preview
- Error handling for corrupt/unsupported files

**Dependencies from you:**
- 3-5 sample resume PDFs/DOCX
- 3-5 sample JD PDFs/DOCX

---

### Phase 3: Skill Extraction & Gap Analysis (3-4 days)
- spaCy `en_core_web_lg` for NER
- Skill keyword dictionary (software/ML/DS roles)
- Extract: skills, education, experience, projects
- Simple gap logic: JD skills − Resume skills = Gaps
- Dashboard: Matched skills, Missing skills, Job Fit %

**Dependencies from you:**
- Skill keyword list (or I'll use a default: Python, SQL, ML, Docker, Kubernetes, AWS, React, etc.)

---

### Phase 4: LLM Interview Questions (2-3 days)
- LLM client wrapper (OpenAI / Together.ai / local)
- Prompt template:
  ```
  Resume: {resume_summary}
  JD: {jd_summary}
  Matched: {matched_skills}
  Gaps: {gap_skills}
  Previous Q&A: {history}
  Generate 1 technical interview question targeting a gap area.
  ```
- Fixed 5-question flow (no adaptive logic)
- Display question as text pop-up
- Capture text answer (textarea)

**Dependencies from you:**
- **LLM API key** (OpenAI / Together.ai / HuggingFace)
- Preferred model (gpt-4o-mini, llama-3.1-8b, etc.)

---

### Phase 5: Scoring & Report (2-3 days)
- Rule-based scoring per answer:
  - Keyword coverage (gap skills mentioned) — 40%
  - Answer length / detail — 20%
  - LLM self-evaluation prompt — 40%
- Aggregate: Technical, Communication, Overall
- Report screen: Scores + Skill gaps + Answer transcripts
- In-app display (no PDF export)

**Dependencies:** None

---

## Timeline: 11-16 days (2-3 weeks)

```
Week 1: Phase 1 → Phase 2 → Phase 3
Week 2: Phase 3 → Phase 4 → Phase 5
Week 3: Integration, bug fixes, build .exe
```

---

## What's Excluded (Full Version Only)
| Feature | Prototype | Full Version |
|---------|-----------|--------------|
| Audio recording (Whisper) | ❌ | ✅ Phase 8 |
| Video analysis (MediaPipe) | ❌ | ✅ Phase 9 |
| Sentence-BERT semantic matching | ❌ | ✅ Phase 4 |
| ESCO/O*NET standardization | ❌ | ✅ Phase 4 |
| Adaptive question logic | ❌ | ✅ Phase 7 |
| RAG technical verification | ❌ | ✅ Phase 10 |
| XGBoost trained scoring | ❌ | ✅ Phase 12 |
| SHAP explainability | ❌ | ✅ Phase 13 |
| PDF report export | ❌ | ✅ Phase 15 |
| Learning recommendations | ❌ | ✅ Phase 14 |

---

## Your Action Items (Before Start)

| Item | When Needed |
|------|-------------|
| LLM API key | Phase 4 (Day 7-8) |
| 3-5 resume samples | Phase 2 (Day 3-4) |
| 3-5 JD samples | Phase 2 (Day 3-4) |
| Skill keyword list (optional) | Phase 3 (Day 5-6) |

---

## Next Step
Provide the 4 items above → I'll start Phase 1 implementation.