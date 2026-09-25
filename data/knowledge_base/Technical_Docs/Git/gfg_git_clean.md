# Git Clean

> Source: https://www.geeksforgeeks.org/git/git-clean/

git clean remove untracked files and directories from the working directory to keep the repository clean.
Note: git clean is destructive and irreversible, so always use -n first to preview changes.
Git Clean Common Options
git clean provides multiple options to control how untracked and ignored files are removed, allowing safe previews, selective cleanup, and force deletion as needed.
1. Dry Run (-n / --dry-run)
Preview what will be deleted without actually removing anything.
git clean -n
2. Force Clean (-f / --force)
Git does not remove files unless explicitly forced.
git clean -f
3. Remove Ignored Files (-X or -x)
- Remove only ignored files:
git clean -fX
- Remove both ignored and untracked files:
git clean -fx
4. Interactive Clean (-i / --interactive)
Allows selective deletion with user confirmation.
git clean -i
5. Remove Untracked Directories (-d)
By default, directories are not removed.
git clean -fd
Git Clean Examples
There are certain limitations associated which are as follows:
By default, it will not remove-
- the .gitignore files
- new directories which are created recently
- index files.
- existing commit files
Let us pictorially depict the above commands and interpret them via terminal/PowerShell as follows:
Example 1: Using "git clean"
Example 2: Using "git clean -n"
Example 3: Using "git clean --force"
Example 4: Using "git status" (To check the status of files)
Example 5: Using "git clean -fdx"
Git Cleanup Best Practices
Regular cleanup helps keep your Git repository synchronized, organized, and efficient.
Prune Remote Branches
Removes local references to deleted remote branches, keeping the repository in sync.
git remote prune <remote-name>
Remove Merged Branches
Deletes local branches that have already been merged into the main branch.
git branch -d <branch-name>
Delete Local and Remote Tags
Removes unnecessary tags after merges or releases.
git tag -d <tag_name>
git push --delete origin <tag_name>
Clean Untracked Files
Deletes untracked files and directories from the working directory (use with caution).
git clean
Using git clean -fd Safely
git clean -fd is used to forcibly remove untracked directories along with untracked files from the working directory.
- -f forces deletion.
- -d removes untracked directories.
- Permanently deletes files and folders.
- Always run a dry run before execution.
git clean -fd
Interactive Mode Or Git Clean Interactive
Interactive mode allows you to clean untracked files and directories with confirmation, reducing the risk of accidental deletion.
- Default git clean runs without user prompts.
- --interactive asks for confirmation before deletion.
- Displays files and directories to be removed.
- Safer approach for controlled cleanup.
git clean --interactive
Git Clean Command Limitations
git clean permanently deletes untracked files, but it has specific technical limitations that must be considered.
- Permanent Deletion: Untracked files and directories are deleted permanently; always take a backup first.
- Limited Scope: Does not remove tracked files; ignored files require additional options.
- No Confirmation: Runs without prompts unless --interactive is used.
- Directories Not Removed by Default: Use -d to delete untracked directories.
