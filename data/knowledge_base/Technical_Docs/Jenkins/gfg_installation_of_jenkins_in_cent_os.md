# Installation of Jenkins in Cent OS

> Source: https://www.geeksforgeeks.org/devops/installation-of-jenkins-in-cent-os/

Cent OS is one of the popular and lightweight Linux distributions that is used in servers. In this article, we will be looking at how to install Jenkins on Cent Os, which is based on Red Hat Enterprise Linux.
Jenkins is an open-source tool that is used for automating the continuous integration and continuous delivery process or CI/CD process in short. In Jenkins, we can automate the deployment by creating pipelines. So let's get started with the installation process.
System Requirements
According to the Jenkins website, the minimum system requirements are as follows:
- 256 MB of RAM
- 1 GB of drive space (although 10 GB is a recommended minimum if running Jenkins as a Docker container)
Recommended hardware configuration for a small team:
- 4 GB+ of RAM
- 50 GB+ of drive space
Installation Steps
Step 1: Java is required in order to run our Jenkins server. If you already have Java installed then you can skip this step. Open the terminal and type the following command.
sudo dnf install java-11-openjdk-devel -y
Upon successful completion, the terminal will look like below.
Step 2:The default centos repository does not contain the Jenkins repository. So we need to add it to the centos software repository. We can do this by typing the following command in the terminal.
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo
Upon successfully downloading the Jenkins repo, the output would look like this. Make sure the location '/etc/yum.repos.d/jenkins.repo' .
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
The above command will import the GPG key into the RPM system. This will not generate any output on completion.
After adding the GPG key, we need to update the package information. This can be done by the following command:
sudo yum upgrade
Upon successful completion the output will look like below.
Step 3: Now we are finally here to install Jenkins using yum package manager. The command to install jenkins is below.
sudo yum install jenkins -y
The output of this command will look like:
Some other commands these are optional but you can do as per your preference.
To start jenkins server at boot:
sudo systemctl enable jenkins
To start jenkins server:
sudo systemctl start jenkins
To kill the jenkins server:
sudo systemctl stop jenkins
Step 4:At this point our jenkins server is running and we can access it at port 8080. To access it just open browser and access the server at localhost port 8080.
Now, lets unlock our jenkins server. So to do that we will need a initial admin password, this can be found at /root/.jenkins/secrets/initialAdminPassword file.Enter the password from the file then click on install suggested plugins wait for this to get complete.
Now, we can create a user or we can skip this step and continue working with the root user which is not recommended.
Then just we need to do couple to next-next and our jenkins server will be ready to create pipelines.
Alternative way
In this way we will be using docker to run our jenkins server.
docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins
After running this container our jenkins server will be started and we can access it at 8080 port.
Congrats! Your jenkins server is up and running and are ready to create pipelines. If you have any queries feel free to ask.
