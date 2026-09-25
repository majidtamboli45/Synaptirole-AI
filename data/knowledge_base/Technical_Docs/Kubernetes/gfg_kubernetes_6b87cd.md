# Kubernetes Nodes

> Source: https://www.geeksforgeeks.org/devops/kubernetes-node/

Kubernetes Nodes are the Worker or master machines where the actual work happens. Each Kubernetes node has the services required to execute Pods and is controlled by the Control Plane. Each Kubernetes Node can have multiple pods and pods have containers running inside them. 3 processes in every Node are used to Schedule and manage those pods.
- Container runtime: A container runtime is needed to run the application containers running on pods inside a pod. Example: Docker.
- kubelet: kubelet interacts with both the container runtime as well as the Node. It is the process responsible for starting a pod with a container inside.
- kube-proxy: It is the process responsible for forwarding the request from Kubernetes Services to the pods. It has intelligent logic to forward the request to the right pod in the worker node.
What is Kubernetes?
Kubernetes is an open-source Container Management tool that automates container deployment, container scaling, descaling, and container load balancing (also called a container orchestration tool). It is written in Golang and has a vast community because it was first developed by Google and later donated to CNCF (Cloud Native Computing Foundation). Kubernetes can group ‘n’ number of containers into one logical unit for managing and deploying them easily. It works brilliantly with all cloud vendors i.e. public, hybrid, and on-premises.
What is a Kubernetes Node?
A Kubernetes node is a single machine, either a physical server or a virtual machine, that runs the necessary components to execute and manage containerized applications. Each node contains the kubelet, a small service responsible for communicating with the Kubernetes control plane, and a container runtime like Docker to run the containers. Nodes also include the kube-proxy, which maintains network rules and allows for seamless communication between services within the cluster.
How Does A Kubernetes Pod Work?
A pod is the smallest unit that exists in Kubernetes. It is similar to that of tokens in C or C++ language. A specific pod can have one or more applications. The nature of Pods is ephemeral this means that in any case if a pod fails then Kubernetes can and will automatically create a new replica/ duplicate of the said pod and continue the operation. The pods have the capacity to include one or more containers based on the requirement. The containers can even be Docker containers.
The Pods in Kubernetes provide environmental dependencies which include persistent storage volumes which means it is permanent and is available to all pods in the said cluster and even configuration data that is required to run the container within the pod.
How Does A Kubernetes Node Work?
The primary work of the nodes is to facilitate the pods which are containing of containers. Nodes will be of two kinds worker node and master node depending on the roles assigned to them thy will be differentiated. Master node will take care of worker node and nodes will take care of pods.
There is no certain limitation for the worker nodes depending on the requirements of project you can have n no.of nodes and also it is recommended to have at-least two master nodes in case of any failure of one master node another will take the responsibility of managing the worker nodes. To know more about kubernetes architecture refer to Kubernetes – Architecture.
Kubernetes Node Name Uniqueness
In a kubernetes cluster two nodes shouldn't have same name it will leads to inconsistencies to the cluster when an objects are modified in the cluster. Kubernetes cluster assumes that the nodes with same will have same labels and same state and volumes. If the instance is updated then the node with same names will be very hard to find which node your currently talking about.
There are some assumptions for having the same node name for example if you are running the single pod in each node then it will not as issue to have same name to multiple pods.
Kubernetes Nodes Not Ready
To see the no.of nodes available in the kubernetes cluster you can use the following command.
kubectl get nodes
Status Of Kubernetes Nodes
- Ready: The node is running healthy where the scheduler can schedule the pods in that Node.
- NotReady: The node is not yet ready to run the pods. This occurs because of so many reasons some of them are some of them are like a network issue, a pod failure, or a kubelet error.
- Unknow: If the node is not responding to scheduler to schedule the pods. If the master node can't communicate with that node then then the status will be shown as unknow.
Self-registration Of Kubernetes Nodes
The node which is already available in the cluster or node which is going to be created newly should be register in the API server by that the master will starts too recognise the node which are available in the kubernetes cluster.
Instead of doing it manually it can be automated which is also a preferred way of doing. By default this self registration will be enabled in the kubernetes cluster kubelet will take will takes responsible for automatic registration.
Different Option For Self-registration Of Kubernetes Nodes
The following are the different options for self registratin of kubernetes Nodes:
- Aceses To Kubeconfig File: We can provide the path of kubeconfig file to the kubelet by which it can authenticate with the API server.
- Setting The Flag True: "--register-nodes" the default value is true when it is set to true kubelet will contact the API server and send the all the information to the node which is newly added and the API server creates node object in the kubernetes cluster and kubernetes scheduler will use the node objects to schedule the pods on nodes.
Manual Kubernetes Node Administration
Manual node administration in the kubernetes refer to the regestring the nodes maually with out any self registration of nodes there are certain commands to use to maually administer the nodes like following.
- kubectl create node
- kubectl delete node
- kubectl create node
- kubectl delete node
Things you should mention in the yaml file before create an object in kubernetes cluster are node name,labels and taints. To know more commands on kubectl refer to Kubernetes – Kubectl Commands. To control the the scheduling the pods on specific node you can use the taints and toleration or labels you contains the pods from scheduling the pods on certain nodes.
Kubernetes Node Status
- To view a Node's status and other information, use kubectl:
kubectl describe node <node-name>
- The following command illustrates on describing the kubernetes node:
- A healthy node is described by the JSON structure below:
"conditions": [
{
"type": "Ready",
"status": "True",
"reason": "KubeletReady",
"message": "kubelet is posting ready status",
"lastHeartbeatTime": <last heartbeat time>,
"lastTransitionTime": <last transition time>
}
]
Kubernetes Node Controller
To monitor the node in the cluster, Kubernetes has a collection of services that monitors the data on the basis of metadata. name. Kubernetes automatically registers the node if the –register-node flag is true.
–register-node = true
- And to implement it manually, you need to set
–register-node = false
Resource Capacity Tracking
While self registering the node to the Kubernetes API node object will track information about the node resource capacity. Node report capacity means how many CPUs, how much memory avalible in the nodes.
Following are the resources will be tracked of an node while registering:
- CPU
- Memory
- Ephemeral storage
- Persistent storage
If the nodes doesn't have enough capacity to facilitate the pods then scheduler makes sure that the pod is not going to schedule on that particular node.
Kubernetes Node Topology
In kubernetes some pods are interdependent on the other like the statefullset applications in that cases we need to make sure the two pod are going to deploy on the same node in that cases you can use node topology.
You can assign the labels to the pods which will helps to schedule all the pods with the same name to a certain node which will helpful for the pods whose performance is co-related.
Sample YAML File For Node Topology
- The following is the yaml manefist file that regarding to node topology:
 apiVersion: v1
kind: Pod
metadata:
name: my-pod
spec:
containers:
- name: my-container
image: nginx
nodeSelector:
topology.kubernetes.io/zone: us-east-1a
- You should mention the node topology constrain.
Graceful Node Shutdown
Nodes can be shutdown in two ways one is graceful and another is forceful. Graceful node shutdown will give time to the pods which are running in the node to save there state after that they will be terminated gracefully with giving the intimation to shutdown instead of doing it abruptly.
The pods which are running on the nodes will be terminated forcefully if they are not going to terminate after graceful period also then the pods will terminate automatically if the pods are unresponsive.
Benefits of Graceful Node Termination
The following are the some of the benefits of graceful node termination:
- No Loss of Data: Ensuring that active processes and transactions complete without interruption helps prevent data corruption or loss, maintaining the integrity of the system.
- State Preservation: Pods are given time to save their state and clean up resources, ensuring that no critical information or processing state is lost when a node is shut down.
- Smooth Transition: By allowing ongoing tasks to finish and gracefully redirecting traffic to other nodes, service availability is maintained, minimizing the impact on end-users.
- Consistent System Behavior: Graceful termination helps avoid abrupt disruptions, ensuring a more predictable and reliable system operation, which is crucial for maintaining overall application performance and stability.
Non-Graceful Node Shutdown Handling
The pods which are running in the certain node will be terminated without gracefully shutdown. The kubelet CLI which is running on the node will not be given any notification to the pods running in that pod so pods will not any time to store the data and they can't retain the state of the pod.
In kubernets cluster Non-graceful termination is consider has an biggest issue because the pods which are containing the state-full application will not have any time to retain the state and also pod will automatically to the Terminating status which means the control will not have create an new pod in the node which is running in good condition.
Kubernetes Nodes vs Kubernetes Pods
The following are the differences between kubernetes nodes and kubernetes pods:
| Nodes | Pods | 
|---|---|
| Kubernetes node will allows one or more pods run on it. | Kubernetes pods will contains one or more containers which are schedule to run on the nodes. | 
| Node can be represented an virtual machine which allows you to run the kubernetes. | Pods will be used to run the containers on the nodes. | 
| The resources like CPUs, memory and storage will be provided by the nodes | The pods will use the all the resources from the nodes. | 
| If you are using kubernetes on any cloud then the nodes willbe taken care by the cloud its self or kubernetes will take care of the nodes. | Nodes will take care of the kubernetes pods. | 
Managing Kubernetes Nodes
Managing the Kubernetes nodes involves lots of tasks from deploying the new nodes to managing the existing nodes which help in maintaining the application in high availability to the end users below is the comprehensive overview of managing Kubernetes nodes.
- Provisioning and Deploying Kubernetes Nodes.
- Maintaining and Updating Kubernetes Nodes.
- Scaling Kubernetes Nodes for Performance and Availability.
Optimizing Kubernetes Node Performance
Kubernetes cluster performance can be increased by optimizing the resources used by the cluster nodes if the utilization of the resources is very high then the performance will go down slowly. You need to be more careful while scheduling strategies and optimizing container runtime parameters, you can greatly improve your Kubernetes cluster's speed.
Resource Utilization Optimization in Kubernetes
The following are the some of the resource utilization optimization steps in kubernetes:
- Container Packing: Efficiently placing containers on nodes to maximize resource usage and minimize costs.
- Resource Requests and Limits: Defining minimum and maximum resource usage for containers to ensure fair distribution and avoid resource contention.
- Eviction Policies: Mechanisms to gracefully terminate and reschedule pods when resources are scarce, maintaining cluster stability.
- Resource Monitoring: Continuously tracking resource usage to detect and address inefficiencies and bottlenecks.
Scheduling Strategies
The following are the scheduling strategies of the kubernetes node:
- Node Affinity and Anti-Affinity: Ensuring pods are scheduled on specific nodes (affinity) or kept apart (anti-affinity) to optimize performance and fault tolerance.
- Workload-Aware Scheduling: Placing workloads based on their specific resource and performance characteristics for better efficiency.
- Dynamic Scheduling: Adjusting pod placements in real-time based on current cluster conditions to maintain optimal resource utilization.
Container Runtime Tuning
The following are the some of the container runtime tuning:
- Container Runtime Configuration: Customizing settings of the container runtime (e.g., Docker) to enhance performance and efficiency.
- Image Optimization: Using smaller, optimized container images to reduce startup times and resource consumption.
- Container Runtime Updates: Regularly updating the container runtime to leverage performance improvements and security fixes.
- Runtime Memory Management: Fine-tuning memory allocation and management within the container runtime to optimize resource usage and application performance.
Securing Kubernetes Nodes
To stop the unauthorized access, vulnerabilities and potential attacks you need to secure your kubernetes cluster and containerized applications you can secure the kubernetes cluster with the help of following service that are offered by the kubernetes.
- Node Hardening and Vulnerability Management.
- Network Security and Access Control.
- Container Runtime and Security Considerations.
