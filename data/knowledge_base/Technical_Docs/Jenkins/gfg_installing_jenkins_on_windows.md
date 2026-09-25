# Installing Jenkins on Windows

> Source: https://www.geeksforgeeks.org/devops/installing-jenkins-on-windows/

Jenkins is primarily used for continuous integration and continuous delivery on a platform. It is a Java application that has multiple plugins for automating all components at an infrastructure level. These plugins are responsible for all the different functionalities of Jenkins.
Here are the steps to install Jenkins on your Windows operating system
Steps for Installing Jenkins on Windows
Step 1. Download the Jenkins WAR File.
Click on the Jenkins download for Windows.
Step 2. Start Jenkins Using the WAR File.
Once you have downloaded the jenkins.war file, the next step is to execute it and start Jenkins. Place the jenkins.war file in a folder on your local machine.
Open the terminal or command prompt and navigate to the folder where the jenkins.war file is located.
Run the following command:
java -jar jenkins.war
Jenkins will initialize and start up, printing logs to the console. Here are the one time password will be generate to login the System which is :
Step 3. Access Jenkins on Your Browser.
Open your web browser and navigate to the following URL:
http://localhost:8080
By default, Jenkins runs on port 8080. If port 8080 is unavailable, Jenkins will automatically suggest an alternate port in the terminal output.
Step 4. Unlock Jenkins.
During the setup, Jenkins will generate a one-time admin password. Retrieve the password from the console logs or the initialAdminPassword file located in:
C:\Users\<YourUsername>\.jenkins\secrets
Enter the password on the Jenkins unlock page to proceed.
Step 5. Install Suggested Plugins.
Jenkins will now prompt you to install plugins. Plugins in Jenkins provide extended functionality, allowing you to integrate with various tools and platforms.
Choose Install Suggested Plugins for a quick setup. This will install commonly used plugins like Git, Pipeline, and Email Notification.
Step 6. Create an Admin User
Set up an admin user with a username, password, and email.
This user will be used for future logins.
Step 7. Complete Installation
After setting up your admin user, Jenkins will finalize the installation and redirect you to the Jenkins dashboard.
Here are we successfully installed Jenkins on your Windows machine. You are now ready to start creating and automating your continuous integration (CI) and continuous delivery (CD) pipelines.
