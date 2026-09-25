# Add an Empty Directory to a Git Repository

> Source: https://www.geeksforgeeks.org/git/how-to-add-an-empty-directory-to-a-git-repository/

Git does not track empty directories by default, as it only tracks files. To preserve project structure, placeholder files are used to include empty directories in the repository.
- Git tracks files, not empty directories.
- Empty directories are added using placeholder files like .gitkeep.
- Helps maintain consistent project structure across teams.
Methods to Add an Empty Directory
Strategies to add empty directories in Git repositories:
1. Using a placeholder file
To add an empty directory in Git, create a placeholder file inside the directory since Git only tracks files. This ensures the directory is included in version control.
Steps:
Step 1: Create a new directory
mkdir <directory_name>
Step 2: Navigate to the directory and create a placeholder file (e.g., .gitkeep)
cd <directory_name>
touch .gitkeep
Step 3: Add the file to the staging area
git add .gitkeep
Step 4: Commit the changes
git commit -m "Add empty directory using .gitkeep"
2. Using a .gitignore file
Another way to add an empty directory in Git is by using a .gitignore file. This file ignores all contents of the directory except itself, allowing Git to track the directory.
Steps:
Step 1: Create and navigate to the directory
mkdir <directory_name>
cd <directory_name>
Step 2: Create a .gitignore file
touch .gitignore
Step 3: Add the following content to .gitignore
# Ignore everything in this directory
*
# Except this .gitignore file
!.gitignore
Step 4: Add the file to the staging area
git add .gitignore
Step 5: Commit the changes
git commit -m "Add empty directory using .gitignore"
