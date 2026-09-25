# Customizing Git Hooks for Workflow Automation

> Source: https://www.geeksforgeeks.org/git/customizing-git-hooks-for-workflow-automation/

Git is a distributed version control system that monitors changes to a project. Git hooks are scripts that run in response to Git events such as commit or push. They automate tasks, enforce rules, and can be tailored to your project's requirements. A pre-commit hook, for example, can detect errors in the code, whereas a post-receive hook can send email notifications. Customizing these hooks can help streamline your workflow and make Git a more versatile tool.
There are two types of Git Hooks: server-side and client-side. Client-side hooks function locally, while server-side hooks run on the Git server. Git hooks are commonly used to run tests before committing changes, enforce code-style guidelines, and notify team members after successful pushes.
Table of Content
Use Cases of Git Hooks
- Enforcing code style guidelines
- Running tests
- Preventing commits with specific patterns
- Notifying team members
- Automating deployment
- Enforcing commit message conventions
- Integration with issue trackers
- Preventing accidental commits to certain branches
- Git hooks can be customized to fit many other use cases, depending on your team's needs.
Types of Git Hooks
- Pre-commit: This hook is called before any commits are created. It can be used to check the staged changes for code style violations or syntax errors.
- Prepare-commit-msg: This hook is executed before the commit message editor is opened, but it runs after the default message has been set.
- Commit-msg: This hook is run before the commit is completed, but it runs after the commit message has been created. It can be applied to verify the format or content of the commit message.
- Post-commit: This hook is triggered after a commit. It can be used to perform actions such as sending notifications or updating documentation.
- Pre-rebase: This hook is triggered before a rebase operation starts. It can be used to perform checks or actions to ensure that the rebase can proceed smoothly.
- Post-rewrite: This hook is triggered by commands that rewrite commit history, such as `git commit --amend` or `git rebase`. It can be used to perform actions after the history has been rewritten.
- Pre-push: This hook is triggered before a push to a remote repository. It can be used to perform checks or actions to ensure that the push is allowed.
- Pre-receive: This hook is triggered on the remote repository before any references are updated. It can be used to enforce policies on incoming commits.
- Update: This hook is triggered on the remote repository when a reference is being updated. It can be used to perform checks or actions on the updates.
- Post-receive: This hook is triggered on the remote repository after all references have been updated.
Steps to create a hook from scratch
- Navigate to the hooks directory: Git hooks are stored in the .git/hooks directory of your Git repository. Navigate to this directory using the command line.
cd /path/to/your/repo/.git/hooks
- Create a new file for the hook: Create a new file in the hooks directory with the name of the hook you want to create. For example, if you want to create a pre-commit hook, you would create a file named pre-commit.
touch pre-commit
- Make the hook executable: The hook must be executable to run. Change the file permissions to make it executable.
chmod +x pre-commit
- Edit the hook script: Open the hook file in a text editor and write your script. The script can be written in any scripting language. The shebang at the top of the script should correspond to the language of the script. For example, if you’re writing a bash script, the shebang would be #!/bin/bash.
Example of a simple pre-commit hook script that prevents commits with a certain word in the commit message:
#!/bin/bash
if git rev-parse --verify HEAD >/dev/null 2>&1
then
    against=HEAD
else
    # Initial commit: diff against an empty tree object
    against=$(git hash-object -t tree /dev/null)
fi
# Check for forbidden words in the commit message
if test $(git diff --cached --name-only | xargs grep -l 'FORBIDDEN_WORD' | wc -l) != 0
then
    echo "Your commit contains a forbidden word. Please remove it."
    exit 1
fi
# If there were no issues, exit with success
exit 0
- Test the hook: Make changes to your repository that would trigger the hook and ensure it behaves as expected.
Remember that Git hooks are unique to your Git repository and are not versioned. If you want to share your hooks with others, add them to your project in a separate directory and create a script to copy them to the .git/hooks folder.
Customizing Git Hooks
Workflow automation with customized Git hooks can improve your team's output and adherence to best practices significantly.
How to customize Git hooks for various automation tasks:
- Pre-Commit Hooks: 
  - Triggered before a commit is made. It executes the defined actions (such as running tests, linting, etc.) and can prevent the commit if any checks fail.
  - Code Linting: To enforce code style standards, use programs like Pylint, ESLint, or RuboCop.
  - Static Analysis: Utilize tools for static analysis to find possible problems early.
  - Verify that dependencies are compatible and up to date by doing dependency checking.
  - Utilize unit tests to identify issues before they are added to the repository.
Example: Pre-commit Hook for Code Linting':
#!/bin/bash
# Run the linter
linter_output=$(npm run lint)
# If the linter found issues, print them and exit with a non-zero status
if [[ $linter_output == *"ERROR"* ]]; then
  echo "Linting errors found, aborting commit:"
  echo $linter_output
  exit 1
fi
# If there were no issues, exit with success
exit 0
- Prepare-Commit-Msg Hooks: Commit Message Templates: Pre-fill commit messages with templates containing required information (e.g., Jira ticket number).
  - Commit-Msg Hooks: Commit Message Validation: Enforce rules for commit message formatting and content.
- Post-Commit Hooks: Notification: Send notifications to team members or update issue trackers.
Example of "Post-commit Hook for Automated Push":
#!/bin/bash
# Push the commit to the remote repository
git push origin master
# Exit with success
exit 0
- Pre-Push Hooks: 
  - Code Review: Integrate with code review tools to ensure code quality before pushing.
  - Branch Protection: Prevent pushing to protected branches without necessary approvals.
- Pre-Rebase Hooks:
  - Branch Policy Enforcement: Check if the branch is allowed to be rebased based on your team's policies.
- Post-Rewrite Hooks: 
  - Documentation Update: Automatically update documentation or release notes after history rewriting.
- Pre-Receive Hooks (Server-Side):
  - Enforce Policies: Check if incoming changes meet certain criteria (e.g., code coverage, required reviewers).
- Update Hooks (Server-Side):
  - Enforce Branch Policies: Ensure that updates to branches follow your team's workflow.
- Post-Receive Hooks (Server-Side):
  - Deployment Automation: Automatically trigger deployment pipelines after changes are pushed.
A pre-commit hook that runs tests before allowing a commit:
#!/bin/bash
run_test(){
    npm test
}
run_lint(){
    eslint .
}
run_formatting(){
    prettier --check .
}
run_test
run_lint
run_formatting
if [$? -ne 0 ]; then
    echo "Checks Failed. Aborting commit."
    exit 1
fi
exit 0
A post-merge hook that notifies team members after a successful merge.
#!/bin/bash
notify_team(){
    slack-cli -c react-assets-gh-bot "New changes into main branch"
}
if[ $? -eq 0]; then
    notify_team
fi
Best Practices
- Keep hooks lightweight and fast to avoid impacting developer workflow.
- Provide informative messages to guide developers on why a hook is being triggered.
- Use version control for hooks to ensure consistency across the team.
- Test hooks in a controlled environment before deploying them to your production repository.
