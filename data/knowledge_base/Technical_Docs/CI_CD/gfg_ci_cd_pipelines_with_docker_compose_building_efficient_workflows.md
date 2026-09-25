# CI/CD Pipelines with Docker Compose: Building Efficient Workflows

> Source: https://www.geeksforgeeks.org/devops/ci-cd-pipelines-with-docker-compose

In the modern view of software development, each passing day has proved Continuous Integration and Continuous Deployment pipelines critical for fast, efficient, and reliable delivery of software. Docker Compose can smoothen the process: building, testing, and deploying an application could be orchestrated and automated at various stages. This article investigates how Docker Compose can enhance CI/CD workflows and introduces some important terminology while following a step-by-step process to create a working CI/CD pipeline.
Primary Terminologies
- CI/CD: Continuous Integration (CI) and Continuous Deployment (CD) are practices in the software development process. In other words, these are tools that help to carry out integration, testing, and application deployment automatically. Continuous Integration means integrating code changes continuously, whereas Continuous Deployment practices ensure every change goes to production.
- Docker: This is a tool that helps in the development, shipping, and running of apps within containers; these containers constitute an application and its run-time environment.
- Docker Compose: This is a file definition that describes, runs, and manages multi-container Docker applications. With Compose, you define a multi-service application with its volumes, networks, and dependencies/links in a single file.
- Pipeline: A series of automated steps that code has to navigate in order to progress from development to deployment. Normally includes building, testing, and deployment.
- YAML: Human-readable data format used to define configurations in Docker Compose and many other tools.
- Version Control: Management and tracking of changes taking place in the code. They enable collaboration, such that many developers can work on the same codebase.
- Orchestration: In the context of Docker, is the coordination and management of multiple containers working together in a distributed application.
Step-by-Step Process: Building a CI/CD Pipeline with Docker Compose
Step 1: Install docker
Install docker by using following command
sudo yum -y install docker
Start and enable docker
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
Now change permission to docker sock
sudo usermod -aG docker ec2-user
sudo chmod 666 /var/run/docker.sock
Step 2: Install Docker Compose
Now install docker compose by using following command
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose 
sudo chmod +x /usr/local/bin/docker-compose
Step 3: Install Jenkins
After docker and docker compose installation now install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install -y java-17*
sudo yum install jenkins -y - Now start and enable jenkins by using following commands
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
- Access Jenkins by navigating to http://<Public IP>:8080 in your web browser, and complete the setup process.
- Now unlock jenkins by using administration password
- This is the official page of jenkins
Step 4: Set Up Jenkins for CI/CD
Install Required Plugins:
- In Jenkins, go to "Manage Jenkins" > "Manage Plugins."
- Install the "Docker Pipeline" plugin and "Docker" plugin.
Create a New Jenkins Pipeline Job:
- Go to the Jenkins dashboard and click on "New Item."
- Choose "Pipeline" and give your job a name.
Configure the Pipeline Script:
- In the job configuration, scroll to the "Pipeline" section and choose "Pipeline script" from the Definition dropdown.
- Use the following example pipeline script to integrate Docker Compose with your Jenkins job:
pipeline {
agent any
environment {
// Ensure Docker and Docker Compose are in the PATH
PATH = "/usr/local/bin:${env.PATH}"
}
stages {
stage('Build') {
steps {
// Build the Docker image for NGINX using Docker Compose
sh 'docker-compose build'
}
}
stage('Deploy') {
steps {
// Start the NGINX server using Docker Compose
sh 'docker-compose up -d'
}
}
stage('Test') {
steps {
// Test if NGINX is serving content
sh 'curl -f http://localhost/ || exit 1'
}
}
stage('Cleanup') {
steps {
// Optional: Stop and remove Docker Compose services
sh 'docker-compose down'
}
}
}
post {
always {
// Actions to take regardless of success or failure
echo 'Cleaning up...'
}
success {
echo 'Pipeline completed successfully. NGINX is up and running.'
}
failure {
echo 'Pipeline failed. Check the logs for details.'
}
}
}
Now click on build now
Here we can see the output of the pipeline
Below figure shows that pipeline view
We can our docker-compose container in CLI by using following command
docker-compose ps
We can access our nginx application by using public Ip of instance
Conclusion
Docker Compose plays a crucial part in modern CI/CD pipelines. It eases the management of applications running in multiple containers across different environments. The service can define and orchestrate services in one single YAML file, enabling the development of a setup that is consistent and reproducible on development, testing, and production levels. Use of Docker Compose within the CI/CD workflow will automate these stages with building, testing, and deployment, therefore reducing the need for manual intervention while decreasing the number of possible errors. This means more effective work processes and quicker release cycles, and with that, at the end of the day, a more reliable process of delivering software. Whether you develop a small project or a complex application, the addition of Docker Compose into your CI/CD strategy will improve your development and deployment efficiency by leaps and bounds.
