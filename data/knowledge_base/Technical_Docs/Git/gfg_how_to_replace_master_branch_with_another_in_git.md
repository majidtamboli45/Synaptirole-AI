# How to Replace Master Branch with Another Branch in GIT?

> Source: https://www.geeksforgeeks.org/git/how-to-replace-master-branch-with-another-branch-in-git/

In Git, the "master" branch traditionally serves as the primary development branch in many repositories. However, there are situations where you might want to replace the contents of the "master" branch with those of another branch. This could be due to a variety of reasons, such as renaming the default branch to something more inclusive or reflecting a new primary development focus. This guide will walk you through the steps to replace the "master" branch with the contents of another branch in Git.
Steps to Replace the Master Branch
Step 1: Ensure Your Working Directory is Clean
Before making any changes, ensure your working directory is clean. This means committing or stashing any uncommitted changes.
git status
If there are uncommitted changes, either commit them:
git add .
git commit -m "Save changes before replacing master branch"
Or stash them:
git stash
Step 2: Switch to the Branch You Want to Replace Master With
Checkout the branch that you want to use to replace the master branch.
git checkout feature-branch
Step 3: Update the Branch to Be Up-to-Date
Make sure your branch is up-to-date with the latest changes from the remote repository.
git pull origin feature-branch
Step 4: Delete the Master Branch Locally
Next, switch to the branch you want to preserve and delete the local master branch.
git branch -D master
Step 5: Rename the Current Branch to Master
Rename the current branch (feature-branch) to master.
git branch -m master
Step 6: Force Push the New Master Branch to Remote
Finally, force push the new master branch to the remote repository. Be very careful with this step as it will overwrite the remote master branch.
git push origin master --force
Step 7: Verify the Changes
To ensure everything went smoothly, you should verify that the remote master branch has been updated.
git fetch origin
git checkout master
git log
Review the commit history to confirm that it matches the branch you replaced it with.
Conclusion
Replacing the master branch with another branch in Git involves careful steps to ensure that the new branch content accurately reflects in the master branch. By following the outlined steps, you can effectively manage significant changes in your project. Always ensure proper communication and backup before performing such operations to maintain the integrity of your codebase and team workflow.
