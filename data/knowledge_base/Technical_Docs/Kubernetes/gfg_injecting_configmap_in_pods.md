# Injecting ConfigMap in Pods

> Source: https://www.geeksforgeeks.org/devops/kubernetes-injecting-configmap-in-pods/

Pre-requisite: Kubernetes
Leveraging the open-source container orchestration engine Kubernetes to automate the deployment, scalability, and management of applications. Another name for Kubernetes is K8s. Google originally created Kubernetes, which is currently overseen by the Cloud Native Computing Foundation. Despite the fact that it now works with CRI-O as well as Docker runtime, with which it was initially intended to work. Automating operational activities for container management is Kubernetes' primary goal. It has built-in capabilities for deploying apps and rolling out necessary application changes. Businesses like Google, Spotify, and Capital One now use it.
Injecting ConfigMap in Pods
Numerous applications are dependent on the configuration that is applied during runtime or at application initialization. Normally, it is necessary to change the values associated with configuration parameters. One could refer to ConfigMaps as the Kubernetes method of configuring application pods. ConfigMaps gives us the ability to keep containerized applications portable and to decouple configuration artifacts from the image content.
Configmap is an API object in Kubernetes that is primarily used to store non-confidential data. ConfigMap stores data in the form of key-value pairs. Pods can use ConfigMaps as command-line arguments, environment variables, or even configuration files in a volume. This property helps us by decoupling environment-specific configurations from their container images, after this is done our applications are easily portable. ConfigMap can't offer any form of secrets or protection, so it is preferred to store non-confidential or general data instead. We can only use secrets as a means to store confidential/important data, it is important to keep this in mind.
A ConfigMap can be used to set configuration data independently of the application code. Consider that we are creating a program that you can use both on your computer and on a cloud-based platform. We can check the DATABASE HOST environment variable by writing code. Locally, the variable can be set to localhost; however, in the cloud, a Kubernetes Service is set. Locally, the variable can be set to localhost; however, in the cloud, a Kubernetes Service is set. Large amounts of data are not intended to be stored in config maps. ConfigMap can only store data that is no larger than 1MiB. Volume can be used in place of ConfigMaps if we need to store more information than that.
We can use the environment variable in the command and arguments of a container to inject the ConfigMap feature into Pods. This is possible by using the $( VAR_NAME).
Inject Multiple Variables Using the Same Map Name
Data from a Single Pod
$ kubectl create configmap 
special-config --from-
literal=special.how=very
Data from Multiple Pods
$ kubectl create -f
