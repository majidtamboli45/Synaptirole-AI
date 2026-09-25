# How To List All The Jenkins Plugins Configured In CLI ?

> Source: https://www.geeksforgeeks.org/devops/how-to-list-all-the-jenkins-plugins-configured-in-cli/

Jenkins is an open-source automation server that plays an important role in Continuous Integration and Continuous Deployment (CI/CD) in the software development life cycle (SDLC). Jenkins plugins are the extensions that will enhance the functionalities of Jenkins like source code management, building, testing, artifact management, notifications, monitoring, security, logging, scripting, automation, cloud integration, and many more.
What is Command-Line-Interface (CLI)?
A Command Line Interface (CLI) is a text-based interface that allows users to interact with a computer or software with the help of commands and scripts in a specific syntax. When a user types instructions into a terminal or console in a CLI, the system outputs text in response. Typically, the user enters precise commands and parameters, and the system carries out the required action while text-based feedback or results are provided.
Understanding the Dynamics and Impact of Installed Plugins
- Functionality: Jenkins plugins extend its core functionality, allowing users to customize and enhance their Jenkins instance according to their specific needs. Knowing which plugins are installed enables users to understand the capabilities available to them and effectively utilize them to optimize their Jenkins workflows.
- Security: Plugins can introduce security vulnerabilities if they are outdated or have known security issues. By keeping track of installed plugins, users can ensure they are promptly updated to the latest secure versions, minimizing the risk of security breaches.
- Compatibility: Plugins may have dependencies on other plugins or specific versions of Jenkins. Knowing which plugins are installed helps users maintain compatibility between different components of their Jenkins environment, preventing conflicts and ensuring smooth operation.
- Troubleshooting: When issues arise within Jenkins, knowing the installed plugins can help in diagnosing the problem. Users can identify whether a malfunction is caused by a specific plugin, facilitating targeted troubleshooting and resolution.
- Performance: Some plugins may have a significant impact on Jenkins's performance. By monitoring installed plugins, users can identify resource-intensive plugins and optimize their usage to improve overall system performance.
To More Continuous Integration and Continuous Deployment (CI/CD).
Limitations Of Direct CLI Commands
- It only provides basic information about installed plugins, and their names or versions, but it lacks of details on metadata, dependencies, or compatibility information.
- Typically do not offer dependency resolution capabilities. The user needs to manually track and install required dependencies for plugins.
- Browsing available plugins and configuration will be difficult due to nongraphical user interface (GUI) interactions.
- If there are any issues related to plugins, CLI commands may not offer comprehensive error messages or logging capabilities, making troubleshooting more challenging compared to Jenkins Web.
- Users should be familiar with command-line syntax in order to use CLI more efficiently.
Step-By-Step Process To List All Jenkins Plugins Configured In CLI
Step 1: Access the Jenkins server and download the Jenkins-cli.jar file.
- To access Jenkins CLI, first, we need to download the Jenkins-cli.jar file.
- Open the terminal or command prompt and login to the Jenkins server.
- Use this below command to download jenkins-cli.jar
sudo wget http://your.jenkins.url/ jnlpJars/jenkins-cli.jar
Step 2 : Access Jenkins dashboard and get API token.
- Login to the Jenkins web interface.
- Go to configure under user profile (right end side).
- Scroll down to the "API Token" section and generate a new token.
Step 3 : Authentication with API token.
- Go to Jenkins instillation path. i.e. /var/lib/jenkins
- Use this below command for authentication.
java -jar jenkins-cli.jar -s http://your.jenkins.url/ -auth username:API_token
Step 4 : List all Jenkins plugins using the below command.
java -jar jenkins-cli.jar -s http://your.jenkins.url/ -auth username:API_token list-plugins
