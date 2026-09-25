# How To Fetch Remote Branches in Git ?

> Source: https://www.geeksforgeeks.org/git/how-to-fetch-remote-branches-in-git/

Git provides a powerful version control system that allows developers to collaborate efficiently on projects. Over time, however, a repository can have local and remote branches. Local branches are created locally and only exist on local machines and the remote branches exist on the remote repository that is available on GitHub.
Fetching a remote branch means fetching all the changes or the commits of the remote branch and storing them as a local copy of the branch in the local repository. These changes or commits will not automatically be merged to the local branches. It helps us to keep updated our local repository with the remote changes.
Steps To Fetch Remote Branches in Git
Step 1: Check the list of branches
Open up the git terminal and navigate to the directory of the repository on your local machine. We have created a test repository and this repository contains "main" as the default main branch and two remote branches "test1" and "test2". Now to see all the local branches that are available in the repository run the following command in the terminal:
git branch
Now to see all remote branches type and run the below command in the terminal:
git branch -r
Step 2: Fetch all remote branches.
To fetch all remote branches, type and run the following command in the terminal:.
git fetch remote_name
Examples:
We have created a remote repository called "testRepo." This repository has two remote branches, "test1" and "test2," and a local git main branch. We have created commits from both branches. Through the "test1" branch, we have added a new text file to the repository and added some content to it. Through "test2," we have updated the content of the readme file in the repository. Now we will use the git fetch command to download those changes and bring those changes to the git local repository. See the results. This command displays the branches that have been downloaded.
In our case, we have only one remote that is "origin," so we have not mentioned it in the command. By default, git will fetch from the remote repository named "origin" if no remote is specified explicitly. The git fetch command will not merge these changes to local branches automatically; it only creates a local copy of changes that can be merged to local branches.
Let's just review the changes from fetched branches before merging them into main branch. Type and run the following command to review the changes from the specified branches:
git log origin/branch_name
Now let's merge the changes to main branch using the following commands. Before that make sure you are switched to main branch. This branch will merge remote branches changes to the main branch.
git checkout main
git merge origin/remote_branch_name
The above command will open up a editor and ask you to enter a commit message so just type and commit message and close the editor and you are done.
Step 3: List all branches.
Run the following command to list all the local and fetched remote branches:
git branch -a
