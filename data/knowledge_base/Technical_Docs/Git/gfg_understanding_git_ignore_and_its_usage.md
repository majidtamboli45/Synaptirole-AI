# Understanding Git-Ignore and Its Usage

> Source: https://www.geeksforgeeks.org/git/what-is-git-ignore-and-how-to-use-it/

.gitignore specifies which files and directories Git should exclude from version control.
- Prevents tracking of unnecessary or sensitive files.
- Supports file names, extensions, and directory patterns.
- Helps keep the repository clean and manageable.
Creating a .gitignore File
Step 1: Open the terminal or command prompt, navigate to your project directory using cd, and use ls -a to view its contents.
cd <directory-name>
ls -a
In this setup, the project resides in the story folder under web development, and Git is configured to ignore the secrets.txt file.
Step 2: Create .gitignore File inside the project folder.
Step 3: List the files or patterns to be ignored in the .gitignore file, placing each entry on a separate line.
Step 4: Initialize Git in the terminal, add the files to the repository, and commit the changes with an appropriate message.
git init
git add .
git commit -m "your message"
Step 5: Check the repository status. Files listed in .gitignore will be consistently excluded from tracking and commits.
git status
Examples
# Compiled class file
*.class
# Log file
*.log
# Mobile Tools for Java (J2ME)
.mtj.tmp/
# Package Files
*.jar
*.war
*.nar
*.ear
*.zip
*.tar.gz
*.rar
.gitignore File Patterns and Format
- Blank line: Used to separate entries for readability.
- #: Denotes a comment. Use \# to match a literal #.
- /: Directory separator. Example: webdev/ ignores the webdev directory at the root.
- *.extension: Matches all files with a specific extension (e.g., *.txt, *.log).
- **/name: Matches any file or directory named name at any level.
- name/**: Matches all files and subdirectories inside name.
.gitignore Rules
- Files listed in the .gitignore file must follow a specific pattern.
- Git reads the .gitignore file from top to bottom.
- The .gitignore file supports negation using the ! prefix.
- *.log ignores all files with the .log extension.
- build/ ignores the entire build directory.
- You can comment lines in the .gitignore file using #.
Local and Personal Git Ignore Rules
Local and Personal Git Ignore Rules define user-specific ignore settings that apply only to a local repository and are not shared with others.
Local Git Ignore Rules
.gitignore is a repository-level file that defines which files and directories Git should ignore.
- Only one .gitignore file is typically maintained per repository.
- Lists files and directories to be excluded from version control.
- Applies only to the specific repository where it exists.
- Shared with others only after it is committed and pushed to the remote repository.
Personal Git Ignore Rules
You can set up an .gitignore file which can be applied to all Git repositories. It will not shared with any other collaborators. Steps To Create a global .gitignore file
Step 1: Create .gitignore file as following.
touch ~/.gitignore_global
Step 2: Add the required rules to the .gitignore file as shown below.
# ~/.gitignore_global
*.swp
.DS_Store
Step 3: Now we need to configure this file as a global .gitignore file.
git config --global core.excludesfile ~/.gitignore_global
How to undo committed files
Before using .gitignore to ignore certain files, if you have already committed files you didn't want to here's how you can undo it. Use the following command on Git Bash to undo a commit:
git rm --cached -r <file or directory>
Here, "rm" stands for remove while -r stands for recursive.
Note: Head over to the GitHub and search for gitignore repositories, you will find a list of gitignore repositories contributed by various people.
