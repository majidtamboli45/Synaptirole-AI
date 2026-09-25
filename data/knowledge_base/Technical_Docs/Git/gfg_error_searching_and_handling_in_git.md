# Error Searching and Handling in Git

> Source: https://www.geeksforgeeks.org/git/error-searching-and-handling-in-git/

Error searching and handling in Git involves identifying issues in the repository and using appropriate commands to fix, revert, or manage changes efficiently.
- Helps detect errors in commit history and working directory, supporting efficient debugging in DevOps workflows
- Uses Git commands to troubleshoot, resolve issues, and manage changes effectively.
- Allows reverting or correcting unwanted changes, improving reliability and version control management.
Common Git Errors and Their Solutions
These are common mistakes developers face in Git along with their fixes using appropriate commands.
1. Remove Files and Folders from the Index
Sometimes files are staged using git add, but you may want to unstage specific files to modify them before committing.
Syntax:
git reset <filename/dirname>
2. Forgot Changes in the Last Commit
If you forgot to include some changes in the last commit, you can update it without creating a new commit.
Syntax:
git commit --amend
3. Edit the Most Recent Commit Message
Allows you to change the message of the most recent commit without creating a new commit.
Syntax:
git config --global alias.hist 'log --pretty=format:"%C(yellow)%h%Geeks%ad |
%C(green)%s%Geeks%C(blue)%d%for Geeks %C(red)[%an]" --graph --decorate --date=short'
4. Remove Personal Data from Local Repository
Used when unwanted files (like personal data) are committed and need to be removed while keeping other files intact.
Syntax:
git reset --mixed HEAD~
git reset --mixed <commit-id>
5. Ignore Local Changes
If unwanted changes are made locally, they can be discarded to restore the file to its previous state.
Syntax:
git checkout -- <filename>
git checkout -- <dirname>
6. Replace Previous Commit with a New One
Removes the last commit while keeping the changes staged so they can be modified and committed again.
Syntax:
git reset --soft HEAD~1
7. Committed Wrong Data
Resets the project to a previous state, removing the incorrect commit and its changes.
Syntax:
git reset --hard HEAD~n
git reset --hard <commit-id>
8. Return to an Old Project State
Restores the project to a previous state, removing all changes made after that point.
Syntax:
git reset --hard <branch-number-here>
9. Recover a Deleted Local Branch
Restores a local branch that was accidentally deleted using its reference.
Syntax:
git checkout -b <branch> <sha-keypair>
10. Rename a Branch
Changes the name of a branch to correct or update it as needed.
Syntax:
git checkout <old_branch_name>
git branch -m <new_branch_name>
11. Rearrange Commit History
Reorders or combines commits to organize the commit history more effectively.
Syntax:
git rebase --interactive <commit-id>
Note: Works only on local commits, not pushed ones.
12. Handling Mistakes with Git Hooks
Git hooks are scripts that run at specific stages (like before commit) to check code and prevent errors before they are saved.
- Located in .git/hooks directory.
- Can block commits if issues are detected.
- Helps enforce rules in collaborative projects.
Example Logic:
- Redirect output to stderr for alerts.
- Detect forbidden patterns (e.g., “todo: fix this”).
- Reject commit if such patterns are found.
