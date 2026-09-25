# Node Affinity in Kubernetes

> Source: https://www.geeksforgeeks.org/devops/node-affinity-in-kubernetes/

Node affinity in Kubernetes refers to the ability to assign a Kubernetes pod to a specific node or group of nodes in a cluster based on specific criteria. A feature called node affinity is employed to guarantee that particular pods are located on particular nodes in a cluster. This facilitates better resource management and performance optimization of the application.
In Kubernetes, a node is a physical or virtual machine that controls one or more pods. Pods are the smallest deployable components in Kubernetes and are used to run containerized applications. With the use of node affinity, specific pods can be scheduled on particular nodes on the basis of a variety of factors, such as the node's CPU or memory capacity or its location within a particular region or data center.
What is Node Affinity?
Node Affinity in Kubernetes is a feature in Kubernetes that facilitates us to specify the rules for scheduling the pod based on the node labels. It facilitates providing a way for pod placement by expressing the requirements about the nodes where the pods should be scheduled. Node Affinity allows to expression of various conditions as preferred such as node attributes, and anti-affinity rules to avoid certain nodes and to have more complex label expressions for pod placement strategies.
What Are Node Labels?
Node Labels in kubernetes are key-value pairs to kubernetes nodes. It is used for describing the characteristics of nodes such as hardware capabilities, geographical locations, environment and other any metadata. These labels are used to organize and categorize the nodes on various factors like geo-locations, hardware resources etc.. Node labels are essential in kubernetes in scheduling the workloads on certain required nodes. It facilitates the user to define affinity or anti-affinity rules, node selectors and other scheduling constraints to control the pod distribution across the cluster. These Labels provides the flexible mechanism for grouping and targeting the nodes based on different criteria, with efficient resource allocation and management.
What Are the Types of Node Affinity in Kubernetes?
Required node affinity and Preferred node affinity. We use the required node affinity to specify which pod needs to be scheduled on which node. The node's CPU or memory capacity, location in a particular area or data center, or any other special label that the node has been given may all have an impact on this specification.
However, it is not a strict requirement. On the other hand, preferred node affinity is used to suggest that a pod should, whenever possible, be scheduled on a node that matches a specific label. If there are no nodes that match the preferred node, the pod can still be scheduled on different node affinity labels. The following are the types of Node Affinity:
1. RequiredDuringSchedulingRequiredDuringExecution
2. RequiredDuringSchedulingIgnoredDuringExecution
3. PreferredDuringSchedulingIgnoredDuringExecution
Types of Node Affinity
Based on node properties, Node Affinity is used to specify the scheduling preferences for pods. You can further categorize Node Affinity into Three types:
1.RequiredDuringSchedulingRequiredDuringExecution
This is a hard rule. The pod must be scheduled on a node that complies with the node affinity criteria If no nodes in the cluster satisfy the rule, then the pod will remain unscheduled. If the node labels are changed in the future the pod will be evicted.
affinity:
nodeAffinity:
requiredDuringSchedulingRequiredDuringExecution:
nodeSelectorTerms:
- matchExpressions:
- key: <label-key>
operator: In
values:
- <label-value>
In this case, the label key-value pair specified in the "nodeSelectorTerms" prevents the pod from being scheduled on nodes that do not have it.
2.RequiredDuringSchedulingIgnoredDuringExecution
This is the second hard rule. The pod will be scheduled only if the pod labels are matched with the node labels. If the node labels are changed in the future the pod will not be evicted.
affinity:
nodeAffinity:
requiredDuringSchedulingIgnoredDuringExecution:
nodeSelectorTerms:
- matchExpressions:
- key: <label-key>
operator: In
values:
- <label-value>
3. PreferredDuringSchedulingIgnoredDuringExecution
This is a soft rule. This specifies the primary way for scheduling a node for a pod in accordance with the node affinity rule. The pod will still be scheduled on a node that does not match with the rule if none of the cluster's nodes do. Below is the example of PreferredDuringSchedulingIgnoredDuringExecution:
affinity:
nodeAffinity:
preferredDuringSchedulingIgnoredDuringExecution:
- weight: 100
preference:
matchExpressions:
- key: <label-key>
operator: In
values:
- <label-value>
In this case, the pod will be scheduled on a node that has the label key-value pair specified in the "match expressions" section. If nodes do not meet this requirement, the pod will still be scheduled on a different node.
Node affinity is a powerful resource that may be used to improve Kubernetes cluster performance and resource usage, but it also has pros and cons. The following are some of the advantages and disadvantages of node affinity:
Difference Between Node Selector And Node Affinity
In Kubernetes, the concepts of node selector and node affinity are used to control the scheduling of pods onto the required cluster nodes.
- Node Selector: To choose which nodes the pods should be scheduled onto, use the Node Selector. To do this, a collection of key-value pairs that match labels on nodes are specified in the pod specification. Only nodes with labels that match the selector will have the pod scheduled onto them. When your cluster just has a few nodes and you want to make sure that particular pods are scheduled onto particular nodes based on their labels, Node Selector can be helpful.
- Node Affinity: A more quality method of defining how pods should be scheduled onto nodes is Node Affinity. It enables you to specify more complex rules based on node labels, such as requiring that the pod be scheduled onto a node with a particular label or one that meets certain criteria. You may also express anti-affinity via Node Affinity, which makes sure that pods are not scheduled into nodes with specific labels. When your cluster has a lot of nodes and you want more precise control over how pods are scheduled onto them, Node Affinity can be helpful.
So basically, Node Selector provides an easy method for choosing nodes based on labels, whereas Node Affinity offers more advanced capabilities for choosing and avoiding nodes based on complex rules.
Difference Between Pod Affnity vs Node Affinity
The following are the differences between Pod Affinity and Node Affinity:
| Criteria | Pod Affinity | Node Affinity | 
|---|---|---|
| Definitiion | It used for defining rules for Pods' affinity or anti-affinity with other pods. | It used for specifying the rules for pod scheduling based on the node labels. | 
| Scope | It used for applying pod scheduling decisions within the same node or across different nodes. | It used for influencing the pod scheduling decisions based on node labels. | 
| Flexibility | It offers the flexibility in definity affinity or anti-affinity rules between pods. | It provides the flexibility in expressing the preferences or requirements about the node attributes. | 
| Example | It co-locates the pods of same application on the same node for imporved locality. | It used for scheduling pods required GPU's only on node labeled with GPU resources. | 
| Control | It operates at the pod level, allowing fine-grained control over pod placement decisions. | It operates at the node level, influencing the pod scheduling based on node labels. | 
| Use Cases | It ensure co-location or anti co-location of related pods on the same or different nodes. | It sepcifies the rules for pod scheduling based on the node labels. | 
Advantages Of Kuberentes Node Affinity
The following are the advantages of kubernetes Node Affinity:
- Better Resource Utilization: Node affinity aids Kubernetes clusters in making better use of their resources by ensuring that pods are scheduled on nodes that have the necessary resources. The performance of the application can be improved in this way.
- Increased Control: Node affinity gives Kubernetes administrators more control over the placement of their pods, which can be extremely beneficial for applications that require specific hardware or network resources.
- Improved Availability: By ensuring that pods are scheduled on particular nodes or groups of nodes, node affinity can improve the availability of applications in Kubernetes clusters.
Disadvantages Of Kubernetes Node Affinity
The following are the disadvantages of kuberentes Node Affinity:
- Complexity: Node affinity can significantly increase the complexity of Kubernetes clusters, especially for administrators who are unfamiliar with the platform. It might be difficult to solve problems or maximize resource use as a result.
- Increased Overhead: Node affinity increases Kubernetes clusters' overhead costs by allowing for more configuration and maintenance than just letting the scheduler distribute pods as it sees fit.
- Limited Scalability: Node affinity can also limit the scalability of Kubernetes clusters due to its ability to scale up or down or add new nodes to the cluster. It might be difficult or time-consuming to add new nodes that meet the same criteria.
Difference of Pod Affinity, Intra-pod Affinity and Anti-Affinity
The following are the difference of pod affinity, Intra-pod affinity and Anti-Affinity:
| Feature | Pod Affinity | Intra-pod Affinity | Anti-Affinity | 
|---|---|---|---|
| Definition | It schedules the requirements of the pod that required for placing it on a same node or others | Affinity or Anti-Affinity rules within a single pod with specifying the preferences for co-location or avoid the co-location of containers. | It defines the rules to discourage co-location of the pods on the same node or within the same pod promoting the distribution across multiple nodes | 
| Use Case | Co-location of pods that belonging to related services to optimize the communication and resource utilization. | It ensure the certain containers within pod for scheduling together or apart based on their requirements or dependencies. | It prevents the single points of failures by spreading the pods across different nodes or containers within the same pod. | 
| Example | It scheduling pods of frontend and backend service on the same node helps in reducing the network latency. | It co-locates the containers withing a pod that requires the high-speed inter-process communication. | It avoids the scheduling multiple instances of a critical service on a single node for increasing fault tolerance. | 
| Kubernetes API | podAffinity | Not applicable | Pod Anti Affinity | 
How to Assign Pods to Nodes Using Node Affinity ? A Step-By-Step Guide
Assigning the pds to Nodes using the node affinity provides the control on which nodes our pods to be scheduled, based on the node labels. The following is the step by step guide for assigning the pods to nodes using node affinity:
Step 1: Firstly ensure that the kuberentes cluster is in running state with kubernetes master and worker nodes.
Step 2: Create label the nodes with their specifications so that we can make easier to deploy pods on where we want to deploy. The following command helps in setting the labels to the nodes.
kubectl label nodes <node-names> <label-key>=<label-value>
Step 3: Define the node affinity in Pod Yaml
- In you pod manefist file, try to define the node affinity rules under the spec section. The following is an example of Yaml code:
spec:
affinity:
nodeAffinity:
requiredDuringSchedulingIgnoredDuringExecution:
nodeSelectorTerms:
- matchExpressions:
- key: <label-key>
operator: In
values:
- <label-value>
Step 4: Apply the pod configuration
- After once defining the affinity rules save the yaml configuration file and apply it using the following command:
kubectl apply -f <file_name.yaml>
Step 5: Verify Pod Placement
- Verify on where the pod is placement on the Node with the following command;
kubectl get pods -o wide
Adding A Label to a Node
On adding the labels to the nodes provides to specify additional metadata to the node, which can be used for various purposes like node selection, scheduling and grouping.
- The following command is used for adding label to the node:
kubectl label nodes <node-name> <label-key>=<label-value>
- Verify the labels of the node with the following command:
# Add Label to Node
kubectl label nodes <node-name> <label-key>=<label-value>
Schedule A Pod Using Required Node Affinity
The following are the steps for sechule a pod using required Node Affinity:
Step 1: Identiy the Node Label
- Firstly identify the node on which you want to deploy the pod, know its node labels.
Step 2: Deine Pod Yaml
- Create a pod yaml manifest with the required node affinity specified rules under the spec section.
# Define Pod YAML with Required Node Affinity
apiVersion: v1
kind: Pod
metadata:
name: pod-with-required-affinity
spec:
affinity:
nodeAffinity:
requiredDuringSchedulingIgnoredDuringExecution:
nodeSelectorTerms:
- matchExpressions:
- key: <label-key>
operator: In
values:
- <label-value>
containers:
- name: example-container
image: nginx:latest
Step 3: Apply Pod Configuration
- After once configured and defined the affinity rules in the yaml manifest file save it and then apply the changes with the following command:
kubectl apply -f pod-with-required-affinity.yaml  Step 4: Verify Pod Placement
- Now, check the pod is scheduled on a node with the specified label using the following command:
kubectl get pods -o wide
Schedule a Pod Using Preferred Node Affinity
The following are the steps for scheduling the pod using preferred Node Affinity:
Step 1: Identify the Node Label
- Firstly identify the node on which you want to deploy the pod, know its node labels.
Step 2: Define Pod Yaml
- Create a pod manifest Yaml with preferred node affinity specified under the spec section.
# Define Pod YAML with Preferred Node Affinity
apiVersion: v1
kind: Pod
metadata:
name: pod-with-preferred-affinity
spec:
affinity:
nodeAffinity:
preferredDuringSchedulingIgnoredDuringExecution:
- weight: 1
preference:
matchExpressions:
- key: <label-key>
operator: In
values:
- <label-value>
containers:
- name: example-container
image: nginx:latest
Step 3: Apply Pod Configuration
- Using the following command you can apply the pod configuration:
kubectl apply -f pod-with-preferred-affinity.yaml
Step 4: Verify the Pod Placement
- Check the pod scheduled on a node with the specified labels using the following command:
kubectl get pods -o wide
Assigning Pods to Nodes
The following are the steps for assigning the pods to nodes:
Step 1: Label the Nodes
- Firstly Identify the node where you want to schedule th pods and provide the labels to the node with the following command:
kubectl label nodes node-1 environment=production
Step 2: Create Pod Yaml File
- Now, Create pod manefist file to schedule the pod on the specific labeled node. The pod manifest file looks as follows:
apiVersion: v1
kind: Pod
metadata:
name: my-pod
spec:
containers:
- name: my-container
image: nginx
affinity:
nodeAffinity:
requiredDuringSchedulingIgnoredDuringExecution:
nodeSelectorTerms:
- matchExpressions:
- key: environment
operator: In
values:
- production
Step 3: Apply Configuration
- Once, you configured the pod manefist file, use the following command to apply the configuration:
 kubectl apply -f pod.yaml
Step 4: Verify Pod Placement
- Check the pod is scheduled on the desired node using the following command:
 kubectl get pods -o wide
Command to See Existing labels of the Node
The following is the command used to see the existing labels of the Node:
kubectl get nodes --show-labels
Command to set New Labels to Node
The following is the command used to set the new labels to the Node:
kubectl label nodes <node-name> <label-key>=<label-value>
Example of NodeAffinity
You must include the selector rules in the pod's YAML definition file in order to use the node selector in Kubernetes. For example, the YAML file below defines a pod with a necessary node selector for nodes with the label "nginx"
In the following example, we have used the 'nodeSelector' parameter for showing the required node affinity for nodes that do have the label 'nginx'. This means that the pod will be scheduled on the nodes which contain this label.
Let's take another example of Node Affinity. For this, we will first create a deployment. The deployment will have the following features:
- name: Blue
- image: nginx
- replicas: 3
In order to create this deployment we can use two different approaches. However, for simplicity, we will use an imperative approach. We can create this deployment using the command:
- To check whether or not the deployment was created successfully, execute the command:
- We have two nodes in my cluster, the control plane, and node01.
- For this example, we want to Set Node Affinity to the deployment to place the pods on node01 only.
- Name of the deployment: blue
- Replicas: 3
- Image: nginx
- NodeAffinity: requiredDuringSchedulingIgnoredDuringExecution
- Key: color
- value: blue
- In order to achieve this, we will edit the deployment using:
- Once we are in we will add the following block of script on the same level of container:
- The specs of a Kubernetes object are specified in the "spec" field. It is used for defining the pod's affinity rules.
- The node affinity and all other scheduling preferences for the pod are mentioned in the "affinity" column. The preferences of the pod for the nodes on which it is scheduled are specified in the "node affinity" column.
- The nodeSelectorTerms requirements must be met for the pod to be scheduled, according to the "requiredDuringSchedulingIgnoredDuringExecution" parameter. The rules are ignored while the pod is being executed, thus if the node's labels change while the pod is running, it won't be rescheduled.
- The 'nodeSelectorTerms' field is used to define the requirements for a node to satisfy for scheduling. It has mentioned the 'matchExpressions' field in its instance.
- In this, we have used the 'matchExpressions' for specifying a set of label selectors to match with the labels specified on the node. We have used the operator 'In' and the corresponding values 'blue' are matching against the 'color' label key.
- Thus, this code directs that the pod be scheduled on nodes that have the label "color" and the value "blue" assigned to them.
- Once we have updated the file, We can see that the pods are running on node01. To check the configuration we should run the command:
As we can see that all the pods are deployed on the node01 node. In Conclusion, your Kubernetes clusters' performance and resource efficiency may be enhanced by using node affinity. Assuring that your pods are scheduled on nodes with the resources they require through the use of node affinity can help to reduce resource contention and enhance application performance.
