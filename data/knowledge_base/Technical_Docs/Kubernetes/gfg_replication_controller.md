# Replication Controller

> Source: https://www.geeksforgeeks.org/devops/kubernetes-replication-controller/

A Replication Controller (RC) is a Kubernetes controller that ensures a specified number of Pod replicas are running at all times. Just like a ReplicaSet, its core job is to monitor its managed Pods and automatically create or terminate them to match a desired count. This provides a basic level of fault tolerance and scaling.
The core responsibilities of a Replication Controller are:
- Ensuring Availability: If a Pod managed by an RC fails, is deleted, or its node crashes, the RC will automatically create a new Pod to replace it, maintaining the desired replica count.
- Scaling: You can manually increase or decrease the number of running Pods by changing the replicas field in the RC's definition.
- Load Balancing: When used with a Kubernetes Service, an RC enables traffic to be distributed across its set of replica Pods.
Running an Example ReplicationController
Create a YAML file named rc-definition.yaml to define a Replication Controller.
apiVersion: v1
kind: ReplicationController
metadata:
name: myapp-rc
spec:
replicas: 3
selector:
app: myapp
template:
metadata:
labels:
app: myapp
spec:
containers:
- name: nginx
image: nginx
Explanation of the manifest:
- apiVersion: v1 : The Replication Controller is part of the corev1 API group.
- kind: ReplicationController : Defines the object type.
- metadata.name : The name of our Replication Controller.
- spec.replicas: 2 : We desire 2 running Pods.
- spec.selector : This is the equality-based selector. It will manage any Pod with the labelapp: nginx-web .
- spec.template : The Pod template used to create new replicas. Its labels must match theselector .
- Create the Replication Controller
kubectl apply -f rc-definition.yaml
- Verify its creation
kubectl get rc myapp-rc
# NAME DESIRED CURRENT READY AGE
# myapp-rc 3 3 3 15s
kubectl get pods
# NAME READY STATUS RESTARTS AGE
# myapp-rc-5j2x7 1/1 Running 0 25s
# myapp-rc-8b9vj 1/1 Running 0 25s
# myapp-rc-h4wz8 1/1 Running 0 25s
- Test Self-Healing
kubectl delete pod <one-of-your-pod-names>
- Scale the Replicas
kubectl scale rc myapp-rc --replicas=5
- Clean Up
kubectl delete rc myapp-rc
Labels on the ReplicationController
The labels which are used in the replication controller are the key-value pairs that can be attached to the resources and can be reused for recognizing the resources. Labels play a major role in the replication controller where you can identify and organize the pods. By using labels you can also manage the scheduling of pods to the required nodes.
Pod Selector
A pod selector will select the pods based on their labels. Pod selector works on the key/value pair where the selectors can be used in various Kubernetes resources like
- Replication controller.
- Deployments.
- Deamonset.
selector:
app: nginx
multiple labels can be used in pod selector you can separate them by using commas as the following.
selector:
app: web app
tier: frontend
Responsibilities of the ReplicationController
Repilcation Controller will make sure that the desired no.of pods that are created by using Replication Controller is matching.
- ReplicationController will balance the desired no.of pods with the pods which are running if not replication will generate the new pods to ensure the desired and running pods are matching.
- ReplicationController will delete the pods if the running is more than the desired count.
- The health of the pods is monitored by using the replication controller. If any pod failed in the health then the replication controller will replace thereby creating a new pod.
- It ensures that the desired number of pods is always running, even if some pods fail or are deleted.
Kubernetes Replication Controller vs Replica Set
| Replication Controller | Replica Set | 
|---|---|
| ReplicationController will maintain the pod lifecycle by making sure that the desired is matching with no.of pods running. | Replicaset is the next-generation of replication controller. | 
| A Replication Controller is a structure that enables you to easily create multiple pods, then make sure that that number of pods always exists. | A Replicaset is a structure that enables you to easily create multiple pods, then make sure that that number of pods always exists. | 
| Replication Controllers and PODS are associated with labels | ReplicaSet and PODS are associated with the selectors. | 
| The major difference between a ReplicaSet and a Replication Controller right now is the selector support. | ReplicaSet supports the new set-based selector requirements as described in the labels user guide whereas a Replication Controller only supports equality-based selector requirements. |
