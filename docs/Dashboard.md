# SynaptiRole AI -- Dashboard UI Functional Specification

## 1. Dashboard

The Dashboard is the main workspace displayed after successful login.

Its purpose is to provide a quick overview of:

-   Interview activity
-   Overall performance
-   Skill matching
-   Practice time
-   Performance trend
-   Recent interviews
-   Quick actions

The Dashboard acts as the central summary page of SynaptiRole AI.

------------------------------------------------------------------------

# 2. Sidebar Navigation

The sidebar contains the primary application navigation.

Visible items:

1.  Dashboard
2.  Resume & JD
3.  Mock Interviews
4.  Reports
5.  Settings
6.  User Profile
7.  Logout

------------------------------------------------------------------------

## \[2.1\] Dashboard

Opens the main dashboard.

### Active State

The selected item is highlighted.

### Displays

-   Summary cards
-   Performance Trend
-   Quick Actions
-   Recent Interviews

------------------------------------------------------------------------

## \[2.2\] Resume & JD

Opens the Resume & JD module.

The user can:

-   Upload Resume
-   Upload Job Description
-   View uploaded documents
-   Replace documents
-   Delete documents
-   Start analysis

The system can extract:

-   Education
-   Experience
-   Skills
-   Projects
-   Certifications
-   Job requirements
-   Required skills
-   Preferred skills

------------------------------------------------------------------------

## \[2.3\] Mock Interviews

Opens the mock interview module.

The system can generate questions using:

-   Resume
-   Job Description
-   Target role
-   Required skills
-   Skill gaps
-   Previous performance

Questions are displayed as text pop-up questions in the current design.

------------------------------------------------------------------------

## \[2.4\] Reports

Opens the interview performance reports.

Reports can include:

-   Overall score
-   Technical performance
-   Communication performance
-   Answer relevance
-   Strengths
-   Areas of improvement
-   Skill gaps
-   Recommendations

------------------------------------------------------------------------

## \[2.5\] Settings

Opens application settings.

Settings can include:

-   Notification Settings
-   Privacy Settings
-   Appearance
-   Language
-   Date Format
-   Time Format
-   Help Center
-   Contact Support

------------------------------------------------------------------------

# 3. User Profile Area

The bottom-left profile section displays the logged-in user's:

-   Avatar
-   Name
-   Professional/target role

Example:

**Arjun Sharma**

**AI/ML Engineer**

Clicking the profile can open account-related options.

------------------------------------------------------------------------

## \[3.1\] Profile Avatar

Displays the user's profile image.

If no image exists, initials can be displayed.

Example:

**A**

------------------------------------------------------------------------

## \[3.2\] User Name

Displays the authenticated user's name.

The name should come dynamically from the user's profile.

------------------------------------------------------------------------

## \[3.3\] User Role

Displays the user's selected or target professional role.

Example:

**AI/ML Engineer**

------------------------------------------------------------------------

# 4. Logout

## \[4.1\] Logout Button

Terminates the authenticated session.

### On Click

1.  End the current session.
2.  Invalidate the authentication token according to backend
    implementation.
3.  Clear temporary authentication information.
4.  Redirect to Login.

Optional confirmation:

**Are you sure you want to log out?**

Buttons:

-   Cancel
-   Logout

------------------------------------------------------------------------

# 5. Dashboard Header

The header contains the welcome message, notifications, profile
controls, and date filter.

------------------------------------------------------------------------

## \[5.1\] Welcome Message

Example:

**Welcome back, Arjun! 👋**

The name is dynamically loaded from the user profile.

------------------------------------------------------------------------

## \[5.2\] Dashboard Description

Example:

**Track your interview progress and improve your skills.**

Provides context for the dashboard.

------------------------------------------------------------------------

# 6. Notification Bell

## \[6.1\] Notification Icon

Provides access to system notifications.

The badge displays the number of unread notifications.

Example:

**3**

Notifications may include:

-   Interview recommendations
-   Interview feedback ready
-   Weekly performance summary
-   System announcements

### On Click

A notification panel opens.

Each notification can display:

-   Title
-   Description
-   Date/time
-   Read/unread state
-   Navigation action

------------------------------------------------------------------------

# 7. User Profile Dropdown

## \[7.1\] Profile Dropdown

The top-right profile area displays:

-   Avatar
-   User name
-   User role
-   Dropdown arrow

### On Click

Possible options:

-   View Profile
-   Account Settings
-   Settings
-   Logout

------------------------------------------------------------------------

# 8. Date Range Selector

## \[8.1\] Date Filter

Example:

**May 10 -- May 16, 2024**

Allows the user to select the reporting period.

Possible options:

-   Today
-   Last 7 Days
-   Last 30 Days
-   This Month
-   Custom Range

### On Selection

Dashboard statistics update according to the selected period.

Affected information can include:

-   Interviews Taken
-   Overall Score
-   Skills Matched
-   Total Time Practiced
-   Performance Trend
-   Recent Interviews

------------------------------------------------------------------------

# 9. Performance Summary Cards

The Dashboard contains four main statistic cards.

------------------------------------------------------------------------

## \[9.1\] Interviews Taken

Displays the number of interviews completed in the selected period.

Example:

**12**

### Comparison

Example:

**↑ 20% vs last 7 days**

The system compares the current period against the previous equivalent
period.

------------------------------------------------------------------------

## \[9.2\] Overall Score

Displays the user's overall interview score.

Example:

**68 / 100**

The score can be calculated from the application's interview evaluation
model.

Possible inputs:

-   Answer correctness
-   Answer relevance
-   Technical knowledge
-   Communication
-   Role/JD alignment
-   Relevant audio features
-   Relevant video behavior metrics

### Comparison

Example:

**↑ 8 pts vs last 7 days**

------------------------------------------------------------------------

## \[9.3\] Skills Matched

Displays the percentage of job-required skills matched by the candidate.

Example:

**72%**

The system compares extracted candidate skills with Job Description
requirements.

Semantic matching can use:

-   Sentence-BERT
-   ESCO
-   O\*NET
-   Skill extraction

------------------------------------------------------------------------

## \[9.4\] Total Time Practiced

Displays the total interview practice duration.

Example:

**8h 24m**

Calculated by summing eligible interview durations in the selected
period.

------------------------------------------------------------------------

# 10. Performance Trend

## \[10.1\] Performance Trend Chart

Displays how the user's interview scores change over time.

### X-Axis

Date.

### Y-Axis

Score from 0 to 100.

### Data Points

Each point represents the user's performance score for a date/interview.

Example:

-   May 10 = 45
-   May 11 = 62
-   May 12 = 58
-   May 13 = 55
-   May 14 = 70
-   May 15 = 65
-   May 16 = 68

------------------------------------------------------------------------

## \[10.2\] Chart Data Point

Selecting or hovering over a point can display:

-   Date
-   Score
-   Interview count
-   Optional interview information

------------------------------------------------------------------------

## \[10.3\] Performance Period Dropdown

Example:

**Last 7 Days**

Possible values:

-   Last 7 Days
-   Last 30 Days
-   Last 3 Months
-   Last 6 Months

Changing the selection updates the graph.

------------------------------------------------------------------------

# 11. Quick Actions

The Quick Actions panel provides shortcuts to important functions.

The four actions are:

1.  Upload Resume / JD
2.  Start Mock Interview
3.  View Reports
4.  Areas of Improvement

------------------------------------------------------------------------

## \[11.1\] Upload Resume / JD

Opens the Resume & JD page.

The user can upload:

-   Resume
-   Job Description

Possible file formats:

-   PDF
-   DOCX
-   TXT

After upload, the system processes and extracts relevant information.

------------------------------------------------------------------------

## \[11.2\] Start Mock Interview

Starts the interview preparation flow.

The system should verify that the required Resume/JD information is
available.

Possible configuration:

-   Target role
-   Interview type
-   Difficulty
-   Selected JD
-   Number of questions

After configuration, the interview begins.

------------------------------------------------------------------------

## \[11.3\] View Reports

Navigates to the Reports page.

The user can inspect previous interview results.

------------------------------------------------------------------------

## \[11.4\] Areas of Improvement

Opens the personalized improvement section.

The system can identify:

-   Weak technical skills
-   Communication weaknesses
-   Frequently incorrect concepts
-   Low-scoring competencies
-   Missing job-related skills

The system can recommend:

-   Topics to study
-   Skills to practice
-   Interview questions
-   Preparation priorities

------------------------------------------------------------------------

# 12. Recent Interviews

## \[12.1\] Recent Interviews Table

Displays the latest interview records.

The table provides a quick overview of recent activity.

------------------------------------------------------------------------

## \[12.2\] Role

Displays the role for which the interview was conducted.

Examples:

-   AI/ML Engineer
-   Software Developer
-   Data Analyst

------------------------------------------------------------------------

## \[12.3\] Company

Displays the company associated with the Job Description.

If unavailable:

**Custom Job Description**

------------------------------------------------------------------------

## \[12.4\] Date & Time

Displays when the interview occurred.

Example:

**May 16, 2024**

**10:30 AM**

The display should follow the user's Date Format and Time Format
settings.

------------------------------------------------------------------------

## \[12.5\] Score

Displays the final interview score.

Example:

**72/100**

------------------------------------------------------------------------

## \[12.6\] Percentile

Displays relative performance when a valid comparison dataset exists.

Example:

**Top 2%**

If sufficient comparison data does not exist, percentile should not be
fabricated.

------------------------------------------------------------------------

## \[12.7\] Duration

Displays the interview duration.

Example:

**45m 32s**

Calculated from interview start and end timestamps.

------------------------------------------------------------------------

## \[12.8\] Status

Displays interview state.

Possible statuses:

-   Not Started
-   In Progress
-   Completed
-   Interrupted
-   Failed

------------------------------------------------------------------------

# 13. View Report

## \[13.1\] View Report Button

Opens the detailed report for the selected interview.

The report can include:

-   Overall score
-   Answer evaluation
-   Technical performance
-   Communication analysis
-   Skill analysis
-   Relevant video behavior metrics
-   Strengths
-   Areas of improvement
-   Recommendations

------------------------------------------------------------------------

# 14. Three-Dot Menu

## \[14.1\] More Actions

Provides additional actions for a specific interview.

Possible options:

-   View Report
-   Rename Interview
-   Download Report
-   Delete Interview

Destructive actions such as Delete should require confirmation.

------------------------------------------------------------------------

# 15. View All

## \[15.1\] View All Interviews

Opens the complete interview history.

The full history can support:

-   Search
-   Filtering
-   Sorting
-   Date filtering
-   Role filtering
-   Score filtering
-   Status filtering

------------------------------------------------------------------------

# 16. Dashboard Data Refresh

Dashboard information should update when:

-   A new interview is completed.
-   An interview report is generated.
-   Resume/JD analysis is completed.
-   Date range is changed.
-   Dashboard is refreshed.

------------------------------------------------------------------------

# 17. Loading State

During data loading, the Dashboard should display:

-   Skeleton cards
-   Loading indicators
-   Disabled actions where necessary

The application should not appear frozen.

------------------------------------------------------------------------

# 18. Empty State

If the user has no interviews:

**No interviews yet**

**Upload a Resume/JD and start your first mock interview.**

Suggested button:

**Start Your First Interview**

------------------------------------------------------------------------

# 19. Error State

If dashboard data cannot be loaded:

**Unable to load dashboard data. Please try again.**

A Retry button should be displayed.

For upload errors:

**Unable to process this file. Please check the file format and try
again.**

For network problems:

**Connection problem. Please check your internet connection and try
again.**

------------------------------------------------------------------------

# 20. Responsive Behavior

## Desktop

The sidebar remains visible and the dashboard uses the complete layout.

## Smaller Screens

-   Sidebar can collapse.
-   Summary cards can stack.
-   Charts resize.
-   Recent Interviews can become horizontally scrollable or responsive
    cards.

------------------------------------------------------------------------

# 21. UI Interaction States

All interactive controls should support:

-   Default
-   Hover
-   Active
-   Focus
-   Disabled
-   Loading
-   Success
-   Error

This makes the UI clear and interactive.

------------------------------------------------------------------------

# 22. Dashboard Data Mapping

  UI Element             Data Source
  ---------------------- ---------------------------------
  User Name              User Profile
  User Role              User Profile / Target Role
  Interviews Taken       Interview Records
  Overall Score          Interview Evaluation
  Skills Matched         Resume/JD Skill Matching
  Total Time Practiced   Interview Duration
  Performance Trend      Historical Interview Scores
  Recent Interviews      Interview Records
  Percentile             Comparison Dataset
  Areas of Improvement   Evaluation + Skill Gap Analysis
  Notifications          Notification Data
  Resume                 Document Storage
  JD                     Document Storage
  Reports                Interview Evaluation Records

------------------------------------------------------------------------

# 23. Dashboard Workflow

**Login**

↓

**Dashboard**

↓

**Upload Resume/JD**

↓

**Resume/JD Analysis**

↓

**Skill Matching**

↓

**Start Mock Interview**

↓

**Interview Evaluation**

↓

**Report Generation**

↓

**Areas of Improvement**

↓

**Dashboard Statistics Updated**

------------------------------------------------------------------------

# 24. Dashboard Objective

The Dashboard should allow the user to understand their current
interview readiness quickly.

The primary experience is:

**View Progress → Practice → Evaluate → Identify Gaps → Improve → Track
Progress**

The UI should prioritize important information while keeping detailed
features accessible through navigation and Quick Actions.
