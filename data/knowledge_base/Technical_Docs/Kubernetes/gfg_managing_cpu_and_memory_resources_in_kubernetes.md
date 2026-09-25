# Managing CPU and Memory Resources in Kubernetes

> Source: https://www.geeksforgeeks.org/devops/managing-cpu-and-memory-resources-in-kubernetes/

Managing the CPU and memory resources in Kubernetes is not an easy task. CPU and memory resources define how much processing power and RAM a container can access within a cluster. Proper management helps maintain performance, avoid resource contention, and reduce infrastructure waste.
- CPU requests determine the CPU share a Pod receives when multiple containers compete for resources.
- Pods with higher CPU requests are allocated more CPU time than those with lower requests on a node under contention.
- Over-provisioning limits may lead to wasted resources, while under-provisioning requests can cause throttling or Pod eviction.
- Efficient management improves container performance and ensures consistent operation.
Ensuring Efficient Resource Utilization in Kubernetes
Efficient resource utilization ensures that cluster resources are allocated effectively and workloads remain performant.
Some Strategies include:
- Use ResourceQuotas: Limit total CPU and memory usage at the namespace level to prevent any team or application from over-consuming resources.
- Implement Horizontal Pod Autoscaler (HPA): Automatically scale Pods based on CPU or memory usage.
- Monitor Resources: Use Metrics Server, kubectl top , or tools like Prometheus and Grafana to track usage.
- Avoid Over-Provisioning: High limits can lead to wasted resources, while low requests can cause throttling or scheduling failures.
- Example: A request of 1 CPU and a limit of 2 CPUs ensures a container always has at least 1 CPU and can scale up to 2 CPUs if needed.
Understanding CPU and Memory in Kubernetes
- CPU Requests: Minimum CPU a container needs for stable operation. The scheduler uses this to assign the Pod to an appropriate node.
- CPU Limits: Maximum CPU a container can use. If exceeded, the container is throttled.
- Memory Requests: Minimum memory required for a Pod to function reliably.
- Memory Limits: Maximum memory a container can use. If exceeded, the Pod may be terminated by the kernel’s OOM (Out-Of-Memory) system.
Timing CPU and Memory Management in K8s
- Multi-tenant environments: In scenarios where Kubernetes serves numerous tenants (different teams or applications sharing the same cluster resources), CPU limitations prevent any single tenant from consuming disproportionate CPU resources.
- Benchmarking: Benchmarking is running the application under multiple operating circumstances to determine the real CPU use across different states of application load.
- Predictability: CPU limitations improve the predictability of program performance by assuring a consistent allocation of CPU resources. This stability is critical for applications.
Implementation of Managing CPU and Memory Resources in Kubernetes
Here is the step-by-step procedure for managing CPU and memory resources in Kubernetes:
Step 1: Create a Deployment with Resource Requests and Limits
First, you have to make sure to create a deployment YAML file. yaml.
apiVersion: apps/v1
kind: Deployment
metadata:
name: resource-demo
spec:
replicas: 2
selector:
matchLabels:
app: resource-demo
template:
metadata:
labels:
app: resource-demo
spec:
containers:
- name: demo-container
image: nginx
resources:
requests:
cpu: "500m"
memory: "256Mi"
limits:
cpu: "1"
memory: "512Mi"
Step 2: Check Resource Requests and Limits
Next, you need to verify the deployment specifics.
kubectl describe deployment resource-demo
Output:
Step 3: Create an HPA Resource
Now you must have the same file to generate the YAML file hpa. yaml.
apiVersion: autoscaling/v2beta2
kind: HorizontalPodAutoscaler
metadata:
name: resource-demo-hpa
spec:
scaleTargetRef:
apiVersion: apps/v1
kind: Deployment
name: resource-demo
minReplicas: 2
maxReplicas: 10
metrics:
- type: Resource
resource:
name: cpu
target:
type: Utilization
averageUtilization: 50
Apply the HPA:
kubectl apply -f hpa.yaml
Output:
Step 4: Check HPA Status
Then you have to check the HPA's current status.
kubectl get hpa
Output:
Step 5: Check Resource Quota Status
You can view the resource quota details.
kubectl get resourcequota
Output:
Step 6: Install Metrics Server and verify Node Resource Usage
Then you have to install the metrics server and also you need to verify Node Resource Usage.
kubectl top nodes
Output:
Step 7: Check Pod Resource Usage
Lastly, you can check which resource usage of pods in Kubernetes.
kubectl top pods
Output:
