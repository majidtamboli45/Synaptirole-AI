# How To Create A .gitlab-ci.yml File in GitLab?

> Source: https://www.geeksforgeeks.org/git/how-to-create-a-gitlab-ci-yml-file-in-gitlab

GitLab CI/CD automates the process of building, testing, and deploying code, ensuring your software is always in a releasable state. At the heart of GitLab's CI/CD pipelines is the .gitlab-ci.yml file, which defines the stages, jobs, and commands that need to be executed in a CI/CD pipeline.
In this article, we’ll walk through how to create a .gitlab-ci.yml file in GitLab, discuss its structure, and provide some best practices for using it effectively.
What is a .gitlab-ci.yml File?
The .gitlab-ci.yml file is a YAML-based configuration file placed in the root of your GitLab repository. It tells GitLab how to run CI/CD jobs, which include steps such as compiling code, running tests, deploying applications, and more. Each time a pipeline is triggered (e.g., by a code push or merge request), GitLab Runner reads the .gitlab-ci.yml file and executes the jobs according to the defined stages and conditions.
Key Features of the .gitlab-ci.yml File:
- Stages: Defines the steps in the pipeline, such as build, test, and deploy.
- Jobs: Defines the individual tasks that need to be executed during each stage.
- Artifacts: Specifies files that should be saved and passed between stages.
- Environment Variables: Allows you to define and use custom environment variables during the pipeline's execution.
Steps To Create A .gitlab-ci.yml File in GitLab
Step 1: Understand the Pipeline Stages
Before writing your .gitlab-ci.yml file, you should understand how stages work in GitLab pipelines. A pipeline consists of multiple stages, which are executed in a defined order. Each stage contains one or more jobs that will run concurrently. The most common stages include:
- Build: Compile the code or generate binaries.
- Test: Run automated tests to validate the code.
- Deploy: Deploy the application to a staging or production environment.
These stages form the backbone of a pipeline. You can add custom stages depending on your project’s requirements.
Step 2: Create a .gitlab-ci.yml File
To create the .gitlab-ci.yml file, follow these steps:
- Create a New File in the Root Directory: In your GitLab repository, create a new file named .gitlab-ci.yml. You can do this through the GitLab web interface or locally using a text editor.
- Define the Stages: Start by defining the stages that your pipeline will include. Here’s an example:stages: 
 - build
 - test
- deploy
Step 3: Define Jobs in Each Stage
Now that you've defined your stages, you can create jobs for each stage. A job is a script that GitLab Runner will execute. Each job should belong to a specific stage. For example, you can create a build job, a test job, and a deploy job.
Example .gitlab-ci.yml:
stages:
- build
- test
- deploy
# Job for the build stage
build_job:
stage: build
script:
- echo "Building the project..."
- make build
# Job for the test stage
test_job:
stage: test
script:
- echo "Running tests..."
- make test
# Job for the deploy stage
deploy_job:
stage: deploy
script:
- echo "Deploying to production..."
- ./deploy.sh
environment:
name: production
In this example:
- build_job: This job compiles the code and is part of the build stage.
- test_job: This job runs tests and is part of the test stage.
- deploy_job: This job deploys the code to production and is part of the deploy stage. The environment field specifies the deployment environment.
Step 4: Use Docker Images in Your Jobs
You can specify a Docker image for each job to define the environment in which it runs. This is useful when you need specific versions of tools or languages.
Example with Docker:
stages:
- build
- test
- deploy
# Build stage
build_job:
stage: build
image: node:14
script:
- npm install
- npm run build
# Test stage
test_job:
stage: test
image: python:3.9
script:
- pip install -r requirements.txt
- pytest
# Deploy stage
deploy_job:
stage: deploy
image: alpine:latest
script:
- ./deploy.sh
In this example:
- The build_job runs inside a Node.js 14 container, where it installs dependencies and builds the application.
- The test_job runs inside a Python 3.9 container, where it installs test dependencies and runs tests.
- The deploy_job uses an Alpine Linux container to run the deployment script.
Step 5: Add Conditions to Your Jobs
You can set conditions for when jobs should run, using keywords like only, except, and rules.
Example with only:
stages:
- build
- test
- deploy
build_job:
stage: build
script:
- make build
only:
- main
test_job:
stage: test
script:
- make test
only:
- merge_requests
deploy_job:
stage: deploy
script:
- ./deploy.sh
only:
- tags
- only: This keyword limits the job to run only for certain branches, merge requests, or tags. In this example:
- The build_job runs only on the main branch.
- The test_job runs only for merge requests.
- The deploy_job runs only when a Git tag is pushed.
Step 6: Configure Artifacts
Artifacts allow you to pass files between jobs and stages. For example, the build stage might produce binaries that are needed in the test or deploy stage.
Example with Artifacts:
stages:
- build
- test
- deploy
build_job:
stage: build
script:
- make build
artifacts:
paths:
- build/
test_job:
stage: test
script:
- make test
dependencies:
- build_job
In this example:
- artifacts: The build_job saves the build artifacts (e.g., compiled binaries) from the build/ directory.
- dependencies: The test_job depends on the artifacts from build_job to run the tests.
Step 7: Manage Environment Variables
You can define environment variables in your .gitlab-ci.yml file or through the GitLab UI. Environment variables can be useful for setting credentials, configuration options, or secrets.
Example with Environment Variables:
stages:
- build
- deploy
build_job:
stage: build
script:
- npm run build
variables:
NODE_ENV: production
deploy_job:
stage: deploy
script:
- ./deploy.sh
environment:
name: production
variables:
DEPLOY_KEY: $DEPLOY_KEY
In this example:
- variables: You define variables specific to a job (e.g., NODE_ENV in build_job).
- Secrets like DEPLOY_KEY are securely stored in GitLab’s CI/CD settings, and the variable is accessed in the deploy job using $DEPLOY_KEY.
Step 8: Execute Your Pipeline
Once you’ve created and committed the .gitlab-ci.yml file, GitLab will automatically trigger the pipeline whenever code is pushed to the repository.
- Commit and Push the File: Save the .gitlab-ci.yml file, commit it to your repository, and push it to GitLab:git add .gitlab-ci.yml 
 git commit -m "Add CI/CD pipeline"
git push origin main
- View Pipeline Execution: After pushing, you can view your pipeline’s status under the CI/CD > Pipelines section in your GitLab project. You’ll see the jobs executing in the order defined by your stages.
Best Practices for .gitlab-ci.yml Files
- Keep it DRY: Use anchors and reusable blocks to avoid repetition. This simplifies the maintenance of your .gitlab-ci.yml file.
- Use Cache: Use caching to store dependencies and speed up job execution times.
- Fail Fast: Ensure that failing jobs stop the pipeline early to save resources and time.
- Secure Your Variables: Store sensitive data like API keys or deployment credentials in GitLab’s CI/CD settings, rather than hardcoding them into the .gitlab-ci.yml file.
