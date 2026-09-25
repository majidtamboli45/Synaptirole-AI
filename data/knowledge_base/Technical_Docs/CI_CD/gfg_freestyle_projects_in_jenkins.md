# Freestyle Projects In Jenkins

> Source: https://www.geeksforgeeks.org/devops/creating-and-configuring-freestyle-projects-in-jenkins

In Jenkins freestyle project is a basic and simple way to create and build jobs of any type of application. For this project, there is no need for any scripting language or no need of coding skills. By using the console itself self you can do all the configurations needed for the project, which will save lots of time and effort for the employees.
Here are the steps to create a freestyle project in Jenkins.
Step 1: Access Jenkins and Log In
Open your browser and access the Jenkins URL (e.g., http://localhost:8080). Log in with your Jenkins credentials (username and password) that you set up during the installation process
Step 2: Create a New Freestyle Project
On the Jenkins dashboard, click on "New Item" to create a new project.
- In the pop-up window, enter the name of your project.
- Select "Freestyle project" from the options.
- Click OK to proceed.
Step 3: Configure the Project
After selecting Freestyle project, a configuration page will open where you can define all the settings for your project. Here, you will specify the source code repository, build tools, and other necessary configurations.
Provide details such as:
- Source Code Management: The repository URL where Jenkins will fetch the source code.
- Build Triggers: Specify when Jenkins should automatically trigger the build.
- Build Environment: Define the environment required to build and deploy the application.
Step 4: Configure the GitHub Repository
In this step, you will configure Jenkins to pull the source code from your GitHub repository.
- In the Source Code Management section, select Git.
- Paste your GitHub repository URL in the Repository URL field.
- Click on the Add Credentials link next to the Credentials field to link your GitHub account.
Step 5: Add Credentials for GitHub
- Click the +Add button to open the credentials pop-up.
- In the pop-up window, select "Username with password" for the Kind field.
- Enter your GitHub username and the SSH key in the respective fields. To get the SSH key, go to your GitHub account, generate an SSH key, and use that in the password field.
- Click OK to save your credentials.
Step 6: Select Git Branch
In the Branches to build section, specify the branch you want Jenkins to clone.
Step 7: Configure Maven Build
You need to configure the Maven build step.
- Scroll to the Build section and select "Invoke top-level Maven targets".
- Under Maven Version, select the version of Maven you have configured in Jenkins (e.g., Maven 3.8.6 ).
- In the Goals field, enter the Maven command to build your project:
clean package
Note: Do not include mvn here; Jenkins will automatically run Maven for you.
Step 8: Save the Configuration
After configuring all the necessary details, click on the Save button. You will be redirected to the build page of your project. On this page, click on the Build Now option to trigger the build.
Step 9: Monitor the Build
Once the build starts, Jenkins will execute the build process.
- Click on the Job that is currently running. This will open the Console Output where you can monitor the status of the build.
- In the Console Output, you will see logs related to the build process, including whether the build was successful or failed.
Step 10: Review the Build Status
- Scroll down in the Console Output to check the status of the build.
- If the build is successful, you will see a message indicating that the job has succeeded.
- If there are any issues or errors, the console will display detailed logs, allowing you to debug and fix the problems accordingly.
We created and configured a Freestyle project in Jenkins, connected it to your GitHub repository, and set up Maven for building your project.
