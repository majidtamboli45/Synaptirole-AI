# Load Balancing Service

> Source: https://www.geeksforgeeks.org/devops/kubernetes-load-balancing-service/

Before learning Kubernetes (or K8S in Short), you should have some knowledge of Docker and Containers. Docker is a tool that helps the developer create containers in which applications can run in an isolated environment. Containers are just an abstraction for the applications inside. Docker also provides some facilities for these containers to talk to each other, store data on the host machine, and much more. Similarly, Kubernetes is used to control these containers and enhance their availability as well as functionality. Docker has containers, but Kubernetes has Containers, Pods, and then Nodes. Nodes contain pods, and pods have containers. Kubernetes ensures more isolation of the container.
What is service?
A service is a functionality that is by default disabled on containers, pods, and nodes. We need to mention a specific service that we want to enable. Some of the services offered by the Kubernetes cluster are NodePort and Load Balancer services. We have discussed in detail the load balancer service below in the article.
What is Kubernetes Load Balancer?
Kubernetes load balancer uses the Kubernetes Endpoints API to track pod availability. When the Kubernetes load balancer gets a request for a specific Kubernetes service, it sorts or rounds robins the request among the service’s relevant Kubernetes pods. They can work with your pods, provided they are externally rout table. Google and AWS both have this functionality built in.
In terms of Amazon, this corresponds precisely to ELB, and Kubernetes running on AWS can automatically launch and configure an ELB instance for each load balancer service deployed.
Types of load balancers available in Kubernetes
There are two main types of load balancers: internal and external. Internal load balancers are designed to balance traffic within the cluster, ensuring that the distribution of requests among the pods is even and efficient. This type of load balancer is particularly useful for services that do not need to be accessed from outside the cluster, allowing them to communicate seamlessly within the private network. On the other hand, external load balancers handle traffic coming from the internet, making services accessible to users over the web. They ensure that incoming requests from external sources are evenly distributed among the available pods, maintaining service availability and reliability even during high traffic volumes. This makes external load balancers ideal for public-facing applications that require robust and scalable access points.
Types of Services in Kubernetes
There are four main types of services to expose your applications:
- ClusterIP: This is the default service type. It exposes the service within the cluster, making it accessible only to other services inside the cluster. It's used for internal communication.
- NodePort: This service type exposes the service on a specific port on each node in the cluster. You can access it externally using <NodeIP>:<NodePort> . It's useful for simple external access without a load balancer.
- LoadBalancer: This service type uses a cloud provider's load balancer to expose the service to the internet. It provides a public IP address, making it easy for users to access your application from outside the cluster. Suppose we run a company and we want to hire some employees. We have shared a link on which interested candidates can share their resumes and book a slot for the interview. But our website can only handle about 10 people at a time. This can lead to the loss of great talent and eventually, this is a loss to the company. To solve this problem, we needed load balancers. These load balancers launch a new clone website when the number of users reaches a certain limit and redirect those extra users to the newly created clone website.
- ExternalName: This service maps the service to an external DNS name, like example.com . It's useful for directing traffic to an external service or integrating external systems.
To Know more about the difference between the cluster ip, Nodeport, Load Balancer and External name refer this link.
External load balancer providers
For applications used on Kubernetes clusters, external load balancer providers provide essential amenities for dividing up incoming network traffic among several servers or instances, guaranteeing maximum performance and high availability. A few of the prominent vendors are IBM Cloud Load Balancer, Microsoft Azure Load Balancer, DigitalOcean Load Balancers, Google Cloud Platform (GCP) Load Balancing, and Amazon Web Services (AWS) Elastic Load Balancer (ELB).
These are the top three cloud providers provide these load balancing techniques in the cloud:
- Some of the load balancer types which AWS ELB offers include the Application Load Balancer (ALB) for HTTP/HTTPS traffic with advanced routing features, the Network Load Balancer (NLB) for high-performance, low-latency traffic distribution at the network layer, and the Classic Load Balancer (CLB) with basic routing capabilities.
- TCP/UDP load balancing for non-HTTP(S) traffic with global load balancing capabilities, HTTP(S) load balancing for distributing HTTP and HTTPS traffic, and Network load balancing for delivering traffic to the nearest backend instance in terms of latency are all offered by GCP load balancing.
- Microsoft Azure offers the Azure Load Balancer for basic layer 4 load balancing to distribute incoming network traffic and the Azure Application Gateway for layer 7 load balancing with SSL termination and web application firewall (WAF) advantages.
Configure Load Balancer in Kubernetes
Creation of Deployment: We could create deployment by simply executing commands on the CLI or by using YML or JSON configuration files for the deployment. Deployment communicates with the pods about the creation of containerized applications as well as about the modification that can be made to the same applications. We will be using the Nginx image for this deployment.
Using CLI Command
$ kubectl create deployment webserver-deployment --image=nginx:latest
$ kubectl get deployments
$ kubectl get pods
It will take some time to create and start the start container, that is the reason the status of the pod is showing "ContainerCreating".
Using Deployment Manifest File
We need to create a deployment manifest file. Below is an example of such a manifest file. This file is created in YAML format because it is easy to create and edit for humans. YAML is used in various other processes apart from configuration files. Like, in Log files, inter-process messaging, and for advance data structures. Create a yml file named "loadBalancerDeployment.yml".
#Deployment
apiVersion: apps/v1
kind: Deployment
metadata:
name: deployment-nginx
labels:
app: nginx-application
spec:
replicas: 1
selector:
matchLabels:
app: nginx-application
template:
metadata:
labels:
app: nginx-application
spec:
containers:
- name: nginx-container
image: nginx:latest
ports:
- containerPort: 80
To create this deployment execute the below command.
$kubectl create -f  loadBalancerDeployment.yml
Create a Service from a manifest and linking it to Deployment
To create a load balancer service we have to create a service manifest file and to link this service to the pods we can use the labels of the pods previously used in the deployment manifest file.
#Service
apiVersion: v1
kind: Service
metadata:
name: service-nginx
labels:
app: nginx-application
spec:
selector:
app: nginx-application
type: LoadBalancer
ports:
- nodePort: 31000
port: 80
targetPort: 80
To create this service execute the below command.
$ kubectl create -f   loadBalancerService.yml
Details of the Service
To check if the service is created or not execute the below command. it gives a brief introduction to the service.
$ kubectl get services -l app: nginx-application
To get details about the load balancer service use the "kubectl describe" command.
$ kubectl describe service service-nginx
We have created a deployment and linked that deployment to the load balancer service. Now load balancer will take care of all the users coming to the website.
Create a Service using kubectl
Anyone can run specific commands directly on the command line interface (CLI) in order to build a service in Kubernetes using the kubectl command in an imperative manner. With this way, you can define a YAML configuration file once and effortlessly set up services. Here are some examples and clarifications on using kubectl imperatively for developing different types of services.
kubectl expose deployment <deplyment-name> --type=LoadBalacer --name=<service-name> --port=80 --target-port=8080
- kubectl: This is the command-line tool for Kubernetes.
- expose: This command creates a new service.
- deployment <deployment-name>: You're specifying which deployment you want to expose. Replace <deployment-name> with the name of your deployment.
- --type=LoadBalancer: This tells Kubernetes to create a service that's accessible from the internet using a load balancer provided by your cloud provider.
- --name=<service-name>: You're giving a name to your new service. Replace <service-name> with the name you want.
- --port=80: This is the port that external users will connect to.
- --target-port=8080: This is the port where your application is running inside the pods.
Garbage collecting load balancers
The method of automatically removing or clearing out inactive or outdated load balancer resources in a Kubernetes cluster is referred to as "garbage collecting load balancers." A cloud provider's load balancer resource (such as the AWS Elastic Load Balancer or Google Cloud Load Balancer) typically appears when you create a LoadBalancer service in Kubernetes. However, the corresponding load balancer resource could keep running even after the service is terminated or no longer required, generating unnecessary costs and use of resources.
The setting up of mechanisms to detect and delete these not wanted load balancer resources is required for garbage disposal load balancers. This can be achieved through various means:
- Controller Managers: Installing existing controller managers, such as the Kubernetes cloud-controller-manager, which may manage resources specific to cloud providers, such load balancers, or creating custom ones.
- Custom Scripts or Tools: Using third-party tools or writing custom scripts to automatically search for and remove not wanted load balancer resources based on established standards.
- Kubernetes Cluster Auto-scaling: Leveraging the auto-scaling features of Kubernetes clusters to dynamically scale load balancer resources up or down in accordance with workload demands, ensuring that only resources that are needed are provided.
- Resource Labels and Annotations: Labeling or tagging load balancer resources to demonstrate that they belong to Kubernetes resources makes it simpler to find and delete stranded resources.
Load Balancer Traffic Distribution Strategies
Load balancers split up incoming requests across multiple backend servers or instances through different traffic distribution techniques. These strategies support high availability, better application performance, and optimizing resources. These are the few strategies to load distribution on load balancer in Kubernetes.
- Round Robin: Consider of this is the way of giving back. The load balancer directs each new request to a separate server in an ordered to fashionate so that everyone gets the same opportunity. It is fair and simple to use, but it does not account for how busy each machine is in round robin rule.
- Least Connections: Think about yourself join the short line at a checkout. Ensure that the demand is distributed fairly and that no server becomes overwhelmed, the load balancer routes requests to the server with the fewest active connections.
- IP Hashing: Think about get a unique stamp whereas enter a theme park. The load balancer guarantees this, for services such as online shopping in the carts, your session remains connected to the same place through your unique IP address, send you to the same server each time.
- Least Response Time: It is like pick the lane with a small amount of traffic. The load balancer forwards requests to the fastest-respond the server in order to offer users with the best possible customer experience.
- Weighted Round Robin: This is like allocate the different speeds to various lanes on an expressway. The load balancer assigns a "weight" based on capacity to each server to help it handle increase the stress. More traffic goes towards the servers which have more capability.
- Layer 7 Routing: Consider of this as a smart traffic cop that is aware of our route direction. The load balancer scans every request for content, including the URL and data type, and then directs it to the server that best meets the needs of the application.
- Geographic Routing: Think about using a GPS to locate the nearest gas station. The load balancer minimizes the distance data must travel, enhancing efficiency for users worldwide by routing users to the closest server based on their location.
Best Practices for Handling a Kubernetes Load Balancer
Ensuring high availability, scalability, and performance of applications hosted on Kubernetes clusters requires operating a Kubernetes load balancer correctly. Here is the few techniques to select the right load balancer in Kubernetes.
- Choose the Right Load Balancer Type: Choose the right load balancer type for your application is important. A minimal things to consider whereas choose between options like Application Load Balancers (ALB), Network Load Balancers (NLB), or Classic Load Balancers (CLB) involve traffic volume, protocol requirements, and anticipated performance.
- Implement Health Checks: Create health checks that track the backend servers' condition. Load balancers ensure optimal reliability and performance by automatically redirecting traffic away from sick or degraded servers by constantly tracking server availability and health.
- Optimize Traffic Distribution: Use traffic distribution methods like round-robin, least connections, or weighted routing to split incoming requests evenly amongst backend servers. This promotes the effective use of assets and helps in avoiding a glut of particular servers.
- Enable Session Affinity (Sticky Sessions): On the load balancer, activate session affinity for any applications which need session persistence. Ensure that successive requests from the same client travel to the same backend server maintains session state and enhances user experience.
- Monitor and Scale Dynamically: For signals of limits on capacity or performance bottlenecks, keep an eye on load balancer metrics such as throughput, latency, and error rates. To dynamically scale load balancer resources up or down in response to altering application requirements and traffic patterns, use auto-scaling policies.
