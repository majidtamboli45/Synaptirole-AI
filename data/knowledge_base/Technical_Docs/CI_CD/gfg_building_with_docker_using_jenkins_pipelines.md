# Building with Docker Using Jenkins Pipelines

> Source: https://www.geeksforgeeks.org/devops/building-with-docker-using-jenkins-pipelines

Continuous Integration and Continuous Delivery (CI/CD) are two essential practices in today's modern development landscape for delivering software efficiently. The most potent combination to implement a smooth CI/CD workflow is Docker and Jenkins. Docker packages an application and its dependencies into a standardized unit of software called a container, thus assuring applications run predictably on any infrastructure. Jenkins is an open-source automation server well known for supporting the building, testing, and deploying applications through robust workflows.
This automation by Jenkins pipelines helps in the automatic execution and orchestration of the entire development cycle, from committing code to deploying software with the help of Docker. It gives automation to build, test, and ship applications inside isolated, reproducible development and test environments that decrease the "works on my machine" problem and increase deployment reliability.
Build Docker images using Jenkins pipelines, understand key terminologies, and provide a step-by-step guide so that this integration can be in place. By the end of this article, you should be able to follow Docker and Jenkins for robust CI/CD processes with practical examples and common questions raised so far in order to solidify your knowledge.
Primary Terminologies
Docker
- Docker is a platform that allows developers to develop, ship, and run apps in containers. Generally, it supports app packaging with everything it needs—application runtime plus its dependencies—into one package for consistency across different environments, from development to production.
Jenkins
- Jenkins is an automation server tool that is open-source and used for building, deploying, and automating software development. It highly furnishes in setting up continuous integration/continuous deployment pipelines.
Jenkins Pipeline
- A Jenkins pipeline is a suite of plugins embraced by Jenkins users, making it possible to implement and manage continuous delivery pipelines using code. It defines the steps for building, testing, and deploying applications using a Groovy-based DSL.
Docker Image
- A Docker image is a lightweight, standalone, executable package that includes everything needed to run a piece of software; for instance, the code, runtime, libraries, environment variables, and configuration files are included.
Docker Container
- A Docker container is an executing instance of a Docker image—an isolated environment where the application code runs, ensuring consistency and reliability, no matter how many different runtimes there are.
Dockerfile
- A Dockerfile is a text document that contains instructions in code to create an image using Docker. In the context of a Dockerfile, every command adds a new layer on top of the previous one.
Docker Hub
- Docker Hub is an online repository service through which you can share your created Docker images, also for them to be available at ease for any individual. It supports easy sharing, collaboration, and deployment of containerized applications.
Continuous Integration (CI)
- Continuous Integration is the practice in software development whereby all developers merge code into shared repositories regularly. That way, automatic builds, and tests are done with each integration, allowing teams to detect problems early.
Continuous Delivery (CD)
- Continuous Delivery (CD) is a software engineering approach that allows for small incremental changes in code, automatically builds, and tests them before being readied to go into production. That means its software can be released with ease at time.
Step-by-Step Process for Building with Docker Using Jenkins Pipelines
Step 1: Launch EC2 Instance
- Login to AWS Console by using credentials
- Navigate to EC2 dashboard launch an ec2 instance
Step 2: Install Jenkins and Required Plugins
Install Jenkins
- Download and install Jenkins from the official Jenkins website or follow below commands to install jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum -y install java-17*
sudo yum -y install jenkins
- Now start and enable jenkins by using following commands
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
- Now navigate to ec2 dashboard and copy public ip of instance and browse it along with port 8080 because jenkins default port number is 8080
- Copy and paste administration password and unlock jenkins
- In below figure we can see official page of jenkins
Install Required Plugins
- Navigate to Manage Jenkins -> Manage Plugins.
Install the following plugins:
- Docker Pipeline Plugin
- Pipeline Plugin
Step 3: Configure Jenkins Credentials
Add Docker Hub Credentials
- Now navigate to dockerhub and generate access token
- Profile -> Security -> New Access Token
- Now add this access token to jenkins
- Go to Manage Jenkins -> Manage Credentials.
- Select Kind: Username with password
- Scope: Global
- Username: Your Docker Hub username
- Password: Your Docker Hub password
Step 4: Create a Jenkins Pipeline
Create a New Pipeline Job:
- In Jenkins, click New Item.
- Enter a name for your job, select Pipeline, and click OK
Define Your Pipeline in a Jenkinsfile:
- Give project description
- Now go to pipeline section add pipeline script
pipeline {
agent any
environment {
// Define Docker Hub credentials ID stored in Jenkins credentials store
DOCKERHUB_CREDENTIALS = 'dockerHubCredentials #replace with your id name
IMAGE_NAME = 'amazonlinux'
IMAGE_TAG = 'latest'
}
stages {
stage('Build and Push Docker Image') {
steps {
script {
// Load Docker Hub credentials from Jenkins credentials store
withCredentials([usernamePassword(credentialsId: DOCKERHUB_CREDENTIALS, usernameVariable: 'DOCKERHUB_USERNAME',
passwordVariable: 'DOCKERHUB_PASSWORD')]) {
// Login to Docker Hub
sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
// Build Docker image
sh "docker build -t ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG} ."
// Tag the Docker image
sh "docker tag ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG} index.docker.io/${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
// Push Docker image to Docker Hub
sh "docker push index.docker.io/${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
}
}
}
}
}
post {
always {
echo 'Pipeline finished'
}
}
}
Step 5: Build Pipeline
- Now Build pipeline to run docker
- Build was successful
- In below figure we can stage view of pipeline
Step 6: Verification
- Now navigate to dockerhub and check docker image was push or not into dickerhub
- Here we see that docker image was successfully pushed into dockerhub
Conclusion
With Docker integrated into the Jenkins pipeline, robust and efficient automation is done with the building, testing, and deploying containerized applications. By leveraging Docker's abilities to containerize applications and Jenkins' robust workflows for CI/CD, an assured state can be achieved that software delivery will be stable and predictable across any environment.
We have discussed the fundamental ideas and terminologies of Docker and Jenkins, which create a good foundation for integrating the two technologies. In this paper, we will cover the step-by-step procedure for configuring Jenkins pipelines to build Docker images, guaranteeing a smooth and practical guide for implementation.
It will be possible to create integrated CI/CD pipelines that eliminate clutters in the development process, decrease manual errors, and make your software delivery process way faster. This integration of Docker with Jenkins means more than just efficiency and reliability during deployment; it paves the way for a development team to constantly work at their best in an environment of continuous improvement and collaboration.
As you explore and start using these tools, please keep in mind that you need to tweak the settings according to your project needs and stay abreast of all the best practices in CI/CD. Adopting such integration by your team will enable the delivery of software of high quality with more incredible speed and confidence.
