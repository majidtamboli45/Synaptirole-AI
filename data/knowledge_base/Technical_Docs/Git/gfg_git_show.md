# Git Show

> Source: https://www.geeksforgeeks.org/git/git-git-show-command-line-utility/

git show is used to display detailed information about a specific commit or Git object, including its metadata and file changes.
- Shows commit details (author, date, message).
- Displays exact file changes (diff output).
- Works with commit ID, branch, or tag.
We use Git in our daily coding activities, but many concepts are still unfamiliar to developers. One such command is git show.
Before understanding git show, we first initialize a repository using:
git init
This creates a .git folder that contains several subdirectories.
Git Internal Objects
Inside .git/objects, Git stores different types of objects:
- Blob Object: Stores the contents of a file.
- Tree Object: Contains a list of files and pointers to blob objects.
- Commit Object: Points to a tree object (snapshot of the project).
- Tag Object: Stores tag-related information (name, type, message).
To view detailed information about these objects, we use the git show command.
Using git show
Create demo.txt, add content, and commit the changes.
git show <commit id>
This command displays detailed information about that commit.
Output of git show
The output is divided into two main parts:
Part 1: Commit Information
- Displays commit message, author, date, and commit ID.
- Shows where HEAD is pointing (e.g., HEAD -> master) .
- Similar to the output of git log.
Since this commit had a pointer to the HEAD, let's see another example of git show where the commit doesn't have a pointer to the HEAD.
We didn't get HEAD->master here as this commit is not pointing to the HEAD.
Note: If the commit is not pointed to by HEAD, you won’t see HEAD -> master.
Part 2: File Changes (Diff Output)
This section starts with:
diff --git a/demo.txt b/demo.txt
Displays added, removed, and modified content.
- diff: Shows differences between file versions
- a/demo.txt: Previous version
- b/demo.txt: Updated version
Relation with git diff
Both commands are used to view changes, but they differ in scope.
- git diff: Shows differences between working directory, staging area, and commits.
- git show: Shows changes within a specific commit.
Note: git diff is used to show differences between file versions, including changes between the working directory, staging area, commits, and branches.
