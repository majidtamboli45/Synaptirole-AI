# Create Config Map From Files

> Source: https://www.geeksforgeeks.org/cloud-computing/kubernetes-create-config-map-from-files/

Pre-requisite: Kubernetes
While creating a manifest file in Kubernetes, we can define environment variables. However, when you have a lot of manifest files, it will become difficult to manage the environment data stored in various manifest files. To overcome this issue, we can manage environment data centrally using ConfigMaps.
ConfigMaps are used to pass configuration data in the form of key-value pairs in Kubernetes. Let's say when a pod is created, ConfigMap is injected into that pod so that key-value pairs are available as environment variables for applications hosted inside the container in the pod.
There are two phases involved in configuring ConfigMaps:
1. Create ConfigMap Using Definition File:
You can use a definition/manifest file to create a ConfigMap and store environment variables. In the case of manifest files, we generally have a spec field whereas, in the case of a ConfigMap, we have a data or binary data field. The keys stored in the data field should not have a duplicate in the binary data field.
- Use a manifest file where we are creating a ConfigMap "app-config" with 2 environment variables "ENV" and "APP-COLOR".
- Using kubectl apply, we can create the manifest file on Kubernetes as shown in the image below.
- Using kubectl describe, we can see the environment variables within our ConfigMap.
- You can create ConfigMaps from a particular file as well using the kubectl create configmap command. Let's say we have a file migration.properties where we have our environment variables as shown in the image below
- We can use these properties files to create config maps using kubectl commands as shown below
- These files can also be represented under the data section of manifest files as shown in the image below
2. Inject ConfigMap in Manifest Files:
Now that we have the ConfigMap created, we need to inject it into our pod definition file. There are 3 ways to inject ConfigMaps in our pod definition file listed as follows:
- Injecting all the environment variables from ConfigMap. To inject a ConfigMap in the pod definition file, we use the envFrom property to our container field. Below is an image for your reference.
- Injecting a single environment variable from a ConfigMap. Here, we use the env property under the containers field as shown in the image below.
- Inject environment data as a file in a volume. Below is an image for your reference.
