# Git Rebase

> Source: https://www.geeksforgeeks.org/git/rebasing-of-branches-in-git/

Git rebase integrates changes by replaying your commits on top of the latest state of another branch, creating a cleaner, linear history.
- Moves commits to the tip of the target branch.
- Rewrites commit history instead of creating a merge commit.
- Keeps project history linear and easier to read.
Syntax:
git checkout <feature-branch>
git rebase <base-branch>
- <feature-branch> is the branch with the changes you want to rebase.
- <base-branch> is the branch you want to rebase your changes onto, typically main or master.
Usage of Git Rebase
Git helps developers track, manage, and collaborate on code efficiently.
- Tracks changes in files and maintains version history.
- Enables collaboration among multiple developers.
- Supports branching and merging for parallel development.
- Allows rollback to previous versions when needed.
- Helps manage code across local and remote repositories.
- Facilitates code sharing using platforms like GitHub.
Example:
1. You and your teammate start with this:
A → B   (main branch)
2. You create your feature branch and make some changes:
A → B   (main)
\
C → D (feature)
3. Meanwhile, your teammate updates the main branch:
A → B → E → F   (main)
\
C → D (your branch is outdated now)
4. Now you run:
git checkout feature
git rebase main
5. Your feature branch is moved and now looks like:
A → B → E → F → C' → D'  (rebased feature branch)
Your work (C and D) is now placed after the latest work (E and F). The code history is clean and easy to follow.
Understanding the Rebase Process
Rebase reapplies your commits on top of the latest base branch to create a clean, linear history.
- Git temporarily removes your changes.
- Then it adds the latest work from the branch you rebased onto.
- Then it reapplies your changes on top of that.
- It creates new commit versions of your changes (called C′ and D′).
Visual Working of Git Rebase
Before Rebasing
C1 → C2 → C3 → C4 → C5   (Main Branch)
\
B1 → B2 → B3 (Feature Branch)
- C1 to C5 are commits on the main branch (green).
- B1 to B3 are commits on the feature branch (yellow), created from C3 .
- At this point, the feature branch is outdated, because the main branch has moved ahead ( C4 and C5 were added after C3).
After Rebasing B1, B2, and B3
C1 → C2 → C3 → C4 → C5 → C6 → C7 → C8
↑
(Rebased Feature Commits)
- The git rebase command takes commits B1 → B2 → B3 and reapplies them on top of C5, the latest commit on main.
- These become new commits: C6 → C7 → C8 (green versions of B1–B3).
- The feature branch now appears as if it was based on the latest version of the main branch.
Internal Workflow of Git Rebase
Git rebase shifts your branch base to the latest commit and reapplies your changes sequentially.
- Git finds the common ancestor commit (C3) between the main and feature branches.
- Temporarily removed commits B1, B2, and B3.
- Moved the base of the feature branch from C3 to C5.
- Re-applied the changes from B1-B3 on top of C5 as new commits C6, C7, C8.
Types of Git Rebase
Git rebase comes in different types to either automate or customize how commits are reapplied.
1. Interactive Rebase (git rebase -i)
Interactive rebase allows you to modify commit history before integrating changes.
- Allows editing, squashing, reordering, or deleting commits.
- Combines multiple commits into a single clean commit.
- Helps reorder commits for a clearer history.
- Enables editing commit messages before pushing.
Commands
- Reword a commit message
reword a1b2c3 Updated login feature
- Squash commits into one
squash d4e5f6 Fixed button styling
- Edit a commit during rebase
edit g7h8i9 Added validation
2. Non-Interactive Rebase (Standard Rebase)
Standard rebase automatically reapplies commits onto another branch without manual intervention.
- Automatically reapplies commits onto the target branch using git rebase <branch>.
- Does not allow manual editing of commits during the rebase.
- Used to update a feature branch with the latest changes from the main branch.
Commands
- Rebase current branch onto main
git rebase main
- Continue rebase after resolving conflicts
git rebase --continue
- Abort an ongoing rebase
git rebase --abort
3. Auto-merge Rebase
Auto-merge rebase applies commits automatically and only pauses when conflicts need resolution.
- Automatically applies commits when no conflicts are found.
- Stops and requires manual resolution if conflicts occur.
- Commonly used to keep feature branches up to date with the main branch.
Commands
- Pull remote changes with automatic rebasing
git pull --rebase
- Fetch and rebase local commits onto updated remote branch
git fetch origin
git rebase origin/main
- Automatically squash commits marked as fixup or squash
git rebase --autosquash main
Git Standard Vs Git Interactive Rebase
| Aspect | Standard Rebase | Interactive Rebase | 
|---|---|---|
| Command | git rebase master | git rebase -i master | 
| Control | No manual control over commits | Full control (edit, reorder, squash, drop) | 
| Interaction | Fully automatic | Requires user input in editor | 
| Use Case | Simply update branch with latest changes | Clean and organize commit history | 
| History Editing | Not possible | Possible (rewrite commit history) | 
Common Git Rebase Commands
The following are the most used Git rebase commands:
- git rebase master: Applies the changes of the current branch onto the master branch.
- git rebase --continue: Continues the rebase process after resolving conflicts
- git rebase --abort: Cancels the ongoing rebase and restores the branch to its original state
- git rebase --skip: Skips the conflicted commit (use cautiously).
- git rebase -i HEAD~3: Interactively edit the last three commits.
Configuration Options In Git Rebase
Customize your rebase process with options like:
- --interactive (-i): Enables interactive rebasing for editing commits.
- --onto <newbase>: Specifies a new base commit for rebase.
- --no-verify: Skips pre-commit hooks during rebase.
- --auto-squash: Automatically squashes commits marked with fixup or squash
Git Rebase Abort
There are two correct ways to undo a rebase, depending on the situation:
1. If rebase is still in progress (not completed)
git rebase --abort
Cancels the rebase and returns your branch to its original state
2. If rebase is already completed
git reset --hard HEAD@{1}
Moves your branch back to the state before the rebase (using reflog)
Recovering Lost Changes After an Upstream Rebase
This process helps restore commits or changes that may be lost after rebasing against an upstream branch.
Step 1: Check the Reflog
Use the following command to view the commit history, including the lost commits:
git reflog
Step 2: Checkout the Lost Commit
Moves to detached HEAD
git checkout <commit-id>
Step 3: Create a New Branch
Once you find the commit ID, create a new branch from it:
git branch <new-branch> <commit-id>
Step 4: Cherry-pick Lost Commits
The following command is used to apply specific (lost or required) commits to another branch:
git cherry-pick <commit id> Step 5: Resolve Conflicts
Use git add <file> to stage resolved files.
git add <file>
Step 6: Push the New Branch
To push your new branch to the remote repository use the following command:
git push -u origin <new-branch>
Git Pull Rebase
The git pull --rebase command fetches updates from the remote repository and re-applies your local commits on top of those changes, resulting in a linear commit history.
Steps:
- Fetch the remote repository:
git fetch <remote>
- Rebase the local branch:
git pull --rebase
Best Practices for Using Git Rebase
Use git rebase to keep commit history clean and up to date while avoiding changes to shared branches and resolving conflicts promptly.
- Don’t Rebase Public History: Avoid rebasing shared branches to prevent disrupting others’ work.
- Clean Up Commits with Rebase: Squash or organize commits before merging to main.
- Rebase Regularly: Keep feature branches updated to reduce future conflicts.
- Resolve Conflicts Quickly: Fix conflicts promptly during rebasing.
