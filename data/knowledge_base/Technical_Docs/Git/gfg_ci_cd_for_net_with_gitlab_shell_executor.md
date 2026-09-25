# CI/CD for .NET with GitLab Shell Executor

> Source: https://www.geeksforgeeks.org/git/implementation-of-ci-cd-in-net-application-using-shell-executor-on-gitlab/

CI/CD for a .NET application using GitLab Shell Executor automates the build, test, and deployment process directly on the host machine for faster and consistent delivery.
- Executes pipeline jobs locally using GitLab Shell Executor.
- Automates build, test, and deployment workflows.
- Runs .NET commands like dotnet build and dotnet publish efficiently.
Understanding CI/CD with GitLab
Before diving into implementation details, let's briefly review the concepts of CI/CD and how GitLab facilitates their implementation:
- Continuous Integration (CI): Automatically builds and tests code changes on each commit.
- Continuous Deployment (CD): Automatically deploys code changes to target environments.
- GitLab Shell Executor: Runs CI/CD jobs directly on the host machine for better control.
Requirements and Configuration
Essential tools and their paths required for setting up and executing the CI/CD pipeline.
- Git: Used for version control and connecting to GitLab, set environment paths like C:\Program Files\Git and C:\Program Files\Git\bin.
- GitLab Runner: Executes CI/CD jobs automatically when commits are made.
- MSBuild.exe: Builds the .NET project during pipeline execution; path required in YAML configuration.
- NuGet.exe: Manages and restores dependencies; path required in YAML configuration.
- MSTest.exe: Executes test cases for the .NET application.
- .gitlab-ci.yml: Pipeline configuration file placed in the project root defining build and execution steps.
GitLab Runner Set Up
Follow these steps to download, configure, and register GitLab Runner
Step 1: Download and Setup
- Download GitLab Runner for Windows.
- Save it in a directory (e.g., C:\Tools\GitLab-Runner).
- Rename it to gitlab-runner.exe
Step 2: Check and Stop Runner
- Open Command Prompt in Admin mode.
- Navigate to runner directory.
- Check status:
gitlab-runner status
- Stop runner if running:
gitlab-runner.exe stop
Step 3: Register Runner
gitlab-runner.exe register
Provide the following details:
- GitLab URL: e.g., http://gitlab.example.com
- Token: Found in GitLab > Repository > Settings > CI/CD > Runners
- Description: Any name for the runner
- Tags: Optional
- Executor: Select shell
Step 4: Start Runner
gitlab-runner start
Step 5: Verify Runner
- Go to GitLab > Repository > Settings > CI/CD > Runners
- Green indicator: Active
- Gray indicator: Not started
Note: If the circle is gray, it means the runner has not started and starts again.
Windows GitLab Runner Command
Common commands used to manage and control the GitLab Runner service on Windows.
- gitlab-runner.exe register: Register runner
- gitlab-runner.exe start: Start runner
- gitlab-runner.exe stop: Stop runner
- gitlab-runner.exe status: Check status
- gitlab-runner restart: Restart runner
- gitlab-runner uninstall: Uninstall runner
- gitlab-runner unregister --all-runners: Remove all runners
.gitlab-ci.yml Configuration
Defines CI/CD pipeline stages, jobs, and execution steps, including build, test, and deployment, along with scripts, variables, and dependencies.
Variables
variables:
NUGET_PATH: 'C:\Tools\Nuget\nuget.exe'
MSBUILD_PATH: 'C:\Program Files (x86)\Microsoft Visual Studio\...\MSBuild.exe'
MSTEST_PATH: 'C:\Program Files (x86)\Microsoft Visual Studio\...\mstest.exe'
TEST_FOLDER: '.\test\bin\Release'
Stages
stages:
- build
- test
- deploy
Before Script
before_script:
- '& "$env:NUGET_PATH" restore sourcecode\project.sln'
- '& "$env:NUGET_PATH" restore test\test.sln'
Build Stage
Compiles the .NET solution using MSBuild to generate application binaries.
build_job:
stage: build
only:
- developer
script:
- '& "$env:MSBUILD_PATH" sourcecode\project.sln ...'
Test Stage
Executes automated tests (e.g., via MSTest) to validate the built application.
test_job:
stage: test
script:
- .\test\test.bat
dependencies:
- build_job
Deploy Stage
Copies or publishes the built artifacts to the target deployment directory or environment.
deploy_job:
stage: deploy
script:
- 'xcopy /y /s "...Publish\*.*" "C:\solutionDir"'
dependencies:
- build_job
- test_job
- Commit changes to repository.
- Go to GitLab > CI/CD > Pipelines.
- Check job execution status.
