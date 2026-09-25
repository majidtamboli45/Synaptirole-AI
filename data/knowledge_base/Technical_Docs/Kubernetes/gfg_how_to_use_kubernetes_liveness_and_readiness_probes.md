# How To Use Kubernetes Liveness and Readiness Probes?

> Source: https://www.geeksforgeeks.org/devops/how-to-use-kubernetes-liveness-and-readiness-probes/

Kubernetes (also known as K8s) is an open-source Container Management tool. It helps us automate all the processes like deployment, load balancing, rolling updates, etc. We can deploy, scale, and manage containerized applications.
Kubernetes Liveness and Readiness Probes
In Kubernetes, Liveness and Readiness probes are usually used for monitoring the health of the pods and are quite similar in nature as well. If the pod goes down or if the connection is interrupted these probes help efficiently to know it is down and also help recover it. They can be specified in the yaml files itself.
These Kubernetes Liveness an Readiness are essential for monitoring the health of the pods. While the Liveness probes will determine the if a pod is running, restarting it if necessary and Readines probes will check if a pod is ready to serve the traffic. These can be specified directly in the Yaml configuration files. It ensures the automated recovery and smooth traffic management.
Three Types of Kubernetes Probes
The following are the types of the kubernetes probes and those discussed here inshort and effectively:
1. Liveness Probe
Liveness probes in kubernetes facilitates the application within a pod running as expected. If a liveness probe fails then it will that pod and then it will restarted the pod according to the restart policy. It faciliates automatic recovery from the broken state and ehance the overall system reliability.
2. Readiness Probe
Readines probes are determined if a pod is ready for accepting the incoming traffic. When a readines probe fails, then it temporarily removes the probe from the service load balancer preventing it from receiving any requests unitl it is ready. These are particularly helpful during startup, maintenance or when scaling the applications.
3. Startup Probe
Startup probes are designed for managing the startup sequence of applications that taking longer to initialize. These probes are run to check if the application has successfully started. If the startup probe fails, then it will restart the pod according to its restart policy. It ensure that such applications to give enough time to become ready before other probes take over.
How Do Liveness and Readiness Probes Work?
Liveness and Readiness probes in Kubernetes are used to monitor the health and availability of pods.
Liveness probe as the name suggests tells us if the pod is alive or not. It basically tells us if the pod is in a healthy state or not. It can be used in multiple ways but is defined under spec.containers.livenessprobe in yaml configuration file.
Readiness probe on the other hand lets us check whether our application pods are ready to take any new request. It could happen if our Kubernetes pod is alive but due to some network error or congestion, it is not able to process any new requests, So, the readiness probe helps us know this. It is defined under spec.containers.readinessprobe in yaml configuration file. It will helps while using kubernetes deployments.
Both probes are defined in the pod's YAML configuration, providing automatic and continuous health monitoring to maintain robust and reliable Kubernetes deployments.
Configuration Settings of Kubernetes Probes
The following are the important configuration settings of Kuberentes Probes:
- SuccessThreshold: if the probe failed last time, the successes required for it to be successful.
- PeriodSeconds: the period of time between each run of the probe.
- InitialDelaySeconds: it tells how much time needs to be waited after startup for the first probe to run
- FailureThreshold: if the probe failed last time, the failures required for it to be called failed.
- /tmp/healthy: this path/command can be used on kubernetes which provides the health of the pods.
- TimeoutSeconds: the time after which the probe can timeout if it doesn't run
How to Configure Kubernetes Liveness, Readiness and Startup Probes?
The following are the steps for configuring the kubernetes Livenes, Readiness and Startup Probes:
Step 1: Define Probes in Pod Specification
- Firstly create a pod-probes.yaml file and define the configuration with including liveness, readines and startup probes in the YAML configuration of the Pod.
Step 2: Specify Probe Parameters
- Choose the probe type such as HTTP or TCP or any type and then define the parameters like initialDelaySeconds ,periodSeconds ,timeoutSeconds , andfailureThreshold .
- The yaml configuration file of pod-probes.yaml looks as follows:
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
  - name: example-container
    image: example-image
    livenessProbe:
      httpGet:
        path: /healthz
        port: 8080
      initialDelaySeconds: 3
      periodSeconds: 3
    readinessProbe:
      httpGet:
        path: /ready
        port: 8080
      initialDelaySeconds: 5
      periodSeconds: 5
    startupProbe:
      httpGet:
        path: /startup
        port: 8080
      initialDelaySeconds: 10
      periodSeconds: 10
Step 3: Apply the Configuration
- Use the kubectl command to create or update the pod configurations in your kubernetes cluster with following command:
kubectl apply -f pod-probes.yaml
Defining Various Types of Liveness Probes in Kubernetes
Kubernetes support different types of liveness probes to check the health of an application within a pod:
1. Define a liveness Command
- It executes a specific command inside the container, if the command returns a non-zero exit code then pod is considered as unhealthy. The following is the example of the defined liveness probe configuration yaml code:
livenessProbe:
  exec:
    command:
    - cat
    - /tmp/healthy
  initialDelaySeconds: 5
  periodSeconds: 5
2. Define a liveness HTTP request
- It sends an HTTP GET request to a specified endpoint. If the response code is not in the 200-299 range, the pod is marked as unhealthy. The example yaml code of the livness HTTP request is as follows:
livenessProbe:
  httpGet:
    path: /healthz
    port: 8080
  initialDelaySeconds: 3
  periodSeconds: 3
3. Define a TCP liveness Probe
- It attempts in establishing a TCP connection to the specified port. If the connection cannot be established, the pod is considered unhealthy. Example:
livenessProbe:
  tcpSocket:
    port: 8080
  initialDelaySeconds: 10
  periodSeconds: 10
4. Define a gRPC liveness probe
It uses grpc to check the health of a service by calling a specified method. Example:
livenessProbe:
  grpc:
    port: 8080
    service: grpc.health.v1.Health
  initialDelaySeconds: 5
  periodSeconds: 5
- These are the probes that ensure the kubernetes it automatically detecting and making to recover form the application failures maintaining the reliability and availability of your services.
How to use Kubernetes Liveness Probe?
- To use liveness probe for our application, we need to specify them in the yaml configuration file in the place defined above.
- To check if the pod is alive or not, we can specify a command or a custom script to run periodically. The container is killed by the kubelet and is subject to its restart policy if the liveness probe fails.
- First of all, for adding a liveness probe we could add something like this:
spec:
containers :
name: "demo_container"
livenessProbe:
failureThreshold: 6
exec :
command: ["bash", "-c", "./liveness-script.sh"]
periodSeconds: 5
- In the above, we added liveness probe for one of the containers and specified the failureThreshold as 6 which means it will check 6 times when the pod fails before declaring it as failed and periodSeconds as 5 on how periodically we want to check the liveness probe.
- Now, coming to the actual command which will run to check the liveness probe - in this case it runs a script (we can also run a set of commands directly).
- The content of the script would differ based on type of container and how do we verify the pod is alive for that.
- We can have a command as simple as "ping" for the url or more complex scripts. The liveness probes also differ if we need to check a HTTP connection or a TCP connection.
- Suppose for checking an HTTP request we can use something similar to this:
livenessProbe:
  httpGet:
    path: /health
    port: 8000
- This will make an HTTP Get request on the specified path and port to check the aliveness.
- On the other hand, for a TCP connection request we can do this:
livenessProbe:
  tcpSocket:
    port: 8080
This will try opening a TCP socket connection on the specified port and if it succeeds, then the pod is alive
Define Readiness Probes
Readiness probes in Kubernetes ensures if a pod is ready to handle traffic by periodically checking its health. When a readiness probe leads to fail, then the pod is temporarily removed from the service's load balancer, preventing it from receiving traffic until it becomes healthy again. These probes play a crucial role during startup, scaling, or maintenance tasks, ensuring that only fully functional pods serve user requests. They offer flexibility with various check types like HTTP requests, TCP connections, or command execution, contributing to the stability and reliability of Kubernetes deployments.
Configuring and Using Kubernetes Readiness Probe? A Step-By-Step Guide
- To use readiness probe for our application, we need to specify them in the yaml configuration file in the place defined above.
- To check if the pod/container is ready to take a request, we can specify a command or a custom script to run periodically. And if the pod is not ready, it won't get any traffic from the kubernetes services.
- First of all, for adding a readiness probe we could add something like this:
spec: 
   containers :    
      name: "demo_container"
      readinessProbe:
         exec : 
           command:  ["bash", "-c", "./readiness-script.sh"]
         periodSeconds: 5
         failureThreshold: 5
- It is very similar to how we define livenessProbe, just using readinessProbe instead.
- Using HTTP and TCP connections also work in similar manner for readiness probes as liveness probes.
- For the same pod/container, both the probes can be utilised simultaneously.
- Using both can guarantee that traffic does not go to a pod which is not ready and that containers are restarted when they encounter problems.
When to use Readiness Probe?
The following are the some of the cases or scenarios to use the Readiness Probes:
- During Application Startup: The readiness probes can used for ensuring that the pods are fully initialized and ready to handle incoming traffic before allowing them to receive requests. This helps prevent users from accessing partially functional or initializing pods.
- Scaling Operations: It employes the readiness probes when scaling up or down the number of pods in a deployment. By confirming that newly created pods are ready to serve traffic, readiness probes ensure a seamless transition without disrupting user experience.
- Application Updates and Maintenance: Try on implementing the readiness probes during application updates or maintenance activities to verify that pods have successfully completed any necessary configuration changes or updates before directing traffic to them. This minimizes downtime and potential disruptions for users.
What are HTTP and TCP Probes?
HTTP probes in Kubernetes are the one that used to determine the health of an application by sending HTTP requests to a specific endpoint. They check if the response status code falls within a specified range i.e., typically 200-399 to consider the application healthy. These are versatile with supporting various HTTP request methods faciliating with customization of the request path and port.
TCP probes are the one that used for knowning the health of an application by attempting to establish a TCP connection to a specified port. They are simpler than HTTP probes as they only verify whether a TCP connection can be successfully established. These are useful for application that don't expose HTTP endpoints but still requires the health monitoring.
How Does Readines Probes Work?
The Readiness probes in kubernetes periodically checks the health of the pods by determining whether they are ready to handle the traffic or not. The following are some of its main working functionalities:
- Regular Checks: They helps in performing the periodic checks typically uses HTTP requests, TCP connections or command execution for accessing the pod readiness.
- Traffic Management: When a readiness pod fails, It temporarily removes the pod from the service's load balancer, preventing it from the receiver traffic until it becomes ready again.
- Critical for Availability: These will be crucial during the startup, scaling or maintenance tasks. It ensures that only functional pods serve users requests.
How to Disable the Readiness Probe in Kubernetes?
We can disable the readiness probes in kubernetes by removing or commenting out the readines probe section from the pod's yaml configuration. The following are the steps to disable the readiness probes in Kubernetes:
- Step 1: Edit Pod Configuration - open the Yaml configuration file of the Pod.
- Step 2: Remove Readiness Probe - It delete or comment out the readinessProbe section.
- Step 3: Appy Changes to Pod resource with the following command:
kubectl apply -f pod-config.yaml
- By removing the readiness probe, Kubernetes will no longer perform the health cheks to determine the pod readiness, potentially impacting the traffic management and overall application reliability.
Advantages of Using Liveness and Readiness Probes
As mentioned earlier liveness and readiness probes are used to check the health of the resources in Kubernetes, but this also has many added advantages. Some of them include:
- Using liveness probes can help us improve the availability of our application and containers.
- Readiness probes can actively help in troubleshooting. If there's some failure in a readiness probe it lets us know there is an issue with the service and can help fix it.
- Liveness probes can also help us verify if the services restart properly if any of the pods are unhealthy.
- On the other hand, readiness probe help us verify if the services run as designed.
Troubleshooting of Kubernetes Liveness and Readines Probes
The following are the troubleshooting cases of Kubernetes Liveness and Readiness Probes:
Protect Slow Starting Containers with Startup Probes
- Define Startup Probes: It specifies a seperate startup probe in the Pod's YAML configuration allowing more time for slow starting of containers to initialize.
- Adjust Probe Parameters: Try on increasing the initialDelaySeconds and periodSeconds parameters of the startup probe to providesufficient time for container initialization.
Fixing Kubernetes Readiness Probe Failures
- Review Probe Configuration: Firstly check the pod's configuration file, ensuring whether the readiness probe section is correctly reflecting the application's readiness conditions.
- Check Application Dependencies: Try to investigate the application dependencies or external services that required for readiness checks are properly configured and accesible or not.
Common Error Scenarios for Readiness Probes
- Connection Timeout: Readiness probes may fail due to network issues or incorrect endpoint configurations, resulting in connection timeouts.
- Application Initialization: If the application takes longer than expected to initialize, readiness probes may fail prematurely, leading to pod eviction.
