# Basic CI Workflow For Android using GitHub Actions

> Source: https://www.geeksforgeeks.org/android/basic-ci-workflow-for-android-using-github-actions

Continuous integration (CI) is a software development process in which the team members can integrate their work. For Android developers, setting up a CI pipeline can greatly enhance productivity and code quality. GitHub Actions, a powerful automation tool integrated into GitHub, provides an excellent platform for creating a CI workflow for Android projects. This article will guide you through the process of setting up a basic CI workflow for Android using GitHub Actions.
Prerequisites
Before we begin, make sure you have the following:
- A GitHub account
- An Android project hosted on GitHub
- Basic knowledge of GitHub and Android development
Steps to Implement
Step 1: Make a repository on Github and push any Android project into it. Since GitHub Actions checks for the CI workflows stored in a specific directory i.e. .github/workflows, we will create this directory in our GitHub repository. Once done with the above steps, click on Code -> Add a file -> Create new file.
Step 2: CI scripts are written in a file called yaml (Yet Another Markup Language), having file extension .yml. So we'll create a new directory as shown in the above step and add a .yml file to it. Name this file as test.yml. The path of the file will be now, .github/workflows/test.yml.
Step 3: Now the main part of writing a script for the CI workflow comes in. Paste the code below into the file created in the previous step i.e. test.yml.
name: Android CI
on:
 push:
   branches: [master]
 pull_request:
   branches: [master]
jobs:
 build:
   runs-on: ubuntu-latest
   steps:
     - name: Checkout
       uses: actions/checkout@v2.4.0
     - name: Setup JDK
       uses: actions/setup-java@v2.5.0
       with:
         distribution: 'temurin'
         java-version: '11'
     - name: Set execution flag for gradlew
       run: chmod +x gradlew
     - name: Build with Gradle
       run: ./gradlew build
Step 4: Scroll to the bottom. In the Commit New File section, give a Title and Description to the commit. Click on commit new file.
Step 5: Now head to the Actions tab and you will see the workflow that you just created running there.
Step 6: You can click on the Title of the workflow and see the detailed build. It will take a couple of minutes to run and after that, a green check stating that the run has succeeded will be shown.
