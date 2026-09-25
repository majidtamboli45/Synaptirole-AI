# Git Prune

> Source: https://www.geeksforgeeks.org/git/git-git-prune/

git prune is a Git command used to remove unreferenced (dangling) objects from the repository. It helps clean up unnecessary data, freeing space and keeping the repository efficient.
- Removes dangling objects and cleans leftover data from operations like reset, rebase, or branch deletion.
- Frees disk space and improves repository performance by deleting unused objects.
- Commonly used with git gc, supports --dry-run, and should be used carefully as data cannot be recovered.
Syntax
git prune [options]
Command options:
- -n or --dry-run: is used to just display the removable items in the repository.
- -v or -verbose: provide details of pruning process.
Note: git prune operates on the hidden data and usually runs in conjunction with Git gc.
Git Objects
Git objects are the fundamental units of data storage in Git, used to store all repository information in its internal database.
- Commits: Represent snapshots of your project at different points in time.
- Trees: Represent directories and their structure.
- Blobs: Represent individual files.
Using git prune
git prune is a Git command used to delete objects (commits, blobs, trees) that are no longer reachable from any branch or tag. It helps clean up Git’s internal database and reduce unnecessary storage.
Cleaning Up Your Local Repository
To remove stale references from a remote:
git fetch --prune <remote>
- Deletes references to branches that no longer exist on the remote
To prune without fetching:
git remote prune origin
Configuring Automatic Pruning
Enable automatic pruning during fetch:
git config --global fetch.prune true
Example: Cleaning Unreachable Commits
A commit becomes unreachable (e.g., after git reset), and git prune is used to remove such dangling commits and unreferenced objects.
1. Create and initialize a repository
mkdir git-prune-demo
cd git-prune-demo
git init
echo "Hello World" > hello.txt
git add hello.txt
git commit -m "first commit"
- Creates a new repository called git-prune-demo.
- Changes the current directory to git-prune-demo.
- Initializes an empty Git repository.
- Creates a file hello.txt with content "Hello World".
- Adds the file to the staging area.
- Commits the file with the message "first commit".
Output:
2. Modify file and create another commit
echo "Hello from the other side" > hello.txt
git add hello.txt
git commit -m "second commit"
Output:
Check commit history:
git log
Output:
Here, the git log will display the commit history of the repository.
3. Make a commit unreachable
git reset --hard HEAD~1
- The latest commit becomes unreachable.
- git log will now show only the first commit.
Output:
Check commit history:
git log
Output:
The second commit becomes unreachable after git reset and is no longer visible in git log.
Checking it out using:
git checkout HEAD~1
Places the repository in a detached HEAD state, where the commit is not associated with any branch.
Note: The commit still exists in the repository and is simply not referenced by any branch.
Output:
The HEAD~1 is the commit that is detached from the current branch.
4. Run git prune
Preview objects to be removed:
git prune --dry-run --verbose
- If nothing is shown, Git is still tracking the commit via reflog.
Output:
5. Clear reflog and prune
Expire reflog entries:
git reflog expire --expire=now --expire-unreachable=now --all
Now run prune again:
git prune --dry-run --verbose --expire=now
- Displays SHA references of objects that will be deleted.
Output:
This will result in displaying git SHA object references of commit and tree objects that are no longer reachable from the current branch.
Usage of git prune
git prune helps optimize and clean the repository by removing unnecessary data.
- Free up disk space by removing unused and dangling objects.
- Improve performance by reducing unnecessary internal data.
- Maintain repository cleanliness for easier management.
Use Cases
git prune is useful in specific scenarios where unreferenced objects are created.
- After deleting branches, to remove unreferenced commits.
- After rewriting history (e.g., rebase), to clean up orphaned commits.
- As part of regular maintenance to keep the repository efficient.
