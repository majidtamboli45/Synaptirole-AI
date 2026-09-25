# kubernetes vs Jenkins

> Source: https://www.geeksforgeeks.org/devops/kubernetes-vs-jenkins

A popular automation server is Jenkins, while Kubernetes is an open-source framework for container orchestration. Selecting the best solution for your requirements might be difficult because Kubernetes and Jenkins both have special capabilities and advantages.
Kubernetes is used by DevOps engineers, IT system administrators, and application developers to autonomously scale, deploy, maintain, plan, and run many application containers across node clusters. Jenkins simplifies continuous integration and continuous delivery by aiding in the automation of the building, testing, and deployment processes involved in software development. It is a server-based solution that is conducted in Apache Tomcat or other servlet containers.
Difference Between Kubernetes and Jenkins
The following are the differences between Kubernetes and Jenkins:
| Kubernetes | Jenkins | 
|---|---|
| Kubernetes, An open-source container orchestration platform makes software deployment, scalability, and administration automated. | Jenkins,An open-source automation server. | 
| Preferred option for orchestrating containers | Preferred option for CI/CD processes | 
| Automates scaling, administration, and deployment. | Tests, integrates, and delivers software automatically. | 
| Complex designs, scalability, and containerised deployments | Software delivery automation and CI/CD processes | 
| Comprehensive backing from CNCF and the open-source community | Jenkins community and plugin ecosystem are vibrant | 
What Is Kubernetes?
Kubernetes, An open-source container orchestration platform makes software deployment, scalability, and administration automated. The Cloud Native Computing Foundation is the owner of the trademark, and a global network of volunteers now maintains the project that was initially established by Google.
Kubernetes is used by DevOps engineers, IT system administrators, and application developers to autonomously scale, deploy, maintain, plan, and run many application containers across node clusters. On host devices, containers operate on top of a common shared operating system (OS), but they are separated from one another unless a user decides to link them.
Features Of Kubernetes
The following are the features of Kubernetes:
- Self-healing: Kubernetes automatically restarts or replaces any unhealthy instances of containers based on its monitoring of their health. This guarantees your apps' high availability and dependability.
- Configuration management: Declarative manifests are a feature of Kubernetes that let you create configurations for your apps.
- Scalability: Kubernetes enables you to add or remove instances in response to demand, allowing you to scale your applications horizontally.
- Service discovery: Containers can easily locate and interact with one another because to Kubernetes' integrated methods for service discovery.
Benefits Of Kubernetes
The following are the benefits of Kubernetes:
- Deployment: Preferred states for container deployment are specified and modified by Kubernetes. Users have the ability to add new container instances, relocate current ones to them, and delete the previous ones.
- Load balancing: Load balancing is accomplished by Kubernetes to divide traffic among many container instances.
- Security: Tokens, SSH keys, passwords, and other private data are also managed using Kubernetes.
- Accessibility: Automatically rescheduling or resuming failed containers on healthy nodes, it may guarantee high availability of containers.
Challenges Of Kubernetes
The following are the challenges of Kubernetes:
- Security: Due to its fragility and complexity, security is one of Kubernetes' biggest problems. It might make it difficult to find vulnerabilities if it is not adequately monitored.
- Networking: Kubernetes and conventional networking techniques don't function well together. As a result, as your deployment grows in size, so do the issues you confront.
- Clusters stability: Since Kubernetes containers are inherently transient and ephemeral, they are continuously being generated, modified, and deleted.
- Storage: Containers must be able to rotate quickly up and down. They are therefore intended to be non-persistent. But for apps to function properly in production, persistent data is needed.
What Is Jenkins?
Jenkins, An open-source automation server. It facilitates repeated integration and continuous delivery by aiding in the automation of the building, testing, and deployment processes involved in software development. It is a server-based solution that engage in Apache Tomcat or other servlet containers.
Code branches can be more easily integrated into a main branch by using pipelines, which also automate testing and reporting on isolated changes in a larger code base in real time. Along with building the programme, automating testing, preparing the code base for delivery, and eventually deploying the code to bare metal, cloud, and container servers, they also quickly identify issues in a code base. Jenkins comes in a number of commercial versions. Only the upstream Open Source project is covered by this definition.
How to setup Jenkins On Kubernetes? A Step-By-Step Guide
The following are the effective steps for setting up Jenkins on Kubernetes:
Method 1: Install Jenkins with Helm v3
The following are the steps for the installation of Jenkins with Helm v3
Step 1: Download and install the Helm v3 from the Official Page
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3chmod 700 get_helm.sh./get_helm.sh
Step 2: Add Jenkins Helm Repository
helm repo add jenkins https://charts.jenkins.io/
helm repo update
Step 3: Create Namespace for Jenkins with the following command:
kubectl create namespace jenkins
Step 4: Install Jenkins using Helm
helm install jenkins jenkins/jenkins --namespace jenkins
Step 5: Access Jenkins
- Get the admin password with the following command:
printf $(kubectl get secret --namespace jenkins jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
- Port forward to access the Jenkins UI:
kubectl --namespace jenkins port-forward svc/jenkins 8080:8080
- Open http://localhost:8080 in your browser and log in with the admin password.
Method 2: Install Jenkins with YAML files
- The following are steps using to Install the Jenkins with the Yaml Files
Step 1: Create a Namespace for Jenkins
 kubectl create namespace jenkins
Step 2: Create a Persistent Volume and Persistent Volume Claim
# pv.yaml
apiVersion: v1
kind: PersistentVolume
metadata:
name: jenkins-pv
spec:
capacity:
storage: 10Gi
accessModes:
- ReadWriteOnce
hostPath:
path: /mnt/data
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
name: jenkins-pvc
spec:
accessModes:
- ReadWriteOnce
resources:
requests:
storage: 10Gi
Step 3: Create a Deployment and Service Yaml Files, The following are the sample yaml manifest files that we are using now:
# jenkins-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
name: jenkins
spec:
replicas: 1
selector:
matchLabels:
app: jenkins
template:
metadata:
labels:
app: jenkins
spec:
containers:
- name: jenkins
image: jenkins/jenkins:lts
ports:
- containerPort: 8080
volumeMounts:
- name: jenkins-volume
mountPath: /var/jenkins_home
volumes:
- name: jenkins-volume
persistentVolumeClaim:
claimName: jenkins-pvc
---
apiVersion: v1
kind: Service
metadata:
name: jenkins
spec:
ports:
- port: 8080
targetPort: 8080
selector:
app: jenkins
- Use the following command to apply the yaml manefist changes to the cluster:
kubectl apply -f jenkins-deployment.yaml -n jenkins
Step 4: Access Jenkins
- Get the admin password with the following command:
kubectl exec --namespace jenkins -it $(kubectl get pods --namespace jenkins -l "app=jenkins" -o jsonpath="{.items[0].metadata.name}") -- cat /var/jenkins_home/secrets/initialAdminPassword - Now, port forward to access the Jenkins UI with the following command:
kubectl --namespace jenkins port-forward svc/jenkins 8080:8080
- Open http://localhost:8080 in your browser and log in with the admin password.
Method 3: Install Jenkins with Jenkins Operator
The following are the steps for the installation of Jenkins with Jenkins Operator:
Step 1: Clone the Jenkins operator repository
git clone https://github.com/jenkinsci/kubernetes-operator
cd kubernetes-operator
- Apply the Custom Resource Definitions and the Jenkins Operator:
kubectl apply -f deploy/crds/
kubectl apply -f deploy/all-in-one-v1alpha2.yaml
Step 2: Create a Jenkins Custom Resource
# jenkins-cr.yaml
apiVersion: jenkins.io/v1alpha2
kind: Jenkins
metadata:
name: example
namespace: jenkins
spec:
master:
basePlugins:
- name: kubernetes
version: "1.29.7"
- name: workflow-aggregator
version: "2.6"
- name: git
version: "4.0.0"
containers:
- name: jenkins-master
image: jenkins/jenkins:lts
imagePullPolicy: Always
livenessProbe:
httpGet:
path: /login
port: 8080
initialDelaySeconds: 80
periodSeconds: 10
- Apply the jenkin-or.yaml manifest file to the cluster with the following command:
 kubectl apply -f jenkins-cr.yaml -n jenkins
Step 3: Access Jenkins
- Get the admin password with the following command:
 kubectl get secret example-jenkins-operator-credentials-jenkins-admin-password -o jsonpath="{.data.password}" -n jenkins | base64 --decode
- Port forward to access the jenkins UI with the following command:
kubectl --namespace jenkins port-forward svc/example-jenkins-operator-http 8080:8080
- Open http://localhost:8080 in your browser and log in with the admin password.
Features Of Jenkins
The following are the features of Jenkins:
- Plugins Available: Hundreds of plugins that connect with every tool in the CI and CD toolchain are available from The Update Centre.
- Distributed builds: Jenkins is capable of supporting distributed builds, which let you split up build jobs over several computers. This shortens the time needed for software delivery and enhances build speed.
- Easy Configuration: Jenkins' online interface, which includes built-in help and error checks, makes it simple to set up and configure.
- Extensible: The plugin design of extensible Jenkins allows for extensions, resulting in practically infinite capabilities.
Benefits Of Jenkins
The following are the benefits of Jenkins:
- Open source and free: Developers and DevOps teams who work with open source and free software don't want to worry about the expense of purchasing code pipelines. All they want is for code to be integrated into an artefact or to be deployed consistently from one central location.
- Integrations and plugins: The variety of platform plugins that Jenkins offers is one of its main benefits. Anyone can create plugins for Jenkins, and anyone may use them.
- Simple to debug: Jenkins' comprehensive reports and logs make it simple to identify and address problems in your code. Additionally, you may configure warnings and alarms for any problems.
- Adaptable to generate jobs: Jenkins gives you the option to build jobs pipeline-style or freestyle. Moreover, you may use scripts and parameters to personalise your jobs.
Challenges Of Jenkins
The following are the challenges of Jenkins:
- Lack of cooperation: It's challenging to transfer responsibilities between several disjointed Jenkins controllers. A team with no practical means of communicating new, more efficient methods to other isolated teams may find it difficult to share knowledge.
- Challenges with compliance: There is no system in place to guarantee that teams are conducting testing regularly. While some teams might make sure that security scans are incorporated throughout each pipeline section, others might not.
- Plugin conflicts: While plugins are a nice feature of Jenkins, the unique needs of different teams might lead to conflicts when using a monolithic Jenkins server.
- Networking: Conventional networking methods don't work well with Jenkins. As a result, the problems you face increase in proportion to the extent of your deployment.
Conclusion
In this article we have learned about Kubernetes and Jenkins. Kubernetes is an open-source container orchestration platform composes software deployment, scalability, and administration automated and Jenkins is an open-source automation server preferred option for CI/CD processes.
