# Git Status

> Source: https://www.geeksforgeeks.org/git/git-status/

git status displays the current state of the working directory and staging area, helping you understand which files are staged, modified, or untracked.
- Shows staged changes that are ready to be committed and included in the next snapshot of the repository.
- Displays modified files that have not yet been staged, indicating changes made in the working directory.
- Lists untracked files that exist in the directory but are not currently tracked by Git.
To use the git status command, navigate to your Git repository in your terminal and type:
git status
This command does not require any arguments, and its output provides a snapshot of your repository’s status.
Creating a Project Directory and Initializing a Git Repository
Create a new project directory, navigate into it, and initialize a Git repository.
$ mkdir gfg
$ cd gfg
$ git init Output:
Git Status when working tree is clean:
$ git status
Output:
Here, the Working tree is clean that's why the output is coming as nothing to commit.
Git Status when a new file is created:
$ touch new.txt
$ git status
Output:
Here, We created a new file that's why it is showing untracked files. We can use the 'git add' command to include this file.
$ git add new.txt
$ git status
Output:
Now, It is showing changes to be committed which means the file is now included and ready to commit. We can commit files using the git commit -m "message" command.
$ git commit -m "first commit"
$ git status
Output:
After committing, the status is now changed to nothing to commit because now the working tree is clean.
Git Status when an existing file is modified:
First, we need to add some content to our new.txt file.
Now execute command i.e.
$ git status
Output:
It is showing modified: new.txt means something is modified in it. Now let's add it and commit it.
$ git add new.txt
$ git commit -m "file modified"
$ git status
Output:
After adding and committing our working tree is cleaned that's why git status is showing 'nothing to commit'.
Git Status when the file is deleted:
$ git rm new.txt
$ git status
Output:
After deleting the file git status command show's the deleted file name and it is also ready to commit it by using the git commit command. So let's commit it and then see the status of the repo.
$ git commit -m "file deleted"
$ git status
Output:
After committing our working tree is cleaned that's why git status is showing 'nothing to commit'.
