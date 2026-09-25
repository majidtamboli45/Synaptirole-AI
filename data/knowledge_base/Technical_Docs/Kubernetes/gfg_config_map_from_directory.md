# Config Map From Directory

> Source: https://www.geeksforgeeks.org/devops/kubernetes-config-map-from-directory/

Pre-requisite:- Kubernetes
Software deployment, scalability, and administration are mostly automated using Kubernetes, an open-source container orchestration framework. K8s is another name for Kubernetes. Kubernetes was initially developed by Google and is now managed by the Cloud Native Computing Foundation. Despite the fact that it now supports CRI-O in addition to the Docker runtime, with which it was first designed to interact. The main objective of Kubernetes is to automate container management's operational tasks. It comes with built-in functions for rolling out required application modifications and for deploying applications. It is currently utilized by businesses including Google, Spotify, and Capital One.
ConfigMap:
Many applications depend on the configuration which is used during either application initialization and/or during runtime. Generally, there is a requirement to adjust values assigned to configuration parameters. ConfigMaps can be called the Kubernetes way to inject application pods with configuration data. ConfigMaps allow us to decouple configuration artifacts from image content and keep containerized applications portable.
Creating a ConfigMap from the Directory:
We can use either kubectl create configmap or a ConfigMap generator in kustomization.yaml to create a ConfigMap. Kubectl started to support kustomization.yaml since its 1.14 version.
we use the kubectl create configmap command to create ConfigMaps from directories or files.
$ kubectl create configmap <map-name> <data-source>
Here <map-name> represents the name we want to assign to the ConfigMap and <data-source> is the directory or file from which we draw data. A valid DNS subdomain name must be assigned to ConfigMap. We use kubectl describe or kubectl if we want to retrieve information about a ConfigMap.
We can use the command: "kubectl create configmap" to create a ConfigMap from multiple files in the same directory. If we create a ConfigMap based on a directory then Kubectl identifies fires whose base name is a valid key in the directory and then it packages each of the files into the new ConfigMap.
