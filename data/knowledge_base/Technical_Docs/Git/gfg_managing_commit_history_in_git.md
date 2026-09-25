# Managing Commit History in Git

> Source: https://www.geeksforgeeks.org/git/git-changing-history/

Git provides powerful features to alter commit history, allowing you to change commit messages, reorder commits, or remove them to maintain a clean project history.
- Modify, reorder, or remove commits.
- Helps manage and maintain clean project history.
- Should be used carefully to avoid unintended changes.
Commands for Altering Commit History
Commands used to modify, reorganize, or rewrite commit history in Git.
1. git commit --amend
Used to modify the most recent commit.
- Change commit message or update files
- Replaces the last commit with a new one
git commit --amendgit commit --amend -m "Updated message"git commit --amend --no-edit
This option helps you to commit remaining changes if any without changing it's commit message.
2. git rebase
Used to modify or reorganize commit history by changing the base of a branch.
- Creates a cleaner, linear history.
- Reapplies commits onto a new base.
Interactive Rebase
- Interactive rebase lets you rewrite commit history by editing, reordering, squashing, or deleting commits.
- It’s useful for cleaning up commits before sharing changes with others.
git rebase -i HEAD~3
Rebase Options
These options control and manage the rebase process during or after conflicts.
- git rebase --continue: Continue after resolving conflicts
- git rebase --abort: Cancel and restore original state
- git rebase --quit: Stop rebase without resetting HEAD
3. git filter-branch
Used to rewrite large portions of commit history.
- Remove files from all commits.
- Modify author/email globally.
- Restructure repository.
