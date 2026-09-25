# Recovering Lost Commits in Git

> Source: https://www.geeksforgeeks.org/git/recovering-lost-commits-in-git/

Git is a powerful version control tool, but improper usage can lead to lost commits. However, lost work can be recovered using commands like git reflog and git cherry-pick.
- Lost commits can occur due to resets, rebases, or incorrect operations.
- git reflog helps track previous actions and locate lost commits.
- git cherry-pick is used to restore specific commits back into the branch.
Note: Reflog data is temporary. Git periodically cleans it, so recovery must be done promptly.
Procedure to Recover Lost Commits
Step 1: View Reflog History
The first step is to view all previous actions and commits in the repository.
git reflog
Note: Commit hashes will differ in your local repository. Use the relevant hash from your reflog.
Step 2: Identify the Commit
Find the commit hash you want to recover.
Example: e77111b
Step 3: Recover the Commit
Use the git cherry-pick command to restore the commit.
git cherry-pick e77111b
Output:
Handling Merge Conflicts (If Any)
If a conflict occurs during recovery, you may see:
error: could not apply 12944d8... API touchups
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add ' or 'git rm '
hint: and commit the result with 'git commit'
Steps to Resolve merge conflict
Step 1: Manually resolve conflicts in the affected files
Step 2: Stage the resolved files:
git add <file>
Step 3: Complete the process:
git commit
