# How to Update or Sync a Forked Repository on GitHub?

> Source: https://www.geeksforgeeks.org/git/how-to-update-or-sync-a-forked-repository-on-github/

When you fork a repository on GitHub, you basically make a copy of the original repository and keep it under your own account. As time goes on, the original repository (known as the "upstream" repository) might receive updates, and it's important to keep your fork up to date with these changes. This way, you can contribute effectively and avoid any conflicts.
Using the GitHub Web Interface
This is the simplest method, involving just a few clicks on the GitHub website.
Step 1: Go to your GitHub account and open the forked repository.
Step 2: On GitHub, navigate to the main page of the forked repository that you want to sync with the upstream repository.
Step 3: Above the list of files, select the Sync fork dropdown menu.
Using Command Line
This approach provides more control and is preferred by developers comfortable with the command line.
Step 1: Clone Your Forked Repository (if not already cloned)
   git clone https://github.com/your-username/your-fork   
cd your-fork
Step 2: Add the original repository as a remote called `upstream`
git remote add upstream https://github.com/original-owner/original-repo
Step 3: Fetch Upstream Changes
git fetch upstream
Step 4: Merge Upstream Changes into Your Fork
- Switch to the main branch (usually `main` or `master`).
   git checkout master
- Merge the upstream changes into your local repository.
   git merge upstream/master
Step 5: Push the Updates to Your GitHub Fork
   git push origin main
Using GitHub Desktop
For those who prefer a graphical user interface, GitHub Desktop offers an intuitive way to manage repositories.
Step 1: Open GitHub Desktop and Clone Your Repository (if not already cloned).
Step 2: Add the Upstream Repository :
- Go to `Repository` > `Repository Settings`.
- Click on `Remote` and add the upstream repository URL.
Step 3: Fetch and Merge Upstream Changes :
- Go to `Fetch origin` to fetch changes from the upstream repository.
- After fetching, go to `Branch` > `Merge into current branch` to merge the changes.
By following these methods, you can easily keep your forked repository up-to-date with the upstream repository. Choose the approach that best fits your workflow and comfort level.
