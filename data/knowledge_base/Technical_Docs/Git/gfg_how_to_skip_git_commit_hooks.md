# How To Skip Git Commit Hooks?

> Source: https://www.geeksforgeeks.org/git/how-to-skip-git-commit-hooks/

Git commit hooks are powerful tools that automatically run scripts before or after specific Git operations, such as committing or pushing code. They are used to enforce coding standards, run tests, or automate tasks. However, there might be situations where you need to bypass these hooks temporarily, for instance, during large imports or debugging. This article explains how to skip Git commit hooks effectively and responsibly.
Understanding Git Hooks
Git hooks are scripts that run automatically in response to specific Git events. They are stored in the .git/hooks directory of a repository and can be customized to perform various tasks. Common hooks include:
- Pre-commit: Runs before a commit is created, often used for linting or formatting checks.
- Commit-msg: Validates the commit message format.
- Pre-push: Runs before code is pushed to a remote repository, often used for running tests.
While hooks are beneficial for maintaining code quality and consistency, there are some cases where skipping them can be useful.
Methods to Skip Git Commit Hooks
1. Using the --no-verify Flag
The most straightforward way to skip commit hooks is by using the --no-verify flag. This flag can be applied to several Git commands to bypass their associated hooks.
Skip Pre-commit and Commit-msg Hooks
To bypass pre-commit and commit-msg hooks when making a commit:
git commit -m "Your commit message" --no-verify
Skip Pre-push Hook
To skip the pre-push hook when pushing code to a remote repository:
git push --no-verify
2. Temporarily Disabling Hooks
If you need to disable hooks temporarily without using the --no-verify flag repeatedly, you can rename the hooks or move them out of the .git/hooks directory.
Rename Hook Files
Navigate to the .git/hooks directory and rename the hook scripts:
cd .git/hooks
mv pre-commit pre-commit.disabled
mv commit-msg commit-msg.disabled
After completing your tasks, rename them back:
mv pre-commit.disabled pre-commit
mv commit-msg.disabled commit-msg
3. Bypassing Hooks with Environment Variables
Some hooks are designed to check for specific environment variables to decide whether to run. This approach requires that the hooks are written to recognize and respect these variables.
Example Environment Variable Bypass
Suppose your pre-commit hook checks for a SKIP_HOOKS environment variable:
1. Set the Environment Variable:
export SKIP_HOOKS=true
2. Run Git Command:
git commit -m "Your commit message"
3. Unset the Variable Afterward:
unset SKIP_HOOKS
4. Skipping Hooks by Renaming Them
If you need to bypass hooks for multiple operations and don’t want to use --no-verify each time, you can rename or move the hook scripts temporarily.
Move Hooks to Another Directory
Create a backup directory and move the hooks there:
mkdir -p .git/hooks_backup
mv .git/hooks/pre-commit .git/hooks_backup/
mv .git/hooks/commit-msg .git/hooks_backup/
After your tasks are done, restore the hooks:
mv .git/hooks_backup/pre-commit .git/hooks/
mv .git/hooks_backup/commit-msg .git/hooks/
Examples
Example 1: Skipping Hooks for a Single Commit
You are in the middle of a large refactor and need to commit your changes, but the pre-commit hook is time-consuming due to linting checks. Use --no-verify to bypass the hook for this commit:
git commit -m "Refactoring codebase" --no-verify
Example 2: Temporarily Disabling Hooks for a Batch Operation
You are performing a series of commits or pushing multiple branches, and the hooks are slowing you down. Move the hooks out of the .git/hooks directory:
mv .git/hooks/pre-commit .git/hooks_backup/
mv .git/hooks/commit-msg .git/hooks_backup/
After completing the batch operation, restore the hooks:
mv .git/hooks_backup/pre-commit .git/hooks/
mv .git/hooks_backup/commit-msg .git/hooks/
Example 3: Using Environment Variables to Control Hooks
Your team has configured hooks to skip when a specific environment variable is set. Before committing, you set the variable:
export SKIP_HOOKS=true
git commit -m "Quick fix without hooks"
unset SKIP_HOOKS
