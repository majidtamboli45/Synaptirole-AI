# How to cherry-pick Multiple Commits in Git?

> Source: https://www.geeksforgeeks.org/git/how-to-cherry-pick-multiple-commits-in-git/

Cherry-picking in Git allows you to apply the changes from a specific commit (or commits) to another branch. This can be particularly useful when you need to incorporate bug fixes or features from one branch to another without merging the entire branch. While cherry-picking a single commit is simple, doing so for multiple commits requires some additional steps. This article guides you through the process of cherry-picking multiple commits in Git, ensuring you understand the commands and their usage.
Prerequisites
Before you start, make sure you have:
- A working knowledge of Git and its basic commands.
- Git installed on your machine.
- A Git repository with multiple branches and commits to practice on.
What is Cherry-Picking?
Cherry-picking involves selecting specific commits from one branch and applying them to another branch. Unlike merging or rebasing, which might bring a series of commits or an entire branch's history, cherry-picking allows for more granular control over which changes are applied.
Cherry-Picking a Single Commit
To cherry-pick a single commit:
1. Identify the Commit Hash: Each commit has a unique identifier (SHA-1 hash).
git log
2. Cherry-Pick the Commit: Use the commit hash to cherry-pick.
git cherry-pick <commit-hash>
This command applies the changes from the specified commit to your current branch.
Cherry-Picking Multiple Commits
Method 1: Sequential Cherry-Picking
You can cherry-pick multiple commits sequentially by repeating the git cherry-pick command for each commit. This is straightforward but can be tedious for a large number of commits.
1. Identify the Commits: List the commits you want to cherry-pick.
git reflog
2. Cherry-Pick Each Commit: Apply each commit in sequence.
git cherry-pick <commit-hash-1>
git cherry-pick <commit-hash-2>
git cherry-pick <commit-hash-3>
Repeat this for each commit you need to apply.
Method 2: Cherry-Picking a Range of Commits
If the commits you want to cherry-pick are consecutive, you can specify a range. Git allows you to cherry-pick a range of commits using the .. or ^.. syntax.
1. Identify the Range: Determine the range of commits. If you want to cherry-pick commits from A to D (including both), you can use:
git cherry-pick <commit-A>^..<commit-D>
This picks commits from A to D.
2. Cherry-Pick the Range:
git cherry-pick <start-commit>^..<end-commit>
Method 3: Using an Interactive Rebase
An interactive rebase can be used to reorder, edit, or remove commits before applying them. This is useful when you need more control over the cherry-picking process.
1. Checkout a New Branch: Create a new branch from the source branch.
git checkout -b temp-branch source-branch
2. Interactive Rebase:
git rebase -i <target-commit>
This command opens an editor where you can modify the list of commits.
3. Edit the List: Mark the commits you want to keep with pick and remove or reword the rest.
4. Cherry-Pick the Result: After saving, switch back to the target branch and cherry-pick the commits from the temporary branch.
git checkout target-branch
git cherry-pick <temp-branch-start-commit>^..<temp-branch-end-commit>
Method 4: Using Git Range Patch and Apply
Another way to cherry-pick multiple commits is by creating a patch file for the range of commits and then applying that patch.
1. Create a Patch File:
git format-patch -k -n -o /path/to/patches <start-commit>^..<end-commit>
This command generates a series of patch files for each commit in the specified range.
2. Apply the Patch:
git am /path/to/patches/*.patch
Handling Conflicts
Cherry-picking might result in conflicts, similar to merging. When a conflict occurs:
1. Resolve Conflicts: Manually edit the conflicted files to resolve the discrepancies.
git status
Look for files marked as "Unmerged".
2. Stage the Resolved Files:
git add <resolved-file>
3. Continue the Cherry-Pick:
git cherry-pick --continue
If you decide to abort the cherry-pick due to complex conflicts, you can use:
git cherry-pick --abort
Best Practices
- Use Descriptive Commit Messages: Clear messages help in identifying commits for cherry-picking.
- Keep Changes Small: Smaller, focused commits are easier to cherry-pick and less likely to cause conflicts.
- Test After Cherry-Picking: Ensure that the cherry-picked changes work as expected in the target branch.
