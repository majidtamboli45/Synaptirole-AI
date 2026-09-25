# How to Merge Two Branches in Git?

> Source: https://www.geeksforgeeks.org/git/how-to-merge-two-branches-in-git/

Version control systems like Git provide powerful tools for managing code changes and collaboration among developers. One common task in Git is merging branches, which allows you to combine the changes made in one branch into another. In this article, we will explore the process of merging branches in Git.
Prerequisites
- GitHub Desktop installed
- An active GitHub account
- Local and remote repository
Table of Content
What are Branches in Git?
Branches are basically pointers to a specific commit in the repository's history. They allow you to work on different features, bug fixes, or experiments independently without affecting the main codebase. Each branch can have its own set of commits, and they can diverge from each other over time.
Types of Branch Merging
In Git, there are primarily two types of branch merging: fast-forward and recursive.
1. Fast-forward merge
- When the commit history of the branch being merged (branch A ) contains all the commits of the target branch (branch B ), Git can perform a fast-forward merge.
- In this case, Git simply moves the pointer of the target branch (branch B ) to the same commit as the branch being merged (branch A ).
- Fast-forward merges result in a linear history without creating an additional merge commit.
2. Recursive merge
- Recursive merge is performed when the commit histories of the two branches diverge, meaning there are unique commits on both branches.
- Git analyzes the commit history of both branches and combines the changes, creating a new merge commit that represents the merged state.
What are Merge Conflicts?
Merge conflicts occur when Git is unable to automatically resolve differences between the branches being merged. This typically happens when the same part of a file has been modified differently on both branches. When a conflict occurs, Git marks the conflicted sections in the affected files, and it's up to the developer to resolve these conflicts manually.
Steps to Merge Two Branches in Git
Step 1: On your newly created GitHub account, click on New on the left side of the screen.
Next, you’ll need to give your repository a name and fill in a few other details. Give it a short description if you want, make it public, and a best practice is to always add a ReadMe file. Once you’re done, click on Create repository.
Now, to get working in your code editor, you’ll want to clone your new repository by clicking the Clone button. Select HTTPS, copy the address, and open your terminal.
Step 2: In your our terminal, use the cd command to choose where you want to create a new directory for your project.
cd user/desktop/repo/
Step 3: When you’re in the correct branch, use the mkdir command to create a new directory:
mkdir <name of your directory>
Step 4: Now, let’s use the cd command again to switch to that newly created directory:
cd <name of your newly created directory> Step 5: Once in your new directory, use the git init command to create a new repository:
git init
Next, use the git clone command with the correct HTTPS address, and hit Enter. By default, this will create a main branch on your local repository.
git clone <paste https address here>
Now, open your newly cloned repository with Visual Studio Code. You can now start writing code.
After creating your repository, you will already be on the main branch. As a best practice, you should never, ever, push code directly to the main branch, which needs to be protected.
Step 6: Creating another Git branch
we are currently on the main branch, you’ve coded something to create some content, and now you want to create a new branch. In your terminal, use the git checkout command to create a new branch and automatically switch to it:
git checkout -b <name of new branch>
The command should automatically cut that new branch from your main branch, so the code of the latter should not change.
Step 7: Merging your two Git branches in your local repository
While you’re on your new branch, go to your terminal and use the git branch command to verify the name of the branch you are on:
git branch
You are now on your new branch, use the git checkout command again to switch to your main branch:
git checkout Main
Next, use the git pull command to import any changes that your team may have made and get your local main branch up to date:
git pull
Now, use git checkout again to switch to the new branch you want to merge with the main branch:
git checkout <your specified branch>
It's now time to use the git merge command. This will take the current version of your main branch and then merge it into your development branch:
git merge Main
The merge result will have the latest version of the code plus the feature you developed.
