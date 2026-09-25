# GitHub Actions

> Source: https://www.geeksforgeeks.org/git/github-actions

GitHub Actions is an automation tool built inside GitHub that helps you automatically run tasks like testing code, deploying applications, formatting files, sending notifications, etc., whenever something happens in your repository.
- GitHub Actions is GitHub’s built-in system for automating tasks like CI/CD using simple YAML workflows.
- Workflows run automatically on events such as push, pull request, or scheduled triggers.
- It provides GitHub-hosted runners and secure secret management for safe execution.
- It can automate testing, building, and deploying applications to cloud platforms.
Key Features of GitHub Actions
- Seamless Integration: Directly integrated with GitHub, providing a unified development experience.
- Flexibility and Customization: Supports a wide range of automation tasks, from testing and building to deployment.
- Powerful CI/CD Capabilities: Automates complex CI/CD pipelines with ease.
- Multi-Platform Support: It runs workflows across different operating systems (Linux, macOS, Windows).
- Community-Driven: Extensive marketplace with reusable actions created by the community and GitHub.
Use GitHub Actions
There are two ways through which we can create the GitHub Actions.
- Using the Github UI
- Locally with your IDE
1. Create a GitHub Action Using the GitHub UI
Click on the Action tab to create a GitHub Action. You’ll see the following page:
Step 1: Click on the Action
Step 2: Select the workflow action
GitHub suggestions automatically work according to the nature of your project. Select the GitHub workflow and click on the configure button to create your action.
Step 3.Create the GitHub workflow
Here you can edit and create your action. Click on the commit change button to save the action.
Your GitHub Action has been created.
2. Create a GitHub Action Locally with Your IDE
- Open your project on the particular IDE like Vs code.
- Then create a .github/workflow/name-of-workflow.yml file in your project.
- Copy and paste the following code and save and push your local code into the GitHub repository.
- Below is the workflow action example mentioned which will print the hello world message.
 .github/workflows/demo.yml
name: CI
on:
    push:
        branches: ["main"]
jobs:
    build:
        runs-on: ubuntu-latest
        steps:
            - uses: actions/checkout@v4
            - name: Run a one-line script
              run: echo Hello, world!
- This workflow runs whenever a push is made to the main branch.
- Job Execution defines a 'job' called build that runs on an Ubuntu environment.
- The workflow triggers on a push to the main branch, runs a job on an Ubuntu environment, checks out the repository code, and executes a script that prints "Hello, world!".
GitHub Actions Workflow Components
1. Events in GitHub Actions
In GitHub Actions, events are the triggers that kick off workflows. These events are specific activities in your repository that lead to the execution of actions. For example, pushing new code or creating a pull request triggers specific events that initiate associated workflows.
Common GitHub Action Event Types
- Push: Triggered when code is pushed to the repository.
- Pull Request: Activated when a pull request is created, opened, or updated.
- Release: Occurs when a release is created or updated.
- Label: Happens when a label is applied or removed.
- Issues: Fired when an issue is opened, edited, or closed.
- Milestone: Triggered when a milestone is added or updated.
Each event type can be further customized to trigger only for specific actions. For example, a pull_request event can be restricted to occur only when a PR is opened for the 'releases/**' branch.
# .github/workflows/demo.yml
on:
issues:
types: [opened, edited, milestoned]
pull_request:
types:
- opened
branches:
- "releases/**"
This precise control over event types ensures that your workflow is efficient and minimizes unnecessary resource usage.
2. Jobs in GitHub Actions
Jobs are tasks that run within a GitHub Action workflow. By default, jobs run in parallel, but you can define dependencies so that one job runs after another. This is useful when certain tasks depend on the output of previous ones, such as building an app before running tests.
# .github/workflows/demo.yml
name: Demo Workflows
on:
push:
jobs:
build:
name: Build
needs: [Development]
steps:
- name: Build and deploy on Cloud
dev:
name: Development
steps:
- name: Run the developer
Test:
needs: [build, dev]
name: Testing
steps:
- name: Testing the application
In the above example, the Test job depends on the build and dev jobs. The jobs will run in parallel, but Test will wait until the other two jobs complete.
3. Runners in GitHub Actions
Runners are the virtual machines or environments where your GitHub Actions workflows execute. GitHub provides runners for various operating systems, such as Ubuntu, Windows, and MacOS.
You can specify the type of runner to use for each job in the workflow by setting the runs-on option.
Defining a Runner:
# .github/workflows/demo.yml
name: Demo workflows
on:
push:
branches: ["main"]
jobs:
build:
runs-on: ubuntu-latest
This configuration specifies that the build job should run on the latest version of Ubuntu. You can also define multiple runners for a job using an array.
4. Managing Secrets
You must never hardcode sensitive values like API keys, passwords, or cloud credentials in your YAML files. GitHub Actions provides Encrypted Secrets for this.
- How: You store them in your repository settings (Settings > Secrets and variables > Actions).
- Usage: You access them in your workflow using the secrets context:
steps:
- name: Login to Docker Hub
uses: docker/login-action@v3
with:
username: ${{ secrets.DOCKERHUB_USERNAME }}
password: ${{ secrets.DOCKERHUB_TOKEN }}
5. Self-Hosted Runners
While GitHub-hosted runners are easy, self-hosted runners are a key system design choice for many companies.
Why?
- Security & Network Access: The runner can be placed inside your private network (e.g., your private VPC in AWS). This allows your CI/CD pipeline to securely access private databases, internal artifcats, or Kubernetes clusters that are not exposed to the public internet.
- Custom Hardware: You can use runners with specific hardware, like powerful GPUs for machine learning, or ARM-based CPUs.
- Cost & Performance: For organizations with very high build volumes, it can be more cost-effective to manage their own fleet of runners.
6. Caching Dependencies
CI/CD jobs run in clean environments, meaning they have to download dependencies (like node_modules or Maven packages) every single time. This is slow and wasteful. You can use actions/cache to store these dependencies and restore them on subsequent runs.
steps:
- uses: actions/checkout@v4
- name: Cache Node.js modules
uses: actions/cache@v4
with:
path: ~/.npm # The directory to cache
key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}
restore-keys: |
${{ runner.os }}-npm-
- name: Install dependencies
run: npm install
The key is crucial. When the package-lock.json file changes, the key changes, and the cache is invalidated.
7. Matrix Builds
To ensure your system is reliable, you might need to test it across multiple platforms, language versions, or configurations. A matrix strategy lets you run the same job multiple times with different parameters.
jobs:
test:
runs-on: ubuntu-latest
strategy:
matrix:
node-version: [16.x, 18.x, 20.x]
os: [ubuntu-latest, windows-latest]
steps:
- name: Set up Node.js ${{ matrix.node-version }}
uses: actions/setup-node@v4
with:
node-version: ${{ matrix.node-version }}
# ... run tests ...
This will trigger 6 jobs in parallel (3 node versions x 2 OSes).
Why Use GitHub Actions?
GitHub Actions offers several advantages over traditional CI/CD tools
- Seamless Integration: Works natively within GitHub, reducing the need for external CI/CD services.
- Event-Driven Automation: Triggers workflows based on repository events like pushes, pull requests, and issues.
- Parallel Execution: Run multiple jobs concurrently to speed up CI/CD pipelines.
- Customizable Workflows: Define workflows in YAML files to suit specific project needs.
- Supports Multiple Runners: Works with GitHub-hosted and self-hosted runners for diverse environments.
- Marketplace for Actions: Utilize pre-built actions from the GitHub Marketplace to simplify workflow creation.
Use Cases of GitHub Actions
GitHub Actions can be applied in various scenarios
- CI/CD Pipelines: Automate testing, building, and deployment.
- Automated Code Reviews: Run static analysis and linting tools.
- Scheduled Jobs: Automate routine tasks such as backups.
- Security Scans: Detect vulnerabilities using security tools.
- Notification Triggers: Send alerts to Slack, email, or Discord.
