# How to Configure and Integrate Maven in Jenkins?

> Source: https://www.geeksforgeeks.org/devops/configure-and-integrate-maven-in-jenkins

Maven integration with Jenkins makes Java project development and deployment easier. Step-by-step instructions for integrating Maven with Jenkins are provided in this guide. You will discover how to set up Jenkins for Maven, manage project dependencies, automate builds, and enhance software delivery pipelines.
What Is Maven?
Maven is a powerful project management tool that is based on POM (project object model). It is used for project build, dependency, and documentation. It simplifies the build process like ANT. But it is too much more advanced than ANT. In short terms we can tell maven is a tool that can be used for building and managing any Java-based project. maven makes the day-to-day work of Java developers easier and generally helps with the comprehension of any Java-based project.
Different Types Of Ways to Configure Maven in Jenkins
- Using Jenkins Plugin
- Using Jenkins CLI
Configuring Maven Using Jenkins Plugin
Follow the steps mentioned below to configure Maven using Jenkins UI.
Step 1: Click on the "Manage Jenkins" option in the navigation menu, sidebar, or user dropdown, click on it. This will take you to the Jenkins configuration management page where you can access various settings and options for managing your Jenkins server.
Step 2: After clicking on "Manage Jenkins" in the Jenkins dashboard, you'll find a section or category called "Tools" within the management options.
Step 3: Here we are choosing the version maven3.9.6 you can configure according to your requiurment.
- Maven installations: This is the title at the top of the section, indicating you're adding a new Maven installation.
- Add Maven: This button initiates the process of adding a new Maven installation.
- Name: This field allows you to specify a name for this particular Maven installation. It helps distinguish between different Maven versions you might manage within Jenkins. The example shows maven3.9.6 as the name.
- Install automatically? This checkbox determines how Jenkins retrieves Maven. If checked (as in the image), Jenkins will automatically download and install the chosen Maven version during configuration.
- Install from Apache: This radio button selection (pre-selected in the image) instructs Jenkins to download the Maven installer from the official Apache Maven repository.
- Version: This dropdown menu allows you to choose the specific Maven version you want to install. The current selection is 3.9.6.
- Add Installer: If you select to install from a custom location rather than the default Apache repository, this button would allow you to upload a custom Maven installer.
- Save: Clicking this button saves the configuration and installs Maven if the "Install automatically" checkbox is selected.
- Apply: Clicking this button applies the configuration changes without saving them permanently.
Configuring Maven Using Jenkins CLI
Follow the steps mentioned below to configure maven in jenkins using jenkins CLI
Step 1: Using the below command, first verify whether the maven is installed or not.
mvn -v
- mvn: This is the executable for the Maven command-line tool.
- -v: This is a flag that tells mvn to display the version information.
In my instance, the error "command not found" indicates that Maven is not installed, as you can see in the image. Rewrite the sentence
Step 2: To install Maven within your Jenkins environment, use this command:
sudo apt install maven
- sudo: stands for "superuser do" and is used to execute commands with administrative privileges. Since installing software often requires modifying system files, sudo is necessary to grant those permissions.
- apt: is the package manager used by Debian-based systems. It manages the installation, removal, and updating of software packages. Think of it like a central app store for your system.
- install: is a command within the apt package manager that instructs it to install a specific software package.
- maven: is the name of the software package you want to install. In this case, it's "maven," which refers to the Apache Maven software, a popular build automation tool used for managing project lifecycles in software development.
Step 2: Once you've run the sudo apt install maven command, let's verify if the installation was successful.
mvn -v
The image confirms successful Maven 3.8.7 installation using sudo apt install maven.
