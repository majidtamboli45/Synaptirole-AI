# CareerPilot AI — Project Development Plan

## Project Overview
CareerPilot AI is a Windows desktop application (PySide6 + QML) that helps candidates prepare for technical interviews by analyzing their resume against job descriptions, conducting AI-powered mock interviews with multimodal analysis (audio/video), and providing explainable performance reports with skill gap recommendations.

---

## Development Phases

### Phase 1: Foundation & Core Infrastructure
- Project structure setup (PySide6 + QML)
- Application packaging (PyInstaller)
- Configuration management
- Logging & error handling
- Basic navigation: Login → Dashboard

**Dependencies on User:**
- None

---

### Phase 2: Document Processing & Text Extraction
- Resume/JD upload UI (drag-drop, file picker)
- PyMuPDF integration for PDF parsing
- python-docx integration for DOCX parsing
- Text extraction pipeline with error handling
- Raw text output for both resume and JD

**Dependencies on User:**
- Sample resume PDFs (3-5)
- Sample JD PDFs/DOCX (3-5)
- Expected extracted fields for validation

---

### Phase 3: NLP & Skill Extraction
- spaCy pipeline setup (en_core_web_lg or similar)
- Custom NER for skills, education, experience, projects
- Entity normalization & deduplication
- Skill taxonomy mapping preparation

**Dependencies on User:**
- Labeled dataset: 50+ resumes with annotated skills/entities
- Skill synonym list (e.g., "NLP" = "Natural Language Processing")
- Domain-specific terms for software/ML roles

---

### Phase 4: Semantic Skill Matching
- Sentence-BERT integration (all-MiniLM-L6-v2 or similar)
- Embedding generation for resume skills + JD skills
- Cosine similarity computation
- Match classification: Matched / Partial / Gap
- ESCO/O*NET integration for skill standardization

**Dependencies on User:**
- ESCO/O*NET dataset download (provide links or local files)
- Ground truth matching pairs for evaluation (20+ resume-JD pairs)
- Threshold preferences for match/partial/gap classification

---

### Phase 5: Skill Gap Analysis & Dashboard Visualization
- Skill gap computation logic
- Priority ranking (HIGH/MEDIUM/LOW)
- Dashboard UI: Job Fit %, Matched Skills %, Skill Gaps count
- Visual components: progress bars, skill tags, priority badges

**Dependencies on User:**
- Priority weighting rules (e.g., required vs preferred skills)
- UI/UX preferences for gap visualization
- Color scheme / branding assets

---

### Phase 6: LLM Integration — Personalized Question Generation
- LLM provider abstraction (OpenAI / Llama 3 / Mistral)
- Prompt engineering for context-aware questions
- Input: Resume + JD + Matched Skills + Skill Gaps + Interview Context
- Output: Single personalized technical question
- Question history tracking for adaptive flow

**Dependencies on User:**
- **LLM API Key** (OpenAI / Together.ai / HuggingFace / local Llama)
- Preferred LLM model selection
- Prompt templates / style guidelines
- Example Q&A pairs for few-shot prompting (10-20)

---

### Phase 7: Adaptive Interview Logic
- Interview state machine (Initial → Follow-up / Advanced)
- Answer quality assessment (heuristic + LLM-based)
- Question selection strategy based on previous response
- Max questions / time limits configuration

**Dependencies on User:**
- Adaptive logic rules (when to follow-up vs advance)
- Interview duration / question count preferences
- Weak/Strong answer criteria definitions

---

### Phase 8: Audio Pipeline — Speech-to-Text & Prosody
- Microphone recording (PyAudio / sounddevice)
- Whisper integration (local: faster-whisper / openai-whisper)
- Librosa feature extraction: speaking rate, pauses, pitch, energy, filler words
- Transcript + audio features output

**Dependencies on User:**
- Whisper model size preference (tiny/base/small/medium/large)
- Audio sample rate / format requirements
- Filler word list for detection
- Test audio recordings (5-10 samples)

---

### Phase 9: Video Pipeline — Behavioral Analysis
- OpenCV webcam capture
- MediaPipe integration (Face Mesh, Pose, Hands)
- Landmark extraction per frame
- Metric computation: camera-facing %, posture stability, head/hand movement
- Real-time overlay / recording option

**Dependencies on User:**
- MediaPipe model selection (full/light)
- Frame rate / resolution requirements
- Threshold definitions for "good" vs "poor" metrics
- Test video recordings (5-10 samples)

---

### Phase 10: RAG — Technical Knowledge Verification
- Knowledge base construction (ESCO + O*NET + curated tech docs)
- Document chunking & embedding (Sentence-BERT)
- Vector store (FAISS / Chroma / local)
- Retriever + LLM verification pipeline
- Verification score output

**Dependencies on User:**
- **Curated technical documents** (PDFs, markdown) for knowledge base
- Verification prompt templates
- Ground truth Q&A for evaluation (20+ technical questions)
- Vector store preference (FAISS recommended for local)

---

### Phase 11: Feature Engineering & Fusion
- Multimodal feature vector construction:
  - Text/NLP: technical relevance, skill match
  - Audio: speaking rate, pauses, filler words, pitch, energy
  - Video: camera-facing, posture, head/hand movement
  - RAG: verification score
  - Skill relevance weight
- Feature normalization & scaling
- Feature store / serialization

**Dependencies on User:**
- Feature weight preferences (initial)
- Normalization strategy (min-max / z-score)
- Feature importance validation data

---

### Phase 12: XGBoost Scoring Model
- Training pipeline (data preparation, train/val/test split)
- XGBoost model training for interview scoring
- Multi-output: Technical, Communication, Audio, Visual, Knowledge, Overall
- Model persistence (joblib / pickle)
- Inference integration

**Dependencies on User:**
- **Labeled training dataset**: 200+ interview sessions with expert scores
- Score rubric / annotation guidelines
- Hyperparameter preferences (or use defaults)
- Cross-validation strategy

---

### Phase 13: SHAP Explainability
- SHAP integration (TreeExplainer for XGBoost)
- Feature contribution computation per prediction
- Positive / negative contributor classification
- Explainability UI components

**Dependencies on User:**
- Explanation format preferences (text, charts, both)
- Threshold for "significant" contribution
- UI mockups for explanation display

---

### Phase 14: Recommendation Engine
- Skill gap aggregation (resume + JD + interview results)
- Priority ranking algorithm
- Learning resource mapping (links to courses, docs)
- Recommendations UI

**Dependencies on User:**
- Learning resource catalog (URLs for skills: RAG, Docker, etc.)
- Priority weighting rules
- Recommendation display preferences

---

### Phase 15: Performance Report & Polish
- Complete report generation (PDF / in-app)
- All scores, gaps, explanations, recommendations
- End-to-end integration testing
- Bug fixes, performance optimization
- Final PyInstaller build & distribution

**Dependencies on User:**
- Report template / branding
- User acceptance testing (UAT) feedback
- Distribution requirements (installer, auto-update)

---

## Summary of User Dependencies

| Category | Items Needed |
|----------|--------------|
| **API Keys** | LLM provider (OpenAI / Together.ai / HuggingFace), optional: vector store cloud |
| **Datasets** | Labeled resumes (50+), Labeled interview sessions (200+), Resume-JD pairs (20+), Technical Q&A (20+), Test audio (10+), Test video (10+) |
| **Knowledge Base** | Curated technical documents (PDFs/markdown), ESCO/O*NET local files |
| **Configuration** | LLM model choice, Whisper model size, Thresholds for matching/scoring, Priority rules, Feature weights |
| **Assets** | UI branding (logo, colors), Learning resource URLs, Report template |
| **Validation** | Ground truth for skill extraction, matching, scoring, verification |

---

## Suggested Phase Execution Order

```
Phase 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 10 → 11 → 12 → 13 → 14 → 15
   │       │     │     │     │     │     │     │     │     │      │      │      │      │
   ▼       ▼     ▼     ▼     ▼     ▼     ▼     ▼     ▼     ▼      ▼      ▼      ▼      ▼
Found   Doc   NLP   Match  Gap   LLM   Adapt  Audio  Video  RAG   Fusion  XGBoost SHAP  Rec   Report
```

**Parallelizable:** Phase 8 (Audio) and Phase 9 (Video) can run in parallel after Phase 7.

---

## Next Steps
1. User provides dependencies for Phase 1-2 (sample documents)
2. Begin Phase 1 implementation
3. Iterate phase by phase with user validation at each checkpoint