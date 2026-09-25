# Simple and Concise Git Commands That Every Software Developer Should know

> Source: https://www.geeksforgeeks.org/git/simple-and-concise-git-commands-that-every-software-developer-should-know/

As developer git is the most useful arena which is not operated directly so do we have git commands that become very crucial that one should know after having git installed in the local system. if not you must download git from here Download Git. If you need any help with the further installation process.
So, Now let's start with the basic commands and will advance to further complex commands that are frequently used. So, the first command you should run before running any command is that `git status`, it will tell either your folder is git folder or a non-git folder. If it tells git folder then it will also show untracked files or tracked files. Basically, we can say that the status of the folder. So everyone should run this command first.
Now, if your particular folder is not a git folder you should run `git init `, it will set that folder as a git folder and the first time will show you untracked files. Now do must go through all the commands been listed up below along with actions performed by them which are as follows:
- git add filename.ext - To add a particular file in the staging area.
- git add - To add all files in the staging area.
- git restore --staged filename.ext - To unstage a particular file.
- git diff - compare the working directory with the staging area.
- git commit -m "any message" - Commit into a final folder with the message.
- git commit -a -m "any message" - Commit into a final folder skipping staging area with the message.
- git commit --amend - To change the commit.
- git diff --staged - Compare the staging area to the last commit.
- git checkout --filename.ext - Change a particular file data to the last commit.
- git checkout -f - Change all file data to the last commit.
- git log - To see all commits.
- git log -p - To see the information about what was deleted and added in all commits.
- git log -p - n - To see the information about what was deleted and added in 'n' commits.
- touch filename.ext - To create a new file.
- git mv filename.ext renamed name.ext - rename a particular file and move the file to the staging area.
- git rm filename.ext - to delete a particular file and move the file to the staging area.
- git rm --cached filename.ext - to stop tracking a particular file.
- git checkout -b new branchname - to create a new branch and move to that new branch.
- git checkout branchname - to move to a particular branch.
- git branch - to see all branches and current branch in pwd.
- git merge branchname - to merge into a master branch if merge conflicts happen you have to fix it manually and then stage the file by running `git add .` command and then commit by running `git commit -m "any message"`.
- git branch -v - to see the last commits of all branches.
- git branch --merged - to see merged branches.
- git branch --no-merged - to see non-merged branches.
- git branch -d branchname - to delete a non-merged particular branch but it will not delete rather it will give a warning that your branch is not merged. After the warning, you want to delete replace small d with capital d and your branch will be deleted.
- git branch -D branchname - to delete a particular branch.
- rm -rf .git - to stop tracking the folder or you can say that make a non-git folder.
Now, we will move to see how we can easily use Github using Git commands -
First, create an account on Github. Make a repository and then add ssh keys to GitHub. To generate an ssh key follow the commands:
- ssh-keygen-t rsa -b 4096 -C "your email"
- eval "$(ssh-agent -s)"
- ssh-add ~/.ssh/id_rsa
- tail ~/.ssh/id_rsa.pub
How to push files and folders in the GitHub repository?
- git remote: To check if any remote account is connected or not.
- git remote -v: To check from where we can push our files or from where we can pull the files.
- git remote add origin "url of github repository": To add GitHub repository to git/local storage.
- git push -u origin master - to push files into GitHub repository.
- git push origin branchname: To push a particular branch into GitHub repository.
- git push origin branchname::newbranchname: To push a particular branch into GitHub repository as a new name.
- git push -d origin branchname: To delete a branch in the GitHub repository.
How can you clone anyone GitHub repository in your local system?
- git clone "url" - to clone GitHub repository in local storage as the default name.
- git clone "url" new name - to clone GitHub repository in local storage as a new name.
