# How to Run Python Script in GitHub Actions ?

> Source: https://www.geeksforgeeks.org/devops/run-python-script-in-github-actions

A tool available on GitHub that can help you automate chores in your software projects is called GitHub Actions. It enables you to design workflows that, when executed automatically, carry out actions like as deploying, testing, and even sending out notifications. It basically works like a small robot assistant that handles your monotonous tasks, saving you time and energy when managing your projects. This is a detailed guide on how to use GitHub actions to run Python scripts.
- Flexibility: GitHub Actions allows for adjustable workflow definition. Workflows can be adjusted to match the particular needs of your project by interacting with various resources and services.
- Integration: It interfaces with GitHub repositories with ease, allowing you to create workflows in reaction to a variety of events, including pushes, pull requests, and the creation of issues.
- Community Contributions: GitHub Actions offers a vast library of pre-built actions created by the community, so you do not have to start from scratch when adding everyday tasks to your workflows.
- Visibility: GitHub Actions gives you Runtransparency and a knowledge of the automated processes that comprise your project through making it easy for you to monitor the status of your workflows within your repository.
Step-By-Step to Runscript repository Python Script in GitHub Actions
Step 1: Create a Python script repository on GitHub.
Step 2: Here is the created repository named the Python script.
Step 3: Here is the a simple python script named as the python.py.
# Simple Python script to print "Hello, world!"
print("Hello, world!")
Step 4: Here is the sample ci/cd file on GitHub action to run the python script.
name: Python Script Workflow
on:
push:
branches:
- main
jobs:
run-python-script:
runs-on: ubuntu-latest
steps:
- name: Checkout code
uses: actions/checkout@v2
- name: Set up Python
uses: actions/setup-python@v5
with:
python-version: '3.10'
- name: Run Python script
run: python python.py
name: Python Script Workflow
The name of the workflow, "Python Script Workflow," is specified on this line. The GitHub Actions interface will show this name.
on:
push:
branches:
- main
The event that starts the workflow is specified by the on keyword. In this instance, the workflow is initiated upon each push event to the repository's main branch.
jobs:
run-python-script:
runs-on: ubuntu-latest
We define a job called "run-python-script" under the jobs key. The steps outlined in this assignment will be carried out. It states that the newest version of Ubuntu will be used for the job's execution.
    steps:
- name: Checkout code
uses: actions/checkout@v2
In order to make the repository's code available for next phases, this step verifies it. It makes use of a pre-made GitHub Action for checking out code called actions/checkout@v2.
      - name: Set up Python
uses: actions/setup-python@v5
with:
python-version: '3.10'
Using the actions/setup-python@v5 action, the Python environment is configured in this phase. Version 3.10 of Python is required to be utilized. Additional inputs can be passed to the action using the with keyword.
      - name: Run Python script
run: python python.py
This step finally executes the python.py Python script. To run a command inside the job's environment, use the run keyword. The Python script is executed in this instance using the python command.
Step 5: Click on Action then click on the cicd file named as the blank.yml.
Step 6: Click on the run python script you will find the console output of the ci/cd pipeline.
Step 7: Here is the console output of the ci/cd action file named as the blank.yml
Step 8: Click on the run python script we will find the detailed console output of the python script.
Deploying Applications
Deployment to Servers: Python applications can be pushed to distant servers via GitHub Actions via SSH or other remote access techniques.
- Strategies: Use SSH actions to connect to the server and copy application files using SCP or SFTP.
- Best Practices: Securely manage SSH keys and credentials using GitHub Secrets.
Deployment to Cloud Platforms: GitHub Actions may utilize platform-specific APIs or CLI to deploy Python apps to cloud computing systems such as AWS, Azure, Google Cloud, and more.
- Strategies: Utilize cloud provider-specific actions or CLI commands to deploy applications.
- Best Practices: Leverage cloud-native services like AWS Elastic Beanstalk, Azure App Service, or Google App Engine for managed deployments.
Deployment to Containers: Docker images for Python applications can be generated via GitHub Actions and then deployed to container orchestration platforms like Docker Swarm or Kubernetes.
- Strategies: Use Docker build and push actions to build Docker images and push them to container registries.
- Best Practices: Follow containerization best practices like minimizing image size, using multi-stage builds, and leveraging layer caching.
Conclusion
GitHub Actions offers flexibility, integration, and visibility to transform the way we automate tasks in software projects. Powerful automation capabilities can be unlocked by studying deployment options and following the detailed instructions for executing Python scripts in GitHub Actions. With the help of GitHub Actions, we can optimize our procedures and save time and effort when managing projects, regardless of whether they are being deployed to servers, cloud platforms, or containers. GitHub Actions is a crucial tool in contemporary software development which encourages efficiency and collaboration because to its extensive community contributions and transparent processes. You can obtain detailed instructions on how to launch a Python script using GitHub actions by following the aforementioned steps.
