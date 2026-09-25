# What is Git?

> Source: https://www.geeksforgeeks.org/git/what-is-git/

Git is a distributed version control system that helps track and manage changes in code over time. It allows multiple developers to work on the same project, view previous versions, and restore changes when needed.
Features of Git
1. Version Control System: Git keeps track of every change you make to your project files. You can go back to previous versions is any requirement arises.
2. Repositories: A Git repository (or repo) is like a project's central hub where everything related to your work is stored and managed. There are two main types:
- Local Repository: This is a copy of the repository which is stored in your computer. You can work on your project and make changes here.
- Remote Repository: This is stored on a server, like GitHub, where you and others can share and work on a project.
3. Commits: Every time you make changes and save them in Git, these are called commits. The repository keeps track of all the commits you have made.
4. Branches: A repository allows you to create Branches and work on new features and fixes. For example, you can have a "main" branch for stable code and a "feature" branch for new features you're developing.
5. Merging: Once you are done with the branches you have made, you can merge those branches into main branch. This adds the changes you have made in the rest of the project.
6. Cloning: Cloning is a process of making a complete copy of Git repository. It's like copying the entire project from central location ( like website) to your own computer.
Reasons to Choose Git
- Distributed System: Every developer has a complete local copy of the project, allowing for offline work and increased resilience.
- Performance: Git is fast and efficient, handling large projects with ease.
- Branching and Merging: Git's lightweight branching and easy merging facilitate parallel development and feature isolation.
- Collaboration: Tools like GitHub enhance team collaboration, code reviews, and project management.
- Track Changes: Git tracks changes and maintains a history, making it easy to revert to previous versions.
Steps to Setup a Git
Install Git: Download and install Git from the official Git website.
Configure Git: Set up your username and email.
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
Create a Repository: Navigate to your project directory and initialize a Git repository.
git init
Make Your First Commit: Add files to the staging area and commit your changes.
git add .
git commit -m "Initial commit"
Basic Git Commands
- git init: Initializes a new Git repository.
git init
- git clone [URL]: Clones a remote repository to your local machine.
git clone [url]
- git add [file]: Stages changes to be committed.
git add [file]
- git commit -m "message": Commits the staged changes with a message.
git commit -m "Your commit message"
- git push: Pushes your commits to a remote repository.
git push origin branch-name
- git pull: Fetches and merges changes from a remote repository to your local repository.
git pull origin branch-name
- git status: Shows the status of changes in your working directory.
git status
Drawbacks
- Git can be complex to learn, especially for beginners.
- Some commands and operations can be difficult to understand and remember.
- Resolving conflicts when merging branches can be challenging.
- The local repository can take up significant space on your computer.
- Initial setup and configuration can be time-consuming.
- Git is less efficient at handling large binary files (e.g., videos, images).
Git Workflow
A Git workflow is a set of guidelines for using Git in a structured and efficient manner. Here’s a simple and common Git workflow:
- Clone Repository: git clone git@github.com:username/repository.git
- Create Branch: git checkout -b feature-branch-name
- Check Status: git status
- Stage Changes: git add filename or git add .
- Commit Changes: git commit -m "Add feature X"
- Push Branch: git push origin feature-branch-name
- Create Pull Request: On Github/other service
- Update Local Repository: git checkout main, git pull origin main
- Delete Branch: git branch -d feature-branch-name, git push origin --delete feature-branch-name
