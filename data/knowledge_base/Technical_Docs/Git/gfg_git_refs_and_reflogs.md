# Git Refs and Reflogs

> Source: https://www.geeksforgeeks.org/git/using-refs-and-reflogs-in-git/

Refs and reflogs in Git help track branch pointers and record updates to references, making it possible to recover lost commits.
- Refs point to specific commits (e.g., branches, tags).
- Reflogs keep a local history of reference changes for recovery.
Types of Refs
- Branches: Correctly described as movable pointers that advance with new commits.
- Tags: Correctly identified as static pointers, commonly used to mark releases.
- HEAD: Correctly described as a special reference pointing to the currently checked-out commit (typically a branch tip).
Viewing Refs in a Git Repository
Refs are stored as plain text files inside the .git/refs directory. You can explore them by navigating to .git/refs or by running a Git command from the project’s root directory.
$ ls -F1 .git/refs
or type the command in Git bash in the root directory of your project
find .git/refs
You should see the following structure, but it will contain different files depending on what branches, tags and remotes you have in your repo.
$ ls -F1 .git/refs
├── heads/
│   └── master
├── remotes/
├── tags/
- Local branches are stored in the refs/heads/ directory.
- Each file name corresponds to a branch name.
- The file contains a commit hash.
- The hash points to the tip of the branch.
Git Reflogs
A reflog (reference log) records when the tips of branches and other refs were updated in your local repository. Every time you:
- switch branches
- commit
- stash
- reset
- rebase
Git logs the movement of that reference into the reflog.
For example, Head@{2} points to where HEAD was two updates ago.
git reflog HEAD@{2}
If you want to inspect the commit itself, use:
git show HEAD@{2}
Command that manages information recorded in reflogs:
git reflog
Common Git Reflog Commands
Git reflog commands come with various subcommands for advanced usage:
git reflog [show] [log-options] [<ref>]
git reflog expire [--expire=<time>] [--expire-unreachable=<time>]
                            [--rewrite] [--updateref] [--stale-fix]
                           [--dry-run | -n] [--verbose] [--all [--single-worktree] | <refs>…]
git reflog delete [--rewrite] [--updateref]
                            [--dry-run | -n] [--verbose] ref@{specifier}…
git reflog exists <ref>
Words in square brackets such as "show", "log-options" are qualifiers, or we can say arguments to git reflog command.
Whether you are fixing mistakes or just understanding what happened, mastering refs and reflogs can make you much more confident using Git.
- Git Reflog Show: Displays the reflog for a reference (or HEAD by default), including recent actions and branch switches.
- Git Reflog Expire: Removes old or unreachable reflog entries; usually not run manually.
- Git Reflog Delete: Deletes a specific reflog entry by reference; rarely used directly.
- Git Reflog Exists: Checks whether a reference has a reflog and returns status accordingly.
