# Repositories and Commands in Git

> Source: https://www.geeksforgeeks.org/git/what-is-a-git-repository/

A Git repository (or repo) is a storage space where your project’s files and their complete history of changes are kept. It allows you to track, manage, and collaborate on code over time.
- Stores all files, branches, commits, and history of a project.
- Allows version control, so you can go back to any previous state of your project.
- Supports collaboration, enabling multiple developers to work together without overwriting each other’s changes.
- Can be cloned to create copies on different machines.
Types of Git Repositories
1. Local Repository
- Stored on your own computer.
- Allows you to make changes, commit them, and review your project history without needing an internet connection.
- Example: The .git folder inside your project contains the local repository.
2. Remote Repository
- Hosted on a server like GitHub, GitLab, or Bitbucket.
- Enables multiple developers to collaborate on the same project.
- Supports operations like push ,pull , andfetch to synchronize changes with the local repository.
Types of Repositories based on Structure
Bare vs Non-Bare Repositories
| Bare Repository | Non-Bare Repository | 
|---|---|
| Contains only the version history and Git data, no working files. | Contains working files along with the Git history. | 
| Mainly used on servers for collaboration. | Used on local machines for development. | 
| Cannot directly edit files; only supports Git operations like push andfetch . | Files can be edited directly; supports all Git operations including commit andmerge . | 
| Usually ends with .git extension. | Does not usually end with .git extension. | 
| Acts as a central repository for multiple developers. | Acts as a local copy for development and testing. | 
Basic Git Commands
Git commands are important for navigating and controlling your project repository. These commands help you manage files, track changes, and collaborate with others.
| Command | Description | 
|---|---|
| git status | Shows the current status of the repository — staged, unstaged, and untracked files. | 
| git add <file-name> | Stages a specific file for commit. Use git add . to stage all changes. | 
| git commit -m "message" | Commits the staged changes with a descriptive commit message. | 
| git branch <branch-name> | Creates a new branch with the given name. | 
| git checkout <branch-name> | Switches to the specified branch. | 
| git merge <branch-name> | Merges changes from the given branch into the current branch. | 
| git push origin <branch-name> | Pushes the local branch changes to the remote repository. | 
| git pull origin <branch-name> | Fetches and merges changes from the remote repository into the local branch. | 
| git log | Displays the commit history for the current branch. | 
Initialize a Git Repository
Before you can start tracking files, you need to initialize a repository in your project folder. This is done with the git init command.
git init
Syntax And Usage Of git add
git add file_name
The following are the different ways to use add command:
- To add all the working area files in the current repository to the staging Area following command is used:
git add .
- Adds all changes (new, modified, and deleted files) to the staging area.
git add --all
- To add all files with extension .txt of the current directory to a staging area.
git add *.txt
- To add all text files with .txt extension of the docs directory to staging area.
git add docs/*.txt
- To add all text files of a particular directory(docs) to staging area.
git add docs/
- To add all files in a particular directory(docs) to staging area.
git add "*.txt"
Moving From Staging Area To Commit Area In A Git Repository
Committing changes from the Index Committing process is done in the staging area on the files which are added to the Index after git add command is executed. This committing process is done by the use of git commit command.
Syntax And Usage Of git commit
git commit -m "Add existing file"
This commit command is used to add any of the tracked files to staging area and commit them by providing a message to remember.
Cloning And Synchronizing With Remote Repositories
Git lets users clone repositories to their local machine, creating separate copies. To sync changes with others, Git provides commands to synchronize local repositories with remote one.
- git clone creates a local copy of a remote repository on your computer, including its files, branches, and commit history.
Syntax
git clone <repository-url>
Git Push And Pull Commands
Git Push
git push command is used to push all the commits of the current repository to the tracked remote repository. This command can be used to push your repository to multiple repositories at once.
Syntax
git push origin <branch-name>
To push all the contents of our local repository that belong to the master branch to the server (Global repository).
Git Pull
git pull command updates your local repository by fetching and merging changes from the remote repository. It ensures your copy stays synchronized when others have made updates.
Syntax
git pull origin <branch-name>
Additional Git Commands
Here are some more git commands that you might use when working on a project:
Git Status
Used for checking the status of git repository, i.e., if the files are committed or not, files in staging area or untracked file.
Syntax
git status
Git Log
Used to track all the changes made in the repository, providing the information on contributors and their contributions.
Syntax
git log
Git Fetch
Used to download the latest changes from the remote repository without automatically merging them into the current branch.
Syntax
git fetch
.gitignore
You may use .gitignore if you want to hide any file when uploading online. Just simply create a .gitignore file, and write all the files names you want to ignore.
Git Merge
git merge merge two branches within the same repository. It combines the changes from one branch into another (usually merging a feature branch into the main branch) without losing history.
Syntax
git merge <branch-name>
Git Branch
Command is used to create and manage separate branches in a Git repository. It allows developers to work on features or fixes independently without affecting the main branch.
Syntax
git branch <branch-name>
Git Checkout
Command is used to switch between branches or view a previous version of the project by moving HEAD to a specific branch or commit. It does not permanently roll back the project when used with a commit hash.
Syntax
git checkout <branch-name>
Switch to a previous commit:
git checkout <hash-code>
