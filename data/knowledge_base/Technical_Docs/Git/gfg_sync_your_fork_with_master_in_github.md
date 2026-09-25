# Sync Your Fork With Master in GitHub

> Source: https://www.geeksforgeeks.org/git/sync-your-fork-with-master-in-github/

Forking a repository on GitHub allows you to create your own copy of someone else's project. This is especially useful for contributing to open source projects. However, as the original repository (often referred to as the "upstream" repository) continues to evolve, it's important to keep your fork updated with the latest changes. This article will guide you through the steps to sync your fork with the upstream repository.
Table of Content
Why Sync Your Fork?
- Stay Updated: Keep your fork up-to-date with the latest features, bug fixes, and improvements.
- Avoid Conflicts: Reduce merge conflicts when you submit pull requests.
- Maintain Relevance: Ensure that your contributions are relevant to the current state of the project.
Steps to Sync Your Fork with Master
Step 1: Open your command line or terminal in git bash.
Step 2: Run the following command in your terminal to see the current configured remote repository in your fork:
git remote -v
Step 3: Run the following command:
git remote add upstream https://github.com/(original_owner_or_organisation/(original_repository).git
This particular command will help you add the upstream which means the link to master repository from which you have forked.
Step 4: Check your remote now by running the following command again:
git remote -v
It will show something like this, which indicates your own local repository and also your master repository.
Step 5: Fetch the changes from the upstream with following command:
git fetch upstream
Now, that you've set the upstream, it's time to fetch the changes from the upstream(master repository) that have been made since the time you forked. But make sure, you are in your master branch or any main branch before you run this command.
Step 6: Merge the fetched changes:
git merge upstream/master
We've reached the milestone finally and now it's all left to merge the changes that you've have fetched from your master to the local repository. This command will help you do that.
After you have run all these commands in stepwise order correctly, you will have all the changes made in the master updated in your local repository successfully.
Automating the Process with GitHub Desktop
If you prefer a graphical user interface, GitHub Desktop provides an easy way to sync your fork with the upstream repository.
- Open GitHub Desktop and navigate to your fork.
- Add the upstream repository:
  - Go to "Repository" > "Repository Settings..."
  - In the "Remote" tab, click "Add"
  - Enter the URL of the original repository and name it "upstream"
- Fetch and merge upstream changes:
  - Click "Fetch origin" to pull in the latest changes
  - Click "History" to view the fetched commits
  - Click "Branch" > "Merge into current branch..." and select the upstream branch to merge
Best Practices
- Regularly Sync: Sync your fork regularly to keep up with the upstream repository’s changes.
- Create Feature Branches: When working on new features or bug fixes, create a new branch in your fork. This keeps your main branch clean and makes it easier to manage updates.
- Communicate: If you're contributing to a project, communicate with the maintainers about any major updates you're merging to ensure consistency and avoid duplication of effort.
