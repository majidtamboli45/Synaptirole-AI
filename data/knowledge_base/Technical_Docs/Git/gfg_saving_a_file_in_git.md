# Saving a File in Git

> Source: https://www.geeksforgeeks.org/git/saving-a-file-in-git/

Saving a file in Git means recording its current state in the repository so that changes can be tracked over time.
- Git saves files by creating commits that store snapshots of the project.
- Changes must be staged before they can be committed to the repository.
- Each saved version helps track modifications and maintain project history.
Steps to Saving a File in Git
Saving a file in Git involves staging the changes and committing them to record the file in the repository history.
1. Initialize a Git Repository
If a Git repository has not been created yet, initialize one by navigating to the project directory and running:
git init
This command creates a new Git repository in the project directory.
2. Create or Modify a File
Create a new file or modify an existing file in the working directory. For example:
echo "This is an example file." > example.txt
This creates a file named example.txt with sample content.
3. Check the Status
Use the git status command to view the current state of the working directory and staging area:
git status
This command shows newly created or modified files that have not yet been staged.
4. Add the File to the Staging Area
Stage the file so it can be included in the next commit:
git add example.txt
To stage all files in the current directory:
git add .
5. Commit the Changes
Once the file is staged, create a commit to permanently record the changes in the repository:
git commit -m "Add example.txt file"
A clear commit message should describe the changes made.
6. Push the Changes (Optional)
If the repository is connected to a remote service (e.g., GitHub or GitLab), push the commit to the remote repository:
git push origin main
This uploads the local commits to the remote branch.
Example : Creating a Python file and using Git commands to track and commit changes.
Creating a python file.
Using git add, git status, git commit commands in our first commit.
Changing or updating the Number.py file in IDLE and saving it.
Again using git add, git status, git commit commands in our Second commit.
