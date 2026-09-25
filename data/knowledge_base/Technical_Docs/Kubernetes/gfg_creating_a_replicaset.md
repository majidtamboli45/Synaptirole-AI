# Creating a ReplicaSet

> Source: https://www.geeksforgeeks.org/devops/kubernetes-creating-a-replicaset/

A ReplicaSet is a Kubernetes controller whose primary purpose is to maintain a specified number of identical Pods called replicas. It acts as a self-healing mechanism, if a Pod fails, crashes, or is deleted, the ReplicaSet controller will immediately start a new one to bring the count back to the desired state. This ensures high availability and reliability for your applications.
Purpose of a ReplicaSet
The core function of a ReplicaSet revolves around ensuring application stability and scalability.
- High Availability: By maintaining a minimum number of running Pods, a ReplicaSet ensures that your application can survive node failures or Pod crashes. If one instance goes down, others are still available to serve traffic, preventing downtime.
- Load Balancing: When combined with a Kubernetes Service, a ReplicaSet allows you to distribute network traffic across its set of identical Pods. As you scale the number of replicas up or down, the Service automatically adjusts, ensuring efficient resource utilization.
- Scalability: You can easily scale your application by simply changing the replicas field in the ReplicaSet definition. The controller will automatically create or terminate Pods to match the new desired count.
How ReplicaSets Overcame Past Limitations
ReplicaSets are the direct successor to the older Replication Controller. The single most important improvement they offer is more expressive and flexible selectors.
- Replication Controllers use equality-based selectors. This means they can only match Pods that have the exact same key-value pairs in their labels (e.g., app: frontend ). This is quite restrictive.
- ReplicaSets use set-based selectors. This allows for more complex selection criteria. You can match Pods based on whether a label key exists, or if a key's value is within a specific set of values.
For example, a ReplicaSet can manage Pods where the environment label is either production or qa (environment in (production, qa)). This powerful selection capability makes ReplicaSets far more versatile for managing complex application deployments.
Example
apiVersion: apps/v1
kind: ReplicaSet
metadata:
name: nginx-replicaset
spec:
replicas: 2
selector:
matchLabels:
app: nginx-rs-pod
matchExpressions:
- key: env
operator: In
values:
- dev
template:
metadata:
labels:
app: nginx-rs-pod
env: dev
spec:
containers:
- name: nginx
image: nginx
ports:
- containerPort: 80
Non-Template Pod Acquisitions
You need to make sure that the selectors which are mentioned in the replicaset don't match other pod labels. ReplicaSet has the ability to acquire pods that are not created by itself as long as the selector doesn't match other pod labels. This is known as non-template pod acquisitions.
Example
apiVersion: apps/v1
kind: ReplicaSet
metadata:
name: 1st-replicaset
spec:
podSelector:
matchLabels:
app: Web-app
replicas: 5
Replicaset will acquire the pods which are having the same label as mentioned in the manifestfile. It will manage all the pods and monitor all the pods with the same labels.
Working with ReplicaSets
Step 1: Create a YAML file that defines the ReplicaSet. This file should include the number of replicas you want, the container image to use, and any other desired properties such as environment variables or resource limits.
To create the ReplicaSet, you can use the kubectl create command and pass it to the YAML file as an argument:
$ kubectl create -f replicaset.yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
name: <RSName>
spec:
replicas: <noOfPODReplicas>
selector: # To Match POD Labels.
matchLabels: # Equality Based Selector
<key>: <value>
matchExpressions: # Set Based Selector
- key: <key>
operator: <in/not in>
values:
- <value1>
- <value2>
template:
metadata:
name: <PODName>
labels:
<key>: <value>
spec:
- containers:
- name: <nameOfTheContainer>
image: <imageName>
ports:
- containerPort: <containerPort>
Writing a ReplicaSet manifest
- The apiVersion field specifies the version of the Kubernetes API that the object is using.
- The kind field specifies the type of object that this file represents. In this case, it is a ReplicaSet.
- The metadata field contains metadata about the ReplicaSet, such as its name.
- The spec field contains the specification for the ReplicaSet. It includes the following fields:
  - replicas: the number of replicas of the pod that should be running at any given time
  - selector: a label query that determines which pods should be managed by the ReplicaSet
- template: the pod template that will be used to create new pods when the ReplicaSet needs to scale up or down. The template field contains the following fields:
  - metadata: metadata for the pod
  - spec: the specification for the pod. The spec field for the pod includes a containers field, which specifies the containers that should be run in the pod. In this case, there is a single container named my-app that is based on the my-app: latest image and exposes port 80.
Step 2: Create a ReplicaSet using the configuration in replicaset.yaml
$ kubectl create -f gmemegen_deployment.yaml
Step 3: Verify that the ReplicaSet was created
$ kubectl get replicasets
Step 4: View the ReplicaSet in more detail
$ kubectl describe replicaset my-replicaset
Deleting a ReplicaSet and its Pods
Deleting a ReplicaSet
Replicaset can be deleted by using the following command:
kubectl delete rs <name of the replicaset>
Kubectl is a command line interface that will help you to connect to the kubernetes cluster and rs is the short name of replicaset.
Deleting The Pod
The pod can be deleted by using the following command.
kubectl delete pods --selector <key= pair>
You can delete the pod without deleting the replicaset by using the above command. If you want to update the pods then you need to delete the pod and then again redeploy it because the replicaset will not support the rolling updates of the pod.
Isolating Pods from a ReplicaSet
Pods can be isolated from the replicaset by changing the labels of the pods without matching the selectors of the replicaset. You can change the pod labels by performing the following steps:
Step 1: Select the pod which you need to be isolated. For that list all the pods
kubectl get pods
Step 2: Edit the pod labels which no longer match the replicaset selectors.
kubectl edit pod <Name of the Pod> Step 3: Apply the pod by using the following command.
Kubectl apply -f <name of the pod> Scaling a ReplicaSet
Scaling the replicaset can be done by using two methods.
- Manually by using the command.
- ReplicaSet as a Horizontal Pod Autoscaler Target.
Manually by using the command
You can scale the replicaset manually by changing the no.of replicas needed by using the following command.
kubectl scale rs <name of replicaset> --replicas=5
Kubectl is the command line interface tool used to communicate with the kubernetes cluster "scale rs" scale the replicaset and the name of replicaset and mentioned the no.of replicas is needed in the command the replicas will be scaled to 5 replicas.
ReplicaSet as a Horizontal Pod Autoscaler Target
Scaling of replicaset can also be done by using a resource called horizontal pod autoscaler. The pods will scale automatically when the threshold value of the pod CPU will reach the maximum value as mentioned in the manifest file it depends on our requirement based on the incoming traffic.
apiVersion: apps/v1
kind: ReplicaSet
metadata:
name: mavenwebapprc
namespace: test-ns
spec:
replicas: 2
selector:
matchLabels:
app: mavenwebapp
template:
metadata:
labels:
app: mavenwebapp
spec:
containers:
- name: mavenwebapp
image: dockerhandson/maven-web-application:1
ports:
- containerPort: 8080
metrics:
- type: Resource
resource:
name: cpu
targetAverageUtilization: 80
In the above yaml file, you can see the "targetaverageUtilization" which is 80 after the CPU utilization becomes 80 the HPA will automatically scale the pod replicas into the max replicas mentioned in the manifest file. In this case, the max replicas will be four.
Difference Between ReplicaSet and ReplicationController
| ReplicaSet | ReplicationController | 
|---|---|
| ReplicaSet is the next-generation Replication Controller. | Replication Controller is one of the key features of Kubernetes, which is responsible for managing the pod lifecycle. | 
| ReplicaSet will ensure that no.of pods running is matching the desired no. of pods in the Kubernetes cluster. | ReplicationController is responsible for making sure that the specified number of pod replicas are running at any point in time. | 
| ReplicaSet supports the new set-based selector requirements as described in the labels user guide whereas a Replication Controller only supports equality-based selector requirements. | Replication Controllers and PODS are associated with labels. | 
Difference Between ReplicaSet and DaemonSet
| ReplicaSet | DaemonSet | 
|---|---|
| ReplicaSet will ensure that no.of pods running is matching the desired no. of pods in the Kubernetes cluster on any node. | DaemonSet will ensure that each node has at least one pod of the application which we deployed. | 
| It is most suitable for applications like web applications which are stateless. | It is most suitable for the application which is stateful. | 
| If the pod is deleted automatically replicaset will automatically create a new copy of that pod. | When a new node is added to the cluster daemonset make sure a copy of the pod is added to that node. |
