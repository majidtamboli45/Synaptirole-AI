# SynaptiRole AI --- Video Interview Page Specification

## 1. Document Purpose

This document defines the functional, visual, UX, and implementation
requirements for the **SynaptiRole AI Video Interview page**.

It is intended to be used as a product/design implementation reference
by **Antigravity / OpenAI project tooling**. The implementation should
follow this document as the source of truth for the interview page.

The page is an **AI-led video mock interview experience**. The candidate
is being interviewed by an AI interviewer, while the candidate's camera
and microphone are active. The experience should feel like a real
structured interview rather than a normal video-call application.

------------------------------------------------------------------------

# 2. Critical Scope Rule

## Sidebar MUST NOT be redesigned

The existing left sidebar is an established part of the SynaptiRole AI
product and must remain visually and structurally unchanged.

Do not: - Change the sidebar width. - Change the SynaptiRole AI logo. -
Change logo placement. - Change navigation labels. - Change navigation
icons. - Change the active "Mock Interviews" state. - Change the user
profile section. - Change "Arjun Sharma". - Change the "AI/ML Engineer"
role label. - Change Logout placement. - Add new sidebar navigation
items. - Remove sidebar navigation items. - Reorganize sidebar
content. - Change the sidebar color system.

The design work in this specification applies to the **Video Interview
workspace only**.

------------------------------------------------------------------------

# 3. Product Context

## Product

**SynaptiRole AI**

## Page

**Video Interview**

## Interview Type

**AI/ML Engineer Mock Interview**

## Interview Mode

AI-led video interview.

The AI asks questions and the candidate answers through the webcam and
microphone.

The interface should communicate: - The AI is currently conducting the
interview. - The candidate is being recorded. - The interview has a
defined number of questions. - The current question and difficulty are
visible. - The candidate can see system/device readiness. - The
candidate can navigate the interview where appropriate. - The interface
should remain calm and professional while the candidate is answering.

------------------------------------------------------------------------

# 4. Design Philosophy

The page should feel like a combination of:

1.  A professional technical interview.
2.  A modern AI interview assistant.
3.  A focused video-recording experience.

It should NOT feel like: - Zoom. - Google Meet. - Microsoft Teams. - A
generic webcam recorder. - A chatbot. - A dashboard overloaded with
analytics.

The candidate's face and the current interview question are the primary
focus.

The UI should provide useful context without distracting the candidate
while answering.

------------------------------------------------------------------------

# 5. Overall Layout

The page uses a three-part application structure:

``` text
---------------------------------------------------------
| Sidebar |              Interview Workspace            |
|         |----------------------------------------------|
|         | Top Header                                   |
|         |----------------------------------------------|
|         | Question / AI Interviewer | Progress         |
|         |---------------------------|-----------------|
|         |                           | Assistant        |
|         | Video                     | Status           |
|         |                           | Navigation       |
|         |---------------------------|-----------------|
|         | Tip / Security Notice                       |
---------------------------------------------------------
```

The sidebar remains fixed.

The interview workspace occupies the remaining viewport.

The center area should receive the majority of visual attention.

The right side should contain supporting information only.

------------------------------------------------------------------------

# 6. Top Header

The top header represents the active interview session.

## Left side

Display:

**Video Interview**

Under it:

**AI/ML Engineer Mock Interview**

A video-camera style icon appears next to the title.

### Purpose

This establishes: - What the user is currently doing. - What role the
interview is for. - That this is a live video interview.

------------------------------------------------------------------------

# 7. Interview Controls in Header

The header contains three important session indicators/actions.

## End Interview

A clearly visible but non-primary red outlined button:

**End Interview**

Purpose: - Allows the candidate to intentionally stop the interview. -
Red is used because ending the interview is a destructive/high-impact
action.

Do not make it visually dominant over the interview itself.

------------------------------------------------------------------------

## Interview Timer

Display the elapsed interview time.

Example:

**00:12:34**

The timer should visually communicate that the interview is active.

It should continue updating while the interview is running.

------------------------------------------------------------------------

## Recording Status

Display:

**Recording**

with a small green status indicator.

Purpose: - Clearly informs the candidate that recording is active. -
Avoids ambiguity about whether the webcam session is being recorded.

------------------------------------------------------------------------

# 8. AI Interviewer Question Card

This is one of the most important sections of the page.

The AI interviewer question appears above the candidate's video.

## Header

Show an AI/person symbol next to:

**AI Interviewer**

Do NOT use a named human interviewer.

Do NOT display names such as: - Maya - Sarah - John - Senior Software
Engineer - Senior AI/ML Interviewer

The interviewer is an AI, so the interface should clearly represent it
as an AI rather than pretending a real human is conducting the
interview.

------------------------------------------------------------------------

# 9. AI Speaking Indicator

The AI interviewer should have a simple abstract human-head/person
symbol.

The symbol should communicate that the AI interviewer is currently
speaking.

Next to or around the symbol, use animated dots:

``` text
● ● ●
```

The dots should animate while the AI is speaking.

Example state:

**AI Interviewer is speaking...**

The purpose is to make the AI interaction feel conversational without
introducing an unnecessary avatar identity.

### Important

Do not use a realistic human portrait for the AI interviewer.

The user should immediately understand:

> "The AI is speaking to me."

------------------------------------------------------------------------

# 10. Question Number

Display:

**Question 3 of 10**

This indicates: - Current question = 3 - Total questions = 10

The progress information should remain visible throughout the interview.

------------------------------------------------------------------------

# 11. Question Difficulty

Display only:

**Medium**

Do NOT add unnecessary skill/category tags such as: - Machine Learning -
Supervised Learning - Neural Networks - Classification - Regression

The reason is that the interview already establishes the role as AI/ML
Engineer, and excessive tags create visual clutter.

The difficulty indicator exists to give the candidate context about the
level of the current question.

------------------------------------------------------------------------

# 12. Interview Question

Example:

> Can you explain the difference between classification and regression
> in machine learning? Provide an example of each.

The question should: - Be highly readable. - Have strong typography. -
Have sufficient line spacing. - Occupy a clear visual area. - Never
compete visually with the candidate's video.

The question is the primary piece of information the candidate needs
before answering.

------------------------------------------------------------------------

# 13. Candidate Video Section

The candidate video is the largest component of the workspace.

Title:

**Your Video**

The video area should have: - Rounded corners. - Clear boundaries. -
Large viewing area. - Professional neutral background. - Live
indicator. - Fullscreen control. - Bottom recording controls.

The candidate should remain visually centered.

------------------------------------------------------------------------

# 14. Live Indicator

Inside the video:

**LIVE**

with a green indicator.

Purpose: - Confirms the camera feed is live. - Makes the recording state
obvious.

------------------------------------------------------------------------

# 15. Fullscreen Control

A fullscreen icon should appear in the upper-right corner of the video.

Purpose: - Allows the candidate to expand the video if desired. - Useful
for users who want a more focused interview experience.

------------------------------------------------------------------------

# 16. Video Control Bar

A dark translucent control bar sits at the bottom of the video.

It contains:

## Microphone

-   Microphone icon.
-   Active state indicator.
-   Optional small dropdown/control indicator.

Purpose: - Shows that the microphone is active. - Allows the candidate
to manage microphone settings.

## Camera

-   Camera icon.
-   Active state indicator.
-   Optional small dropdown/control indicator.

Purpose: - Shows that the webcam is active. - Allows camera controls.

## Recording State

Center the active recording indicator:

**Recording...**

with a red dot.

This is intentionally different from the header recording status: -
Header = persistent session status. - Video control = immediate
recording control context.

## Answer Timer

Show elapsed answer time.

Example:

**00:12**

This should represent how long the candidate has been answering the
current question.

This is more useful than showing only the overall interview timer.

## Settings

A settings/gear icon provides interview/video settings.

Potential settings: - Camera selection. - Microphone selection. -
Speaker selection. - Video quality. - Audio test.

Do not open these controls automatically.

------------------------------------------------------------------------

# 17. Interview Assistant Panel

The right side should contain an **Interview Assistant** panel.

This replaces unnecessary analytics during the live interview.

The panel should provide real-time interview-state information.

Suggested states:

### AI Interviewer is speaking

Icon + text:

**AI Interviewer is speaking**

Secondary text:

**Please listen carefully...**

This is useful because the candidate needs to know when the AI has
finished asking the question.

------------------------------------------------------------------------

### You speak

Icon + text:

**You speak**

Secondary text:

**Answer when you are ready**

This communicates the transition from AI speaking to candidate
answering.

------------------------------------------------------------------------

### Recording in progress

Icon + text:

**Recording in progress**

Secondary text:

**Your answer is being recorded**

This reinforces the recording state without distracting the candidate.

------------------------------------------------------------------------

### Answer submission

Icon + text:

**Answer will auto-submit**

Secondary text:

**When time is up**

This communicates the expected interview behavior clearly.

If the product later supports manual submission, this text can become
dynamic.

------------------------------------------------------------------------

# 18. Why the Interview Assistant Exists

The assistant panel is not an AI coaching system.

It should NOT: - Suggest answers. - Give technical hints. - Tell the
candidate what to say. - Display answer structure. - Display
transcripts. - Score the candidate during the answer. - Show performance
analytics.

Its purpose is simply to communicate the current interview state.

This keeps the experience close to a real interview.

------------------------------------------------------------------------

# 19. No Answer Structure Guide

Do NOT add an "Answer Structure Guide".

Do NOT show: - Definition - Key Difference - Example - Summary -
Suggested answer points - AI answer hints

Reason:

The candidate is supposed to answer independently.

Providing an answer structure during the interview could influence the
candidate's response and make the mock interview less realistic.

------------------------------------------------------------------------

# 20. No Preparation Timer

Do NOT add a preparation countdown or thinking timer.

The interview should behave like a normal conversational interview
unless the interview configuration specifically requires a preparation
period.

------------------------------------------------------------------------

# 21. No Live Transcript

Do NOT display a transcript panel.

Reasons: - It consumes valuable screen space. - It distracts from the
candidate's interview. - It is not necessary for the live interview
experience. - Transcripts can be generated and shown later in the
interview report.

------------------------------------------------------------------------

# 22. No Live Performance Overview

Do NOT show: - Communication score. - Technical score. - Confidence
score. - Overall interview score. - Performance bars. - Real-time AI
evaluation.

These belong to the **post-interview report**, not the active interview.

Showing scores while the candidate is answering can create anxiety and
distract from the interview.

------------------------------------------------------------------------

# 23. Interview Progress Card

The right side should retain the interview progress card.

Example:

**Interview Progress --- 30%**

Progress bar.

Text:

**3 of 10 Questions Completed**

Additional information:

**Duration:** 40--45 Minutes

**Question Type:** AI Generated

**Difficulty:** Medium

The progress card gives the candidate high-level context without
revealing performance results.

------------------------------------------------------------------------

# 24. Audio & Video Status

Show a compact system-health panel.

Title:

**Audio & Video Status**

Rows:

### Microphone

Status: **Good**

### Camera

Status: **Good**

### Internet

Status: **Good**

Use green indicators for healthy states.

If a problem occurs, the relevant status should dynamically change.

Examples:

**Microphone --- Poor**

**Camera --- Not detected**

**Internet --- Unstable**

The system should make problems obvious before they affect the
interview.

------------------------------------------------------------------------

# 25. Question Navigation

The page should retain question navigation.

Display:

``` text
1  2  3  4  5  6  7  8  9  10
```

States: - Completed questions = green. - Current question = purple. -
Upcoming questions = neutral.

For the current example:

-   1 = completed
-   2 = completed
-   3 = current
-   4--10 = upcoming

------------------------------------------------------------------------

# 26. Previous / Next Controls

Bottom of Question Navigation:

**Previous**

and

**Next**

buttons.

The current interview state should determine whether these buttons are
enabled.

Important:

If the product rules require sequential interviews, future questions
should not be freely accessible.

The UI can visually support navigation while the backend controls
whether skipping is allowed.

------------------------------------------------------------------------

# 27. Interview Tip

Below the video:

**Tip: Look at the camera while speaking. Ensure you are in a quiet
place with good lighting.**

Purpose: - Helpful candidate guidance. - Non-intrusive. - Focused on
video interview quality.

Tips can rotate depending on the interview state.

Examples: - Maintain eye contact with the camera. - Speak clearly. -
Avoid background noise. - Take a moment before answering. - Keep your
face well lit.

Do not provide technical-answer hints here.

------------------------------------------------------------------------

# 28. Security / Privacy Notice

At the bottom of the main workspace:

**Your interview is secure and private. Please do not refresh or close
the window during the interview.**

Purpose: - Reassures the candidate. - Prevents accidental navigation
away from the interview. - Explains why the session should remain open.

Use a shield/security icon.

------------------------------------------------------------------------

# 29. Real-Time Interview States

The UI should be state-driven.

## State A --- AI Speaking

``` text
AI Interviewer
● ● ●
AI Interviewer is speaking...
```

Candidate video may remain visible.

The answer recording state should reflect the configured behavior.

------------------------------------------------------------------------

## State B --- Candidate Answering

``` text
AI Interviewer
Ready for your answer

Recording...
00:12
```

The candidate is now expected to answer.

------------------------------------------------------------------------

## State C --- Answer Completed

The interface can briefly indicate:

``` text
Answer captured
Moving to next question...
```

Then transition to the next question.

------------------------------------------------------------------------

## State D --- Technical Issue

If the microphone/camera/internet has an issue, show a clear warning.

Example:

``` text
Microphone issue detected
Please check your microphone settings.
```

Do not hide critical technical problems inside a small notification.

------------------------------------------------------------------------

# 30. Animation Guidelines

Animations should be subtle.

Recommended animations: - AI speaking dots. - Recording indicator
pulse. - Progress transitions. - Button hover states. - Question
transitions. - Status changes.

Avoid: - Large distracting animations. - Excessive gradients. - Floating
decorative objects. - Constant movement around the candidate video.

The candidate needs concentration.

------------------------------------------------------------------------

# 31. Visual Design System

## Primary color

Purple.

Use purple for: - Active navigation state. - AI indicators. - Current
question. - Primary actions. - Important interface highlights.

## Green

Use green for: - Good microphone. - Good camera. - Good internet. - Live
state. - Completed questions. - Recording availability/status where
appropriate.

## Red

Use red only for: - End Interview. - Active recording indicator. -
Errors/warnings where appropriate.

## Background

Light, clean background with white cards.

------------------------------------------------------------------------

# 32. Cards

Use: - Rounded corners. - Thin borders. - Very subtle shadows. -
Consistent internal padding.

Avoid excessive card nesting.

Each card should have a clear purpose.

------------------------------------------------------------------------

# 33. Typography

The question should have the strongest readable text hierarchy.

Recommended hierarchy:

``` text
Page title
↓
Question
↓
Section title
↓
Supporting information
↓
Status / helper text
```

Do not make secondary metadata visually louder than the actual interview
question.

------------------------------------------------------------------------

# 34. Responsive Behavior

The interview experience should remain usable on smaller screens.

Priority order:

1.  Interview question.
2.  Candidate video.
3.  Recording controls.
4.  Interview state.
5.  System status.
6.  Question navigation.
7.  Secondary tips.

On smaller screens, secondary panels can collapse into expandable
sections.

The sidebar should remain consistent with the existing product's
responsive strategy rather than being redesigned as part of this task.

------------------------------------------------------------------------

# 35. Accessibility

The implementation should support:

-   Keyboard navigation.
-   Visible focus states.
-   Accessible labels for microphone/camera/settings controls.
-   Sufficient text contrast.
-   Status information that is not communicated only through color.
-   Clear error messages.
-   Large enough interactive targets.

Examples:

Instead of communicating only:

``` text
●
```

also provide:

``` text
Recording
```

------------------------------------------------------------------------

# 36. Important Product Logic

The frontend should not assume that every interview uses exactly 10
questions.

The UI example uses:

**3 of 10**

but the actual values should come from interview configuration.

Similarly: - Question text is dynamic. - Difficulty is dynamic. -
Duration is dynamic. - Recording status is dynamic. - Device status is
dynamic. - Current question is dynamic.

------------------------------------------------------------------------

# 37. Backend / API Data Expected

The page will eventually need data similar to:

``` json
{
  "interviewTitle": "Video Interview",
  "role": "AI/ML Engineer",
  "currentQuestion": 3,
  "totalQuestions": 10,
  "difficulty": "Medium",
  "question": "Can you explain the difference between classification and regression in machine learning? Provide an example of each.",
  "questionType": "AI Generated",
  "duration": "40 - 45 Minutes",
  "elapsedInterviewTime": "00:12:34",
  "answerElapsedTime": "00:12",
  "isRecording": true,
  "aiSpeaking": true,
  "microphoneStatus": "Good",
  "cameraStatus": "Good",
  "internetStatus": "Good"
}
```

This is an example data model, not a requirement to hard-code these
values.

------------------------------------------------------------------------

# 38. Component Structure

A sensible component structure would be:

``` text
VideoInterviewPage
│
├── ExistingSidebar
│
├── InterviewHeader
│   ├── InterviewTitle
│   ├── RoleLabel
│   ├── EndInterviewButton
│   ├── InterviewTimer
│   └── RecordingStatus
│
├── InterviewQuestionCard
│   ├── AIInterviewerIndicator
│   ├── SpeakingDots
│   ├── QuestionNumber
│   ├── DifficultyBadge
│   └── QuestionText
│
├── CandidateVideoCard
│   ├── LiveIndicator
│   ├── FullscreenButton
│   ├── VideoStream
│   └── VideoControls
│       ├── MicrophoneControl
│       ├── CameraControl
│       ├── RecordingIndicator
│       ├── AnswerTimer
│       └── SettingsControl
│
├── InterviewTip
│
├── SecurityNotice
│
└── InterviewRightPanel
    ├── InterviewProgress
    ├── InterviewAssistant
    ├── AudioVideoStatus
    └── QuestionNavigation
```

------------------------------------------------------------------------

# 39. Features Explicitly Excluded

The following should NOT be implemented in the live interview screen
unless product requirements change:

-   Live transcript.
-   Answer Structure Guide.
-   Preparation timer.
-   Live performance score.
-   Communication score.
-   Technical score.
-   Confidence score.
-   AI-generated answer suggestions.
-   Technical hints.
-   Named human interviewer.
-   Human-style interviewer profile.
-   Skill/category tag overload.
-   Post-interview report inside the live interview screen.

These features either belong elsewhere or reduce interview realism.

------------------------------------------------------------------------

# 40. Post-Interview Separation

The live interview screen and post-interview report should be treated as
separate experiences.

## Live Interview

Focus on:

**Ask → Listen → Answer → Record → Continue**

## Post Interview

Focus on:

**Evaluate → Score → Analyze → Improve**

Performance analytics, detailed feedback, transcripts, strengths,
weaknesses, and recommendations should be presented after the interview
rather than distracting the candidate during the interview.

------------------------------------------------------------------------

# 41. UX Goal

The candidate should always understand five things immediately:

1.  **Who is interviewing me?**
    -   An AI interviewer represented by an abstract person/head symbol.
2.  **What is the AI doing?**
    -   Speaking indicator with animated dots.
3.  **What question am I answering?**
    -   Large, highly readable question card.
4.  **Am I being recorded?**
    -   Clear Recording state.
5.  **What should I do next?**
    -   Interview Assistant communicates whether the AI is speaking, the
        candidate should answer, or the answer is being submitted.

If these five points are clear, the interface is doing its core job.

------------------------------------------------------------------------

# 42. Final Design Principle

The most important principle is:

> **Do not turn the live interview into an analytics dashboard.**

During an interview, the candidate should concentrate on: - Listening. -
Thinking. - Speaking. - Maintaining eye contact. - Answering naturally.

The UI should support the interview rather than compete with it.

The final experience should therefore be **professional, calm,
AI-driven, video-first, and realistic**, while keeping the existing
SynaptiRole AI sidebar completely untouched.
