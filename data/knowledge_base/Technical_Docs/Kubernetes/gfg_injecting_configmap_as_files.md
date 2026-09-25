# Injecting ConfigMap as Files

> Source: https://www.geeksforgeeks.org/devops/kubernetes-injecting-configmap-as-files/

Pre-requisite:- Kubernetes
The automated deployment, scaling, and administration of software using a system called Kubernetes, an open-source container orchestration tool. K8s is another name for Kubernetes. Kubernetes was initially developed by Google and is now managed by the Cloud Native Computing Foundation. Despite the fact that it now supports CRI-O in addition to the Docker runtime, with which it was first designed to interact. The main objective of Kubernetes is to automate container management's operational tasks. It comes with built-in functions for rolling out required application modifications and for deploying applications. It is currently utilized by businesses including Google, Spotify, and Capital One.
ConfigMap:
Many applications depend on the configuration which is used during either application initialization and/or during runtime. Generally, there is a requirement to adjust values assigned to configuration parameters. ConfigMaps can be called as the Kubernetes way to inject application pods with configuration data. ConfigMaps allow us to decouple configuration artifacts from image content and keep containerized applications portable.
In Kubernetes, Configmap is an API object which is mainly used to store non-confidential data. The data that is stored in ConfigMap is stored as key-value pairs. ConfigMaps can be consumed by Pods as environment variables, command-line arguments, or even as configuration files in a volume. This feature allows us to decouple environment-specific configuration from our container images, after this is done our applications are easily portable. The thing to be noted here is that ConfigMap does not provide any sort of secrecy or encryption, so it is advised to store non-confidential data only we can use secrets to store confidential data.
Injecting ConfigMap as Files:
We can use a ConfigMap for setting configuration data separately from the application code. Imagine that we are developing an application that you can run on your own computer and in the cloud. We write the code to look in an environment variable named DATABASE_HOST. We can set the variable to localhost locally but in the cloud, we set it to a Kubernetes Service. A configMap is not designed to store large data in it. The data that is stored in ConfigMap can not be more than 1MiB. If we need to store more data than that then we can use volume instead of ConfigMaps.
To create a ConfigMap feature for files we can use the command
configure-pod-container/configmap/game.properties
then apply the Customization directory to the ConfigMap object.
With Kubernetes version, 1.23 kubectl started supporting the feature to inject ConfigMap into multiple files. This can be done by using the command kubectl get configmap config-multi-env-files -o YAML.
