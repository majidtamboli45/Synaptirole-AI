# Forking Workflow in Open Source Ecosystem

> Source: https://www.geeksforgeeks.org/git/forking-workflow-in-open-source-ecosystem/

The forking workflow allows developers to contribute to projects by creating a personal copy of a repository and making changes independently.
- Fork the repository on Github and clone it using Git.
- Make changes, commit, and push to your fork.
- Create a pull request to merge changes into the original project.
Forking and Cloning a Repository
Steps to fork a repository, set up your local environment, and prepare for contributing to an open-source project.
Step 1: Fork the Repository (GitHub)
- Go to the GitHub repository you wish to contribute to and click the Fork button (top-right corner) to create a copy in your own account.
Step 2: Clone the Forked Repository (Git)
- Clone your fork to your local machine:
git clone https://github.com/your_username/forked_project
Example:
git clone https://github.com/Aniruddha-Shriwant/techdocs
Step 3: Add Upstream Repository
- The upstream repository is the original repository you forked from.
git remote add upstream https://github.com/accordproject/techdocs
- Verify remotes:
git remote -v
Step 4: Fetch and Sync with Upstream
- Fetch latest changes from the original repository:
git fetch upstream
- Update your local master branch:
git checkout master
git merge upstream/master
Step 5: Create a New Branch
- Always create a new branch for your changes:
git checkout master
git checkout -b yourNewBranch
Step 6: Work on Changes
- Make your changes in the new branch
- Add and commit changes:
git add .
git commit -m "your commit message"
Step 7: Rebase Before Creating Pull Request
- Keep your branch updated with the latest upstream changes:
git fetch upstream
git checkout master
git merge upstream/master
- Rebase your branch:
git checkout yourNewBranch
git rebase master
Step 8: Push Changes and Create Pull Request
- Push your branch to GitHub:
git push origin yourNewBranch
- Then go to GitHub and create a Pull Request (PR).
