# How to Setup an Slave Agent For the Master in Jenkins in AWS?

> Source: https://www.geeksforgeeks.org/devops/how-to-setup-an-slave-agent-for-the-master-in-jenkins-in-aws

Pre-requisites: Jenkins
Jenkins is an open-source continuous integration and delivery (CI/CD) tool used by software development teams to automate the building, testing, and deployment of applications. One of the key features of Jenkins is its ability to support master-slave configuration, which allows you to distribute the workload of building, testing, and deploying applications across multiple machines. In a master-slave configuration, the Jenkins master server acts as the central control point, managing the job scheduling and distributing tasks to the Jenkins slave nodes. The slave nodes are separate machines that perform the actual work of building, testing, and deploying applications. This configuration provides several benefits, including increased scalability, improved fault tolerance, and better resource utilization.
Master-Slave Configuration In Jenkins Steps
Step 1: Install Jenkins on the Master Node(Here, we are using AWS EC2 ubuntu as a master node.)
The first step in setting up a master-slave configuration is to install Jenkins on the master node and verify that Jenkins is up and running by executing the below command. Here, Jenkins is up and running.
systemctl status jenkins
Step 2: Install Java on the Slave Nodes.
Next, you need to install Java on the slave nodes. Java is required to run Jenkins on the slave nodes, and you can download the latest version of Java from the official website. After installing Java, we are good to go there is no need to download and install Jenkins on the slave node. Here, we are using AWS EC2 ubuntu as a slave node. To install java execute the below command.
sudo apt install openjdk-11-jre
#or if java has been already installed we can verify by executing
java --version
Step 3: Configure the Master Node
Once you have installed Jenkins on the master and Java on the slave node, you need to configure the master node. In the Jenkins web interface, go to Manage Jenkins > Manage Nodes and Clouds. Click on the "New Node" button to create a new node and enter the necessary details, such as the node name and the number of executors.
Now, we need to configure the remote root directory of the agent where the master Jenkins can store project-related files. Here, we have to use an absolute path, such as /var/Jenkins or c:\jenkins(if we don't have a Jenkins folder in /var/ then the master will create a directory named Jenkins for us). This path is local to the agent machine only. There is no need for this path to be visible from the master.
Labels: Labels are used to group multiple agents into one logical group. Labels are like tags we will use this tag or label to call it later. As we are running the slave on ubuntu, so we have used ubuntu as a label besides labels are space separated that is we can assign labels separated by space.
Usage: We can use the default use this node as much as possible that is whenever the agent is free and there is a job to execute the master will execute the job on the slave.
Only building jobs with label expressions matching this node means only executing the job when the user explicitly specifies the agent using a label. Here we'll be using only build jobs with label expressions matching this node.
Launch method:-How Jenkins should start the agent there are three options available Launch the agent by connecting it to the controller(which means whenever the agent is ready it can connect with the master, Here we have to connect the slave/agent via a jar file manually.) Launch agent via execution of command on the controller(Here the Jenkins master will start the slave/agent by executing the command)Launch agents via SSH(Start a slave/agent by sending commands through the ssh).
Here, we'll be using the Launch agent by connecting it to the controller. Select the use of WebSocket(for connecting the Jenkins master through the WebSocket.).Leave everything as default and Save the agent.
Step 4: Configure the Slave Nodes
After configuring the master node, you need to configure the slave nodes. In the Jenkins web interface, go to Manage Jenkins > Manage Nodes and Clouds. Click on the node that you created in step 3 to edit its configuration.
Now go to the directory that we have specified in step 3 inside the remote root directory. And copy the commands specified in the above picture under Run from the agent command line and paste them into the slave/agent's terminal.
The slave is connected with the master, now refresh the Jenkins page.
The agent is connected successfully. Now to use this agent we've to specify explicitly the label in the pipeline as a code.
the syntax for specifying:
pipeline{
  agent{
    label 'linux'
  }
  stages{
    stage(DEMO){
      steps{
        echo "Hello-world"
      }
    }
  }
}
Here, in the above pipeline, we have echoed the Hello-world on the slave agent 'Linux'.
Running on the name specified for the slave as in the above case the slave is named as a new node.
Conclusion
Setting up a master-slave configuration in Jenkins can help you improve the scalability, fault tolerance, and resource utilization of your CI/CD pipeline. By following the steps outlined above, you can configure Jenkins to distribute workload across multiple machines and automate the building, testing, and deployment of your applications.
