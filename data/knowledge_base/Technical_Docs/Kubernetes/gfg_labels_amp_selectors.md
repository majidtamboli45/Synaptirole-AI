# Labels and Selectors in Kubernetes

> Source: https://www.geeksforgeeks.org/devops/kubernetes-labels-selectors/

Labels are key/value pairs that you attach to Kubernetes objects like Pods, Deployments, and Services. They are the primary way to organize your resources. Common examples of labels include:
- app: web-server
- tier: frontend
- environment: development
- release: stable
Working with Labels
1. Create a Pod with Labels Save the following manifest as labeled-pod.yaml. We are attaching three distinct labels to this Pod in the metadata.labels section.
apiVersion: v1
kind: Pod
metadata:
name: web-server-pod
labels:
app: nginx
tier: frontend
environment: development
spec:
containers:
- name: nginx-container
image: nginx
Apply the manifest to create the Pod:
$ kubectl apply -f labeled-pod.yaml
2. Viewing Labels You can view the labels of your Pods using the --show-labels flag.
$ kubectl get pods --show-labels
Output:
NAME             READY   STATUS    RESTARTS   AGE   LABELS
web-server-pod 1/1 Running 0 30s app=nginx,environment=development,tier=frontend
To view specific labels as columns, use the -L flag.
$ kubectl get pods -L app,environment
3. Adding and Modifying Labels You can easily add or update labels on an existing object using the kubectl label command. Let's add an owner label.
$ kubectl label pod web-server-pod owner=admin
Verify the new label was added:
$ kubectl get pods --show-labels
To update an existing label, you must use the --overwrite flag.
$ kubectl label pod web-server-pod environment=staging --overwrite
What are Selectors?
If labels are the sticky notes you put on objects, Selectors are how you find and filter those objects based on the notes. Selectors are used extensively in Kubernetes to define which Pods a Service should target, which Pods a Deployment should manage, and more.
There are two types of selectors:
- Equality-Based: The most common type. It filters based on exact key and value matches. The operators are = ,== , and!= .
- Set-Based: More flexible. It filters based on whether a key's value is in a set of values. The operators are in ,notin , andexists .
Hands-On: Using Selectors
To make this interesting, let's create two more Pods. db-pod.yaml:
apiVersion: v1
kind: Pod
metadata:
name: database-pod
labels:
app: postgres
tier: backend
environment: development
spec:
containers:
- name: postgres-container
image: postgres
api-pod.yaml:
apiVersion: v1
kind: Pod
metadata:
name: api-pod
labels:
app: user-api
tier: backend
environment: production
spec:
containers:
- name: api-container
image: gcr.io/google-samples/hello-app:1.0
Apply both files: $ kubectl apply -f db-pod.yaml -f api-pod.yaml
Now, let's query these Pods using selectors with the -l flag.
1. Equality-Based Selection Find all Pods in the development environment.
$ kubectl get pods -l environment=development
Find all Pods that are part of the backend tier.
$ kubectl get pods -l tier=backend
You can also combine selectors with a comma. Find the Pod that is both backend and production.
$ kubectl get pods -l 'tier=backend,environment=production'
2. Set-Based Selection Find all Pods in either the development or staging environment.
$ kubectl get pods -l 'environment in (development,staging)'
Find all Pods that do not have the tier label set to frontend.
$ kubectl get pods -l 'tier notin (frontend)'
Find all Pods that have an app label, regardless of its value (the exists operator).
$ kubectl get pods -l 'app'
