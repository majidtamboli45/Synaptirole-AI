# Sidecar Container Pattern in Kubernetes

> Source: https://www.geeksforgeeks.org/devops/kubernetes-sidecar-container-logging/

A DaemonSet is a workload object that ensures a copy of a Pod runs on all (or a specific subset of) nodes in a cluster. When a new node joins the cluster, the DaemonSet controller automatically deploys the Pod to it. When a node is removed, the Pod is garbage collected.
Why are DaemonSets Needed?
DaemonSets are essential for deploying cluster-wide, node-level services. Common use cases include:
- Log Collection: Running a log collector agent like Fluentd or Logstash on every node to gather logs from all other Pods.
- Node Monitoring: Deploying a monitoring agent like Prometheus Node Exporter or the Datadog Agent on every node to collect node-specific metrics (CPU, memory, disk).
- Cluster Storage & Networking: Running daemons for cluster storage solutions (like Ceph or GlusterFS) or CNI network plugins (like Calico) on each node.
Deploying a Simple DaemonSet
Save the following as node-monitor-ds.yaml.
apiVersion: apps/v1
kind: DaemonSet
metadata:
name: node-monitor-daemonset
spec:
selector:
matchLabels:
app: node-monitor
template:
metadata:
labels:
app: node-monitor
spec:
containers:
- name: monitor-agent
image: busybox
# This command simulates an agent running forever
command: ["/bin/sh", "-c", "while true; do echo 'Monitoring node...'; sleep 10; done"]
$ kubectl apply -f node-monitor-ds.yaml
Now, check the status of the DaemonSet and list the Pods it created
$ kubectl get daemonset$ kubectl get pods -o wide
Init Containers
An Init Container is a special container that runs to completion before the main application containers in a Pod are started. You can have multiple Init Containers, and they will run sequentially—the second one will not start until the first one has finished successfully.
Need of Init Containers
Init Containers are perfect for handling prerequisite tasks that must be completed before your main application starts.
- Delaying App Startup: An Init Container can poll a database or another service and wait until it's available before allowing the main app to start.
- Pre-computation or Setup: They can be used to prepare configuration files, run database schema migrations, or download necessary data into a shared volume.
- Permissions: An Init Container can run with elevated permissions to set up storage volumes or network settings that the main, less-privileged application container will use.
Kubernetes Sidecar Container
A Kubernetes sidecar container is simply another container that will coexist with the primary application container in a pod.
- The sidecar container pattern adheres to separating concerns while isolating portions of an application.
- Most of the time, the major application container holds the primary business logic or application code, and the sidecar container works as a supporting container that complements the functionality or service of the primary container.
How do nodes handle container logs?
- A container runtime processes and redirects any output to a containerized application's stdout and stderr streams.
- Different container runtimes implement this differently, however, the integration with the kubelet is standardized as the CRI reporting format.
- By default, when a container restarts, the kubelet saves one terminated container and its logs.
- When a pod is evicted from a node, all connected containers, including their logs, are removed.
- Clients can access logs from the kubelet using a unique Kubernetes API capability.
- The standard method for accessing this is to execute kubectl logs.
Benefits of using Kubernetes sidecar containers
- Improve security: Sidecar containers can handle authentication, authorization, and encryption, isolating these characteristics from the application.
- Favor reusable components: You may reuse sidecar containers across different applications.
- Improve functionality: A sidecar container, for example, can perform logging, monitoring, or configuration management chores, letting developers focus on the application logic while using it for additional functions.
- Enhance integrations with third-party technology: Sidecars provides easy integration with third-party services, such as databases, caching services, or messaging systems, without embedding these connections directly within the application.
Implementation of Kubernetes sidecar container logging
Below is the step-by-step implementation of Kubernetes sidecar container logging:
Step 1: Create the Kubernetes Manifest
First, you have to make a file called pod-with-sidecar. yaml and fill it with the information below.
apiVersion: v1
kind: Pod
metadata:
name: my-app-pod
spec:
containers:
- name: main-app
image: your-main-app-image
volumeMounts:
- name: shared-logs
mountPath: /var/log/myapp
# Ensure the app writes logs to /var/log/myapp
- name: log-collector
image: fluent/fluentd:v1.12-1
volumeMounts:
- name: shared-logs
mountPath: /var/log/myapp
resources:
limits:
memory: "200Mi"
cpu: "100m"
env:
- name: FLUENTD_ARGS
value: "--no-supervisor -q"
- name: FLUENTD_CONF
value: "fluent.conf"
volumes:
- name: shared-logs
emptyDir: {}
Step 2: Configure the Fluentd Configuration
Then, Make a fluent.conf configuration file for Fluentd and fill it with the following information.
<source>
@type tail
path /var/log/myapp/*.log
pos_file /var/log/fluentd.pos
tag myapp.*
format none
</source>
<match myapp.**>
@type stdout
</match>
Step 3: Deploy the Pod
You can then run the pod using Kubectl in the following step.
kubectl apply -f pod-with-sidecar.yaml
Output:
Step 4: Update the Pod Manifest
To mount the ConfigMap, you have to update pod-with-sidecar. yaml.
apiVersion: v1
kind: Pod
metadata:
name: my-app-pod
spec:
containers:
- name: main-app
image: your-main-app-image
volumeMounts:
- name: shared-logs
mountPath: /var/log/myapp
- name: log-collector
image: fluent/fluentd:v1.12-1
volumeMounts:
- name: shared-logs
mountPath: /var/log/myapp
- name: fluentd-config
mountPath: /fluentd/etc
resources:
limits:
memory: "200Mi"
cpu: "100m"
env:
- name: FLUENTD_ARGS
value: "--no-supervisor -q"
- name: FLUENTD_CONF
value: "fluent.conf"
volumes:
- name: shared-logs
emptyDir: {}
- name: fluentd-config
configMap:
name: fluentd-config
Step 5: Check Pod Status
Next, you must verify the pod is operational.
kubectl get pods
Output:
Step 6: Inspect Logs from Fluentd
Lastly, you can see the logs that Fluentd generated.
kubectl logs my-app-pod -c log-collector
Output:
