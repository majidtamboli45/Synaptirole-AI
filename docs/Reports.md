# SynaptiRole AI -- Reports UI Functional Specification

## 1. Reports

The Reports page allows the user to track their overall interview
performance, analyze strengths and weaknesses, and identify areas to
improve.

Its purpose is to provide a detailed overview of:

-   Interview statistics
-   Performance trend over time
-   Score distribution
-   Category-wise and skill-wise performance
-   Strengths and improvement areas
-   Topic-wise accuracy
-   Test-by-test comparison
-   Overall feedback and personalized recommendations

The Reports page acts as the analytics/insights center of SynaptiRole
AI.

------------------------------------------------------------------------

# 2. Reports Header

The header contains the page title, description, notification bell,
profile dropdown, date range filter, and export action.

------------------------------------------------------------------------

## \[2.1\] Page Title

Example:

**Reports**

------------------------------------------------------------------------

## \[2.2\] Page Description

Example:

**Track your performance, analyze your strengths and identify areas to
improve.**

Provides context for the Reports page.

------------------------------------------------------------------------

## \[2.3\] Notification Bell

Provides access to system notifications.

The badge displays the number of unread notifications.

Example:

**9**

------------------------------------------------------------------------

## \[2.4\] User Profile Dropdown

Displays:

-   Avatar
-   User name
-   User role
-   Dropdown arrow

Example:

**Arjun Sharma**

**AI/ML Engineer**

------------------------------------------------------------------------

## \[2.5\] Date Range Selector

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

All report statistics, charts, and tables update according to the
selected period.

------------------------------------------------------------------------

## \[2.6\] Export Report

With the help of the Export Report button, the user can download their
performance report.

Possible export formats:

-   PDF
-   CSV/Excel

The exported report can include summary statistics, charts (as
images/data), and detailed tables.

------------------------------------------------------------------------

# 3. Performance Summary Cards

The Reports page contains four main statistic cards.

------------------------------------------------------------------------

## \[3.1\] Interviews Taken

Displays the number of interviews completed in the selected period.

Example:

**12**

### Comparison

Example:

**↑ 20% vs last 7 days**

------------------------------------------------------------------------

## \[3.2\] Overall Score

Displays the user's overall interview score.

Example:

**68 / 100**

### Comparison

Example:

**↑ 8 pts vs last 7 days**

------------------------------------------------------------------------

## \[3.3\] Skills Matched

Displays the percentage of job-required skills matched by the
candidate.

Example:

**72%**

### Comparison

Example:

**↑ 10% vs last 7 days**

------------------------------------------------------------------------

## \[3.4\] Total Time Practiced

Displays the total interview practice duration.

Example:

**8h 24m**

### Comparison

Example:

**↑ 1h 15m vs last 7 days**

------------------------------------------------------------------------

# 4. Performance Trend

## \[4.1\] Performance Trend Chart

Displays how the user's interview scores change over time.

### X-Axis

Date (e.g. May 10 -- May 16).

### Y-Axis

Score from 0 to 100.

### Data Points

Each point represents the user's performance score for a given date.

Example values:

-   May 10 -- 45
-   May 11 -- 62
-   May 12 -- 58
-   May 13 -- 55
-   May 14 -- 70
-   May 15 -- 65
-   May 16 -- 68

### Tooltip

On hover, the tooltip can display:

-   Date
-   Score
-   Interview count
-   Optional interview information

------------------------------------------------------------------------

## \[4.2\] Performance Period Dropdown

Example:

**Last 7 Days**

Possible values:

-   Last 7 Days
-   Last 30 Days
-   Last 3 Months
-   Last 6 Months

Changing the selection updates the graph.

------------------------------------------------------------------------

# 5. Score Distribution (Donut Chart)

## \[5.1\] Score Distribution Chart

Displays the distribution of interview results across performance
bands for the selected period.

Center of the chart displays:

-   Total interview count (e.g. **12 Interviews**)

### Bands

-   Excellent (80-100)
-   Good (60-79)
-   Average (40-59)
-   Needs Improvement (0-39)

Each band displays:

-   Count of interviews
-   Percentage share

Example:

-   Excellent (80-100) -- 2 (17%)
-   Good (60-79) -- 6 (50%)
-   Average (40-59) -- 3 (25%)
-   Needs Improvement (0-39) -- 1 (6%)

------------------------------------------------------------------------

## \[5.2\] Improvement Insight Banner

Displays a short comparison message summarizing progress.

Example:

**You've improved 8 pts compared to last 7 days**

------------------------------------------------------------------------

# 6. Average Score by Category

## \[6.1\] Category Score Bars

Displays a horizontal bar chart of average scores across evaluation
categories (0-100 scale).

Categories can include:

-   Technical Skills
-   Problem Solving
-   Communication
-   Confidence
-   Behavioral Skills

Example:

-   Technical Skills -- 72 / 100
-   Problem Solving -- 68 / 100
-   Communication -- 66 / 100
-   Confidence -- 64 / 100
-   Behavioral Skills -- 70 / 100

------------------------------------------------------------------------

# 7. Skills Performance

## \[7.1\] Skills Performance List

Displays individual skill-wise performance with a progress bar,
percentage score, and trend indicator.

Each row displays:

-   Skill icon
-   Skill name
-   Progress bar
-   Score (%)
-   Trend arrow (↑ improving / ↓ declining)

Example:

-   Python -- 85% ↑
-   Machine Learning -- 80% ↑
-   SQL -- 78% ↑
-   Data Structures -- 72% ↑
-   System Design -- 68% ↑
-   Communication -- 65% ↓

------------------------------------------------------------------------

## \[7.2\] View All

Navigates to the complete list of tracked skills and their performance
history.

------------------------------------------------------------------------

# 8. Top Strengths

## \[8.1\] Top Strengths List

Displays the user's strongest performance areas, identified from
interview evaluation data.

Each item displays:

-   Success/checkmark icon
-   Strength title
-   Short description

Example:

-   **Strong hold on Python** -- You performed well in Python related
    questions.
-   **Good Problem Solving** -- You solve problems efficiently with
    optimal approach.
-   **System Design Basics** -- You have a good understanding of
    system design concepts.

------------------------------------------------------------------------

# 9. Areas to Improve

## \[9.1\] Areas to Improve List

Displays the user's weaker performance areas that need focused
practice.

Each item displays:

-   Warning icon
-   Area title
-   Short description/recommendation

Example:

-   **Data Structures** -- Practice more on Arrays, Linked List and
    Trees.
-   **SQL Queries** -- Focus on complex joins and window functions.
-   **Communication** -- Work on giving more structured and detailed
    answers.

------------------------------------------------------------------------

# 10. Recent Interview Summary

## \[10.1\] Recent Interview Summary Panel

Displays a quick statistical summary of interviews within the selected
period.

Metrics can include:

-   Best Score (e.g. **92 / 100**)
-   Lowest Score (e.g. **48 / 100**)
-   Average Percentile (e.g. **Top 23%**)
-   Completion Rate (e.g. **100%**)
-   No. of Completed Interviews (e.g. **12 / 12**)

------------------------------------------------------------------------

# 11. Topic-wise Accuracy

## \[11.1\] Topic-wise Accuracy Chart

Displays accuracy aggregated across all tests, broken down by topic.

Each row displays:

-   Topic name
-   Horizontal progress bar
-   Accuracy percentage

Example topics:

-   General -- 85%
-   Data Structures -- 78%
-   SQL -- 72%
-   Algorithms -- 68%
-   OOP Concepts -- 65%
-   System Design -- 60%
-   DBMS -- 58%
-   Operating Systems -- 58%
-   Networking -- 50%
-   Computer Basics -- 48%

------------------------------------------------------------------------

# 12. Score Distribution (Bar Chart)

## \[12.1\] Score Range Bar Chart

Displays how often the user's scores land within each score range,
shown as a bar chart.

### X-Axis

Score ranges:

-   0-39%
-   40-59%
-   60-79%
-   80-100%

### Y-Axis

Number of tests.

Example:

-   0-39% -- 1 test
-   40-59% -- 3 tests
-   60-79% -- 6 tests
-   80-100% -- 2 tests

------------------------------------------------------------------------

# 13. Test Comparison

## \[13.1\] Test Comparison Table

Displays a list of recent mock interviews with comparative
performance details.

Columns:

-   \# (Test number)
-   Test name
-   Score
-   vs Avg (percentage difference from the user's average score, shown
    with an up/down indicator)
-   Time (duration)
-   Date

Example rows:

  \#   Test              Score   vs Avg   Time     Date
  ---- ----------------- ------- -------- -------- -----------
  1    Mock Interview 12 92%     ↑ 24%    26 min   16 May 2024
  2    Mock Interview 11 78%     ↑ 10%    31 min   15 May 2024
  3    Mock Interview 10 70%     ↑ 5%     22 min   14 May 2024
  4    Mock Interview 9  56%     ↓ -5%    24 min   13 May 2024
  5    Mock Interview 8  48%     ↓ -12%   28 min   11 May 2024

Score color-coding can indicate performance tier (e.g. green for high
scores, orange/red for lower scores).

------------------------------------------------------------------------

# 14. Overall Feedback

## \[14.1\] Overall Feedback Panel

Displays a summarized qualitative and quantitative assessment of the
user's performance for the selected period.

Contains:

-   Feedback tag/label (e.g. **Good Job!**)
-   Short feedback message
-   Overall Score displayed as a circular progress indicator (e.g.
    **68%**)

Example message:

**You are performing well overall. Focus on the suggested areas to
reach the next level.**

------------------------------------------------------------------------

# 15. Personalised Recommendations

## \[15.1\] Recommendations Panel

Displays system-generated recommendations based on the user's
performance patterns.

Subtitle:

**Based on your performance patterns**

Each recommendation card displays:

-   Icon
-   Recommendation title
-   Short description/action items

Example cards:

-   **Focus on Weak Topics** -- Your accuracy in Data Structures, SQL,
    and Communication can be improved. Dedicate focused revision
    sessions to these areas.
-   **Inconsistent Performance** -- Your scores vary by ±22 points.
    Work on time management and maintain consistency across all
    tests.
-   **Capitalize on Strengths** -- You're performing well in Python
    and Technical Skills. Maintain this edge and use this confidence
    to tackle harder topics.

------------------------------------------------------------------------

## \[15.2\] Motivational Footer Message

Example:

**Keep practicing consistently and you will achieve your goals! 🚀**

------------------------------------------------------------------------

# 16. Reports Data Refresh

Report information should update when:

-   A new interview is completed.
-   A new interview report is generated.
-   The date range filter is changed.
-   The page is refreshed.

------------------------------------------------------------------------

# 17. Loading State

During data loading, the Reports page should display:

-   Skeleton cards
-   Loading indicators for charts
-   Disabled actions where necessary

The application should not appear frozen.

------------------------------------------------------------------------

# 18. Empty State

If the user has no interviews in the selected period:

**No interview data available for this period.**

**Take a mock interview to start generating your performance
reports.**

Suggested button:

**Start Mock Interview**

------------------------------------------------------------------------

# 19. Error State

If report data cannot be loaded:

**Unable to load report data. Please try again.**

A Retry button should be displayed.

For export errors:

**Unable to export report. Please try again later.**

For network problems:

**Connection problem. Please check your internet connection and try
again.**

------------------------------------------------------------------------

# 20. Responsive Behavior

## Desktop

The sidebar remains visible and the report widgets are arranged in a
multi-column grid layout.

## Smaller Screens

-   Sidebar can collapse.
-   Summary cards can stack.
-   Charts resize and become scrollable where necessary.
-   Test Comparison table can become horizontally scrollable or
    convert to responsive cards.

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

# 22. Reports Data Mapping

  UI Element                   Data Source
  ----------------------------- ---------------------------------
  Interviews Taken              Interview Records
  Overall Score                 Interview Evaluation
  Skills Matched                Resume/JD Skill Matching
  Total Time Practiced          Interview Duration
  Performance Trend             Historical Interview Scores
  Score Distribution (Donut)    Interview Evaluation Records
  Average Score by Category     Interview Evaluation
  Skills Performance            Skill Analysis
  Top Strengths                 Evaluation + Skill Analysis
  Areas to Improve              Evaluation + Skill Gap Analysis
  Recent Interview Summary      Interview Records
  Topic-wise Accuracy           Question/Topic Evaluation
  Score Distribution (Bar)      Interview Evaluation Records
  Test Comparison               Interview Records
  Overall Feedback              Interview Evaluation
  Personalised Recommendations  Evaluation + Skill Gap Analysis
  Notifications                 Notification Data
  Export Report                 Report Generation Service

------------------------------------------------------------------------

# 23. Reports Workflow

**Login**

↓

**Dashboard**

↓

**Complete Mock Interview(s)**

↓

**Interview Evaluation**

↓

**Report Generation**

↓

**Reports Page**

↓

**Select Date Range**

↓

**Analyze Performance / Strengths / Gaps**

↓

**View Personalised Recommendations**

↓

**Export Report (Optional)**

------------------------------------------------------------------------

# 24. Reports Objective

The Reports page should allow the user to understand their interview
performance in depth over a selected time period.

The primary experience is:

**View Trend → Analyze Categories & Skills → Identify Strengths &
Gaps → Review Topic Accuracy → Compare Tests → Get Recommendations →
Improve**

The UI should prioritize the most important performance signals
(overall score, trend, distribution) at the top, while detailed
breakdowns and recommendations remain accessible further down the
page.
