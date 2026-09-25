# Introduction to GitHub Actions

> Source: https://www.geeksforgeeks.org/git/introduction-to-github-actions/

GitHub Actions is a CI/CD (Continuous Integration/ Continuous Deployment) platform for automating the builds, test, and deployment process. Using GitHub actions, we can build and test every pull request in the repository using workflows, or push the merged pull requests to production with workflows. GitHub Actions allows you to conduct processes in response to the events in your repository. For example, anytime someone files a new issue in your repository, you may execute a process to automatically add the required labels or if someone sends a pull request to your repository, then the automated workflows built by you can check if the pull request is eligible for merging into the main code or not. The figure below explains the flow of work done by a software engineer and the need for CI/CD pipelines.
The Architecture: How It Works Components Of GitHub Actions
To understand GitHub Actions, you must understand its hierarchy. It follows a specific flow:
- Event: Something happens (e.g., a Push).
- Workflow: The automated process triggers.
- Job: A set of tasks running on a specific server (Runner).
- Step: A single task inside a job (e.g., "Install Python").
- Action: A pre-built script used within a step.
The 5 Core Components
1. Workflows
A workflow is the configurable unit of automation. It is defined in a YAML file stored in your repository at .github/workflows/.
- Analogy: The "Recipe" for your automation.
2. Events (The Triggers)
An event is what starts the workflow. You can trigger workflows on almost anything:
- push: When code is pushed.
- pull_request: When a PR is opened.
- schedule: Run at a specific time (e.g., "Every Monday at 9 AM").
- workflow_dispatch: A button to manually run the workflow.
3. Jobs
A workflow contains one or more Jobs.
- Parallel Execution: By default, all jobs run at the same time (parallel).
- Dependencies: You can make Job B wait for Job A to finish (e.g., "Don't deploy unless the 'Test' job passes").
4. Runners
A runner is the server that actually executes your code.
- GitHub-Hosted Runners: Virtual machines managed by GitHub (Ubuntu, Windows, macOS). They are fresh for every job and discarded afterwards.
- Self-Hosted Runners: You can connect your own physical server to GitHub Actions if you need specific hardware (e.g., a GPU for ML tasks).
5. Actions
Actions are reusable commands. Instead of writing complex scripts to "Login to Docker" or "Setup Node.js," you can just "use" an Action that someone else wrote.
- Where to find them: The GitHub Marketplace.
