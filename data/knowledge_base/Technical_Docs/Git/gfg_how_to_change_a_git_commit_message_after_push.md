# How to Change a Git Commit Message After a Push?

> Source: https://www.geeksforgeeks.org/git/how-to-change-a-git-commit-message-after-a-push/

Accidentally deleting a branch or commit in Git can seem alarming, but Git's powerful version control capabilities often allow you to restore them with relative ease. This guide will walk you through the steps to recover a deleted branch or commit.
Table of Content
Restoring a Deleted Branch
1. Find the Branch's Last Commit
When a branch is deleted, the commits are not lost. They remain in the repository's history. You can find the commit where the branch was pointing before it was deleted using the reflog.
Steps: View the Reflog:
The reflog records updates to the tip of branches and other references.
git reflog
This command will display a list of recent commits. Look for the commit where the branch was last updated.
Identify the Commit Hash:
Identify the hash (SHA-1) of the commit that the deleted branch pointed to. For example:
c4f5a2d HEAD@{2}: commit: Fixed issue #123
Restore the Branch:
Once you have the commit hash, you can recreate the branch.
git checkout -b <branch-name> <commit-hash>
For example, to restore a branch named feature:
git checkout -b feature c4f5a2d
Using GitHub or GitLab
If you use a remote repository service like GitHub or GitLab, you might be able to restore a deleted branch from the web interface, provided it hasn’t been permanently removed.
GitHub:
- Go to the repository on GitHub.
- Click on the "Branches" tab.
- Scroll down to the "Recently deleted branches" section.
- Find the branch you want to restore and click "Restore".
GitLab:
- Go to the repository on GitLab.
- Click on "Repository" > "Branches".
- Scroll to the "Deleted branches" section.
- Click "Restore" next to the branch you want to restore.
Restoring a Deleted Commit
If a specific commit was accidentally deleted (for example, through a reset or rebase), you can often restore it using the reflog or the commit hash if you know it.
1. Find the Commit Hash Using Reflog
The reflog can help you locate the hash of the deleted commit.
Steps: View the Reflog:
git reflog
Look through the reflog entries to find the commit hash of the deleted commit.
Create a New Branch or Reset:
Once you have the commit hash, you can either create a new branch pointing to that commit or reset an existing branch to that commit.
Create a New Branch:
git checkout -b <new-branch-name> <commit-hash>
Reset an Existing Branch:
Be careful with this approach as it can alter the branch history.
git reset --hard <commit-hash>
Using git cherry-pick
If the commit was in a branch that you still have, but you want to apply it to another branch, you can use git cherry-pick.
Steps: Check Out the Target Branch:
git checkout <target-branch>
Cherry-pick the Commit: Apply the commit to the current branch.
git cherry-pick <commit-hash>
Conclusion
In conclusion, while accidentally deleting branches or commits in Git can be concerning, the platform provides various mechanisms for recovery. By utilizing tools such as the reflog, commit hashes, and the interfaces of platforms like GitHub or GitLab, you can efficiently restore lost data. Git's flexibility and version control capabilities empower users to manage their projects with confidence, knowing that even mistakes can be rectified without significant hassle.
