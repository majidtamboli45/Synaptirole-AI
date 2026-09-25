# How To Set Up Continuous Integration With Git and Jenkins?

> Source: https://www.geeksforgeeks.org/git/how-to-set-up-continuous-integration-with-git-and-jenkins/

Continuous Integration (CI) is a practice where developers integrate their code into a shared repository frequently, ideally several times a day. Each integration can then be verified by an automated build and automated tests. This practice helps to detect errors quickly and improve software quality. Jenkins is one of the most popular tools for implementing CI. This article will guide you through the process of setting up CI using Git and Jenkins.
Prerequisites:
The Steps to Set Up Continuous Integration are as:
Table of Content
Install Jenkins
Step 1: Download Jenkins
Navigate to Jenkins' official website and download the installer suitable for your operating system.
Step 2: Install Jenkins
Follow the installation instructions for your specific OS. For example, on Windows, run the installer, and on Ubuntu, use the following commands
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.origin.jenkins.io/debian-stable/ binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
Step 3: Start Jenkins
After installation, start Jenkins by running
sudo systemctl start jenkins
To enable Jenkins to start at boot
sudo systemctl enable jenkins
Step 4: Access Jenkins
- Open your web browser and navigate to http://localhost:8080 .
- You will be prompted to unlock Jenkins using a password stored in the /var/lib/jenkins/secrets/initialAdminPassword file. Open this file to get the password.
Configure Jenkins
Step 1: Install Suggested Plugins
After unlocking Jenkins, you will be asked to install plugins. Choose "Install suggested plugins".
Step 2: Create an Admin User
Set up the first admin user with the necessary credentials.
Step 3: Configure Global Tools
Navigate to Manage Jenkins > Global Tool Configuration to configure JDK, Git, and other tools Jenkins will use.
Set Up Your Git Repository
Step 1: Create a Repository
Create a new repository on GitHub or your preferred Git hosting service.
Step 2: Clone the Repository
Clone the repository to your local machine and add your project files.
Step 3: Push the Initial Code
Push your initial code to the repository. For example
git clone https://github.com/your-username/your-repo
cd your-repo
echo "# Your Project" > README.md
git add README.md
git commit -m "Initial commit"
git push origin main
Create a Jenkins Job
Step 1: Create a New Job
- In Jenkins, navigate to New Item .
- Enter a name for your job, select Freestyle project , and clickOK .
Step 2: Configure Source Code Management
- In the job configuration, under Source Code Management , selectGit .
- Enter your repository URL and credentials if needed.
Step 3: Build Triggers
Under Build Triggers, check GitHub hook trigger for GITScm polling or Poll SCM with a schedule (e.g., H/5 * * * * for every 5 minutes).
Step 4: Build Steps
Under Build, add a build step. For a simple project, you can add an Execute shell step with commands to build and test your code. For example:
echo "Building the project"
./gradlew build
Step 5: Save and Build
Save the job configuration and click Build Now to run the job manually.
Set Up GitHub Webhook (Optional)
Create Webhook:
- In your GitHub repository, navigate to Settings >Webhooks >Add webhook .
- Enter your Jenkins URL followed by /github-webhook/ (e.g.,http://your-jenkins-url/github-webhook/ ).
- Choose application/json as the content type and select the events you want to trigger the build on, typicallyPush events.
Conclusion
You've now set up a basic Continuous Integration pipeline using Git and Jenkins. Every time you push changes to your Git repository, Jenkins will automatically build and test your code. This setup helps catch issues early and ensures your codebase remains in a healthy state.
To expand your CI pipeline, consider adding more stages such as deployment, integrating code quality tools, and enhancing test coverage. Jenkins' robust plugin ecosystem provides a plethora of options to tailor your CI process to your specific needs.
