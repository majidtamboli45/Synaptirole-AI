# Undo a Commit in Git

> Source: https://www.geeksforgeeks.org/git/how-to-undo-a-commit-in-git/

Undoing a commit in Git allows you to reverse changes made in previous commits while preserving or modifying the project history as needed.
- git reset is used to undo commits locally (soft, mixed, hard options).
- git revert creates a new commit that reverses previous changes.
- Helps fix mistakes without losing control over version history.
Methods to Undo a Commit in Git
Git provides multiple approaches to undo commits depending on whether changes should be preserved or already shared.
1. Using Git reset
Used to undo commits locally by moving the HEAD pointer to a previous commit, with options to keep or discard changes.
Step 1: Check all your commits
git log
Output:
commit 2: second commit  
commit 1: First commit
Perceptions drawn are as follows:
- Commit 2 is the commit you want to undo; the current head is here.
- Commit 1 is the first commit where you want to go after undo.
Step 2: To restore everything or undo all the changes we have to reset the commit.
git reset --soft HEAD^      git reset --hard HEAD^  Note:
- soft is used if you want to keep your changes
- hard is used if you don't want to keep your changes
Step 3: To check your commit is reset or not
git log
Output:
commit 1: First commit   
//undo the second commit, now head is at first or previous commit
One can clearly see last commit (i.e. second commit) is removed.
2. Using Git revert
If a commit is already pushed, use git revert to create a new commit that reverses the changes.
Step 1: Revert your changes
git revert HEAD  We are now ready for your new commit in order to restore the file that we accidentally have remove with the below command as follows:
git commit -m Step 2: Now check your all commits to see the list of commits
git log
Output:
commit 3: restoring the file that we accidentally remove  
commit 2: removing a file we don't need
commit 1: Needed file
This adds a new commit that undoes the last commit..
Also do note that we use the command below specified to undo the last commits in git where the head is a pointer pointing to the last commit in our branch
git reset HEAD~<no-of-commits>
3. Using git checkout
git checkout can create a new branch from a specific commit, allowing you to work from that point without modifying the original branch.
Step 1: Identify the commit hash
git log
Step 2: Create a new branch from that commit
git checkout -b <new-branch-name> <commit-hash>
Example:
git checkout -b new-feature a1b2c3d
