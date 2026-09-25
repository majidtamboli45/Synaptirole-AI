# Git Interview Questions and Answers

> Source: https://www.geeksforgeeks.org/git/git-interview-questions-and-answers/

Git is a distributed version control system (DVCS) that uses snapshot-based versioning and cryptographic hashing to manage source code changes with high integrity and efficiency. It enables branching, merging, conflict resolution, and collaborative development while serving as the backbone of modern DevOps and CI/CD pipelines.
1. What is a repository in Git?
A Git repository (repo) is a storage location that contains a project's source code, complete commit history, branches, tags, and configuration required for version control. Repositories can be local (on a developer's machine) or remote (hosted on platforms like GitHub, GitLab, or Bitbucket) to support collaboration and synchronization.
2. What is the .git Directory?
The .git directory is a hidden folder created when a repository is initialized. It stores all Git metadata, including commit history, branches, tags, configuration, and object database. Removing this directory stops Git from tracking the project.
3. What is the difference between Git and GitHub?
Git
- It runs locally on a developer's machine.
- It works offline without requiring an internet connection.
- It manages commits, branches, merges, and version history.
- It is installed as software on Windows, Linux, or macOS.
GitHub
- GitHub is a cloud-based platform for hosting Git repositories.
- It enables collaboration among developers using remote repositories.
- It requires an internet connection to synchronize repositories.
- It provides features such as pull requests, code reviews, issue tracking, and GitHub Actions for CI/CD.
- It is accessed through a web browser, Git client, or GitHub Desktop.
4. What is origin in Git?
Origin is the default alias assigned to the remote repository when a Git repository is cloned. It acts as a shorthand reference for the remote repository and is commonly used with commands such as git fetch, git pull, and git push to synchronize changes between the local and remote repositories.
5. What is the purpose of the .gitignore file?
The .gitignore file specifies files and directories that Git should exclude from version control. It is commonly used to ignore temporary files, build artifacts, logs, dependency folders, and sensitive configuration files, keeping the repository clean and secure.
6. What is a version control system (VCS)?
A version control system (VCS) records the work of developers coordinating on projects. It keeps the history of code changes, permitting developers to add new code, fix bugs, and run tests securely. If required, they can restore a past working version, verifying project security.
7. What is the Git Workflow?
The Git workflow describes the process of tracking and sharing code changes using Git. A typical workflow involves creating or cloning a repository, making changes, staging them, committing them to the local repository, and finally pushing them to a remote repository.
8. What is the git push command?
The git push command uploads local commits from a Git repository to a remote repository, updating the corresponding remote branch. It is used to synchronize local changes and make them available to other collaborators.
9. What is the git pull command?
The git pull command retrieves the latest changes from a remote repository and automatically merges them into the current local branch. It is essentially a combination of git fetch followed by git merge.
10. What is the Difference Between a Fork and a Clone?
- Fork: Creates a copy of another user's repository on a Git hosting platform, Used in open-source collaboration, Exists remotely.
- Clone: Creates a local copy of an existing repository, Used for local development, Exists on the local machine.
11. What does git clone do?
The git clone command creates a complete local copy of a remote Git repository, including its commit history, branches, and configuration. The -b option allows you to clone and check out a specific branch instead of the default branch.
12. What are the advantages of using GIT?
- Supports distributed version control with a complete local repository.
- Enables fast branching, merging, and team collaboration.
- Allows offline development and maintains complete version history.
- Free, open-source, and scalable for projects of any size.
13. What is the difference between git init and git clone?
- git init creates a new, empty Git repository in the current directory.
- git clone creates a local copy of an existing remote repository, including its files, branches, and commit history.
14. What is git add?
The git add command stages new or modified files for the next commit. It moves changes from the working directory to the staging area, preparing them to be committed to the repository.
15. What is git status?
The git status command displays the current state of the Git repository, including modified, staged, and untracked files. It helps you identify which changes are ready to be committed and which still need attention.
16. What is a commit in Git?
A commit is a snapshot of the staged changes in a Git repository at a specific point in time. Each commit is identified by a unique hash and includes a commit message describing the changes made.
17. What is the git log Command?
The git log command displays the commit history of a repository, including commit IDs, authors, dates, and commit messages.
git log
18. What is the git show Command?
The git show command displays detailed information about a specific commit, tag, or object, including metadata and code changes.
git show <commit-hash>
19. What is the git restore Command?
The git restore command restores files in the working directory or unstages files without affecting commit history. It replaces older uses of git checkout for restoring files.
git restore file.txt
20. What is the purpose of the git clean command?
The git clean command removes untracked files and directories from the working directory. It is used to clean the workspace by deleting files that are not tracked by Git.
21. What is a 'conflict' in git?
A Git conflict occurs when Git cannot automatically merge changes because the same part of a file has been modified differently in multiple branches. The conflict must be resolved manually before the merge or rebase can be completed.
22. What is the meaning of 'Index' in GIT?
The Index, also known as the Staging Area, is an intermediate area where changes are prepared before they are committed to the repository. It allows you to review and stage specific files or modifications for the next commit.
23. Explain the Git Lifecycle.
The Git lifecycle represents the journey of a file from creation to storage in a remote repository.
- Working Directory: Files are created or modified.
- Staging Area: Changes are prepared for commit using git add.
- Local Repository: Changes are permanently recorded using git commit.
- Remote Repository: Commits are shared using git push.
24. How do you change the last commit in git?
Use the git commit --amend command to modify the most recent commit. It allows you to update the commit message or include additional staged changes before creating a revised commit.
25. What is 'git checkout'?
The git checkout command is used to switch between branches or restore files to a previous commit or state. In modern Git versions, git switch is preferred for branch switching, while git restore is used to restore files.
26. How do you switch branches in Git?
Use the git switch <branch-name> command to switch to an existing branch. In older Git versions, the equivalent command is git checkout <branch-name>.
27. What are the different types of Git repositories?
Git repositories are of two types:
- Bare Repository: Contains only the Git metadata and no working directory. It is primarily used as a remote repository for collaboration.
- Non-Bare Repository: Contains both the Git repository and a working directory, allowing developers to modify, stage, and commit files.
28. How does Git handle file deletion?
Git uses the git rm command to remove files from both the working directory and the staging area. To remove a file only from version control while keeping it locally, use git rm --cached <file>.
29. How can you create an alias in Git?
You can create a Git alias using the git config command:
git config --global alias.<alias_name> "<git_command>"
30. What is the difference between git fetch and git pull?
- git fetch downloads the latest changes from the remote repository but does not merge them into the current branch, allowing you to review the updates first.
- git pull downloads the latest changes and automatically merges them into the current local branch. It is equivalent to git fetch + git merge.
31. Explain Git rebase and when do you use it?
Git rebase reapplies the commits of one branch onto another, creating a linear commit history without unnecessary merge commits. It is commonly used to keep feature branches up to date, simplify commit history, and prepare changes before merging into the main branch.
32. How will you create a git repository?
To create a Git repository:
- Install Git on your system.
- Create or open your project directory.
- Navigate to the project directory in the terminal.
- Run git init to initialize a new Git repository.
33. What differentiates between the commands git remote and git clone?
- git remote is used to manage connections to remote repositories, such as adding, removing, or viewing remote URLs. It does not download repository data.
- git clone creates a complete local copy of a remote repository, including its files, branches, and commit history.
34. What are the benefits of using a pull request in a project?
- Enables code review before changes are merged into the main branch.
- Improves collaboration by allowing team members to discuss and suggest changes.
- Helps maintain code quality and reduces the risk of introducing bugs.
- Keeps the main branch stable by reviewing and validating changes before merging.
35. What is a Git bundle?
A Git bundle is a single file that contains a Git repository's commits, branches, and tags, allowing repositories or changes to be transferred without a network connection. It is created using the git bundle create command and is commonly used for offline repository sharing and backup.
git bundle create <bundle_file> <refs>
36. What are the advantages of Git over SVN?
- Distributed architecture: Every developer has a complete local copy of the repository.
- Faster performance: Most operations are performed locally without network access.
- Efficient branching and merging: Git provides lightweight branches and simpler merges.
- Offline support: Developers can commit and view history without an internet connection.
- Better collaboration: Git offers powerful conflict resolution and flexible workflows for teams.
37. What is git stash?
The git stash command temporarily saves uncommitted changes without creating a commit, allowing you to switch branches or work on another task. The stashed changes can later be restored using git stash apply or git stash pop.
38. How do you revert a commit that has already been pushed and made public?
To safely revert a public commit:
- Switch to the target branch.
- Find the commit hash using git log.
- Run git revert <commit-hash> to create a new commit that reverses the changes.
- Push the revert commit using git push origin <branch-name>.
39. Explain the difference between reverting and resetting?
- git reset moves the HEAD to a previous commit, modifying the commit history. It is mainly used for local commits and can also affect the staging area and working directory.
- git revert creates a new commit that reverses the changes of a previous commit without altering the existing commit history. It is the preferred method for undoing changes in shared or public repositories.
40. What is the difference between git reflog and log?
- git reflog records changes to HEAD and branch references, including commits that are no longer part of the branch history. It is commonly used to recover lost commits or branches.
- git log displays the commit history of the current branch. It is used to review previous commits but cannot show commits that are no longer reachable from the branch history.
41. What is the HEAD in Git?
HEAD is a special reference that points to the latest commit on the currently checked-out branch. When you switch branches, HEAD moves to the latest commit of the new branch. If HEAD points directly to a commit instead of a branch, Git is in a detached HEAD state.
42. What is the purpose of 'git tag -a'?
The git tag -a command creates an annotated tag that stores metadata such as the tagger's name, date, and a message. It is commonly used to mark important milestones, such as software releases, in a Git repository.
43. What is the difference between 'HEAD', 'working tree' and 'index' in Git?
- HEAD is a reference to the currently checked-out branch or the latest commit you are working on.
- The Working Tree is the local project directory where you create and modify files.
- The Index (Staging Area) is an intermediate area that stores staged changes before they are committed to the repository.
44. How to resolve a conflict in Git?
To resolve a Git conflict:
- Identify the conflicted files after a merge or rebase.
- Edit the files and remove the conflict markers (<<<<<<<, =======, >>>>>>>).
- Stage the resolved files using git add <file>.
- Complete the process with git commit (or git rebase --continue if rebasing).
45. Explain the difference between 'git merge' and 'git rebase' and when you would use each?
- git merge combines two branches by creating a merge commit, preserving the complete branch history. It is preferred in collaborative projects where maintaining branch history is important.
- git rebase reapplies commits from one branch onto another, creating a linear commit history without merge commits. It is commonly used to clean up feature branches before merging or pushing.
46. What language is used in GIT?
Git is primarily written in the C programming language, which provides high performance, portability, and efficient memory management. Some supporting tools and scripts are implemented using Shell, Perl, and other scripting languages.
47. How do you add a file to the staging area?
Use the git add <file> command to stage a specific file for the next commit. To stage all modified and new files, use (git add .).
48. What is git diff?
The git diff command displays the differences between files, branches, commits, or the working directory and the staging area. It is commonly used to review changes before staging or committing them.
49. What is a Git commit hash?
A Git commit hash is a unique SHA-1 identifier assigned to each commit in a repository. It is used to uniquely identify, reference, and retrieve specific commits in the Git history.
50. What is a detached HEAD state?
A detached HEAD state occurs when HEAD points directly to a specific commit instead of a branch. Any new commits created in this state are not associated with a branch unless a new branch is created.
51. How can you delete a remote Git branch?
Use the git push origin --delete <branch-name> command to delete a branch from the remote repository. This removes the specified branch from the remote but does not affect the local branch.
52. What is the purpose of git cherry-pick?
The git cherry-pick command applies a specific commit from one branch to the current branch without merging the entire branch. It is commonly used to transfer individual bug fixes or features while maintaining a clean commit history.
53. What does git ls-files do?
The git ls-files command lists all files currently tracked by Git in the repository. It is used to view tracked files and does not display untracked or ignored files.
54. How do you fetch all remote branches?
Use the git fetch --all command to download the latest changes from all configured remote repositories without merging them into the current branch.
55. What is the Git object model?
The Git object model is the internal data structure used by Git to store repository data. It consists of four object types:
- Blob: Stores the contents of a file.
- Tree: Represents the directory structure and references blobs and other trees.
- Commit: Stores a snapshot of the repository along with metadata such as the author, timestamp, and parent commit.
- Tag: References a specific commit, typically used to mark important milestones such as releases.
56. What is git blame?
The git blame command shows who last modified each line of a file, along with the corresponding commit hash and timestamp. It is commonly used to identify the author of a change and assist in debugging.
57. What is a git hook and how might you use it?
A Git hook is a script that runs automatically before or after specific Git events, such as commit, merge, or push. It is commonly used to automate tasks like code quality checks, running tests, enforcing coding standards, or sending notifications.
58. What is the difference between a lightweight tag and an annotated tag?
- A lightweight tag is simply a reference to a specific commit and does not store additional metadata.
- An annotated tag stores metadata such as the tagger's name, date, and a message, making it the preferred choice for marking releases.
59. How do you handle large files with Git?
Large files are typically managed using Git LFS (Large File Storage), which stores large files outside the Git repository while keeping lightweight pointers in the repository. This improves repository performance and reduces storage usage.
60. What is branching in Git?
Branching in Git allows developers to create independent lines of development within a repository. It enables features, bug fixes, and experiments to be developed in isolation without affecting the main codebase until the changes are merged.
61. What is a Git submodule?
A Git submodule is a Git repository embedded within another Git repository. It is used to include and manage external projects or dependencies while maintaining their version history independently from the main repository.
62.How can you undo a commit that hasn’t been pushed to the remote repository?
- git reset --soft HEAD~1 removes the last commit while keeping the changes in the staging area.
- git reset --hard HEAD~1 removes the last commit and permanently deletes the associated changes from the staging area and working directory.
63. How do you squash multiple commits into one using Git rebase?
- Start an interactive rebase using git rebase -i HEAD~<number-of-commits>.
- Change pick to squash (or s) for the commits you want to combine.
- Save and close the editor.
- Edit the combined commit message, save, and complete the rebase.
64. How do you reset a commit to a previous commit without losing changes in the working directory?
Use the git reset --soft <commit-hash> command to move HEAD to a previous commit while preserving all changes in the staging area and working directory.
65. What is the difference between git reset --hard and git clean -fd?
- git reset --hard resets the current branch to a specified commit, discarding all tracked changes in the staging area and working directory.
- git clean -fd removes untracked files and directories from the working directory without affecting the commit history or tracked files.
66. How do you apply a patch from a remote Git repository?
- Obtain the patch file from the remote repository.
- Apply it using the git apply <patch-file> command.
- Review the changes and commit them if required.
67. How do you configure a Git repository to use a specific user for a particular project?
Use the git config command within the repository to set a project-specific username and email:
git config user.name "Your Name"
git config user.email "your.email@example.com"
68. How do you manage multiple remotes in a Git repository?
Multiple remotes can be managed using the git remote command:
- git remote add <remote-name> <remote-url>: Adds a new remote repository.
- git remote -v: Lists all configured remote repositories.
- git remote remove <remote-name>: Removes an existing remote repository.
69. How do you configure and use Git hooks for pre-commit checks?
To configure a pre-commit Git hook:
- Navigate to the .git/hooks directory.
- Rename or copy pre-commit.sample to pre-commit.
- Add a script to perform checks such as code formatting, linting, or testing.
- Make the hook executable using chmod +x .git/hooks/pre-commit.
70. How do you manage large binary files in Git without using Git LFS?
Without Git LFS, large binary files are typically stored outside the main Git repository, such as in a separate repository or external storage, and referenced using Git submodules or download scripts. This helps keep the repository size manageable while preserving version control for the source code.
71. How do you perform a Git bisect to find the commit that introduced a bug?
- Start the bisect process using git bisect start.
- Mark the current commit as bad using git bisect bad.
- Mark a known working commit as good using git bisect good <commit-hash>.
- Test each commit checked out by Git and mark it as good or bad until the faulty commit is identified.
- Run git bisect reset to exit the bisect process and return to the original branch.
72. What is the Difference Between git stash apply and git stash pop?
- git stash apply: Applies the stashed changes without removing them from the stash list, Useful when the stash may be needed again.
- git stash pop: Applies the changes and removes them from the stash list, Useful when the stash is no longer required.
73. What is Semantic Versioning (SemVer)?
Semantic Versioning is a version numbering system that uses the format:
MAJOR.MINOR.PATCH
