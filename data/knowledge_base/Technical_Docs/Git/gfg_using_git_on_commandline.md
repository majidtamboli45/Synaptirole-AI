# Using Git on CommandLine

> Source: https://www.geeksforgeeks.org/git/using-git-on-commandline/

Git on the command line allows developers to manage repositories, track changes, and collaborate efficiently through various Git commands.
- Initialize and manage repositories using commands like git init and git clone.
- Track and commit changes using git add and git commit.
- Manage branches and collaboration using commands like git branch, git merge, and git push.
Git is widely used in software development to manage code efficiently and maintain project history.
Prerequisites
Check Git Installation
Open the terminal and run the following command to check whether Git is installed and to see its version:
git --version
Set Git Username
To configure your Git username globally, run:
git config --global user.name "FIRST_NAME LAST_NAME"
Set Git Email
To configure your Git email address, run:
git config --global user.email "MY_NAME@example.com"
Git Workflow on CLI
Initializing a Local Repository
To start tracking a project using Git, you first need to initialize a local repository.
Command:
git init
Now our repository is initialized we can add some code to our project
After running the git init command, a hidden .git folder is created in the project directory. This folder contains all the information required by Git to track changes in the repository.
To check the current status of files in the repository, use the following command:
git status
The git status command shows the current state of files in a repository.
Git has three main areas:
- Working Directory: Where files are created or modified (untracked files exist here).
- Staging Area: Files prepared for commit using git add.
- Commit: A saved snapshot of the project.
Adding Files to the Repository
In the previous step, some files were untracked. These files can be added to the staging area using the git add command.
- To add a specific file to the staging area:
git add <file-name>
- To add all files in the folder to the staging area:
git add .
After adding files to the staging area if git status is called again, then it will show files to be committed.
Committing Changes
After adding files to the staging area, they are ready to be saved in the local repository using the git commit command.
git commit -m "your message"
- The git commit command saves the staged files as a new version in the repository.
- The -m option is used to add a commit message describing the changes made.
Commit ID and Git Log
Each commit generates a unique SHA-256 commit ID used to identify that version of the project.
To view the commit history, use:
git log
This command shows all commits with their commit IDs and messages, allowing you to refer to previous versions.
Additional Commands
These commands help perform advanced Git operations such as cloning repositories, managing branches, and inspecting changes.
Examples:
- git clone <repository-url> – Clone a remote repository.
- git fetch – Download changes from a remote repository without merging.
- git branch <branch-name> – Create a new branch.
For more Git commands and detailed explanations, refer here.
