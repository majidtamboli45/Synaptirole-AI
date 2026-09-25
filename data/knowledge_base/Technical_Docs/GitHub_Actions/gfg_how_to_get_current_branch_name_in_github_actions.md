# How to Get Current Branch name in GitHub Actions

> Source: https://www.geeksforgeeks.org/devops/get-current-branch-name-in-github-actions

GitHub Actions rightfully deserves credit for the way the workflow automation in the GitHub is being redefined. No matter it has been about continuous integration, deployment or the automation of any custom operation, GitHub Actions provide a framework that is advanced enough to make these tasks easier and quicker. An example of typical authorization pattern which is used in a workflow is retrieving the name of the current branch, which can be important for optionally assessing the execution flow or providing informative outputs. This article will take us through the steps of how to retrieve the current branch name in GitHub actions without extending a typical the work time.
Primary Terminologies
- GitHub Actions: GitHub's functionality of creating automation flows through the GitHub repository directly.
- Workflow: A YAML file with the automation process defined in the GitHub Actions illustration.
- Current Branch: The checkout branch, the repository has this time.
Accessing the Current Branch Name:
In order to get current branch name of GitHub and utilize it in GitHub Actions, the GitHub context of GitHub is a useful context for retrieving current branch name. The context contains the varying information for the event that acts as a trigger of the workflow, that gives the existing branch name.
Step-by-Step Process to Get Current Branch name in GitHub Actions
Step 1: Create Workflow File
- Navigate to your GitHub repository.
- Inside your repository, create a directory named .github/workflows/.
- Inside the .github/workflows/ directory, create a new file named retrieve-branch-name.yml.
Step 2: Define Workflow
Open the retrieve-branch-name.yml file for editing.
Define the workflow YAML with the following content:
name: Retrieve Branch Name
on:
push:
branches:
- '*'
jobs:
retrieve-branch:
runs-on: ubuntu-latest
steps:
- name: Checkout Repository
uses: actions/checkout@v2
- name: Display Branch Name
run: echo "Current Branch: ${{ github.ref }}"
This workflow triggers on any push event to any branch, checks out the repository, and then displays the current branch name in the GitHub Actions console.
Step 3: Commit and Push
- Save the changes to the retrieve-branch-name.yml file.
- Commit the changes with an appropriate commit message.
- Push the commit to your GitHub repository.
Step 4: Monitor Workflow Execution
- Navigate to the main page of your GitHub repository.
- Click on the "Actions" tab.
- You should see the workflow listed under the "All workflows" section.
- Click on the workflow to view its execution.
Step 5: View Workflow Details
- Click on the workflow run you want to view.
- You'll see the workflow's progress.
- Click on each step to view its activity and outputs.
Step 6: Verify Output
- In the workflow run details, navigate to the "Display Branch Name" step.
- You should see the output of the echo command, displaying the current branch name.
Conclusion
In conclusion, retrieving the current branch name in GitHub Actions is straightforward and can be immensely beneficial for various automation tasks within your repository workflows. By leveraging the GitHub context, you can access this information effortlessly and incorporate it into your automation processes effectively.
