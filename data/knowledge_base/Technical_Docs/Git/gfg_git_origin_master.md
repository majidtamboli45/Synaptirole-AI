# Git Origin Master

> Source: https://www.geeksforgeeks.org/git/git-origin-master/

origin/master refers to the remote-tracking branch that represents the latest state of the master branch on the remote repository.
- origin is the default name of the remote repository.
- master is the default main branch in older Git repositories.
- origin/master tracks the state of the remote master branch locally.
- It updates when you run commands like git fetch or git pull.
Git - Origin
In Git, origin is the default name given to the remote repository where the project is hosted. It is commonly used with branch names to push or pull changes between local and remote repositories.
- Origin refers to the remote repository, typically hosted on platforms like GitHub.
- git push origin master sends local commits to the remote master branch.
- git pull origin master fetches and merges updates from the remote master branch into the local repository.
When cloning the remote repository to local, we use "git clone" command and pass the URL for the remote repository as below
The "git remote" command is used to show the remotes mapped to git remote repository
Git remote -v shows all the remote connections linked to a git repository. It shows fetch and push operations on a remote repository as below
Git - Master
Master is the default branch created when a new Git repository is initialized. It typically contains the main and most stable version of the project.
- Master is the default branch created when a repository is initialized using git init.
- Developers often merge approved changes into the master branch after code review.
- The master branch usually contains the latest stable or production-ready code.
Initialize a new git repository using the "git init" command as follows:
Now run the "Git Branch" command and check that we have a single branch in a remote repository which is 'main' or 'master' branch as below:
Check the Github page and see that there is the only branch, i.e the main branch as below depicted as follows:
Origin/Main in Git
Since Origin and Master are two different terminologies in Git but we might get confused when we see Origin/master in git context
- Origin/master is a remote-tracking branch.
- This branch exists in our local and tracks the remote repository 'origin' and branch 'master'.
- Branch in format "remote-name/remote-branch-name" is a remote-tracking branch
Since origin/master is a branch. Below is the process to merge the origin/master to master branch on remote origin
Step 1: Fetching the master branch from the remote origin creates a local remote-tracking branch named origin/master.
git fetch origin master
Step 2: Then merge the 'origin/master' to 'master'
git merge origin/master
Step 3: Finally, now push the changes from remote branch 'master' to remote 'origin'
git push origin master
