# Java Application Deployment In Kubernetes With Jenkins CI/CD Pipeline

> Source: https://www.geeksforgeeks.org/devops/java-application-deployment-in-kubernetes-with-jenkins-ci-cd-pipeline

In modern software development, deploying applications to Kubernetes clusters has become a common practice due to their scalability and reliability. Automating this deployment process using continuous integration and continuous deployment (CI/CD) pipelines with Jenkins streamlines the development workflow and ensures consistent, reliable deployments. This article demonstrates deploying a sample Java application on a Kubernetes cluster using Minikube.
1. Creating a sample Java application
We'll start by creating a simple Java application. Compile the Java code using the javac command.
class Main {
public static void main(String[] args) {
System.out.println("Hello from App");
}
}
2. Creating a Docker image
We'll create a Dockerfile to package the Java application into a Docker image. The Dockerfile will copy the compiled Java class file into the image and specify the command to run the application.
FROM openjdk:11-jre-slim
WORKDIR /app
COPY Main.class .
CMD ["java", "Main"]
3. Defining Kubernetes Deployment YAML File
The deployment YAML file specifies the desired state of the application, including the number of replicas, container image, and other configurations.
apiVersion: apps/v1
kind: Deployment
metadata:
name: java-app-deployment
spec:
replicas: 3
selector:
matchLabels:
app: java-app
template:
metadata:
labels:
app: java-app
spec:
containers:
- name: java-app-container
image: java-app
4. Creating Jenkins Role YAML File (Optional)
If Jenkins needs permission to interact with Kubernetes resources, you can create a Kubernetes role YAML file to define the required permissions.
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
name: jenkins-role
rules:
- apiGroups: [""]
resources: ["pods", "services", "deployments"]
verbs: ["get", "list", "watch", "create", "update", "delete"]
5. Creating a Service Account in Kubernetes
Start the minikube.
minikube start
Use the kubectl create serviceaccount command to create a service account in your Kubernetes cluster.
kubectl create serviceaccount jenkins
6. Generating Token using OpenSSl and setting it for the service account
This command generates a random 32-byte token encoded in base64. Copy the generated token as we need it in the next step.
openssl rand -base64 32
example output: vBM3jD+vKxWlwm+Bd9y2tnoKZdEh8Vc9nutV7LAZ/AE+
We can now set it for the desired service account in Kubernetes. Use the kubectl command to create a secret containing the token and associate it with the service account.
kubectl create secret generic jenkins-token --from-literal=token=vBM3jD+vKxWlwm+Bd9y2tnoKZdEh8Vc9nutV7LAZ/AE+
Make sure you replace vBM3jD+vKxWlwm+Bd9y2tnoKZdEh8Vc9nutV7LAZ/AE+ with your own generated token.
After creating the secret in above step, we need to associate it with the service account.
This command patches the jenkins service account to use the secret jenkins-token. It adds the secret to the list of image pull secrets for the service account.
kubectl patch serviceaccount jenkins -p '{"imagePullSecrets": [{"name": "jenkins-token"}]}'
7. Finding the URL and port of the Minikube cluster
The minikube dashboard --url command is used to retrieve the URL of the Kubernetes dashboard running on your Minikube cluster.
minikube dashboard --url
Note down this url and port number as we need it for the jenkins script.
8. Configuring Jenkins
Install Jenkins LTS version for your Operating System and complete the on screen setup. On new browser tab visit http://localhost:8080/
1. Installing Plugins
- On dashboard click on Manage Jenkins.
- Then click on Plugins.
- Click on Available plugins.
- Install Docker Pipeline plugin and Kubernetes plugin.
- Searching For kubernetes Plugin
2. Configure Credentials
- On dashboard click on Manage Jenkins and under Security click on Credentials.
- Click on global and then add credentials.
- Select Kind as Secret Text and then add the copied key generated in step 6 in Secret Tab. Keep the ID and Description as empty.
- Now you can see the added credentials and the auto generate ID. Copy this ID as this will be required in further steps.
9. Creating Jenkins Pipeline
- On Dashboard click on New Item. Enter the item name, example myapp, and select Pipeline Option.
- Scroll down to Pipeline and add below Pipeline script under script section. Make sure you replace your-credential-id (obtained in step 8-2), http://link:port (obtained in step 7) and the paths with your actual values. Then click on Save.
This Jenkins pipeline script automates the deployment of a Java application to a Kubernetes cluster. It comprises three stages: Build compiles the Java code, Dockerize builds a Docker image, and Deploy to Minikube applies the Kubernetes deployment using a specified service account token and server URL with TLS verification skipped. The script integrates with Jenkins credentials to securely access the Kubernetes service account token and executes commands to deploy the application to the specified Minikube cluster.
pipeline {
agent any
stages {
stage('Build') {
steps {
// Compile Java code
bat "javac \"C:\\Users\\deployJavaAppMain.java\""
}
}
stage('Dockerize') {
steps {
script {
// Disable BuildKit
bat 'SET DOCKER_BUILDKIT=0'
// Build Docker image
bat 'docker build -t java-app "C:\\Users\\deployJavaApp"'
}
}
}
stage('Deploy to Minikube') {
steps {
// Apply Kubernetes deployment using the Kubernetes service account
withCredentials([string(credentialsId: 'your-credential-id', variable: 'KUBE_SA_TOKEN')]) {
bat """
kubectl apply -f "C:\\Users\\deployJavaApp\\kubernetes-deployment.yaml" \
--token="$KUBE_SA_TOKEN" \
--server=http://link:port \
--insecure-skip-tls-verify
"""
}
}
}
}
}
- Then click on Build Now which starts the pipeline to Build and automates the deployment process.
- Now deployment is successful and you can access the deployed application through exposed service or by accessing the pods directly or you can visit the Kubernetes dashboard to manage your deployment.
