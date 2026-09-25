# Working Tree

> Source: https://www.geeksforgeeks.org/git/git-working-tree/

The working tree in Git includes all project files outside the .git folder and represents the current state of your project where changes are made and tracked.
- Contains all files and folders except .git, representing your current project state.
- Tracks changes (modified, added, deleted) and can be viewed using git status.
- Serves as a link between local changes and the staging area.
- Remote repositories do not include a working tree.
Working Tree and git status
Remote repositories (like Github) do not have a working tree. However, in a local repository, we can analyze the working tree using:
git status
This command helps us understand the current state of files in the working directory.
Example: Understanding Working Tree
1. Initialize Repository
Create an empty directory and Initialize Git:
git init
The .git folder is created (not part of the working tree)
2. Add a new file
Create a file named demo.txt and then run:
git status
3. Add to Staging Area
Stage the file:
git add demo.txt
Check status again:
git status
4. Commit the File
Commit Changes:
git commit -m "Created demo.txt"
Check status again:
git status
5. Modify the File
Edit demo.txt and run:
git status
6. Stage and Commit Changes
git add demo.txt 
git commit -m "Update demo.txt"
7. Delete the file
Delete demo.txt and run:
git status
8. Stage and Commit Deletion
git add demo.txt
git commit -m "Deleted demo.txt"
