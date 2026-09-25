# Essential Git Commands

> Source: https://www.geeksforgeeks.org/git/essential-git-commands/

Git includes many commands, but a core set is commonly used to streamline development workflows from repository setup to collaboration.
- Repository setup, tracking changes, and maintaining project history.
- Branch management, switching, and integrating code changes.
- Synchronizing with remote repositories and handling temporary work.
Create
Used to start working with repositories.
- git clone: Clones (copies) an existing remote repository to your local system, including all files, branches, and commit history.
- git init: Initializes a new Git repository in your current folder by creating a .git directory to track changes.
Local Changes
Used to track, review, and prepare changes before committing.
- git status: Displays the state of your working directory (modified, staged, and untracked files).
- git diff: Shows differences between working directory and staging area (what changes are not yet staged).
- git add: Adds all current changes to the staging area (prepares them for commit).
- git add -p: Allows you to stage changes selectively (line-by-line or chunk-by-chunk).
- git commit -a: Commits all tracked files directly without using git add (does not include new/untracked files).
- git commit: Saves staged changes as a new commit in the repository.
- git commit --amend: Modifies the last commit (useful for fixing commit message or adding missed changes).
Commit History
Used to view and analyze project history.
- git log: Shows all commits in reverse chronological order (latest first).
- git log -p: Displays detailed changes (diff) introduced in each commit.
- git blame: Shows who last modified each line of a file and when (useful for debugging).
Branches and Tags
Used for parallel development and version management.
- git branch -av: Lists all local and remote branches.
- git checkout: Switches from one branch to another.
- git branch: Creates a new branch from the current HEAD.
- git checkout --track: Creates a new branch that tracks a remote branch.
- git branch -d: Deletes a local branch (only if merged).
- git tag: Marks a specific commit (commonly used for releases like v1.0).
Update and Publish
Used to interact with remote repositories.
- git remote -v: Lists all configured remote repositories with URLs.
- git remote show: Displays detailed information about a specific remote.
- git remote add: Adds a new remote repository.
- git fetch: Downloads changes from remote repository without merging them.
- git pull: Fetches changes and merges them into your current branch.
- git push: Uploads your local commits to a remote repository.
- git branch -dr: Deletes a remote-tracking branch.
- git push --tags: Pushes all tags to the remote repository.
Merge and Reuse
Used to combine work from multiple branches.
- git merge: Merges another branch into your current branch, preserving history.
- git rebase: Reapplies your commits on top of another branch to maintain a clean linear history.
- git rebase --abort: Cancels the rebase process and returns to original state.
- git rebase --continue: Continues rebase after resolving conflicts.
- git mergetool: Opens a graphical tool to resolve merge conflicts.
- git add / git rm: After resolving conflicts manually, these commands mark files as resolved.
Undo
Used to undo or revert changes safely or forcefully.
- git reset --hard HEAD: Discards all local changes and resets to the last commit (irreversible).
- git checkout HEAD <file>: Restores a specific file to its last committed version.
- git revert: Creates a new commit that undoes a previous commit (safe for shared repositories).
- git reset --hard <commit>: Moves HEAD to a previous commit and deletes all changes after it.
- git reset: Unstages changes but keeps them in the working directory.
- git reset --keep: Resets commits while preserving uncommitted local changes.
