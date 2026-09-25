# GitHub Workflows

> Source: https://www.geeksforgeeks.org/git/github-workflows

GitHub Workflows are a powerful feature of GitHub Actions that automate tasks such as building, testing, and deploying your code directly from your GitHub repository. Workflows are highly customizable, allowing you to create automated processes that fit your specific project needs.
This article provides a detailed overview of GitHub Workflows, explaining what they are, how to create them, and best practices for using them effectively.
What are GitHub Workflows?
A GitHub Workflow is a configurable automated process made up of one or more jobs that run on GitHub Actions. Workflows are defined in YAML files stored in the .github/workflows/ directory of your repository. Each workflow can be triggered by specific events (like pushing code, opening a pull request, or scheduling times) or manually.
Key components of a GitHub Workflow include:
- Events: Triggers that start the workflow, such as push, pull_request, or schedule.
- Jobs: A set of steps that are executed on the same runner. Jobs run in parallel by default but can be configured to run sequentially.
- Steps: Individual tasks that make up a job. Each step can run commands or use actions (predefined, reusable commands) to perform tasks.
How to Create a GitHub Workflow
Here’s a step-by-step guide to creating a basic GitHub Workflow:
Step 1: Navigate to Your Repository
Go to your GitHub repository where you want to create a workflow.
Step 2: Create the Workflow File
Create a new file in the .github/workflows/ directory of your repository. For example, you might create a file named ci.yml.
Step 3: Define the Workflow
In your new workflow file, define the workflow using YAML syntax. Below is a basic example of a workflow that runs a set of tests whenever code is pushed to the main branch:
name: CI
on:
push:
branches:
- main
pull_request:
branches:
- main
jobs:
build:
runs-on: ubuntu-latest
steps:
- name: Checkout code
uses: actions/checkout@v4
- name: Set up Node.js
uses: actions/setup-node@v4
with:
node-version: "14"
- name: Install dependencies
run: npm install
- name: Run tests
run: npm test
This workflow is named "CI" and is triggered by push and pull_request events on the main branch. It includes a job named build that runs on the latest version of Ubuntu. The job consists of steps to checkout the code, set up Node.js, install dependencies, and run tests.
Components of GitHub Workflows
Events: These are triggers that start workflows. Common events include:
- Push: Triggered when code is pushed to the repository.
- Pull Request: Triggered when a pull request is opened, synchronized, or reopened.
- Schedule: Triggers workflows at scheduled times using cron syntax.
Jobs: Jobs are sets of steps that run on the same runner. Jobs can run in parallel or can be configured to run sequentially using the needs keyword.
Steps: Steps are individual tasks within a job. Steps can run commands directly or use actions to perform tasks. Actions are reusable units of code that can be used to simplify your workflows.
Runners: These are the servers that run your workflows. GitHub provides hosted runners for various operating systems, including Ubuntu, Windows, and macOS, or you can use self-hosted runners.
Best Practices for GitHub Workflows
- Keep Workflows Modular: Break down your workflows into smaller, more manageable jobs and steps. This makes them easier to maintain and debug.
- Use Secrets for Sensitive Data: Store sensitive information, like API keys, in GitHub Secrets. Use these secrets in your workflows to keep sensitive data secure.
- Optimize Workflow Performance: Use caching and artifacts to speed up workflows. For example, caching dependencies can significantly reduce build times.
- Testing and Debugging: Test workflows in a separate branch or repository to ensure they work as expected before merging them into the main branch. Use the GitHub Actions logs to debug any issues.
- Reuse Actions: Take advantage of existing actions from the GitHub Marketplace or create your own reusable actions to simplify and streamline your workflows.
- Monitor and Maintain Workflows: Regularly review and update workflows to keep them aligned with project needs and dependencies. GitHub provides insights and logs that can help monitor workflow performance and identify areas for improvement.
Advanced Workflow Features
- Matrix Builds: Use matrix builds to run jobs with multiple combinations of variables, such as testing against multiple versions of a language or operating system.
strategy:
matrix:
node-version: [12, 14, 16]
os: [ubuntu-latest, windows-latest, macos-latest]
- Reusable Workflows: You can define workflows that can be reused across multiple repositories or multiple workflows within the same repository.
- Environment Protection Rules: Define rules that control when jobs can run, such as requiring approvals before deployment to production environments.
Example of a More Complex Workflow
Here’s an example of a more complex workflow that uses a matrix build, cache, and deploys to GitHub Pages:
name: Build and Deploy
on:
push:
branches:
- main
jobs:
build:
runs-on: ubuntu-latest
strategy:
matrix:
node-version: [12, 14]
steps:
- name: Checkout code
uses: actions/checkout@v4
- name: Set up Node.js
uses: actions/setup-node@v4
with:
node-version: ${{ matrix.node-version }}
- name: Cache node modules
uses: actions/cache@v4
with:
path: node_modules
key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
restore-keys: |
${{ runner.os }}-node-
- name: Install dependencies
run: npm install
- name: Build project
run: npm run build
- name: Deploy to GitHub Pages
uses: peaceiris/actions-gh-pages@v3
with:
github_token: ${{ secrets.GITHUB_TOKEN }}
publish_dir: ./build
This workflow demonstrates how to:
- Use matrix builds to test with different Node.js versions.
- Cache dependencies to speed up builds.
- Deploy built content to GitHub Pages using a third-party action.
