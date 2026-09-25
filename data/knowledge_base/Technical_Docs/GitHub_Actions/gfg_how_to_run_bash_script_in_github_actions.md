# How to Run Bash Script in Github Actions ?

> Source: https://www.geeksforgeeks.org/devops/run-bash-script-in-github-actions

GitHub Actions are helpful resources for coding. They automate processes in your GitHub projects, save you time and effort. It is possible that GitHub Actions will automate the steps involved in testing, deploying, and alerting users of your code. Because you can configure them to run at specified times, like when you complete code to your repository or receive a new issue, they are quite helpful. In simple terms, GitHub Actions automate tedious tasks inside your GitHub projects to streamline your workflow.
Purpose of Bash Scripts
Bash scripts are required for the running of GitHub Actions processes because they enable a variety of job automation. They function as collections of Bash scripting commands that outline GitHub Actions' appropriate course of action.
You can modify actions with Bash scripts to meet your own requirements. To compile your code, execute tests, or launch your application, for instance, you can construct a Bash script. These scripts provide you the freedom to customize actions to your exact specifications, making it simple to automate intricate procedures.
Put it simply, Bash scripts enable you to design unique actions in GitHub Actions, which facilitates task automation and simplifies the development process.
Step by step to run Bash script in Github Actions
Step 1: Create the repository on GitHub
Step 2: Here is the Created repository named the bash-script for your reference refer to the below image.
Step 3: We need to create the action file under the work flows. Here we have created the blank.yml. The bash script is stored on bash.sh. For clear guidance refer the above image.
For better understanding here is the action file and bash script.
name: Bash Script
on:
workflow_dispatch:
jobs:
bash-script:
runs-on: ubuntu-latest
steps:
- name: Checkout code
uses: actions/checkout@v2
- name: Run Bash script
run: bash bash.sh
- name: Identifies the workflow by name. In this instance, it is "Bash Script," which is merely a label for identification and has no bearing on how it works.
- on: Specifies the time at which the workflow should start. The process is manually triggered via the workflow_dispatch event, which means that a user must start it.
- jobs: Includes one or more tasks that need to be completed as part of the workflow.
  - bash-script: Describes a work called "bash-script." The latest virtual machine environment for Ubuntu is being used for this job.
    - runs-on: outlines the kind of hardware that should be used for the project. It is an Ubuntu latest environment in this instance.
    - steps: includes a set of actions that must be taken in order to complete the task.
      - Checkout code: checkouts the repository's code using the actions/checkout@v2 action. This stage makes ensuring that the code is usable in the steps that follow.
      - Run Bash script: Carries out a Bash script called bash.sh that is found in the root directory of the repository. The script is executed using the run keyword. Here, it executes the name of the Bash script first, then the bash command.
- bash-script: Describes a work called "bash-script." The latest virtual machine environment for Ubuntu is being used for this job.
#!/bin/bash
# Print current directory
echo "Current directory: $(pwd)"
# List files in the current directory
echo "Files in current directory:"
ls
# Display the current date and time
echo "Current date and time: $(date)"
Shebang line: #!/bin/bash
- The term "shebang" refers to this line, which instructs the Bash shell (/bin/bash) to read the script. The script's interpreter needs to be specified.
Print current directory:
echo "Current directory: $(pwd)"
- The echo command is used to print text to the terminal.
- $(pwd) is a command substitution. It executes thepwd command, which stands for "print working directory", and substitutes the output (the current directory path) into the echo command.
- This line prints the current directory to the terminal.
List files in the current directory:
echo "Files in current directory:"
ls
- The echo command is used to print the text "Files in current directory:" to the terminal.
- The ls command lists the files in the current directory.
- This pair of commands prints a list of files in the current directory to the terminal.
Display current date and time:
echo "Current date and time: $(date)"
- The echo command is used to print text to the terminal.
- $(date) is another command substitution. It executes thedate command, which displays the current date and time, and substitutes the output into the echo command.
- This line prints the current date and time to the terminal.
Step 4: Click on actions of the repository. Here the cicd successfully completed in the github actions refer the below image then click om=n the bash script.
Step 5: For the console output of the repository click on the bash-script job you will find the clear console output of the cicd.
Step 6: The all jobs are successfully completed in the repository.
Step 7: Here refer the below image the script was successfully executed refer the below image.
Conclusion
Bash scripts allow for more freedom and customisation, whereas GitHub Actions automates operations to streamline project workflows. We demonstrated how to use Bash scripts in GitHub Actions with a step-by-step tutorial. Developers can improve software quality and efficiency by focusing on core development tasks, ensuring consistency, and increasing productivity by integrating these techniques.
