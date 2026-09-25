# Forking a GitHub Repository

> Source: https://www.geeksforgeeks.org/git/how-to-fork-a-github-repository/

A fork is a separate copy of an existing repository that allows you to work on changes independently before sharing them back to the original project.
- Shares history with the original (upstream) repository.
- Commonly used when users don’t have write access to the upstream repo.
- Ideal for experimenting, fixing bugs, or adding features.
- Changes can be proposed back using pull requests.
How to Fork a Repo in GitHub
Step 1: Open the repository that you want to Fork there You can see the icon as shown in the image below in the repo’s top right corner. Now, this feature is used to Fork the repo.
Step 2: Go to any repository that you want to Fork here we are using a sample repo of Python official repository.
Step 3: Find the Fork button in the top right corner.
Step 4: Click on Fork.
Step 5: Now you have your own copy of the repository. But how can we confirm for which do refer to below visual aid as follows:
- The forked repository now appears under your username (e.g., username/mern-todo-app), with a link to the original project shown below it.
- You can make changes inside your forked repository.
- After updating it, you can create a pull request to submit those changes to the original project.
- The project maintainers will decide whether to accept or reject your changes.
Fork Using Command Line
Step 1: Open the terminal or git bash and type the below command.
git --version Step 2: You must first log in using the CLI to GitHub using your GitHub account before you may fork the repositories. To do it, issue the following command.
git auth login --web > SSH
Step 3: Once authentication is done. Copy the Repo URL that you to fork into our repo and use the below command.
git clone <REPO URL>
