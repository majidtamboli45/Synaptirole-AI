# Kubernetes Images

> Source: https://www.geeksforgeeks.org/devops/kubernetes-images/

Pre-requisite:- Kubernetes
A container image is used to represent binary data that is being used to encapsulate an application and all its software dependencies. Container images can be represented as executable software bundles that run standalone and make very defined assumptions about their runtime environment. Generally, we create a container image of our application and push it to a registry before terming it a pod.
Image Names
These Images can contain names like pause, Kube-API server, or example/mycontainer. They can also have names like registry hostnames. For example fictional.registry.example/imagename. They can even be port numbers like a fictional.registry.example:10443/imagename. If we fail to specify a registry hostname it will be assumed by Kubernetes that we meant it as a Docker public registry. After the image name, we can add a tag. The main purpose of the tag is to let us identify different versions of the same image series. The tag may consist of lowercase and uppercase letters, periods, dashes, and underscores. If we don't specify a tag then it is considered the latest tag by default.
Image Config File
apiVersion: v1
kind: pod
metadata:
   name: GeeksforGeeks
   spec:
      containers:
         - name: gfg-image
         image: <docker_image_name>
         imagePullPolicy: Always
         command: ["echo", "SUCCESS"] ------------------->
Let's understand the complete config file
- name: GeeksforGeeks :- It is the name of the container which will be created after pulling the image from the Registry
- name: gfg-image :- It is the name given to the container which we want to create.
- image: <docker_image_name>:- It is the name of the image which we needs to pull from the Docker Registry
- imagePullPolicy: Always :- This Pull Policy defines that whenever we run this file to create the container, it will pull the same name again.
- command: ["echo", "SUCCESS"] :- If a container is successfully created then it will display a success message when we will access the container.
Image Commands
- To pull the image and create a container
$ kubectl create –f <container_name>
- To check the log
$ kubectl log Tesing_for_Image_pull
Image Updating
When we create a StatefulSet, pod Deployment, or any other object that includes a Pod template then the pull policy of all containers in that pod will be set to IfNotPresent by default if it is not explicitly specified. This specific policy causes Kubelet to skip pulling an image if it already exists.
The imagePullPolicy for any container and the tag associated with the image affects when the kubelet attempts to download or pull the specific image. They can even set values to the imagePullPolicy like IfNotPresent, Always, or Never.
While we are using the image tags if the image registry were to change the code that the tag on that specific image representation we might end up with a mixture of Pods running both the old and new code.
