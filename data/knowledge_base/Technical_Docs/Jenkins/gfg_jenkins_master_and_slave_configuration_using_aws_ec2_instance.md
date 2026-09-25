# Jenkins Master And Slave Configuration Using AWS EC2 Instance

> Source: https://www.geeksforgeeks.org/devops/jenkins-master-and-slave-configuration-using-aws-ec2-instance/

Optimizing the jenkins performance enhances the scalability by configuring the master-slave architecture using AWS EC2 Instances. Distributed workloads efficiently secures seamless CI/CD process for your projects. In this Article you will guide how to configure jenkins master-slave nodes using AWS EC2 Instances.
What Is Jenkins?
Jenkins is an open-source automation server that facilitates the automation of several stages of the software development lifecycle, including application development, testing, and deployment. Operating within servlet containers like Apache Tomcat, the technology is server-based. Continuous delivery (CD) and Continuous integration (CI) pipelines can be created and managed with Jenkins. The development, testing, and deployment of software applications are automated using CI/CD pipelines. You will be able to release software more regularly and with fewer problems if you do this.
- Jenkins is flexible.
- You can add as many plugins as you want to add to the Jenkins.
- You can automate the process of CI/CD pipelines of all the projects.
Jenkins Master-Slave Architecture
Master-Slave Architecture: The diagram shows a Jenkins Master and multiple Jenkins Slaves in a master-slave architecture. In this setup, the Jenkins Master manages and coordinates the execution of jobs across the Jenkins Slaves.
- Jenkins has written in Java, so it relies on the Java Runtime Environment (JRE) to function. The JRE provides the necessary libraries and tools for Jenkins to run its code and perform its tasks.
Note: There is no need of Jenkins in the slave or worker machine
Need Of Java In Jenkins Master Node
The Jenkins Master is the central control unit. It manages tasks like:
- Scheduling builds
- Assigning builds to available slaves
- Monitoring slave status
- Recording and displaying build results
- To execute these tasks, the Master needs Java to run the Jenkins application code.
- It interacts with Slaves using Java-based communication protocols.
Need Of Java In Jenkins Slave Node
- Jenkins Slaves are essentially worker machines that execute the actual build jobs.
- They need Java to run a small Java program called the "agent".
- This agent listens for instructions from the Master, fetches build scripts and dependencies, and then uses the JRE to execute the build commands on the Slave machine.
Configuring Jenkins Master And Slave Using AWS EC2 Instance
Here we are using Amazon Web Services To achieve Jenkins master's and slave.
Step 1: Create two EC2 instances and name them as Jenkins Server and Jenkins Node.
Step 2: In one of the nodes install Jenkins which is going to act as the master node and install Java in the second server which is going to act as the slave or worker node. Establish the SSH to the worker node and create a directory called node1.
Step 3: Open Jenkins and click on Manage Jenkins there you will find an option called Manage Nodes and Clouds. Click on that option.
Step 4: On the left side you will se an option called new node click on it, there you need to configure all the details of the slave or worker node. In the node name section give the name of the node you want.
Step 5: Configure all the details that have been asked in that section as shown below.
- No of executer: One because we are using only on one slave
- Remote root directory: In this area the the path of the direcory which we have created in the step 1.
- label: Give the label of the node as node only we will this label in the project we are going to build.
- Usage: Select As much as possible.
Step 6: Select the launch method as Launch agents via SSH in the host section give the IP addres of the slave or worker node in the creadentials configure you ssh key.
- In the section of Host Key verification Strategy select the option called manually trusted key strategy.
- And After that ther will be one option called node properties dont select any thing leave it.
Step 7: Know you can see that you salve was online and ready to use it with your projects.
- Built in node was the master and the second node was slave.
Integration Of Slave Node To Jenkins Project
Follow the steps mentioned below to integrate the jenkins project with the slave.
Step 1: Click on general and click on ristrict where the project should run ther you will get an drop down named label expression.
- In that area give the name of the label you have given while configuring the slave node.
- Know you can build the projects in the worker node.
Conclusion
In this article we have seen that the how to configure the jenkins master and slave this master and slave are widely used in the orgnizations by which it will reduce the load ion the master node and distributes it to the slave nodes.
