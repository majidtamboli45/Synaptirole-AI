## Required changes — Line by line

| Line No.Current contentChange required |                                                                         |                                                                                                                                                                              |
| -------------------------------------- | ----------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **54**                                 | Adaptive AI interview — generates personalized questions via OpenAI LLM | Change to **adaptive personalized text-based interview using a pretrained instruction-tuned LLM**                                                                            |
| **57**                                 | RAG against O\*NET/ESCO knowledge bases                                 | Expand to **RAG using O\*NET + ESCO + curated technical documentation**                                                                                                      |
| **60**                                 | Improvement recommendations                                             | Change to **Skill Gap Analysis and Areas of Improvement**                                                                                                                    |
| **62**                                 | Runs entirely on machine except OpenAI API calls                        | If using local LLM, change to **runs locally using pretrained models; OpenAI API is optional**                                                                               |
| **73**                                 | OpenAI API (`gpt-4o-mini`)                                              | Change to **Pretrained LLM — Mistral / Llama / Qwen; optional OpenAI GPT**                                                                                                   |
| **75**                                 | FAISS for skill/knowledge matching                                      | Keep, but clarify **FAISS is primarily used for RAG knowledge retrieval**; SBERT + cosine similarity handles skill matching                                                  |
| **78**                                 | MediaPipe + OpenCV: Face, gaze, hand, head pose, posture                | Remove generic **face/facial analysis**. Use **gaze/camera orientation, head movement, hand gestures, shoulder/posture**                                                     |
| **89–92**                              | OpenAI-specific LLM files                                               | Rename/modify to support a **generic pretrained LLM** instead of only OpenAI                                                                                                 |
| **121**                                | Weighted fusion of answer/audio/video/skill scores                      | **Remove weighted fusion as the final scoring mechanism.** XGBoost should be the final scoring model                                                                         |
| **122**                                | XGBoost regression model                                                | Keep — make it explicitly **final interview scoring model**                                                                                                                  |
| **132–134**                            | Recommendation module + learning recommendation                         | Rename conceptually to **Skill Gap & Improvement module**. Keep learning recommendations only if actually implemented                                                        |
| **146**                                | StackLayout (9 pages)                                                   | Keep only if these 9 pages actually exist in final UI                                                                                                                        |
| **187**                                | Interview setup and question history                                    | Change to **Interview setup and personalized interview configuration**; remove "question history" from UI description                                                        |
| **178**                                | O\*NET/ESCO                                                             | Keep                                                                                                                                                                         |
| **180**                                | `remember_token.json`                                                   | Keep if Remember Me is actually implemented                                                                                                                                  |
| **280**                                | InterviewQuestion contains `difficulty`                                 | Remove `difficulty` if difficulty is no longer part of your finalized interview profile                                                                                      |
| **388**                                | Sets difficulty level and total questions                               | **Remove difficulty level**. Change to: `Sets interview context and total questions`                                                                                         |
| **401**                                | LLM generates questions based on skill gaps                             | Keep, but specify **pretrained instruction-tuned LLM**                                                                                                                       |
| **409**                                | User speaks answer, audio + video captured                              | Keep — this matches your final architecture                                                                                                                                  |
| **410**                                | Answer is recorded, transcribed and scored                              | Keep                                                                                                                                                                         |
| **424**                                | Questions given skill gaps, role, difficulty level                      | Remove **difficulty level**                                                                                                                                                  |
| **429**                                | LLM scores answer 0–100                                                 | Change to **LLM evaluates language/answer quality; XGBoost produces final numerical interview score**                                                                        |
| **442**                                | RAG loads O\*NET + ESCO datasets                                        | Change to **O\*NET + ESCO + curated technical knowledge/documentation**                                                                                                      |
| **455**                                | verified / partially correct / incorrect                                | Keep                                                                                                                                                                         |
| **466**                                | Librosa features                                                        | Keep                                                                                                                                                                         |
| **467**                                | Whisper                                                                 | Keep                                                                                                                                                                         |
| **485–491**                            | Vision modules                                                          | Keep modules, but ensure there is **no facial-expression/emotion recognition**                                                                                               |
| **493–499**                            | Video features                                                          | Remove any implication of facial-expression analysis; retain **gaze/camera orientation, head movement, hand gestures, shoulder/posture**                                     |
| **511**                                | 13-dimensional feature vector                                           | **Do not hard-code 13 unless your implementation really uses exactly 13 features.** Better: "Build an engineered feature vector from text, audio, video and skill features." |
| **518**                                | Video features = gaze, posture, face orientation                        | Change to the finalized video features                                                                                                                                       |
| **520–527**                            | Weighted Fusion                                                         | **Remove this as the final scoring approach**                                                                                                                                |
| **530–534**                            | Answer 35%, Audio 20%, Video 20%, Skill 25%                             | Remove these manually fixed weights                                                                                                                                          |
| **539**                                | `(weighted_fusion + xgboost_prediction) / 2`                            | **Delete this formula**                                                                                                                                                      |
| **541**                                | XGBoost prediction averaged with weighted fusion                        | Change to **XGBoost directly generates the final interview score from engineered features**                                                                                  |
| **547–573**                            | 13-dimensional scoring description                                      | Rewrite around **feature engineering → XGBoost → final score**                                                                                                               |
| **606**                                | Learning resources                                                      | Keep only if learning-resource recommendation is actually implemented                                                                                                        |
| **669**                                | Google/GitHub social login creates dummy accounts                       | **Remove this from documentation unless real OAuth integration is implemented**                                                                                              |
| **697**                                | Interview setup and question history                                    | Change to **Interview setup and personalized question generation**                                                                                                           |
| **879**                                | Sets difficulty level                                                   | Remove                                                                                                                                                                       |
| **890**                                | Question generated via OpenAI LLM                                       | Change to **Question generated via pretrained instruction-tuned LLM**                                                                                                        |
| **903–904**                            | Weighted fusion + XGBoost                                               | Change to **XGBoost final scoring**                                                                                                                                          |
| **936–946**                            | Weighted Fusion + XGBoost                                               | Remove weighted fusion branch                                                                                                                                                |
| **949**                                | `(fusion + xgboost) / 2`                                                | Delete                                                                                                                                                                       |
| **950–958**                            | Final score based on fusion + XGBoost                                   | Replace with **XGBoost → Final Interview Score → SHAP**                                                                                                                      |

The exact current scoring section confirms that the document currently uses both weighted fusion and XGBoost, including the averaging formula.

---

# Most important changes

### 1. LLM — Lines 73–74

**Current:**

```
```

```
LLM | OpenAI API (gpt-4o-mini)
```

**Change to:**

```
```

```
LLM | Pretrained Instruction-Tuned LLM
     | Mistral / Llama / Qwen
     | Optional: OpenAI GPT API
```

Purpose:

```
```

```
Personalized Question Generation
+
Answer Evaluation
+
RAG-based Technical Verification
```

This makes the architecture consistent with your plan to use a pretrained model rather than claiming that you trained an LLM. 

---

### 2. Skill matching — Lines 75–76

**Current:**

```
```

```
Sentence-BERT
FAISS
```

Change the explanation to:

```
```

```
Sentence-BERT (SBERT)
        ↓
Skill Embeddings
        ↓
Cosine Similarity
        ↓
Matched / Partial / Missing Skills
```

Use:

```
```

```
FAISS → RAG knowledge retrieval
SBERT + Cosine Similarity → Resume-JD skill matching
```

This distinction is important.

---

### 3. Vision — Lines 78 and 493–499

Your current documentation still describes broader face analysis. 

Change to:

```
```

```
Vision | OpenCV + MediaPipe
Purpose |
• Camera/Gaze Orientation
• Head Movement
• Hand Gestures
• Shoulder/Posture Analysis
```

**Do NOT include:**

```
```

```
Facial Expression
Emotion Recognition
FER-2013
```

---

### 4. Difficulty — Lines 388 and 424

Current:

```
```

```
Sets difficulty level and total questions
```

Change to:

```
```

```
Loads resume, JD, skill-gap and interview context
Sets total number of questions
```

And:

```
```

```
question_generator.py
Generates personalized questions based on:
• Resume
• Job Description
• Matched Skills
• Skill Gaps
• Target Role
• Previous Answer Context
```

No `difficulty` parameter.

The current file explicitly contains both the `difficulty level` parameter and initialization step. 

---

# 5. Scoring — Biggest correction

Your current codebase documentation says:

```
```

```
Weighted Fusion
       +
XGBoost
       ↓
Average
       ↓
Final Score
```

This is the part I strongly recommend changing.

### Current lines 520–541

Remove:

```
```

```
Answer Quality = 35%
Audio = 20%
Video = 20%
Skill Match = 25%
```

and remove:

```
```

```
final_score =
(weighted_fusion + xgboost_prediction) / 2
```

The current documentation explicitly specifies this formula. 

### Replace with:

```
```

```
Answer Features
       +
Audio Features
       +
Video Features
       +
Skill Match Features
       +
RAG Verification Features
       ↓
Feature Engineering
       ↓
XGBoost
       ↓
Final Interview Score
       ↓
SHAP
       ↓
Explanation
```

This is much cleaner for your research methodology because **XGBoost is the learned scoring model**, rather than mixing a manually weighted score with an ML prediction.

---

# 6. "13-dimensional feature vector" — Lines 511 and 561

Currently the document says exactly:

> Builds a 13-dimensional feature vector. 

I recommend changing it to:

```
```

```
feature_engineering.py
# Builds an engineered feature vector from:
# • Answer quality
# • Audio characteristics
# • Video/behavioral features
# • Skill match
# • RAG verification
```

Why?

Your documented video module currently lists **five** video characteristics, while the scoring section says only **three** video features. 

So the fixed "13-dimensional" claim can create an inconsistency during your viva.

---

# 7. RAG — Lines 442–455

Current:

```
```

```
O*NET + ESCO
```

Change to:

```
```

```
RAG Knowledge Base
├── O*NET
├── ESCO
├── Curated Technical Documentation
└── Interview/Technical Reference Material
```

Flow:

```
```

```
Candidate Answer
       ↓
Embedding
       ↓
FAISS Retrieval
       ↓
Relevant Knowledge
       ↓
LLM Verification
       ↓
Verified / Partially Correct / Incorrect
```

This matches your intended use of RAG for **technical answer verification**.

---

# 8. UI — Line 697

Current:

```
```

```
Interview | Interview setup and question history
```

Change to:

```
```

```
Interview | Interview setup and personalized question generation
```

Your final system should not emphasize a "question history" feature unless you actually want that feature.

---

# 9. Social Login — Line 669

Current:

```
```

```
loginWithGoogle() / loginWithGitHub()
— social login (creates dummy accounts)
```

This should either be **removed** or changed to:

```
```

```
Social login — optional future enhancement
```

Do not document dummy Google/GitHub accounts as an actual implemented authentication mechanism. 

---

# 10. Recommendation Module — Lines 606 onward

Current:

```
```

```
learning_recommendation.py
Suggests learning resources
```

If your final scope is:

```
```

```
Performance Report
├── Overall Score
├── Section-wise Performance
├── Strengths
├── Weaknesses
├── Skill Gap Analysis
└── Areas of Improvement
```

then rename the module conceptually to:

```
```

```
Improvement Module
├── skill_gap_analysis.py
└── improvement_engine.py
```

Keep `learning_recommendation.py` **only if you are actually implementing learning-resource recommendations**.

---

## Final corrected scoring section

I recommend replacing the current **Lines 503–541** with this structure:

```
```

```
## 16. Scoring Module

This module generates the final interview performance score using
engineered multimodal features and XGBoost.

Files:
- feature_engineering.py
- xgboost_model.py
- final_score.py

Feature Sources:
- LLM-based answer evaluation
- Audio features from Librosa
- Video/behavioral features from OpenCV + MediaPipe
- Resume-JD skill match score
- RAG verification results

Flow:

Answer Analysis
       +
Audio Analysis
       +
Video Analysis
       +
Skill Gap / Matching
       +
RAG Verification
       ↓
Feature Engineering
       ↓
XGBoost
       ↓
Final Interview Score
       ↓
SHAP Explainability
```

---

## Final priority list

If you are editing the file now, make these changes **first**:

**🔴 Must change**

1. **Line 73** — OpenAI-only LLM → pretrained LLM. 
2. **Line 78** — remove facial analysis wording. 
3. **Line 121** — remove weighted fusion. 
4. **Lines 511 onward** — fix 13-dimensional feature inconsistency. 
5. **Lines 530–541** — remove manual weights and averaging formula. 
6. **Line 388** — remove difficulty. 
7. **Line 424** — remove difficulty. 
8. **Lines 442–446** — expand RAG knowledge base. 
9. **Lines 493–499** — finalize video features. 
10. **Line 697** — remove question-history wording. 

**🟡 Should change**

11\. Line 60 — improvement recommendations → **Skill Gap Analysis + Areas of Improvement**.

12\. Line 62 — clarify local vs OpenAI deployment.

13\. Line 669 — remove dummy social login.

14\. Lines 606 onward — keep learning recommendations only if implemented.