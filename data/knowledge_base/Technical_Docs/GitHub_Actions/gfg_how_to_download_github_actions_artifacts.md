# How to Download GitHub Actions Artifacts

> Source: https://www.geeksforgeeks.org/devops/download-github-actions-artifacts

Whenever a workflow is executed, GitHub Actions provide artifacts that include useful outputs like build logs and results. Both automated and manual ways to download artifacts are addressed in this guide. Become familiar with the GitHub CLI and API to find artifacts quickly. Effective artifact management is ensured by best practices and security considerations. Downloading master artifacts from GitHub repositories helps speed up workflow analysis and collaboration.
What are Artifacts?
GitHub Artifacts Digital packages called actions hold data or files produced by workflow runs, such as test results or developed code. They are produced automatically and are useful to share results, deploying apps, and troubleshooting workflow processes. These artifacts are snapshots of the status of the project at specific points in time, which makes it simpler for developers to work together and evaluate workflows.
How to Use Artifacts with GitHub Actions
Data generated during workflow runs can be permanently stored using artifacts and GitHub Actions, simplifying tasks like building output sharing and data spread between processes. Here is an overview of how to use artifacts:
- Define Artifacts: Use the upload-artifact action in your workflow YAML file to list the folders or files that you wish to maintain as artifacts.
- Upload Artifacts: Use your workflow's upload-artifact action to add the specified files or directories as artifacts. For the entire duration of the workflow run, these artifacts are kept on file.
- Download Artifacts: For the purpose of retrieving artifacts for use in upcoming tasks or workflow runs, use the download-artifact action. This enables you to retrieve and use the data that was saved for additional processing or inquiry.
Step by step to Download GitHub Actions Artifacts
Step 1: Create the repository
Step 2: Here is the sample repository of maven-web-application for your reference refer to the image.
Step 2: Create the workflow file under the workflows as shown image below. Here is the sample workflow file to build and download the artifact.
Complete code for the workflow file.
name: Java CI with Maven
on:
workflow_dispatch:
#push:
# branches: [ master ]
#pull_request:
# branches: [ master ]
jobs:
build:
runs-on: ubuntu-latest
steps:
- uses: actions/checkout@v2
- name: Set up JDK 21
uses: actions/setup-java@v4
with:
java-version: '11'
distribution: 'adopt'
cache: maven
- name: Build with Maven
run: mvn -B package --file pom.xml
- name: Archive Artifact
uses: actions/upload-artifact@v2
with:
name: maven-web-application
path: /home/runner/work/maven-web-application/maven-web-application/target/maven-web-application.war
deploy:
runs-on: ubuntu-latest
needs: build
steps:
- name: Download Artifact
uses: actions/download-artifact@v2
with:
name: maven-web-application
path: /opt
- name: List Artifacts
run: ls /opt
Her is the detail explanation of the provided code.
This sets the GitHub Actions workflow's name.
name: Java CI with Maven
This defines the event that initiates the workflow. In this particular case, the "Run workflow" button on the GitHub Actions page serves to manually start the workflow.
on:
workflow_dispatch:
Describes a build assignment that runs in an Ubuntu environment.
jobs:
build:
runs-on: ubuntu-latest
Verifies the code in the repository inside the task. The version of the action being utilized is denoted by the @v2.
    steps:
- uses: actions/checkout@v2
Using the actions/setup-java action, the JDK (Java Development Kit) version 11 has been set up for the assignment. The version of the action is denoted by the v4. It advises to cache Maven dependencies and use AdoptOpenJDK as the distribution.
    - name: Set up JDK 21
uses: actions/setup-java@v4
with:
java-version: '11'
distribution: 'adopt'
cache: maven
Utilizes Maven for constructing the Java project. Package is a Maven goal that packages the code into a distributable format and compiles it; the -B flag runs Maven in batch mode. The Maven project file's location is provided using the --file pom.xml argument.
    - name: Build with Maven
run: mvn -B package --file pom.xml
Uploads a thing generated during a Maven build. The path provides the location of the artifact file to be uploaded, and the name provides the name of the artifact.
    - name: Archive Artifact
uses: actions/upload-artifact@v2
with:
name: maven-web-application
path: /home/runner/work/maven-web-application/maven-web-application/target/maven-web-application.war
Defines a second assignment, called deploy, that depends on the build job's successful completion and runs in an Ubuntu environment.
  deploy:
runs-on: ubuntu-latest
needs: build
Obtains the artifact that was submitted during the build job. The route provides the place to download the artifact to, and the name provides the name of the artifact to download.
    steps:
- name: Download Artifact
uses: actions/download-artifact@v2
with:
name: maven-web-application
path: /opt
Lists the contents of the downloaded artifact's directory in order to verify that it exists.
      - name: List Artifacts
run: ls /opt
Step 3: Click on the actions tab and here is the pipeline for build and deploy that will build and generate rate the artifact.
Step 4: Here is the build process executed successfully on the GitHub actions.
Step 5: Here is the deploy process executed successfully. That is uploaded on the /opt directory on next step you will find the artifact upload image and you can download the artifact from the GitHub actions.
Step 6: Here is the artifact and you can download by clicking the download symbol.
Uploading Artifacts
You must first identify what you want to publish—such as compiled code or test results—by naming and pathing the artifacts in your process file before you can use GitHub Actions to upload them. Once you have the path and name of the artifact you wish to upload, you use the upload-artifact action. This operation creates an artifact from the provided files or directories and uploads it to GitHub, where it can be shared or used later in your workflow.
Conclusion
GitHub Actions artifacts are useful storage units for files or data produced by process runs, which facilitates cooperation, problem-solving, and project management. Developers may optimize their CI/CD workflows and effectively manage workflow outputs by learning how to upload and retrieve artifacts. Efficient asset retrieval is ensured by utilizing tools such as the GitHub CLI and API, and effective artifact management is ensured by following best practices and security considerations. By becoming proficient in artifact downloading, developers may maximize workflow analysis and teamwork within GitHub repositories, which in turn improves project success and efficiency.
