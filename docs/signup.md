# SynaptiRole AI -- Sign Up UI Functional Specification

## 1. Sign Up Page

The Sign Up Page is the registration entry point of SynaptiRole AI. Its purpose is to allow new users to create an account and begin using the interview-preparation platform.

The page contains two major sections:

- Left Section: SynaptiRole AI branding, product introduction, and feature highlights.
- Right Section: New-user registration form.

The overall visual design should remain consistent with the Login Page.

------------------------------------------------------------------------

# [1] SynaptiRole AI Logo

The logo identifies the application.

### Behavior

- Displayed at the top-left of the page.
- Primarily a branding element.
- No backend action is required when clicked unless a Home action is implemented.

------------------------------------------------------------------------

# [2] Product Name -- SynaptiRole

Displays the application name.

The visual design can use dark blue and purple to maintain the application's brand identity.

------------------------------------------------------------------------

# [3] Product Tagline

**AI-Powered Interview Copilot**

Explains that the application assists candidates with interview preparation and assessment.

------------------------------------------------------------------------

# [4] Main Heading

**Your AI Copilot for Smarter Interviews**

Introduces the main purpose of the application.

It communicates that the system helps users practice interviews and improve performance.

------------------------------------------------------------------------

# [5] Supporting Description

The description explains the key value proposition:

- Practice smarter.
- Get real-time feedback.
- Improve continuously.
- Prepare for the desired role.

This is informational and does not require interaction.

------------------------------------------------------------------------

# 6. Feature Highlights

The Sign Up Page keeps the same product feature presentation as the Login Page.

## [6.1] AI-Powered Interviews

Explains that the system generates personalized interview questions.

Questions can be based on:

- Resume
- Job Description
- Target role
- Required skills
- Skill gaps
- Previous performance

After Resume/JD processing, the interview engine generates questions relevant to the candidate.

------------------------------------------------------------------------

## [6.2] Multimodal Analysis

Explains that candidate responses can be evaluated using multiple modalities.

The system can process:

- Text
- Audio
- Video

Video analysis can focus on measurable behavioral indicators such as:

- Camera-facing orientation
- Head orientation
- Posture
- Hand movement
- Movement stability

Facial-expression analysis is not included in the current design.

------------------------------------------------------------------------

## [6.3] Detailed Feedback

Explains that the application generates actionable interview feedback.

Possible feedback includes:

- Overall score
- Answer quality
- Technical performance
- Communication performance
- Strengths
- Weaknesses
- Areas of improvement
- Skill gaps
- Recommendations

------------------------------------------------------------------------

## [6.4] Track & Improve

Explains continuous performance tracking.

The application can track:

- Interview count
- Score trend
- Skill-match percentage
- Practice duration
- Areas requiring improvement

------------------------------------------------------------------------

# 7. Product Illustration

## [7.1] AI Interview Illustration

The central illustration visually represents the application workflow.

It can contain visual references to:

- Resume
- Laptop/interview screen
- Job Description
- Interview score
- Microphone
- Camera/video
- AI conversation

The illustration is decorative and does not require interaction.

------------------------------------------------------------------------

# 8. Security Information

## [8.1] Your Data Is Secure With Us

Communicates that user information is protected.

The actual implementation may include:

- Secure authentication
- Protected user data
- HTTPS communication
- Secure session management
- Controlled access

Only security claims that are actually implemented should be displayed.

------------------------------------------------------------------------

## [8.2] Trusted by Aspirants

Communicates that SynaptiRole AI is designed for students and job seekers.

A real user count should only be displayed if actual data is available.

------------------------------------------------------------------------

# 9. Sign Up Form

## [9.1] Create Your Account

Displays:

**Create Your Account 👋**

Confirms that the user is on the registration screen.

------------------------------------------------------------------------

## [9.2] Sign Up Description

Displays:

**Join SynaptiRole and start your journey towards your dream role.**

Explains why the user should create an account.

------------------------------------------------------------------------

# 10. Full Name

## [10.1] Full Name Input

Allows the user to enter their name.

### Placeholder

**Enter your full name**

### Validation

The system checks:

- Field is not empty.
- Name contains valid characters.
- Name meets the configured length requirements.

### Invalid Input

Example:

**Please enter your full name.**

------------------------------------------------------------------------

# 11. Email Address

## [11.1] Email Input

Allows the user to enter the email address associated with the new account.

### Placeholder

**Enter your email**

### Validation

The system checks:

- Field is not empty.
- Email format is valid.
- Email is not already registered.

### Invalid Input

Example:

**Please enter a valid email address.**

If the email is already registered, display a user-friendly message such as:

**An account with this email already exists. Please log in.**

------------------------------------------------------------------------

# 12. Password

## [12.1] Password Input

Allows the user to create a password.

### Placeholder

**Create a password**

Characters are hidden by default.

------------------------------------------------------------------------

## [12.2] Password Requirements

The password should satisfy the configured password policy.

The Sign Up UI can communicate the following requirements shown in the design:

- At least 8 characters
- At least 1 uppercase character
- At least 1 number
- At least 1 special character

The requirements should be validated before account creation.

------------------------------------------------------------------------

## [12.3] Password Visibility Icon

The eye icon controls password visibility.

### Hidden

Password characters remain masked.

### Visible

Password characters are displayed.

The control does not modify the password.

------------------------------------------------------------------------

# 13. Confirm Password

## [13.1] Confirm Password Input

Allows the user to re-enter the password.

### Placeholder

**Confirm your password**

### Validation

The system checks:

- Field is not empty.
- Confirm password matches the password.

### Invalid Input

Example:

**Passwords do not match.**

------------------------------------------------------------------------

## [13.2] Confirm Password Visibility Icon

The eye icon controls visibility of the confirmation password.

### Hidden

Characters remain masked.

### Visible

Characters are displayed.

The control does not modify the entered password.

------------------------------------------------------------------------

# 14. Role Selection

## [14.1] I Am a

Allows the user to select their primary role or target role.

### Placeholder

**Select your role**

The control is displayed as a dropdown/select field.

Possible role values can be configured by the application.

Examples may include:

- Software Developer
- Data Scientist
- Machine Learning Engineer
- AI Engineer
- Frontend Developer
- Backend Developer
- Other

The available values should come from the application's configured role list.

------------------------------------------------------------------------

## [14.2] Role Validation

The system checks:

- A role is selected when the field is required.
- The selected role is a valid configured option.

### Invalid Input

Example:

**Please select your role.**

------------------------------------------------------------------------

# 15. Terms and Privacy Agreement

## [15.1] Agreement Checkbox

Allows the user to confirm acceptance of the application's legal terms.

The UI displays:

**I agree to the Terms of Service and Privacy Policy**

The Terms of Service and Privacy Policy should be presented as clickable links if corresponding pages are implemented.

------------------------------------------------------------------------

## [15.2] Agreement Validation

The user must agree to the required terms before registration is submitted.

### If Not Selected

Display:

**Please agree to the Terms of Service and Privacy Policy.**

The Sign Up action should not create an account until the required agreement is accepted.

------------------------------------------------------------------------

# 16. Sign Up Button

## [16.1] Sign Up

Submits the registration form.

### On Click

1. Validate full name.
2. Validate email.
3. Validate password.
4. Validate confirm password.
5. Validate role selection if required.
6. Validate Terms of Service and Privacy Policy agreement.
7. Send registration request.
8. Create the user account.
9. Establish the appropriate authentication/session state.
10. Redirect the user according to the application's configured registration flow.

### Successful Registration

The user proceeds to the next configured step, such as:

**Sign Up → Dashboard**

or

**Sign Up → Login → Dashboard**

The exact flow depends on the authentication implementation.

### Failed Registration

Display a clear, user-friendly error message.

Examples:

**An account with this email already exists.**

**Unable to create your account. Please try again.**

### Loading State

While registration is processing:

- Sign Up button is disabled.
- Loading indicator is displayed.
- Duplicate registration requests are prevented.

------------------------------------------------------------------------

# 17. Google Authentication

## [17.1] Continue With Google

Provides Google OAuth authentication if implemented.

### Flow

1. User selects Google.
2. Google authentication opens.
3. User authenticates.
4. SynaptiRole AI receives the authentication result.
5. User account is created or retrieved.
6. User is redirected according to the configured authentication flow.

If OAuth is not implemented, this should not be presented as an active button.

------------------------------------------------------------------------

# 18. GitHub Authentication

## [18.1] Continue With GitHub

Provides GitHub OAuth authentication if implemented.

### Flow

1. User selects GitHub.
2. GitHub authentication opens.
3. User authenticates.
4. SynaptiRole AI receives the result.
5. Account is created or retrieved.
6. User is redirected according to the configured authentication flow.

If OAuth is not implemented, this should not be presented as an active button.

------------------------------------------------------------------------

# 19. Login

## [19.1] Login Link

Allows an existing user to return to the Login Page.

The top-right section displays:

**Already have an account? Log in**

### On Click

The user is redirected to:

**Sign Up → Login**

No registration data should be submitted when the Login link is selected.

------------------------------------------------------------------------

# 20. Sign Up Validation

The page should validate user input before sending the registration request.

Possible errors:

- Empty full name
- Invalid full name
- Empty email
- Invalid email
- Email already registered
- Empty password
- Password does not satisfy requirements
- Empty confirm password
- Password mismatch
- Role not selected
- Terms not accepted
- Server error
- Network error

Errors should appear close to the relevant control or as a clear form-level message.

------------------------------------------------------------------------

# 21. Sign Up Loading State

While account creation is processing:

- Sign Up button is disabled.
- Loading indicator is displayed.
- Duplicate registration requests are prevented.
- User input should remain stable unless the implementation requires otherwise.

------------------------------------------------------------------------

# 22. Sign Up Success

After successful registration, the application should continue to the configured authenticated or authentication-completion flow.

Possible flow:

**Sign Up → Account Created → Dashboard**

or:

**Sign Up → Account Created → Login → Dashboard**

The exact behavior depends on the authentication architecture.

------------------------------------------------------------------------

# 23. Sign Up Error Handling

If registration fails because of a server or network issue, display a user-friendly message.

Example:

**Unable to connect. Please try again.**

Do not expose technical backend errors to the user.

------------------------------------------------------------------------

# 24. Overall Sign Up Workflow

**Open Application**

↓

**Sign Up Page**

↓

**Enter Full Name + Email**

↓

**Create Password + Confirm Password**

↓

**Select Role**

↓

**Accept Terms & Privacy Policy**

↓

**Validate Input**

↓

**Create Account**

↓

**Successful?**

- Yes → Authentication/Dashboard
- No → Display Error

Optional:

**Google/GitHub OAuth → Authentication/Dashboard**

------------------------------------------------------------------------

# 25. Navigation Between Authentication Pages

The authentication pages should provide a clear transition between new-user registration and existing-user login.

### New User

**Login Page → Sign Up**

### Existing User

**Sign Up Page → Login**

This prevents users from becoming trapped on either authentication page.

------------------------------------------------------------------------

# 26. Sign Up UI Objective

The Sign Up Page should:

- Clearly communicate the application's purpose.
- Make account creation simple.
- Collect only required registration information.
- Provide useful validation.
- Clearly communicate password requirements.
- Clearly show the role-selection step.
- Clearly communicate Terms of Service and Privacy Policy acceptance.
- Maintain the same visual identity as the Login Page.
- Provide optional OAuth authentication when implemented.
- Avoid unnecessary complexity.

The primary new-user journey is:

**Sign Up → Create Account → Authenticate → Dashboard**
