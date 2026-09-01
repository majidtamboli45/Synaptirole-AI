# CareerPilot AI — Technology Working

## 1. PySide6 + QML — Desktop Application

**Purpose:** Creates the Windows desktop interface.

```text
User
 ↓
PySide6 + QML
 ↓
Login → Dashboard → Resume/JD → Interview → Report
```

PySide6 handles the Python–Qt application, while QML creates the interactive UI. The final application will be packaged as a Windows `.exe` using PyInstaller.

---

## 2. PyMuPDF + python-docx — Resume/JD Processing

**Purpose:** Extracts text from uploaded documents.

```text
Resume.pdf / Resume.docx
          ↓
   PyMuPDF / python-docx
          ↓
      Raw Text
```

The same process is used for the Job Description.

**Output:**
- **Resume:** education, experience, projects, skills
- **JD:** requirements, responsibilities, required skills

---

## 3. NLP + spaCy — Information Extraction

**Purpose:** Processes extracted text and identifies important information.

```text
Resume/JD Text
      ↓
     NLP
      ↓
spaCy preprocessing
      ↓
Entities + Skills + Important terms
```

For example:

> "Experienced Python developer with Machine Learning and SQL experience."

The system identifies:

```text
Python
Machine Learning
SQL
```

---

## 4. Sentence-BERT — Semantic Skill Matching

This is important because the system should not rely only on exact keywords.

```text
Resume Skills              JD Skills
     ↓                         ↓
     └──── Sentence-BERT ──────┘
                  ↓
        Semantic Embeddings
                  ↓
          Similarity Score
                  ↓
       Matched / Partial / Gap
```

For example:

```text
Resume: Natural Language Processing
JD:     NLP
```

Sentence-BERT understands the semantic similarity between the two terms and can identify them as a match.

---

## 5. ESCO + O*NET — Skill/Occupation Knowledge

ESCO and O*NET provide standardized information about skills and occupations.

```text
Resume/JD
   ↓
Extracted skills
   ↓
ESCO / O*NET
   ↓
Standardized skill information
   ↓
Skill matching + skill-gap analysis
```

They can also support the knowledge base used by recommendation and RAG components.

---

## 6. LLM — Personalized Interview Questions

The LLM receives context rather than simply generating random questions.

```text
Input to LLM

Resume
   +
Job Description
   +
Matched Skills
   +
Skill Gaps
   +
Previous Answer / Interview Context
   ↓
  LLM
   ↓
Personalized interview question
```

Possible LLMs include:
- OpenAI GPT
- Llama 3
- Mistral

**Example:**

```text
Skill Gap = RAG
        ↓
       LLM
        ↓
"Explain how Retrieval-Augmented Generation
can improve the reliability of an LLM-based system."
```

The question is displayed as a text pop-up.

---

## 7. Adaptive Interview — Question Selection

The interview is not simply a fixed sequence of questions.

```text
Resume + JD
      ↓
Initial question
      ↓
Candidate answer
      ↓
Answer analysis
      ↓
Next question
```

### Weak Answer

```text
Weak answer
   ↓
Follow-up question
```

### Strong Answer

```text
Strong answer
   ↓
More advanced question
```

The LLM and interview logic work together to adapt subsequent questions according to the candidate's previous response.

---

## 8. Microphone + Whisper — Speech-to-Text

During the interview:

```text
Candidate speaks
       ↓
Microphone
       ↓
Audio recording
       ↓
Whisper
       ↓
Text transcript
```

**Example:**

Audio:

> "I would use RAG to retrieve relevant documents..."

Transcript:

> "I would use RAG to retrieve relevant documents..."

The transcript can then be passed to the NLP, LLM and RAG pipeline.

---

## 9. Librosa — Audio Analysis

Whisper identifies **what** the candidate said. Librosa helps analyze **how** the candidate spoke.

```text
Recorded Audio
      ↓
    Librosa
      ↓
Audio Features
```

Possible features include:
- Speaking rate
- Pauses
- Pitch
- Energy
- Duration

Therefore:

```text
Whisper  → Speech content
Librosa  → Speech characteristics
```

---

## 10. OpenCV — Video Processing

OpenCV handles the camera/video stream.

```text
Webcam
  ↓
OpenCV
  ↓
Video Frames
  ↓
Frame-by-frame processing
```

OpenCV provides video frames that are then analyzed using MediaPipe.

---

## 11. MediaPipe — Gesture/Landmark Analysis

MediaPipe detects body, face and hand landmarks.

```text
Video Frame
     ↓
  MediaPipe
     ↓
Landmark Detection
     ↓
 ┌────┼────────┬────────────┐
 ↓    ↓        ↓            ↓
Eyes  Head    Hands    Shoulders/Pose
```

From these landmarks, the application can calculate measurable features such as:
- Eye/camera orientation
- Head movement
- Hand movement
- Shoulder alignment
- Posture stability

**Example:**

```text
Landmarks
   ↓
Calculate movement/orientation
   ↓
Camera-facing = 82%
Posture stability = 88%
Hand movement = Moderate
```

MediaPipe itself is not a trained scoring model for interview quality. It provides landmark detection; the application calculates behavioral metrics from those landmarks.

---

## 12. RAG — Technical Knowledge Verification

RAG is used to verify the candidate's technical answer against the application's knowledge base.

```text
Candidate Answer
       ↓
    Transcript
       ↓
   Query/Search
       ↓
   Retriever
       ↓
Relevant Documents
       ↓
      LLM
       ↓
Technical Verification
```

The knowledge base can contain:
- ESCO
- O*NET
- Technical documents
- Curated interview/technical resources

**Example:**

```text
Candidate says:
"RAG retrieves external information before
generating the final answer."
          ↓
RAG retrieves relevant information
          ↓
LLM compares the answer with retrieved context
          ↓
Knowledge verification score
```

---

## 13. Feature Engineering — Combine Everything

The system collects information from different modalities.

```text
             Candidate
                 ↓
      ┌──────────┼──────────┐
      ↓          ↓          ↓
    Text       Audio       Video
      ↓          ↓          ↓
    NLP       Librosa    MediaPipe
      ↓          ↓          ↓
      └──────────┼──────────┘
                 ↓
         Feature Engineering
                 ↓
       Combined Feature Vector
```

Example features:
- Technical relevance
- Answer correctness
- Speaking rate
- Pause frequency
- Camera orientation
- Posture stability
- Hand movement
- RAG verification
- Skill relevance

---

## 14. XGBoost — Interview Scoring

The extracted features are given to the XGBoost model.

```text
Feature Vector
      ↓
    XGBoost
      ↓
Performance Prediction
      ↓
Overall Interview Score
```

For example:

```text
Technical       → 87
Communication   → 79
Audio           → 81
Visual          → 85
Knowledge       → 90
        ↓
Overall Score → 84
```

The exact scoring model and feature weights will be determined during model training and evaluation rather than simply assigning these numbers manually.

---

## 15. SHAP — Explainability

XGBoost produces the prediction, while SHAP helps explain why the system produced that prediction.

```text
XGBoost
   ↓
Prediction = 84
   ↓
SHAP
   ↓
Feature contribution
```

**Example:**

### Positive Contributors
- Strong technical answer
- Good knowledge verification
- Stable posture

### Negative Contributors
- Frequent pauses
- Incomplete explanation

Therefore, the system is not just predicting a score; it also explains the factors contributing to the prediction.

---

## 16. Recommendation Engine — Skill Gap + Learning Priority

Finally, the system combines resume skills, JD requirements and interview results.

```text
Resume Skills
      +
JD Requirements
      +
Interview Results
      ↓
Skill Gap Analysis
      ↓
Missing / Weak Skills
      ↓
Priority Ranking
      ↓
Areas of Improvement
      ↓
Learning Recommendations
```

**Example:**

```text
HIGH
→ RAG

MEDIUM
→ Docker

MEDIUM
→ Technical communication
```

---

# Complete Technology Working

```text
                    USER
                     │
                     ▼
              PySide6 + QML
                     │
                     ▼
             Resume + JD Upload
                     │
                     ▼
        PyMuPDF / python-docx
                     │
                     ▼
              NLP + spaCy
                     │
                     ▼
             Skill Extraction
                     │
                     ▼
       Sentence-BERT + ESCO/O*NET
                     │
                     ▼
             Skill Matching
                     │
                     ▼
             Skill Gap Analysis
                     │
                     ▼
              LLM (GPT /
          Llama 3 / Mistral)
                     │
                     ▼
        Personalized Text Question
                     │
                     ▼
           Candidate Speaks
             (Audio + Video)
                /        \
               /          \
              ▼            ▼
          Whisper       OpenCV
          Librosa          │
              │         MediaPipe
              │            │
              └─────┬──────┘
                    ▼
             Feature Extraction
                    │
                    ▼
              RAG Verification
                    │
                    ▼
              Feature Fusion
                    │
                    ▼
                 XGBoost
                    │
                    ▼
                  SHAP
                    │
                    ▼
           Performance Report
                    │
                    ▼
          Skill Gap + Areas of
             Improvement
                    │
                    ▼
          Learning Priorities
```

# Viva Explanation

> CareerPilot AI uses PySide6 and QML for the desktop interface. PyMuPDF and python-docx extract resume and job-description text, while NLP and Sentence-BERT perform semantic skill matching using standardized skill resources such as ESCO and O*NET. The LLM uses the resume, JD, skill gaps and interview context to generate personalized text-based questions. During the response, Whisper and Librosa analyze speech, while OpenCV and MediaPipe extract video and body-landmark features such as eye orientation, head movement, hand movement and posture. RAG verifies the technical content of the answer. These multimodal features are combined and evaluated using XGBoost, while SHAP explains the resulting score. Finally, the system generates a performance report, identifies skill gaps and provides areas of improvement and learning priorities.
