# Remove Large Files from Commit History in Git

> Source: https://www.geeksforgeeks.org/git/remove-large-files-from-commit-history-in-git/

Sometimes, you may accidentally commit a large file to your Git repository, making it unwieldy and slow. Large files can significantly increase the size of your repository, making operations like cloning, fetching, and pulling slower and more cumbersome. This can be particularly problematic in team environments where multiple developers are constantly interacting with the repository.
Fortunately, Git provides powerful tools to rewrite commit history and remove such files. In this guide, we'll show you how to remove a specific file, bigfile.html, from your Git commit history using the filter-branch command.
Steps to Remove Large Files
Step 1: Remove the File
First, you need to remove large_file.html from the commit history. Open your terminal and navigate to your repository’s directory. Run the following command:
git filter-branch --force --index-filter \'git rm --cached --ignore-unmatch large_file.html' \--prune-empty --tag-name-filter cat -- --all
This command goes through your commit history and removes bigfile.html from all commits.
Step 2: Clean Up
After removing the file, you need to clean up your repository to finalize the changes. Run these commands:
git reflog expire --expire=now --allgit gc --prune=now --aggressive
These commands help reduce the repository size by expiring all reflogs and pruning all unreachable objects.
Step 3: Force Push the Changes
Finally, you need to push the cleaned-up history to your remote repository. Be cautious with this step, as force pushing will overwrite the remote history and can cause issues for other collaborators. Make sure to inform your team before proceeding. Run:
git push --force
Important Notes
- Backup Your Repository: Before making any history changes, it's a good idea to create a backup of your repository.
- Communicate with Your Team: Let your team know about the changes you’re making to avoid any surprises or conflicts.
- Understand the Risks: Force-pushing rewrites history and can disrupt other developers' work. Make sure everyone is prepared for the changes.
