# CareerPilot AI — User Storyline

## 1. Arjun Sharma Opens CareerPilot AI

Imagine a student, **Arjun Sharma**, is preparing for a software developer job.

Arjun launches the CareerPilot AI `.exe` application on his Windows laptop. He sees the login screen and enters his email and password.

```text
Open CareerPilot AI
        ↓
Login
        ↓
Dashboard
```

---

## 2. Arjun Sharma Reaches the Dashboard

The dashboard gives Arjun an overview of his career preparation.

He can see options such as:

- Resume + JD
- Skill Gap
- AI Interview
- Performance Report
- Settings

He decides to start by uploading his resume and the job description.

---

## 3. Arjun Sharma Uploads His Resume and JD

Arjun clicks **Resume + JD**.

He uploads:

```text
Arjun_Sharma_Resume.pdf
Software_Developer_JD.pdf
```

CareerPilot AI extracts the text from both documents.

```text
Resume
   ↓
Resume information + skills + experience

JD
   ↓
Required skills + job requirements
```

---

## 4. The System Compares Arjun's Skills with the Job

CareerPilot AI uses NLP and Sentence-BERT to understand the semantic relationship between Arjun's skills and the job requirements.

### Example

**Job requires:**

- ✓ Python
- ✓ Machine Learning
- ✓ SQL
- ✓ Docker
- ✓ RAG

**Arjun has:**

- ✓ Python
- ✓ Machine Learning
- ✓ SQL
- ✗ Docker
- ✗ RAG

The system identifies:

```text
Matched Skills:
Python, Machine Learning, SQL

Skill Gaps:
Docker, RAG
```

---

## 5. Arjun Sharma Sees His Skill Gap

CareerPilot AI presents the results visually.

### Example

```text
JOB FIT                    82%

Matched Skills             76%

Skill Gaps                   2

HIGH PRIORITY
→ RAG

MEDIUM PRIORITY
→ Docker
```

Arjun now knows what he needs to improve before attending the interview.

---

## 6. Arjun Sharma Starts the AI Interview

Arjun clicks **Start AI Interview**.

The system already knows:

- His resume
- Target job
- Matched skills
- Missing skills

Instead of asking completely generic questions, the LLM generates questions based on his profile and target role.

### Example

**Question:**

> Explain how you would implement a Retrieval-Augmented Generation system for a technical chatbot.

The question appears as a **text pop-up** on the screen.

There is **no AI voice asking the question**.

---

## 7. Arjun Sharma Answers the Question

Arjun clicks **Start Answer**.

The camera and microphone start recording. He gives his answer naturally.

```text
                 Arjun
              /         \
        Microphone       Camera
             ↓              ↓
           Audio          Video
```

The system records the candidate's **audio + video** while he answers.

---

## 8. CareerPilot AI Analyzes His Audio

The audio is processed to understand speech characteristics.

```text
Audio
  ↓
Speech-to-text
  ↓
Transcript

Audio features
  ↓
Speaking rate
Pauses
Filler words
Pitch
Energy
```

The system can determine things such as whether Arjun speaks too quickly, has excessive pauses, or frequently uses filler words.

---

## 9. CareerPilot AI Analyzes His Video

At the same time, the video is processed using **OpenCV + MediaPipe**.

The system extracts landmarks and calculates measurable features related to:

- Eye/Gaze
- Head movement
- Shoulder alignment
- Hand movement
- Posture
- Camera-facing orientation

### Example

```text
Camera-facing orientation → 82%
Posture stability        → 88%
Hand movement            → Moderate
Head movement            → Stable
```

These values are computed from the detected landmarks rather than manually assigned.

---

## 10. The Answer Is Technically Verified

Arjun says:

> "RAG first retrieves relevant documents and then gives them to the LLM as context..."

CareerPilot AI uses its RAG knowledge base containing sources such as **O*NET, ESCO and curated technical/interview material**.

The system retrieves relevant information and checks the answer's technical concepts.

```text
Arjun's Answer
      ↓
Transcript
      ↓
Retrieve relevant knowledge
      ↓
RAG + LLM
      ↓
Technical verification
```

---

## 11. The System Evaluates the Complete Interview Response

Now CareerPilot AI has multiple types of information:

```text
Text/NLP
    +
Audio
    +
Video
    +
RAG verification
    +
Skill relevance
```

These features are combined and passed to the **XGBoost scoring model**.

The system produces an overall assessment.

### Example

```text
Technical Answer        87
Communication           79
Audio                   81
Visual                  85
Knowledge Verification  90
                         ─────
Overall Score            84
```

---

## 12. Arjun Sharma Gets an Explainable Result

The system does not just tell Arjun:

> "Your score is 84."

Using **SHAP**, it explains which factors contributed to the result.

### Why Your Score Is 84

**Positive:**

- ✓ Strong technical relevance
- ✓ Good knowledge verification
- ✓ Stable posture

**Needs improvement:**

- ⚠ Frequent filler words
- ⚠ Incomplete technical explanation

This makes the assessment more transparent and understandable.

---

## 13. Arjun Sharma Receives His Areas of Improvement

Finally, CareerPilot AI identifies the areas Arjun should work on.

### Areas of Improvement

```text
1. RAG fundamentals       HIGH
2. Technical explanation  HIGH
3. Communication fluency MEDIUM
4. Docker                 MEDIUM
```

The system can then suggest learning priorities based on these gaps.

---

## 14. Arjun Sharma Checks His Performance Report

Arjun opens **Performance Report**.

He can see:

```text
────────────────────────────
      PERFORMANCE REPORT
────────────────────────────

Overall Score              84

Technical                  87
Communication              79
Audio                      81
Visual                     85
Knowledge                  90

Skill Match                76%

Skill Gaps                  2

Areas of Improvement
→ RAG
→ Docker
→ Technical communication
────────────────────────────
```

Now Arjun understands where he stands and what he should improve.

---

# Complete User Journey

The entire project can be explained in the presentation using this single storyline:

```text
USER
 ↓
Opens CareerPilot AI
 ↓
LOGIN
 ↓
DASHBOARD
 ↓
Uploads Resume + Job Description
 ↓
Resume/JD Analysis
 ↓
Skill Extraction
 ↓
Semantic Skill Matching
 ↓
Skill Gap Identification
 ↓
Starts AI Interview
 ↓
Personalized Text Question Appears
 ↓
Candidate Speaks
(Audio + Video)
 ↓
 ┌───────────────┬────────────────┐
 ↓               ↓
Audio Analysis   Video Analysis
 ↓               ↓
Whisper/         OpenCV +
Librosa          MediaPipe
 ↓               ↓
 └───────────────┴────────────────┘
                 ↓
         RAG Knowledge Verification
                 ↓
            Feature Fusion
                 ↓
              XGBoost
                 ↓
                SHAP
                 ↓
         PERFORMANCE REPORT
                 ↓
          SKILL GAP ANALYSIS
                 ↓
       AREAS OF IMPROVEMENT
                 ↓
        LEARNING PRIORITIES
```

# One-Line Storyline for Viva

> "The user uploads a resume and target job description, CareerPilot AI identifies the skill gaps, conducts a personalized text-based AI interview, analyzes the candidate's audio and video responses, verifies technical knowledge using RAG, evaluates the combined features using XGBoost, explains the score using SHAP, and finally provides a performance report with skill gaps and areas of improvement."
