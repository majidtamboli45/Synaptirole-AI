# Setting AWS Credentials in GitHub Actions

> Source: https://www.geeksforgeeks.org/devops/setting-aws-credentials-in-github-actions

Putting your AWS credentials in GitHub Actions is essential to enabling safe and effective interactions between your workflows and AWS services. Your processes can authenticate and send API queries to AWS services like S3, EC2, or Lambda by giving the required access credentials. This makes sure that your AWS resources and GitHub repositories integrate seamlessly, giving you the ability to automate testing, deployment, and other tasks right from your CI/CD pipelines. We will go over how to safely configure your AWS credentials in GitHub Actions so you can use all of AWS's capabilities in your automated processes. GitHub has a robust automation tool called GitHub Actions that allows you to automate processes from inside your repository. It facilitates process optimization by automating code-building, code testing, and code deployment. With the help of GitHub Actions, you can design complex CI/CD pipelines and automate difficult procedures inside the well-known GitHub environment. To learn more about configuring the credentials on Git Hub actions, follow the steps mentioned below.
Step-By-Step To Configure AWS Credentials In GitHub Actions
Step 1: Create the GitHub repository
Step 2: Click on the repository settings, then click on the secrets and variables section, then click on actions, then click on the new repository secret as shown in the image below.
Step 3: Here we are configuring the AWS_ACCESS_KEY_ID in the secrets section for your reference refer the below image. Here I have configured the sample secret. For more information regarding to get the secret credentials about in AWS refer this link.
Step 4: Here is the secrets is configured on Git hub plaese refer the below screenshot.
Step 5: This is the git hub action file to call the secrets into the action file refer the below CI/CD file.
name: AWS Deployment
on:
push:
branches:
- main
jobs:
deploy:
runs-on: ubuntu-latest
steps:
- name: Checkout code
uses: actions/checkout@v2
- name: Deploy to AWS
run: |
aws configure set aws_access_key_id ${{ secrets.AWS_ACCESS_KEY_ID }}
aws configure set aws_secret_access_key ${{ secrets.AWS_SECRET_ACCESS_KEY }}
aws s3 cp ./dist s3://example-bucket --recursive
This GitHub Actions workflow file is named "AWS Deployment" and is triggered on pushes to the main branch. It runs on an Ubuntu latest environment. The job "deploy" consists of two steps:
- "Checkout code": Uses the GitHub Actions official action to checkout the repository's code.
- "Deploy to AWS": Executes a series of AWS CLI commands to configure AWS credentials using secrets, and then copies the contents of the "./dist" directory to an S3 bucket named "example-bucket" recursively.
This workflow automates the deployment of the code to an AWS S3 bucket whenever changes are pushed to the main branch.
In the provided GitHub Actions workflow file for AWS Deployment, AWS secrets are utilized for configuring AWS access credentials securely. The secrets used are:
- AWS_ACCESS_KEY_ID : This secret stores the AWS access key ID.
- AWS_SECRET_ACCESS_KEY : This secret stores the AWS secret access key.
These secrets are accessed using the ${{ secrets.NAME }} syntax, ensuring that sensitive information is not exposed in the workflow file itself. Instead, these secrets are stored securely in the GitHub repository settings and are only accessible to authorized users with appropriate permissions. This approach helps maintain the security of AWS credentials while enabling automated deployment processes.
Step 6: Here is the console output of the GitHub action CI/CD.
Conclusion
It is essential that you securely configure your AWS credentials in GitHub Actions to allow smooth communication between your workflows and AWS services. You can make sure that your automation processes are prepared to deploy, test, and manage AWS resources effectively and securely by following the above step-by-step guide. By utilizing GitHub Secrets to securely configure your AWS credentials, you can fully utilize their capabilities in your CI/CD pipelines while protecting the confidentiality and integrity of your important credentials.
