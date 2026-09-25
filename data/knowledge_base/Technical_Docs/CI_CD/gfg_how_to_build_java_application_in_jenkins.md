# How To Build Java Application In Jenkins ?

> Source: https://www.geeksforgeeks.org/devops/how-to-build-java-application-in-jenkins

In the software development lifecycle, building and testing applications are basic steps toward ensure code quality and dependability. Jenkins, an open-source automation server, plays a vital role in automating these cycles, especially for Java applications. Java, being one of the most generally utilized programming languages, benefits extraordinarily from Jenkins' capacities in automating builds, tests, and deployments.
Automating the build cycle of Java applications in Jenkins streamlines out the development work process, allowing developers to zero in a larger number of on composing code as opposed to manually taking care of build tasks. By setting up Jenkins responsibilities to construct Java projects, developers can accomplish continuous integration, where changes are routinely integrated into the fundamental codebase and confirmed through automated tests.
This article will dig into the most common way of building Java applications in Jenkins, covering the setup of Jenkins jobs, setup of configuration steps, and monitoring of build results. We'll explore the fundamental stages, terminologies, and best practices associated with utilizing Jenkins for Java application development. Through step by step guidelines, examples, and FAQs, developers will acquire a complete comprehension of how to use Jenkins for building Java applications really.
Primary Terminologies
- Jenkins: Jenkins is an open-source automation server that works with continuous integration and continuous delivery (CI/CD) pipelines. It allows developers to automate different phases of the software development lifecycle, including building, testing, and deploying applications. Continuous Integration and Continuous Delivery (CI/CD) are often cited as pillars of successful DevOps Implementation. To establish and optimize the CI/CD model and reap the benefits, companies need to build an effective pipeline to automate their build, integration, and testing processes. At a high level, the pipeline includes compiling, packaging, and running tests
- Jenkins Job: Build jobs are at the heart of the Jenkins build process. A Jenkins job is an undertaking or series of tasks designed inside Jenkins to automate explicit activities. Jobs can be configured to perform different activities, building code, running tests, conveying applications, and sending notifications. Simply put, you can think of a Jenkins build job as a particular task or step in your build process. This may involve simply compiling your source code and running your unit tests. Or you might want a build job to do other related tasks, such as measuring code coverage or code quality metrics, generating technical documentation, or even deploying your application to a web server.
- Build: With regards to software development, a build refers to the most common way of compiling source code, running tests, and packaging the application into a deployable artifact, for example, a Container file WAR record or JAR file. Build parameters can be used to store configuration options or data. Build parameters allow the users to dynamically provide these configuration options or data while performing the build.
- Maven: Maven is a famous build automation tool essentially utilized for Java projects. It manages project conditions, compiles source code, runs tests, and packages applications into distributable configurations. Maven depends on a declarative XML-based configuration file called pom.xml. A Project Object Model or POM is the fundamental unit of work in Maven. It is an XML file that contains information about the project and configuration details used by Maven to build the project.
- Gradle: Gradle is another build automation tool for Java projects, like Maven however with a more adaptable and adjustable form script design. Gradle fabricate scripts are written in Groovy or Kotlin and give strong capacities for building, testing, and deploying applications.
Step-By-Step Process to build Java application in Jenkins?
Step 1: Launch an Instance
Launch EC2 Instances with specifications AMI Amazon Linux 2 kernel, port number 22,8080 for Jenkins because our Jenkins runs on port 8080
Now, connect it to the instance with SSH command.
Step 2: Install Java and Jenkins
Before going to install jenkins packages we need to install jenkins runtime that is JAVA. Without java jenkins cannot run. Install by using following command
sudo yum -y install java-17*
Now install jenkins packages from official website or follow below commands
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
After installing packages now install jenkins by using following command
sudo yum -y install jenkins
Now start and enable our jenkins by using following commands
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
While we check jenkins status it gives administration password. Copy that password and paste it on jenkins unlock page.
In Above figure shows that highlighted words is the administration password.
Now, copy paste the public IP address along with port 8080 and unlock Jenkins with admin password.
Official page of Jenkins
Step 3: Creating Jobs
Now click on new item, enter item name it is like title and select freestyle.
Create a clone-build-job for cloning the repo and build the application related code to build with the help of triggers/plugins.
We need to install maven integration plugin to avoid manual process.
Manage Jenkins --> available plugins --> maven integration
Now in source code management give GitHub URL to clone from GitHub account of the application.
Now in build steps there is a option Invoke top-level Maven targets in that select maven integration
In build steps select execute shell in that execute shell write a script to install tomcat to host our java application
Now we need to install another plugin to move .war files, for that install a plugin called Deploy to container.
Manage Jenkins --> Available --> deploy to container
Now in Post Build Actions select Deploy war/ear to a container
In this give this path to execute our war file **/*.war
War/ear files to deploy. Relative to the workspace root. You can also specify Ant-style GLOBs, like "**/*.war"
In Containers section add credentials to tomcat and provide tomcat URL
Now on click on save. Now our job was ready to build and finally click on build now
Now copy Public IP and browse it along with port 8080 you can see tomcat page in that tomcat page our application was hosted.
Conclusion
Building Java applications in Jenkins offers a streamlined and efficient way to deal with software development. By utilizing Jenkins' automation abilities, developers can automate the whole build process, from compiling source code to testing and packaging applications. This ensure consistency, reliability, and speed in the development lifecycle.
All through this guide, we've explored the most common way of setting up Jenkins, creating and configuring Jenkins jobs, and executing works for Java applications. With the right configuration and build steps, Jenkins can flawlessly integrate with famous build tool like Maven or Gradle to deal with complex build tasks.
Automating the build process in Jenkins, development teams can accomplish continuous integration, empowering faster feedback loops, early bug detection, and smoother cooperation among team. Jenkins gives rich features to monitoring form status, analyzing build logs, and generating reports, working with successful quality confirmation and project management.
