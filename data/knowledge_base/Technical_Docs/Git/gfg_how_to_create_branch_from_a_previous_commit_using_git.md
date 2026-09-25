# How to Create Branch From a Previous Commit Using Git?

> Source: https://www.geeksforgeeks.org/git/how-to-create-branch-from-a-previous-commit-using-git/

Creating a branch from a previous commit in Git is a common task that allows developers to revisit and build on a specific point in their project's history. This can be useful for bug fixes, new feature development, or exploring alternate project paths without affecting the current state of the project. In this article, we will explore methods to create a branch from a previous commit.
In Git, branches are pointers to specific commits. Creating a branch from a previous commit involves setting a new branch pointer to an older commit in the project's history. This allows you to work on the code as it was at that point while keeping the current state of the project intact. This technique is useful for:
- Fixing bugs that existed in older versions of the code.
- Developing new features based on a previous stable state.
- Conducting experiments without disrupting the main codebase.
Using the Git Command Line:
The most common way to create a branch from a previous commit is through the Git command line. Here are the steps:
Step 1: Identify the Commit Hash: First, identify the commit hash of the commit you want to branch from. You can use `git log` to view the commit history.
git log
Step 2: Create the Branch: Once you have the commit hash, use the `git branch` command to create a new branch pointing to that commit.
git branch <new-branch-name> <commit-hash>
For example, if the commit hash is `abc123`, and you want to create a branch named `feature-branch`, you would run:
git branch feature-branch abc123
Step 3: Switch to the New Branch: After creating the branch, switch to it using `git checkout` or `git switch`.
git checkout feature-branch
Or:
git switch feature-branch
