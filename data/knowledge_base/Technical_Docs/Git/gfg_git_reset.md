# Git Reset

> Source: https://www.geeksforgeeks.org/git/how-to-reset-to-head-in-git/

git reset is a powerful Git command used to move your project’s state backward. It helps undo changes at three key levels:
- HEAD (which points to the latest commit).
- Index/staging area (where files are prepared for commit).
- Working directory (your actual local files).
Working of Git Reset
Depending on how it’s used, git reset allows you to:
- Unstage files that were accidentally added.
- Discard unwanted changes in the working directory.
- Roll back your current branch to a previous commit.
This makes it extremely useful for cleaning up your history during development or fixing staging mistakes.
Before and After Reset (Commit History)
Understand through the image below, which shows how commit history changes when you use git reset.
Before Reset
- There are two branches: the master branch (green commits) and the hotfix branch (pink commit).
- Each branch contains its own sequence of commits.
- Both branches currently point to their most recent commits.
This refers to the typical state of your working directory, with everything in order.
After Reset
Run this command on the master branch:
git reset --hard <some-older-commit>
- The master branch pointer moves back to an earlier commit.
- Project history is reverted to a previous state.
- Later commits become orphaned and hidden from the log.
- Orphaned commits still exist internally in Git.
- The hotfix branch remains unchanged.
Git Reset Modes
There are three primary modes of git reset:
Soft Reset (--soft)
Undo a commit but keep all changes staged.
- Moves the HEAD to an earlier commit.
- Keeps changes staged in the index.
- Leaves your working directory unchanged.
Mixed(Medium) Reset (--mixed) (default)
Resets the branch pointer and clears the staging area while keeping your working directory changes intact.
- Moves HEAD and updates the index to match the target commit.
- Unstages changes.
- Leaves the working directory unchanged.
Hard Reset (--hard)
It is irreversible and will delete your changes permanently.
- Moves HEAD, index, and the working directory to the specified commit.
- All changes (staged + unstaged) are lost.
Example
1. Unstage Files Without Losing Changes
To unstage changes you have added with git add, but keep them in your working directory:
git reset
This is a mixed reset and is helpful when you want to modify what’s staged without affecting the actual file content.
2. Revert to a Previous Commit Without Losing Work
To move the HEAD to a previous commit and keep your changes staged:
git reset --soft <commit-hash>
This lets you rewrite history and prepare your changes for a cleaner commit sequence.
3. Completely Discard All Changes
To discard all changes and reset your branch to a specific commit:
git reset --hard <commit-hash>
This removes all staged and unstaged changes and resets the branch to the specified commit—use with extreme caution as it is irreversible.
