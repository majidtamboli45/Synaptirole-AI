# How to Create Git Branch With Current Changes?

> Source: https://www.geeksforgeeks.org/git/how-to-create-git-branch-with-current-changes/

Creating a new branch in Git while preserving your current changes is a common task that allows you to work on new features, bug fixes, or other tasks without affecting the main codebase. This article will guide you through one approach to achieve this, providing a detailed description, syntax, and examples for each method.
Stashing Changes
Stashing allows you to temporarily save your changes in a "stash" and revert your working directory to a clean state. You can then create a new branch and apply the stashed changes to that branch.
Syntax
Step 1: Stash the changes
git stash
Step 2: Create a new branch
git checkout -b new-branch-name
Step 3: Apply the stashed changes
git stash apply
Step 4: Delete the stash (optional)
git stash drop
Example:
Step 1: Save current changes
git stash
Step 2: Create and switch to a new branch
git checkout -b new-feature-branch
Step 3: Reapply the stashed changes
git stash apply
Step 4: Delete the stash if no longer needed
git stash drop
