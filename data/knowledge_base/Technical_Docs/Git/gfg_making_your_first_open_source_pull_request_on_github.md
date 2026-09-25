# Making Your First Open Source Pull Request on GitHub

> Source: https://www.geeksforgeeks.org/git/making-first-open-source-pull-request/

Open Source software provides publicly accessible source code that can be used, modified, and shared freely. It enables developers to collaborate and contribute using tools like Git and GitHub.
- Source code is freely available for modification and redistribution.
- Git and GitHub are commonly used for managing contributions.
- Encourages collaboration and real-world development experience.
Prerequisites
Before getting started, ensure you have:
- Good understanding of at least one programming language.
- Knowledge of version control tools: Git / SVN.
- Familiarity with platforms like GitHub / Bitbucket / GitLab.
- Ability to read and understand large codebases.
- Basic knowledge of bug/issue tracking systems.
Following are a few resources found to be useful for beginners:
Steps to Create a Pull Request
Once you select a repository or issue:
Step 1: Read Contribution Guidelines
Check the CONTRIBUTING.md file (if available).
Step 2: Discuss the Issue
Communicate with maintainers to clarify requirements and expectations.
Step 3: Fork the repository
Create your own copy on GitHub.
Step 4: Clone the repository
git clone https://github.com/YOUR_USERNAME/PROJECT
Step 5: Add Upstream Repository
git remote add upstream https://github.com/PROJECT_USERNAME/PROJECT
Step 6: Create a New Branch
git checkout -b BRANCH_NAME
Step 7: Make Changes
- Implement your feature or fix.
- Follow coding guidelines.
Step 8: Push Changes
git push origin BRANCH_NAME
Step 9: Create Pull Request
Go to GitHub and submit a Pull request for review.
Useful Git Commands
Common Git commands used to manage repositories, branches, and collaboration efficiently.
- git remote -v: View remote repository
- git branch: List branches
- git branch -D BRANCH_NAME: Delete local branch
- git push origin --delete BRANCH_NAME: Delete remote branch
