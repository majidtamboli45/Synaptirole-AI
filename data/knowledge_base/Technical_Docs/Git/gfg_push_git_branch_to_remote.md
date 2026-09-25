# Push Git Branch to Remote

> Source: https://www.geeksforgeeks.org/git/how-to-push-git-branch-to-remote/

Git is a distributed version control system used to track changes in a project over time. It allows developers to manage versions and collaborate efficiently.
- Tracks who made changes, when, and why in a project.
- Allows reverting to previous versions if needed.
- Provides commands to push branches to remote repositories.
Git Terminologies
Basic Git terminologies help in understanding core Git commands and concepts used for managing repositories.
- init: It is basically a part of a git command with which we initialize git in a non-git repository.
- status: It is also a part of a command with which we can see the current state of any git repository.
- log: It is a record of all the commits done in the repository.
- commit: A commit is a snapshot of the git repository at one point in time.
- commit id: It is a 40-character hexadecimal value that uniquely identifies each commit in a Git repository.
git init
Before pushing a branch to a remote repository, you must first create a local Git repository on your system. This is done by initializing Git in the project directory using the git init command.
Example
cd "E:\git pushing"
git status
Output:
fatal: not a git repository (or any of the parent directories): .git
Initialize the repository:
git init
Output:
Initialized empty Git repository in E:/git pushing/.git/
Check the repository status again:
git status
Output:
On branch main
No commits yet
nothing to commit (create/copy files and use "git add" to track)
- Navigate to the desired project directory using the cd command.
- Running git status in a non-Git directory returns an error.
- Use git init to initialize the folder as a Git repository.
- After initialization, Git commands can be executed without errors.
git status
The git status command shows the current state of a Git repository. It displays information about the current branch, staged changes, unstaged changes, and untracked files.
In the previous example, running git status showed:
- The repository is on the main branch (On branch main).
- No commits have been made yet.
- There are no tracked files in the staging area.
Now, suppose a new file named hello_world.cpp is created in the directory. Running the git status command will produce output similar to:
git status
Output:
On branch main
No commits yet
Untracked files:
(use "git add <file>..." to include in what will be committed)
hello_world.cpp
nothing added to commit but untracked files present (use "git add" to track)
This output indicates that the file hello_world.cpp exists in the directory but is currently untracked by Git. To start tracking the file, you need to add it to the staging area using:
git add hello_world.cpp
git add
The git add command is used to add changes to the staging area, preparing them for a commit.
To track all changes in the repository, run:
git add.
After running the command, check the status:
git status
Output:
On branch main
No commits yet
Changes to be committed:
(use "git rm --cached <file>..." to unstage)
new file: hello_world.cpp
This indicates that the file hello_world.cpp has been added to the staging area and is ready to be committed.
Now, the changes can be committed using the git commit command.
git commit
The git commit command records the staged changes as a snapshot in the repository with a descriptive message.
git commit -m "commit message"
Note: Only the changes present in the staging area are included in the commit.
Example:
git commit -m "created hello_world.cpp"
Output:
[main (root-commit) bb198fb] created hello_world.cpp
1 file changed, 8 insertions(+)
create mode 100644 hello_world.cpp
This creates a commit containing the staged changes.
After committing, the next step is to add a remote repository (origin) to enable pushing and pulling changes.
Add Remote Origin and Push to GitHub
To push your local repository to GitHub, you first need to add a remote origin.
Step 1: Create a Repository on GitHub
- Go to the Repositories section in your GitHub account.
- Click on New and create a repository.
- Copy the repository URL.
Step 2: Add Remote Origin
git remote add origin <repository-url>
Example:
git remote add origin https://github.com/username/my-project.git
Step 3: Verify Remote
git remote -v
Output:
origin  https://github.com/username/my-project.git (fetch)
origin https://github.com/username/my-project.git (push)
Note: If no remote is configured, running git push will result in an error.
Step 4: Push to Remote Repository
git push origin main
Output:
[new branch]      main -> main
This command pushes the local main branch to the remote repository.
