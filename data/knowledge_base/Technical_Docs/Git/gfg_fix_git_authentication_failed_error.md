# Fix Git Authentication Failed Error

> Source: https://www.geeksforgeeks.org/git/git-how-to-solve-remote-invalid-username-or-password-fatal-authentication-failed/

Git authentication failed errors occur when incorrect credentials or outdated authentication methods prevent access to remote repositories.
- Ensure correct username and password or token are used.
- Use personal access tokens instead of passwords when required.
- Check and update saved credentials or authentication settings.
Common Causes of the Error
Occurs due to invalid credentials or changes in authentication settings.
- Incorrect Username or Password: The simplest reason is entering the wrong username or password.
- Outdated Credentials: Saved credentials that are no longer valid can cause this error.
- Two-Factor Authentication (2FA): If 2FA is enabled on your Git hosting service, your regular password won't work.
- Changed Password: If you've recently changed your password, your saved credentials may be outdated.
- Token Expiry: If you're using a personal access token (PAT), it might have expired.
Steps to Solve the Error
Follow a structured process to identify and fix Git authentication issues.
Step 1: Creating a git repository and installing Git Bash
Create a Git repository to store your project files and ensure Git Bash is installed on your system. Once you understand basic Git operations like pushing code, you can proceed to handle authentication errors.
Step 2: Prepare Repository and Files
Create a sample (dummy) Git repository and keep the files ready that you want to upload to GitHub.
Following image attached below shows the files which we are going to upload to the GitHub repository.
Step 3: Verify Git Installation
Check whether Git Bash is installed and working correctly on your system before proceeding.
Step 4: Identify the Error
While pushing files to the repository, you may encounter the error: “remote: Invalid username or password / fatal: Authentication failed”
This guide focuses on resolving this specific issue.
Step 5: Resolve the Error
Generate Personal Access Token (PAT)
- Go to GitHub Settings > Developer Settings > Personal Access Tokens > Tokens (classic).
- Click on Generate New Token.
- Create and copy the token.
Use Token for Authentication
- Run the push command again in Git Bash
- When prompted for credentials: Paste the generated token as the password or OR choose Sign in with your browser.
Complete Authentication
- After successful login, you will be redirected to a confirmation page.
- Close the browser tab and return to Git Bash.
After completing authentication, return to Git Bash to confirm the error is resolved and files are successfully pushed.
Verify the repository on GitHub to confirm that files are successfully pushed and the authentication error is resolved.
