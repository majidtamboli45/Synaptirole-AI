# How to Trigger GitHub Action via API ?

> Source: https://www.geeksforgeeks.org/devops/trigger-github-action-via-api

GitHub Actions are like little assistants that help you automate tasks in your GitHub repositories. Imagine you have a bunch of repetitive tasks like testing your code, deploying it, or even sending notifications. Instead of doing these tasks manually every time, GitHub Actions can do them for you automatically.
They are quite useful because you can program them to execute on specific occasions, such as when you push code to your repository or get a new issue. This allows you to devote more of your attention to creating code and less to tedious tasks! To put it briefly, GitHub Actions saves you time and effort by automating tasks in your GitHub projects.
Manual Triggering of GitHub Actions
- You can manually start businesses when using GitHub directly from the GitHub website. It works similarly to hitting a button.
- Just start by accessing your GitHub repository. The "Actions" tab will then appear at the top. Press that arrow.
- You may view a list of the workflows you have configured under the Actions page. Select the one you wish to manually activate.
- There is a "Run workflow" button next to the workflow name. Press that button.
- GitHub will ask you to confirm that you want to run the workflow. Just click "Run workflow" again, and voila! Your workflow will start running, doing whatever tasks you've set it up to do.
- Therefore, using GitHub to manually trigger actions only requires selecting the appropriate process and pressing a button. Simple as pie!
Step by Step to Trigger GitHub Action via API
Here are the detailed steps to trigger GitHub action via API.
Step 1: Create a GitHub repository
Step 2: Here the GitHub repository named the API-trigger.
Step 3: Here is the curl command to trigger the github action using the below command. Here I have hided the sensitive information.
curl --request POST \
--url 'https://api.github.com/repos/OWNER/REPO_NAME/dispatches' \
--header 'authorization: Bearer YOUR_PERSONAL_ACCESS_TOKEN' \
--data '{"event_type": "YOUR_CUSTOM_EVENT_NAME"}'
- OWNER : Change this to the username or name of the repository's owner.
- REPO_NAME : Put the name of your repository here instead.
- YOUR_PERSONAL_ACCESS_TOKEN : Change this to your unique access token, which was produced by your GitHub account settings. Verify that it has the authorization needed to start workflows.
- YOUR_CUSTOM_EVENT_NAME : Change this to the name of the custom event you wish to use to start the GitHub Actions workflow.
Step 4: Here is the triggered github ci/cd using API for your reference refer the below image.
name: Store Cache
on:
repository_dispatch:
schedule:
- cron: '5 12 * * 0'
jobs:
delete-cache:
runs-on: ubuntu-latest
steps:
- name: Checkout code
uses: actions/checkout@v2
- Name: The process is called "Store Cache." This label serves only as a means of identifying the process; it has no bearing on how it operates.
- on: The timing of the workflow's trigger is specified in this section. In this instance, two things happen that set off the workflow:
  - repository_dispatch : By using the GitHub API, this event makes it possible to manually start the workflow. When a repository dispatch event is sent, it gets started.
  - schedule : This event starts the workflow according to a cron syntax schedule. The workflow in this example is set to execute on Sundays at 12:05 PM UTC (5 12 * * 0).
- jobs: The tasks that the workflow should complete are outlined in this section. One job in this workflow, called "delete-cache," is running on the most recent Ubuntu version.
- Steps: The discrete activities that comprise a job are called steps. Every step carries out a particular task. The following is what the "delete-cache" job's steps accomplish:
  - Checkout code: This step checks out your repository's code so that it's available for subsequent steps to use. It uses the actions/checkout@v2 action, which is a pre-built action provided by GitHub for checking out code from a repository.
- Checkout code: This step checks out your repository's code so that it's available for subsequent steps to use. It uses the 
Step 5: The pipeline is completed end to end on the github action. For your reference refer the below image.
Conclusion
Developers can save a great deal of time and effort by automating processes inside GitHub projects with the help of GitHub Actions. GitHub Actions automates operations based on preset events, streamlining workflows for things like managing alerts, testing code, and app deployment. While triggering using an API enables flexibility and control for integrating actions into bespoke workflows, manual triggering through the GitHub website offers a straightforward approach to start actions with a single click. Developers can leverage the power of GitHub Actions to increase productivity and concentrate more on creating code by following the above step-by-step tutorial. Using GitHub Actions to automate tasks eventually enables teams to produce excellent software quickly and effectively."
