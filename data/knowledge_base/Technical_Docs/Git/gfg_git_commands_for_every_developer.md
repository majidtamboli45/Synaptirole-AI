# Git Commands for Every Developer

> Source: https://www.geeksforgeeks.org/git/top-12-most-used-git-commands-for-developers/

Git is an open-source, distributed version control system for tracking code changes, and mastering a few core commands boosts productivity and collaboration.
- Git helps manage multiple versions of source code with full change history.
- Tracks author, time, and purpose of changes.
- Only a few Git commands are used regularly in daily workflows.
- Mastering core commands improves project management and team collaboration.
Git Commands
Git commands are instructions used to interact with the Git version control system to manage repositories, track changes, and collaborate on code efficiently.
- Used to initialize repositories and manage project history.
- Support core actions like commit, branch, merge, and sync changes.
- Enable direct interaction with local and remote repositories.
- Essential for efficient version control and team collaboration.
Basic Git Commands
Basic Git commands are commonly used to manage repositories, track changes, and collaborate efficiently in everyday development workflows.
1. git config
Before you can start using Git, you need to configure it. This command allows you to specify the username and email address that will be used with your commits.
# sets up Git with your name
git config --global user.name "<Your-Full-Name>"
# sets up Git with your email
git config --global user.email "<your-email-address>"
2. git init
git init initializes a new Git repository by creating the .git directory, which stores all metadata and configuration needed to track versions and commits.
$ git init
3. git clone
git clone <repo_url> creates a local working copy of a remote repository, downloads its full history, and sets the source as the default remote for pulling and pushing changes.
$ git clone https://github.com/<repo-url>
4. git status
git status shows the current state of the repository, including modified, staged, and untracked files, helping you understand what changes are pending.
$ git status
Depending on the state of your files, working directory, and repository, the git status tool will display a lot of information.
5. git add
git add stages changes from the working directory to the index, preparing selected files to be included in the next commit.
$ git add <file1> <file2> … <fileN>
To add all the files:
$ git add .  6. git commit
git commit -m "message" records staged changes to the local repository with a commit ID and message, providing traceable history of modifications.
$ git commit –m "<Type your commit message here>"
7. git push
This command uploads local commits to the remote repository, creating the branch remotely if it does not already exist.
$ git push
8. git branch
git branch is used to create, list, and delete branches, while switching branches updates the working directory to match the selected branch’s commit without losing tracked files.
$ git branch <branch-name>
Take a look at the branches and check out which branch you’re currently working:
$ git branch or $ git branch --list
9. git checkout
git checkout <branch> switches to an existing branch or creates and switches to a new one, updating the working directory to match the target branch (uncommitted changes should be committed or stashed first).
$ git checkout <branch-name>
10. git merge
The command git merge integrates the specified branch’s history into the current branch, creating a merge commit automatically if there are no conflicts (run it from the target branch).
$ git merge <name-of-branch-to-merge-in>
11. git pull
The contents of the remote repository are fetched and integrated into your local repository using this command. git pull pulls the most recent changes from the remote server into the local repository, ensuring you have the most up-to-date information from your coworkers.
$ git pull
12. git log
The git log command is used to show all of a repository's commits. This command displays a log of all commits made to the current branch so far.
$ git log
