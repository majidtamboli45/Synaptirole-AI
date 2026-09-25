# What is Kubernetes API ?Complete Guide

> Source: https://www.geeksforgeeks.org/devops/kubernetes-api/

Kubernetes API is an application that serves Kubernetes functionality through a RESTful interface and stores the state of the cluster via HTTP. Users can directly interact with the Kubernetes API or via tools like kubectl. It supports retrieving, creating, updating, and deleting primary resources via POST, PUT, PATCH, DELETE, and GET. Kubernetes resources are stored as API objects. The API allows configuration to be managed analytically. The core Kubernetes API is flexible and can also be extended to support custom resources.
What Is The Kubernetes API?
Kubernetes Cluster known as K8s. It comes with many frameworks which are essential for orchestrating the applications across mutliple servers in a containerization environment. With these kubernetes cluster setup, It helps in managing and customizing the resources such as kubernetes Pods, Services and containers work for efficient application deployment and operations. The API acts as kubernetes control plane managing the cluster operations by continuously monitoring, detecting the changes and dynamically managing those resources. Baseed on the demand and application requirements, it will allocates and reallocates the resources ensuring the optimal performance, scalability and fault tolerance.
Kubernetes API Terminology
The following are the Key kubernetes API terminologies:
- Pod: Pod is a smallest deployment unit and also known as fundamental units in kubernetes that represents a single running instance.
- Node: A worker machine is called as a Node in where containers are running. Each node hosts multiple pods.
- Cluster: A Cluster is a set of nodes that run containerized applications managed by the kubernetes Master. A kubernetes cluster may consist of several virtual or real computers.
- Namespace: A Namespace is a method of providing cluster resources among several users or programs. It facilitate with isolating the resources from one to another with giving a name of scope.
- Deployment: Deployment is a higher-level abstraction that helps in declarative definition of an application. It helps in managing the deployments and scaling of a set of pods.
- Service: It is an abstration resource in kubernetes that establishes a stable end point for accessing a group of pods. Service facilitates the communication between different set of pods.
- Replicaset: It is controller resource ensuring that a particular specified pod is running with the desired number of replicas. It is used for scaling and maintaining of pod replicas.
- Label: Labels are key-value pairs that are attached to kubernetes objects such as Pods. These are used for organizing and selecting different processes using specified key-values.
To know more refer this article - Kubernetes Architecture
Structure Of The Kubernetes API
The Kubernetes API comes with a structural hierarchy for organising the resources and operations within the kubernetes ecosystem. At its core, The API is structured around 3 main levels. They are
1. Cluster Level: It is at the higher level of structure that comes with resources that define the entire kubernetes cluster itself. The resources included in the level are Nodes, Namespaces, PersistentVolumes, CustomResourceDefinitions (CRDs).
2. Resource Level: The resource level API comes with focusing and managing the workloads and services running on the cluster. The resources included in this level are Pods, Services, Deployments, ReplicaSets and StatefulSets.
3. Extension Level: The Extension-level API helps in extending the kubernetes functionality with additional resources and capabilities. The resources included in this level are Ingresses, CustomResourceDefintions (CRDs)
How Does The Kubernetes API Work?
The kubernetes API acts as a central interface for managing the resources within the kubernetes cluster. It comes with providing various actions including CRUD operations and Watch operations for efficient control and management of the resources in the cluster. On using the API calls user can raise the request with operations he would like to perform such as create, Read, Update, Delete and Watch the resources. The operations can be performable on the resources such as Pods, Deployments, Services etc.. Lets discuss about the operations one by one effectively.
Creating A Kubernetes Resource
When Creating A Kubernetes resource such as Deployment, Pods. User can customize and define their needed specifications such as replica count, deployment strategy to use and name of the deployment resource. Creating the resource with Yaml file provides more flexibility and customization over definition the resource. The following is an example of creating a kuberetes resource Deployment.
Creating Kubernetes Deployment Resource | Example
apiVersion: apps/v1
kind: Deployment
metadata:
name: mydeployment
spec:
replicas: 3
selector:
matchLabels:
app: myapp
template:
metadata:
labels:
app: myapp
spec:
containers:
- name: mycontainer
image: nginx:latest
ports:
- containerPort: 80
Updating A Kubernetes Resource
For Updating the kubernetes resources, User has to specify or have to redefine their changes to respective resource name. For updating the resource we mostly the command `kubectl apply` for either through command line mode or through yaml file. K8s also offers with the option kubectl edit option to directly define resource. The following yaml file example illustrates about updating the kubernetes resource.
Kubernetes Resource Deployment Update | Example
apiVersion: apps/v1
kind: Deployment
metadata:
name: my-deployment
spec:
replicas: 5 # Updated number of replicas
template:
spec:
containers:
- name: my-container
image: nginx:1.21 # Updated container image version
ports:
- containerPort: 80
Now, run the below command for update the changes:
kubectl apply -f mydeployment.yaml
Deleting A Kubernetes Resource
Deleting a kubernetes resource such as Pods or Deployments can be performed through a straightforward using `kubectl delete` command following the resource type and name. The example command looks as follows
kubectl delete pods mypod
Here the kubectl make this as API request for performing delete operation and sends it to kube api-server in the master node and master node's controller resource delete that resource.
Watching A Kubernetes Resource
To watch a kubernetes resource, user can use the `kubectl get ` command following with resource type and name with flag `--watch`. The command as follows:
kubectl get pods --watch
This commands helps in continuously monitoring the specified resource with providing the real time updates and its status and any changes that occurs. Or else users can directly use the kubernetes API calls directly to implement more customized watch functionalities.
How To Access Kubernetes API?
In accessing the kubernetes API, developers mostly follow up 2 methods such as kubectl and direct access via REST API. The kubectl command line tool facilitates in providing a user-friendly interface for interacting with the kubernetes cluster, configuring the settings and retrieving the information. The following the two approaches of acessing kubernetes API. The approaches of access kubernetes API as follows:
1. Using Kubectl
2. Direct Access With REST API
Using Kubectl
The kubectl command serves as main interface of accessing the kubernetes API. The command `kubecl command view` provides the information regarding the cluster configurations including its location and credentials.
kubeclt config view
Direct Access With REST API
The alternative way accessing the REST API is the direct way of accessing the kuberentes API. This method of approach is the straight forward approach to interact with the API server. The following ar the methods of accessing the REST APIs of kubernetes.
Methods Of Accessing REST APIs Of Kubernetes
If you want to access the REST API with an HTTP client like curl or wget, or a browser, there are multiple ways:
1. kubectl Proxy Mode: Ensuring API Server Identity
- Run kubectl in a proxy mode to ensure the identity of the API server.
- This method is recommended since it uses the stored API server location and verifies the identity using a self-signed cert.
- Eliminating the risk of Man-In-The-Middle (MITM) attacks is possible by using this method.
2. Go And Python Client Libraries: Enhancing Access
- Using Go or Python client libraries provides the effective programmatic access to the kubernetes REST API.
- Implement the accessing with kubectl in proxy mode.
- This works with client code that address the potential confusions by proxies.
- To protect against man-in-the-middle attacks, you'll need to import a root cert into your web browser.
3. Using Curl, Get Or Browser For Direct Access
- Use the web browsers or HTTP clients such as curl or wget for accessing kubernetes REST APIs directly.
- Make sure of secure accessing by considering the above methods.
Understanding Of Kubernetes API Groups
In kubernetes, API Groups are the way of organizing and categorizing of resources. They come with a method of classifying the resources with similar features or attributes. The following are the key details of kuberentes AP groups.
- Logical Organization Of Resources: API groups facilitates the logical organization of the resources based on their functionalities or purposes. The API group shares the common prefix in their names, making to easier understanding and managing of related components.
- Scalability And Extensibility: API groups helps the kubernetes to be more scalable and extensible by making relevant resource into groups. kubernetes provides the modular and scalable architecture facilitating new resources allowing to add within the specific API groups without effecting the core functionalities of existing resources.
- Custom Resource Definitions ( CRDs ): Custom Resource Definitions (CRDs) are created and managed in large part by API groups. By establishing the custom resources inside the API groups, users can add domin specific functionalities extending the capabilities of Kubernetes API. It helps in customization of fuctionalities meeting to the specific requirements of various projects or applications.
Examples Of API Groups
The following are the some of the common examples of the API groups in Kubernets:
- Core API Group ( `/api/v1` ): This API group contains the fundamental resources like Pods, Resources and Nodes.
- Apps API Group ( `/apis/apps/v1` ): This includes the resources such as Deployments, StatefulSets and DaemonSets looking on high-level application management.
- Batch API Group ( `/apis/batch/v1` ): It contains the resources like Jobs and CronJobs specifically designed for batch programming.
Understanding Of Kubernetes API Versioning
Versioning of kubernetes API is essential for controlling platform's continuous development ensuring seamless integrations and operations. The following are the key points signifying the kubernetes API versioning:
- Compatibility Assurance: Kubernetes API Versioning is a mechanism that is designed to ensure of making different components work together. Kubernetes provides a seamless interactions through out the ecosystem by supporting coexistence of tools and applications developed with different API releases by multiple versions.
- Easy Upgrades And Transitions: API versioning plays an essential role in seamless upgrading the kubernetes Clusters. It makes the smaller possible modifications allowing clusters to run with multiple versions simultaneously. This approach minimizes the disruptions, making easier of usage for adopting to newer releases.
- Resource Definition Evolution: API Versioning is essential for controlling kubernetes resource definition changes over the time. Versioning of the API allows in introducing new features and modifications for existing resources while preserving backward compatibility of kubernetes.
- Client-Side Adaptability: Kubernetes clients tools like kubectl and custom applications facilitates in adjusting various API versions by adapting to different servers versions. This flexibility improves the seamless communication with kubernetes clusters running with various API versions smoothly and efficiently.
Understanding and efficient management of kubernetes API versioning is important for administrators, developers and operators to maintain a robust kubernetes deployment. It facilitates the users to enhance the capabilities of platform and easily adjust to changing environment.
Accessing Clusters Using The Kubernetes API
Step 1: Initiating Kubectl Proxy
- Launch the kubernetes API proxy effortlessly using the following command.
- This sets up a local server for serving on port 127.0.0.1:8001
$ kubectl proxy &
Step 2: Accessing The Dashboard
- Open your browser and navigate to 127.0.0.1:8001
- On Navigating to 127.0.0.1:8001 you will instantly gain the access to the kubernetes dashboard for simplified cluster management.
Step 3: Direct API Access
- Now we can access any sector via port URL.
- For example, To access the APIs app sector use the following URL:
127.0.0.1:8001/apis/apps/v1
Step 4: Maximizing Efficiency
- This method simplifies the administration and exploration of cluster resources by facilitating users quickly access to different Kubernetes API sections.
- Navigating and communicating with your kubernetes cluster via API becomes effortless with these steps.
Uses Of Kubernetes API
The following are the uses of kubernetes API:
- Resource Management: Developers users the Kubernetes API to performs the CURD operations (Create, Update, Read and Delete ) the resources such as Pods, Deployments, Services etc.. for efficient management of applications and infrastructure in the kubernetes cluster.
- Cluster Configuration: Using Kubernetes API, administrators will do cluster wide configuration settings with resources such as network policies, access controls, and persistent storage configurations for optimizing the performance and enhancing the security across the cluster.
- Monitoring And Logging: For the trouble shooting and management of resource usage effectively kubernetes API provides access for developers and users with cluster metrics, logs and events.
How To Enable Kubernetes API?
For the enablement of kubernetes API, you have to configure the kubernetes configuration file and have to expose the kbuerentes API-Server securely. In General adminstrators can accomplish by specifying the appropriate flags and customizing the settings at time of initializing the kubernetes cluster. For the enablement of kubernetes API the considerations includes such as defining the API's server, port and authentication mechanisms such as tokens or certificates. Once the configuration of kubernetes is done, then accessing of kubernetes API becomes easy with enabling users to interact with the cluster for managing of resources and perform the operations on resources. In general when you executing commands with kubectl also the same mechanism takes place by converting the command line commands into api calls.
The API And Kubernetes Operator
In kubernetes, The kubernetes operator is a method of packaging, deployment and management of application by providing extra more facilities, features with Kubernetes API via kubectl tooling. It act as a specialized controller with extending the kubernetes capabilities in handing the application's lifecycle automatically. It provides seamless, streamlined management for complex software instanes ith unparalleled efficiency.
API Discovery
API Discovery is the crictal aspect in the modern software devlopment to facilitates with systems to dynamically identify and interact with available APIs. It deals with mechanisms of discovering, exploring of endpoints, operations exposed by various API within a system network. Through API Discovery, developers can effectively integrate and manage the external services, frameworks in accelerating the development cycles.
API Groups And Versioning
API Groups and Versioning are essential in management of APIs effectively. API Groups facilitates with providing the logical grouping mechanism to related resources within an API. On the other hand, Versioning helps in evolving the APIs over the time maintaining back compatibility. Through using Versioning API, developers can able to introduce new features and improvements without changing existing one. Together API Grouping and versioning ensure the flexibility and scalbility with evolution of software systems.
Conclusion
In Conclusion, Kubernetes serves as a platform for controlling kuberentes cluster resources using RESTful interface. It support the direct interaction of cluster resources with the help of tools like kubectl. Kubernetes API Groups and Versioning facilitates the logical organization, scalability, and compatibility assurance for evolving kubernetes environments. Efficient accessing methods such as kubectl proxy mode and client libraries simplifies the cluster management. Overall API versioning and its access management facilitates the reliable and adaptable kubernetes deployment on meeting the containerization needs.
