# Python Application Deployment In Kubernetes With Jenkins CI/CD Pipeline

> Source: https://www.geeksforgeeks.org/devops/python-application-deployment-in-kubernetes-with-jenkins-ci-cd-pipeline/

In modern software development, deploying applications to Kubernetes clusters has become a common practice due to their scalability and reliability. Automating this deployment process using continuous integration and continuous deployment (CI/CD) pipelines with Jenkins streamlines the development workflow and ensures consistent, reliable deployments. This article demonstrates deploying a sample Python Flask application on a Kubernetes cluster using Minikube.
1. Creating a sample Python Flask application
We'll start by creating a simple application. The provided Python code defines a basic Flask web application with a single route ("/") that returns the string "Hello from the Python Flask App!" when accessed, and it runs the application on host '0.0.0.0' and port 5000 when executed directly.
# app.py
# Importing the Flask class from the flask module
from flask import Flask
# Creating an instance of the Flask class with the name of the current module (__name__) as argument
app = Flask(__name__)
# Defining a route for the root URL ("/") that responds to HTTP GET requests
@app.route('/')
def hello():
# Returning a string "Hello from Python Flask App!" as the response
return "Hello from Python Flask App!"
# Entry point of the application. This block ensures that the app is run only if executed directly, not imported as a module.
if __name__ == '__main__':
# Running the Flask application on the specified host ('0.0.0.0') and port (5000)
app.run(host='0.0.0.0', port=5000)
Also create a requirements.txt file as below.
Flask==2.0.2
2. Creating a Docker image
We will create a Dockerfile to package the Flask application into Docker image.
This Dockerfile sets up a container environment for running a Python application. It copies the requirements.txt file listing Python dependencies, installs them using pip, then copies the app.py file into the container. It exposes port 5000 and specifies the command to run the Flask application when the container starts, which is python app.py.
# Use official Python image as a base
FROM python:3.9
# Set the working directory in the container
WORKDIR /app
# Copy the requirements file into the container
COPY requirements.txt .
# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
# Copy the Python application code into the container
COPY app.py .
# Expose the port on which the Flask app runs
EXPOSE 5000
# Specify the command to run the Flask application
CMD ["python", "app.py"]
3. Defining Kubernetes Deployment YAML File
The deployment YAML file specifies the desired state of the application, including the number of replicas, container image, and other configurations.
apiVersion: apps/v1
kind: Deployment
metadata:
name: python-app-deployment
spec:
replicas: 3
selector:
matchLabels:
app: python-app
template:
metadata:
labels:
app: python-app
spec:
containers:
- name: python-app-container
image: python-app:latest
ports:
- containerPort: 5000
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
Use the kubectl get serviceaccount command to view the created service accounts.
 kubectl get serviceaccount
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
- Searching For Kubernetes Plugin
2. Configure Credentials
- On dashboard click on Manage Jenkins and under Security click on Credentials.
- Click on global and then add credentials.
- Select Kind as Secret Text and then add the copied key generated in step 6 in Secret Tab. Keep the ID and Description as empty.
- Now you can see the added credentials and the auto generate ID. Copy this ID as this will be required in further steps.
9. Creating Jenkins Pipeline
- On Dashboard click on New Item. Enter the item name, example myapp, and select Pipeline Option.
- Scroll down to Pipeline and add below Pipeline script under script section. Make sure you replace your-credential-id (obtained in step 8-2), http://link:port (obtained in step 7) and the paths with your actual values. Then click on Save.
This Jenkins pipeline script automates the deployment of a Python application to a Kubernetes cluster. It comprises two stages: Dockerize builds a Docker image, and Deploy to Minikube applies the Kubernetes deployment using a specified service account token and server URL with TLS verification skipped. The script integrates with Jenkins credentials to securely access the Kubernetes service account token and executes commands to deploy the application to the specified Minikube cluster.
pipeline {
agent any
stages {
stage('Dockerize') {
steps {
script {
// Disable BuildKit
bat 'SET DOCKER_BUILDKIT=0'
// Build Docker image for Python application
bat 'docker build -t python-app "C:\\Users\\deployPythonApp"'
}
}
}
stage('Deploy to Minikube') {
steps {
// Apply Kubernetes deployment using the Kubernetes service account
withCredentials([string(credentialsId: 'your-credential-id', variable: 'KUBE_SA_TOKEN')]) {
bat """
kubectl apply -f "C:\\Users\\deployPythonApp\\kubernetes-deployment.yaml" \
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
