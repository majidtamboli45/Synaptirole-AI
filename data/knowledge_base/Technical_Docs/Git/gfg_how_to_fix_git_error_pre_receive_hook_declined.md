# How To Fix Git Error: Pre-Receive Hook Declined?

> Source: https://www.geeksforgeeks.org/git/how-to-fix-git-error-pre-receive-hook-declined/

When working with Git repositories, you may encounter an error message that says "Pre-receive hook declined." This error occurs when a pre-receive hook, a type of server-side Git hook, rejects your push. Pre-receive hooks are scripts that run on the server before the push is accepted, and they are often used to enforce rules about commits, branches, or files. Here’s a comprehensive guide to understanding and fixing this error.
Understanding Pre-Receive Hooks
Pre-receive hooks are used to enforce certain conditions on a repository. Common reasons for setting up pre-receive hooks include:
- Code Quality Checks: Enforcing coding standards or running automated tests.
- Branch Policies: Restricting pushes to specific branches or enforcing branch naming conventions.
- Commit Policies: Ensuring commit messages follow a particular format or preventing large commits.
- Security Policies: Preventing the inclusion of sensitive data in the repository.
When a pre-receive hook fails, the push is rejected, and you see the "pre-receive hook declined" error. To fix this error, you need to understand why the hook declined your push and resolve the underlying issue.
Steps to Fix the "Pre-Receive Hook Declined" Error
Step 1: Read the Error Message
The error message often includes details about why the pre-receive hook declined your push. Carefully read any additional information provided. It might point you directly to the issue.
Step 2: Check Repository Policies:
Review the repository's contributing guidelines or any documentation related to repository policies. This can provide insights into the rules enforced by the pre-receive hooks.
Step 3: Inspect Your Changes:
- Compare your changes against the repository’s policies. Check if you have:
- Violated commit message formats.
- Pushed to a restricted branch.
- Included files or changes that violate repository policies (e.g., large files, sensitive information).
Step 4: Run Tests Locally:
If the hook enforces code quality or runs tests, ensure all tests pass locally. You might need to fix code quality issues or failing tests before pushing.
Step 5: Amend Commit Messages:
If the error relates to commit messages, amend your commits to follow the required format. For example:
git commit --amend -m "New commit message"
git push --force
Step 6: Split Large Commits:
If the error is due to the size of the commit, consider splitting large commits into smaller ones:
git reset --soft HEAD~1
git add -p
git commit -m "First part of changes"
git add -p
git commit -m "Second part of changes"
git push
Step 7: Contact Repository Administrators:
If you’re unable to determine the cause or resolve the issue, contact the repository administrators. They can provide specific details about the pre-receive hook and help you understand what needs to be fixed.
Step 8: Check for Updated Hooks:
Sometimes, pre-receive hooks are updated, and your local branch may be out of sync with the latest requirements. Fetch the latest changes from the repository:
Step 9: Correct Branch Naming:
Ensure you’re pushing to the correct branch if branch naming conventions are enforced. Rename your branch if necessary:
git checkout -b new-branch-name
git push --set-upstream origin new-branch-name
Example Scenario and Fix
remote: error: commit message did not match format: [JIRA-123] Description of change
remote: error: pre-receive hook declined
Fix:
Step 1: Amend your commit message to include the required JIRA ticket number:
git commit --amend -m "[JIRA-123] Description of change"
git push --force
Step 2: If the repository doesn’t allow force-pushing, you might need to create a new commit:
git revert HEAD
git commit -m "[JIRA-123] Description of change"
git push
By understanding the specifics of the pre-receive hook and following the steps outlined above, you can effectively resolve the "pre-receive hook declined" error and ensure your changes adhere to the repository’s policies.
