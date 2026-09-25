# Kubectl Create and Kubectl Apply

> Source: https://www.geeksforgeeks.org/devops/kubernetes-kubectl-create-and-kubectl-apply/

Kubernetes is an open-source Container Orchestrating software platform that is widely used in modern application deployment and management. It comes up with many internal resources to manage the other working nodes Organizing as a Cluster facilitates seamless automatic scaling, and deployment updates making applications highly available and fault tolerant. The `kubectl create` and `kubectl apply` commands are essential for managing containerized applications effectively. This Article involves discussing these two kubectl commands with their method of approaches in deploying the resources.
What is Kubectl?
The Kubectl is a command line interface software that allows you to run commands in the Kubernetes cluster. It acts as a communication bridge between users/clients and the Kubernetes cluster. It uses the Kubernetes API Server to authenticate with the Kubernetes Master Node to interact within the Kubernetes Cluster. The communication of API requests in the Kubernetes Cluster using kubectl to deploy the resources will be done with 2 approaches. The following are the 2 approaches used in Kubernetes deployment :
1. Imperative way ( Manual approach)
2. Declarative way ( Dynamic Approach )
Imperative Way of Deploying Resources in Kubernetes
In this Imperative approach, We have to specify the detailed instructions on the management of resources. What resources have to be used such as Kubernetes Pod, Kubernetes ReplicaSet, Deployments, and Daemon Sets... How to Use resources like Creating, Deleting, and Replacing to reach the desired final state. For example, `kubectl create`, `kubectl scale`, `kubectl delete`... This Approach provides full control over the deployment process allowing the operations to be defined manually as a sequence of operations to reach the desired state.
Declarative Way of Deploying Resources in Kubernetes
The declarative approach is an effective way in kubernetes, The desired specification of resources are specified through Yaml configuration files. While execution it will check the current and desired state of resources with specified resource names and then perform the updates that are required. This declarative way provides the optimization and better utilization of resources. The popular command for this example is `kubectl apply` .
Kubectl Usage Approaches
In earlier times, kubectl was mostly used for interactive or experimental reasons to make the development work easier. After once kubernetes came into usage the functionality purpose of kubectl usage is changed. It comes to serve as a key component in configuring the production environment deployment enhancing the agility through application manifest files. kubectl create in the imperative approach and kubectl apply in the declarative approach are two essential kubectl commands in resource deployment of Kubernetes.
This article focuses on two pivotal kubernetes commands that streamline resource deployment. Those two commands are as follows:
- kubectl create ( Imperative way ): This command follows imperative approach provide users specify their desired state directly as a command. It is useful for customizing single resources providing more control to the user. In this resources can configurable without need of manifest files. This will effective for experimenting and rapid prototyping during the development phases.
- kubectl apply ( Declarative way ): This command comes with declarative approach, where users define their desired state of the resources through manifest files. It is preferred for the resource deployment in production environment offering consistency and idempotent nature. This command facilitates the declarative configurations ensuring the desired state of the cluster meeting the specification of manifest file configurations.
Usage of Kubectl Create in Deploying K8S Resources
The kubectl create command is an imperative way of deploying resources on a Kubernetes cluster . The following are a few popular resources that can be created using kubectl create command.
Kubectl create - Creating Deployment Resource
Creating a deployment resource imperatively with kubectl create command by default replicas count will be 1.
Syntax:
kubectl create deployment <Deployment-Name> --image <Container-Image>
Example
kubectl create deployment demo-deployment --image nginx:latest
The following screenshot shows the practical usage of creating imperative Deployment with kubectl create :
kubectl create - Creating Namespace Resource
Kubernetes Namespaces are used for logically isolate the resources within a cluster. By default, a namespace is already created in a cluster i.e "Default". It is very useful to isolated the resources and its management when you are working with different projects or different teams working in same same cluster.
The following command is used to list all namespaces that are created in the cluster.
kubectl get ns
Syntax
 kubectl create namespace <namespace_name>
( OR )
  kubectl create -n <namespace_name>
Example
kubectl  create namespace "production"
The following screenshot shows the practically creating a namespace imperatively with kubectl create command.
Kubectl create - Creating ServiceAccount Resource
A Kubernetes ServiceAccount is used as an identity for assigning to pods or applications. It enables the resources to interact with the Kubernetes API and access the resources within the cluster, while managing permissions through Role-Based Access Control (RBAC).
Syntax
kubectl create serviceaccount  <ServiceAccount_name>
Example
kubectl create serviceaccount "demo-user"
The following screenshot help you in creating the serviceaccount imperatively with kubectl create command.
Kubectl create - Creating Secret Resource
A Kubernetes Secret is a resource used to securely store the sensitive data such as passwords or API keys of the applications. It provides a proper way of management and distribution of confidential data to resources within the Kubernetes cluster.
Syntax
kubectl create secret  <Secret-Type>  <Secret-Name>
Example
kubectl create secret genric  "demo-user-secret"
The following screenshot help you in creating a secret resource of generic type imperatively with kubectl create command.
Usage of Kubectl Apply in Deploying K8S Resources
The kubectl apply command is a declarative way of deploying resources on a cluster using YAML manifest files.
Syntax
kubectl apply  (-f FILENAME | -k DIRECTORY)   [Options]
Example
We want to create a deployment with a ReplicaSet and 2 pods in it and let's say we use the manifest file "deployment.yml" as shown in the below
apiVersion: apps/v1
kind: Deployment
metadata:
name: demo-deployment-yaml
labels:
type: deployment
spec:
replicas: 3
selector:
matchLabels:
type: pods
template:
metadata:
name: demo-pod
labels:
type: pods
spec:
containers:
- name: nginx-pod
image: nginx
The following is the command that is used to create the resources in these manifest files:
kubectl apply -f <ManifestFile-Name>
The following screenshot shows the creation of deployment resource with kubectl apply command.
Upon making any changes to the manifest file, you can re-run the command and it will make the required changes to the resources in the Kubernetes Cluster through checking the current state of the resources and desired state of the resources.
The following Screeenshot shows the updating the deployment resource replicas from 3 to 5 with kubectl apply command.
Difference Between Kubernetes Create and Kubernetes Apply
The following are the main difference between kubernetes create and kubernetes apply
| Features | `kubernetes create` | `kubernetes apply` | 
|---|---|---|
| Usage | It follows imperative approach in deploying the k8s resources. i.e., executing commands explictly | It follows declarative approach in deploying and configuring k8s resources. i.e., Running through configuration files interpretation. | 
| Updating Resources | It generates error if trying to execute already exist resources. | It facilitates idempotent nature, updating configuration of resources and creating new resources. | 
| Workflow | It is used ideally for one time of resource creation in kubernetes cluster. | It can be used for existing resource management, configuring updates through yaml file. | 
| Idempotence | Not idempotent Nature. It raises error on trying to create existing resources. | It has idempotent nature. It only do changes new resources, updates. You can execute resource definition multiple times safely | 
| Changes Handling | It does not automatically handle the changes of resources. | It automatically handles the updates and resource changes. | 
Conclusion
The selection of command usage either `kubectl create` or `kubectl apply` in Kubernetes management of resources depends on the your decision of following imperative and declarative approaches. The Imperative approach with `kubectl create` facilitates sequential control step by step that will be suitable for manual resource manipulation. Conversely, the declarative approach with `kubectl apply` provides the efficiency and the automation of the desired state of resources in Yaml files. The declarative approach in k8s automatically determines and executes the necessary actions required for the desired state. The selection of approach for using these commands depends on the desired level of control while deploying and managing the resources within a Kubernetes cluster.
