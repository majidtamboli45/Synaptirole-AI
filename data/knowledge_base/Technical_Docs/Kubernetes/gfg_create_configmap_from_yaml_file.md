# Create ConfigMap From YAML File

> Source: https://www.geeksforgeeks.org/devops/kubernetes-create-configmap-from-yaml-file/

A ConfigMap is a dictionary consisting of non-confidential data. Its primary role is to keep the configuration separate from the container image. ConfigMap can be created in different ways. This article will cover the declarative approach to creating ConfigMap from the YAML file.
Example:
- apiVersion: This specifies which version of Kubernetes API we use to create the resource object.
- kind: The kind of resource we're building (ConfigMap here). Other types include Pod, Deployment, Secret, etc.
- metadata: This specifies the data that helps uniquely identify the object. Metadata contains the name of the ConfigMap and the namespace in which it should be created. If a namespace is not specified, it's created in the default namespace. We can specify additional metadata fields like labels.
- data: Data specifies the dictionary containing key-value pairs.
Step 1. To create a Kubernetes ConfigMap object from the config.yaml file above, run the following command.
$ kubectl create configmap [configmap_name] [attribute] [source]
Depending on the source, the attribute will be:
- --from file (if the source is a file/directory)
- --from-literal (if the source is a key-value pair)
Step 2. To get more details about the created ConfigMap, run the following command.
$ kubectl describe configmap app-config
Output:
