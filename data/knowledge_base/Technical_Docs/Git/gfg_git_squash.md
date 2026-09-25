# Git Squash

> Source: https://www.geeksforgeeks.org/git/git-squash/

Git squash combines multiple commits into a single commit to simplify and clean up project history, making it more organised and easier to review.
- The top sequence shows multiple incremental commits made during development (feature branch history).
- The squashing process combines those intermediate commits into a single commit.
- The bottom sequence shows a cleaner history with fewer commits, making it easier to understand and review.
Git Squash-Merge Command (Command Line)
You can combine commits from a feature branch into a single commit and merge it into your current branch using:
git merge --squash feature-branch
This command condenses all commits from the feature branch into one that is applied onto your current branch. After squash merging, the repository history becomes cleaner and more organised.
Ways to Squash Commits
There are mainly two way:
1. Interactive Rebase Method
git rebase -i HEAD~3
Steps:
- An interactive editor opens listing the last 3 commits.
- Change pick to squash (or s) for the commits you want to combine.
- Save and close the editor.
- Another editor opens to edit the combined commit message.
- Save and exit to complete the rebase.
Result: Multiple commits are combined into a single commit.
2. Squashing with the --squash Option
Steps:
- Switch to your target branch:
git checkout main
- Merge using squash:
git merge --squash feature-branch
- Resolve any merge conflicts (if they occur).
- Commit the combined changes:
git commit -m "Add group video calls and bug fixes"
- Push changes to the remote repository.
Squashing Last Two Commits
git rebase -i HEAD~2
Steps:
- Open interactive rebase for the last 2 commits.
- Change pick to squash for the second commit.
- Save, update the commit message if needed, and close the editor.
Result: The last two commits are merged into one.
Git Squash Vs Rebase
| Git Squash | Git Rebase | 
|---|---|
| You can combine multiple commits into a single commit. | Applies commits on top of the different base commits. | 
| After using git squash your commit history will be more clean and organized. | You can form a new branch by using previous commits. | 
| Must be done on private branches. | Rebasing can be done on a feature branch or shared branch. | 
| By using squishing you can maintain clean and logical commit history. | By using rebase command you can keep your branch up to date. |
