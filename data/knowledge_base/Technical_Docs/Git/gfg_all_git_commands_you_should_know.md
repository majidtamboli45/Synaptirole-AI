# All Git Commands You Should Know

> Source: https://www.geeksforgeeks.org/git/all-git-commands-you-should-know/

Git is a distributed version control system (VCS) that allows multiple developers to work on a project at a time, giving the possibility of changing each other's work based on requests and authorizations. Created by Linus Torvalds in 2005 for the development of the Linux kernel, Git has since become the most widely used version control system in the world.
Basic Concepts of Git
1. Repository
A repository is a storage space where your project’s files and the history of their changes are stored. A Git repository can exist locally on your machine or as a remote repository on a server like GitHub, GitLab, or Bitbucket.
2. Commit
A commit is like a snapshot of your repository at a specific point in time. Each commit records changes to the repo that describes what was changed and why. Commits form the history of your project.
3. Branch
All work on a project happens on branches. Every project has a main branch, and additional branches can be created as sub-branches based on requirements ( just like branches for the trunk of a tree). This Branch system is used to create new features without disturbing the mainstream because this allows working on changes independently of the main branch.
4. Merge
Merging is a process in Git that helps to merge the features built using sub-branches to main branches or sub-branches to sub-branches. This is how huge projects are built and this merging maintains the cohesivity of the project.
5. Pull Request
A pull request (or merge request) is a method of submitting contributions to a repository. It allows developers to notify others, including team members or project maintainers, about proposed changes. This helps in code review and discussion before merging the changes into the main branch.
What is the power of Git?
- Git provides a facility for the developers to work on different components of a project at a time and merge them independently.
- Git have the ability of Version Control, which means it will keep track of the changes made by different developers to the codebase. It notes the date, time, and what change was done by whom.
- Git have the powers of merging which means a clone of the codebase can be made and a set of team can work on experimental features if it works out then they can seamlessly integrate main branch.
- Git acts as a backup and disaster recovery system because since we use remote repositories , Git provides a robust backup mechanism for projects. Even if a developer's local copy of the repository is lost or corrupted, they can retrieve a copy from a remote repository.
- Git helps to work on Remote Repositories also.
What are Remote Repositories ?
These are different versions of project that are hosted at a server or another Computer. Now, here Git helps for different developers to clone the project by connecting to the server repository without being at the same location and these developers can do the changes and push to main repository.
List of Git Commands
1. Git Installation
For GNU/Linux distributions, Git should be available in the standard system repository.
For example, in Debian/Ubuntu please type in the terminal:
sudo apt-get install git
If you need to install Git from source, you can get it from git-scm.com/downloads.
An excellent Git course can be found in the great Pro Git book by Scott Chacon and Ben Straub.
The book is available online for free at git-scm.com/book.
2. Git Configuration
User Name:
Set the name that will be attached to your commits and tags.
git config --global    user.name “Your Name” User Email:
Set the e-mail address that will be attached to your commits and tags.
git config --global user.email “you@example.com”
User Colors:
Enable some colorization of Git output.
git config --global color.ui auto
3. Starting a Project
clone: Clone command is used to make clone of a repository from a remote server to your local machine.
 git clone <repository-link>
init command: init command are used to create local folder and local pages which can be uploaded in Git hub.
 git init /path/to/directory
4. Day to Day Work
commit:
Create a new commit from changes added to the staging area.
The commit must have a message!
git commit
status:
Status command is used to check the status of the directory (untracked ,modified , staged etc..)
 git status
list:
list (ls) command is used to list all the files in the directory
 git ls list all files:
ls -a is used to list all the files including hidden files
 git ls -a
add:
add command is used to add changes to working directory to the staging area
git add <file1> <file2> ...  // to  add specific files 
git add .                             // to  add all changes
diff:
Show changes between working directory and staging area.
git diff [file]
remote:
remote command is used to manage remote repositories like listing , show , rename etc..
 git remote
5. Branching commands
branch:
this command is to list all the branches in the repository
 git branch
delete branch:
we use this command to delete a branch
 git branch -d <branch-name>
checkout -b:
this command is used to create new branches for the main code base
 git checkout -b <branch-name>
Reset:
Revert some paths in the index (or the whole index) to their state in HEAD.
git reset <path>
rename branch:
we use this command is used to rename a branch
 git branch -m <old-name> <new-name>
remove:
Remove file from working directory and staging area
git rm [file]
rebase:
Apply commits of the current working branch and apply them to the HEAD of [branch] to make the history of your branch more linear.
git rebase [branch name]
6. Merging Branches or Features to the Codebase :
merging can be done in two ways 
1. If there is no one to cross check the branch or it is completely perfect
Step 1: use git diff command - The git diff command is used to display the differences between various entities in your Git repository. It's particularly useful for comparing changes between different commits, branches, or between the working directory .
 git diff <file-name>
Step 2: use merge command - The merge command is used to merge the features from one branch to another branch or main branch
 git merge <branch-name>
2. if there is someone to review to the feature :
we send a pull request to the team. It lets you to tell others about the changes you made to a branch in a repository
git push origin <branch-name> 7. Storing your Work
Stash:
Put current changes in your working directory into stash for later use.
git stash
stash pop:
Apply stored stash content into working directory, and clear stash.
git stash pop
stash drop:
Delete a specific stash from all your previous stashes.
git stash drop
8. Changes to Features
if we need to makes changes to the features we built
reset:
we use reset command to reset the changes we made to the branch
 git reset <file name>
for commit changes:
for commit changes we use hashes to reset
git reset <commit hash> revert:
Create a new commit, reverting changes from the specified commit. It generates an inversion of changes.
git revert [commit sha]
9. Inspect History:
for current history:
List commit history of current branch. -n count limits list to last n commits.
git log [-n count]
overview:
An overview with reference labels and history graph. One commit per line
git log --oneline --graph --decorate
log:
we use log command to check what are all the adds ,commits happened to the whole codebase
 git log
log ref:
1. ref to branch:
List commits that are present on the current branch and not merged into ref. A ref can be a branch name or a tag name
git log ref ..
2. branch to ref:
List commit that are present on ref and not merged into current branch.
git log ..ref
10 .Tagging comments
tag:
this command is used to list all the tags
git tag
create tag:
Create a tag reference named name for current commit. Add commit sha to tag a specific commit instead of current one.
git tag [name] [commit sha]
remove tag:
Remove a tag from local repository.
git tag -d [name]
11. Synchronizing Repositories
remote fetch:
Fetch changes from the remote, but not update tracking branches.
git fetch [remote]
To delete:
Delete remote Refs that were removed from the remote repository.
git fetch --prune [remote]
push :
push command is used to push the changes we made in the local repository to the main repository
 git push origin <branch-name>
pull:
Fetch changes from the remote and merge current branch with its upstream.
git pull [remote]
12. Ignoring files
To ignore files, create a .gitignore file in your repository with a line for each pattern. File ignoring will work for the current and sub directories where .git ignore file is placed. In this example, all files are ignored in the logs directory (excluding the .git keep file), whole tmp directory and all files*.swp.
1. Create ignore file:
we need a gitignore file if we dont have one then you have create one.you can create one in your repository root.
touch .gitignore
2. Edit file:
Open the .gitignore file with your preferred text editor and add the patterns for the files and directories you want to ignore.
nano .gitignore
*.the underneath lines need to be added to gitignore file:
gitignore file# Ignore all files in the logs directory, but not the .gitkeep file
logs/*
!logs/.gitkeep
# Ignore the entire tmp directory
tmp/
# Ignore all files with .swp extension
*.swp
then save the changes and then ignore the unnecessary files.
3. Verify the ignored files:
You can use the following command to see which files are being ignored by Git.
git status --ignored
