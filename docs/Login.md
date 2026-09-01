# SynaptiRole AI -- Login UI Functional Specification

## 1. Login Page

The Login Page is the authentication entry point of SynaptiRole AI. Its
purpose is to authenticate existing users and provide access to the
interview-preparation platform.

The page contains two major sections:

-   Left Section: SynaptiRole AI branding, product introduction, and
    feature highlights.
-   Right Section: User authentication form.

------------------------------------------------------------------------

## \[1\] SynaptiRole AI Logo

The logo identifies the application.

### Behavior

-   Displayed at the top-left of the page.
-   Primarily a branding element.
-   No backend action is required when clicked unless a Home action is
    implemented.

------------------------------------------------------------------------

## \[2\] Product Name -- SynaptiRole

Displays the application name.

The visual design can use dark blue and purple to maintain the
application's brand identity.

------------------------------------------------------------------------

## \[3\] Product Tagline

**AI-Powered Interview Copilot**

Explains that the application assists candidates with interview
preparation and assessment.

------------------------------------------------------------------------

## \[4\] Main Heading

**Your AI Copilot for Smarter Interviews**

Introduces the main purpose of the application.

It communicates that the system helps users practice interviews and
improve performance.

------------------------------------------------------------------------

## \[5\] Supporting Description

The description explains the key value proposition:

-   Practice smarter.
-   Get real-time feedback.
-   Improve continuously.
-   Prepare for the desired role.

This is informational and does not require interaction.

------------------------------------------------------------------------

# 6. Feature Highlights

## \[6.1\] AI-Powered Interviews

Explains that the system generates personalized interview questions.

Questions can be based on:

-   Resume
-   Job Description
-   Target role
-   Required skills
-   Skill gaps
-   Previous performance

After Resume/JD processing, the interview engine generates questions
relevant to the candidate.

------------------------------------------------------------------------

## \[6.2\] Multimodal Analysis

Explains that candidate responses can be evaluated using multiple
modalities.

The system can process:

-   Text
-   Audio
-   Video

Video analysis can focus on measurable behavioral indicators such as:

-   Camera-facing orientation
-   Head orientation
-   Posture
-   Hand movement
-   Movement stability

Facial-expression analysis is not included in the current design.

------------------------------------------------------------------------

## \[6.3\] Detailed Feedback

Explains that the application generates actionable interview feedback.

Possible feedback includes:

-   Overall score
-   Answer quality
-   Technical performance
-   Communication performance
-   Strengths
-   Weaknesses
-   Areas of improvement
-   Skill gaps
-   Recommendations

------------------------------------------------------------------------

## \[6.4\] Track & Improve

Explains continuous performance tracking.

The application can track:

-   Interview count
-   Score trend
-   Skill-match percentage
-   Practice duration
-   Areas requiring improvement

------------------------------------------------------------------------

# 7. Product Illustration

## \[7.1\] AI Interview Illustration

The central illustration visually represents the application workflow.

It can contain visual references to:

-   Resume
-   Laptop/interview screen
-   Job Description
-   Interview score
-   Microphone
-   Camera/video
-   AI conversation

The illustration is decorative and does not require interaction.

------------------------------------------------------------------------

# 8. Security Information

## \[8.1\] Your Data Is Secure With Us

Communicates that user information is protected.

The actual implementation may include:

-   Secure authentication
-   Protected user data
-   HTTPS communication
-   Secure session management
-   Controlled access

Only security claims that are actually implemented should be displayed.

------------------------------------------------------------------------

## \[8.2\] Trusted by Aspirants

Communicates that SynaptiRole AI is designed for students and job
seekers.

A real user count should only be displayed if actual data is available.

------------------------------------------------------------------------

# 9. Login Form

## \[9.1\] Welcome Back

Displays:

**Welcome Back! 👋**

Confirms that the user is on the login screen.

------------------------------------------------------------------------

## \[9.2\] Login Description

Displays:

**Login to continue your interview journey**

Explains why the user needs to authenticate.

------------------------------------------------------------------------

# 10. Email Address

## \[10.1\] Email Input

Allows the user to enter their registered email.

### Placeholder

**Enter your email**

### Validation

The system checks:

-   Field is not empty.
-   Email format is valid.
-   Account exists.

### Invalid Input

Example:

**Please enter a valid email address.**

------------------------------------------------------------------------

# 11. Password

## \[11.1\] Password Input

Allows the user to enter their password.

### Placeholder

**Enter your password**

Characters are hidden by default.

------------------------------------------------------------------------

## \[11.2\] Password Visibility Icon

The eye icon controls password visibility.

### Hidden

Password characters remain masked.

### Visible

Password characters are displayed.

The control does not modify the password.

------------------------------------------------------------------------

# 12. Forgot Password

## \[12.1\] Forgot Password Link

Allows users to recover access to their account.

### Flow

1.  User selects Forgot Password.
2.  Recovery page opens.
3.  User enters registered email.
4.  System verifies the account.
5.  Password-reset process is initiated.
6.  User creates a new password.
7.  User returns to Login.

------------------------------------------------------------------------

# 13. Remember Me

## \[13.1\] Remember Me Checkbox

Allows the user to request a persistent authenticated session.

### ON

The application can keep the session active according to the configured
session policy.

### OFF

Normal session behavior is used.

The password must never be stored directly for this feature.

------------------------------------------------------------------------

# 14. Login Button

## \[14.1\] Login

Submits the authentication form.

### On Click

1.  Validate email.
2.  Validate password.
3.  Send authentication request.
4.  Verify credentials.
5.  Create authenticated session.
6.  Redirect to Dashboard.

### Successful Login

User is redirected to Dashboard.

### Failed Login

Display:

**Invalid email or password.**

The application should not reveal whether the email or password was
incorrect.

### Loading State

The button displays a loading indicator and prevents duplicate
submissions.

------------------------------------------------------------------------

# 15. Google Authentication

## \[15.1\] Continue With Google

Provides Google OAuth authentication if implemented.

### Flow

1.  User selects Google.
2.  Google authentication opens.
3.  User authenticates.
4.  SynaptiRole AI receives the authentication result.
5.  User account is created or retrieved.
6.  User is redirected to Dashboard.

If OAuth is not implemented, this should not be presented as an active
button.

------------------------------------------------------------------------

# 16. GitHub Authentication

## \[16.1\] Continue With GitHub

Provides GitHub OAuth authentication if implemented.

### Flow

1.  User selects GitHub.
2.  GitHub authentication opens.
3.  User authenticates.
4.  SynaptiRole AI receives the result.
5.  Account is created or retrieved.
6.  User is redirected to Dashboard.

------------------------------------------------------------------------

# 17. Sign Up

## \[17.1\] Sign Up Link

Allows a new user to create an account.

Registration can collect:

-   Full name
-   Email
-   Password
-   Confirm password

After successful registration, the user can log in.

------------------------------------------------------------------------

# 18. Login Validation

The page should validate user input before sending the request.

Possible errors:

-   Empty email
-   Invalid email
-   Empty password
-   Incorrect credentials
-   Account not found
-   Server error
-   Network error

Errors should appear close to the relevant control or as a clear
form-level message.

------------------------------------------------------------------------

# 19. Login Loading State

While authentication is processing:

-   Login button is disabled.
-   Loading indicator is displayed.
-   Duplicate login requests are prevented.

------------------------------------------------------------------------

# 20. Login Success

After successful authentication:

**Login → Dashboard**

The user's name and profile information are loaded into the Dashboard.

------------------------------------------------------------------------

# 21. Login Error Handling

If authentication fails because of a server or network issue, display a
user-friendly message.

Example:

**Unable to connect. Please try again.**

Do not expose technical backend errors to the user.

------------------------------------------------------------------------

# 22. Overall Login Workflow

**Open Application**

↓

**Login Page**

↓

**Enter Email + Password**

↓

**Validate Input**

↓

**Authenticate**

↓

**Successful?**

-   Yes → Dashboard
-   No → Display Error

Optional:

**Google/GitHub OAuth → Dashboard**

------------------------------------------------------------------------

# 23. Login UI Objective

The Login Page should:

-   Clearly communicate the application's purpose.
-   Make authentication simple.
-   Provide useful validation.
-   Maintain a professional appearance.
-   Clearly show authentication status.
-   Avoid unnecessary complexity.

The primary user journey is:

**Login → Authenticate → Dashboard**
