# How to Restore a Deleted Branch or Commit with Git?

> Source: https://www.geeksforgeeks.org/git/how-to-restore-a-deleted-branch-or-commit-with-git/

Deleting a branch or a commit in Git might seem like a disaster, especially if it was done unintentionally. However, Git provides robust tools to help you recover deleted branches or commits. Here’s a detailed guide on how to restore a deleted branch or commit in Git.
Table of Content
Understanding the Basics
Git, by design, retains a history of changes which makes it possible to recover deleted branches or commits. The key command is git reflog, which records updates to the tip of branches and other references.
Restoring a Deleted Branch
Step 1: Find the Branch’s Last Commit
First, use git reflog to find the commit at the deleted branch's tip. git reflog shows a log of all changes to the repository’s branches and can be used to locate the SHA-1 hash of the commit.
1. Open your terminal or command prompt.
2. Navigate to your repository.
3. Run git reflog:
git reflog
This command will display a list of recent actions, including those that affected the branch you deleted. Look through the list to find the commit hash (a long string of characters) associated with the deleted branch.
Step 2: Create a New Branch from the Commit
Once you have identified the commit hash, you can create a new branch pointing to it.
1. Copy the commit hash.
2. Create a new branch from that commit:
git checkout -b <new-branch-name> <commit-hash>
Example:
git checkout -b restored-branch abc1234
This command creates and switches to a new branch named restored-branch at the commit abc1234.
Restoring a Deleted Commit
If a specific commit was deleted, you can also use git reflog to find and restore it.
Step 1: Identify the Commit
Use git reflog to find the commit hash for the deleted commit:
1. Run git reflog to see recent changes:
git reflog
2. Look for the commit you want to restore. Note the commit hash.
Step 2: Apply the Commit
You have a couple of options to restore the commit:
Option 1: Create a New Branch from the Commit
You can create a new branch starting from the deleted commit:
git checkout -b restored-commit abc1234
Option 2: Cherry-Pick the Commit
If you want to apply the commit on top of your current branch, use git cherry-pick:
1. Make sure you are on the branch where you want to apply the commit:
git checkout main
2. Cherry-pick the commit:
git cherry-pick abc1234
This command applies the changes from the commit abc1234 onto your current branch.
Important Points
- Safety First: Always make sure to verify the commit hash before restoring to avoid confusion or conflicts.
- Branch Names: Use descriptive branch names when restoring to avoid ambiguity.
- Backup: Regularly push your branches to a remote repository like GitHub or GitLab to prevent data loss.
Conclusion
Restoring a deleted branch or commit in Git is easy if you know the right commands. By using git reflog, you can track down the necessary commit hashes and use git checkout or git cherry-pick to restore your work.
