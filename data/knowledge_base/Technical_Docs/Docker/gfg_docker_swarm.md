# Docker Swarm

> Source: https://www.geeksforgeeks.org/devops/docker-swarm-building-a-highly-scalable-cluster/

Docker Swarm is a container orchestration engine that was included by Docker as a part of its container runtime. Docker Swarm was included in the Docker container runtime in June of 2016.
Docker Swarm is also included in the Mirantis Container Runtime (formerly called the Docker Enterprise Engine) which is also referred to as MCR, which takes a Docker Engine and adds additional features and capabilities including security hardening to make it enterprise-ready.
Why we need Docker Swarm?
Let us take an example to understand the need of Docker Swarm. Let us say you have an application that is divided into 100 containers, now you will need to manage and control multiple containers at a time as a single service. This is called Orchestration - managing and controlling multiple containers as a single service. And this is what we use Docker Swarm for.
We use Docker Swarm for the following tasks:
- Health check on every container
- Ensure all containers are up on every system
- Scaling the containers up or down
- Adding updates/changes to all the containers
- Deploying a fixed set of containers
- Performing rolling update of the containers
- Load Balancing of the containers
Features of Docker Swarm
We have many Container Orchestration tools in the market like Kubernetes, Apache Mesos etc. Kubernetes is even more popular Orchestration tool, Then why should Docker? Here are a few reasons to use Docker and some features of Docker:
1. Docker Swarm schedules the containers, sets up Network Predictions, Monitors for Container health and also restarts any container that have died or are deemed to be unhealthy. If an entire node goes down Docker Swarm will reschedule those workloads on a different node.
2. Docker Swarm becomes even more useful when you want to orchestrate your containers and don't want to download and install a separate software package since it is already installed with Docker. All you need to do is turn the Docker Swarm on.
3. Docker Swarm works with both Linux and Windows worker nodes.
4. Swarm can be extended with Networking Plugins, Storage Plugins, Logging Plugins etc. What does it actually solves is it lets you declare your state instead of having to do everything manually and all your resources, your services, labeling or constraints can be declared in a 'yaml' file.
5. Swarm also handles provisioning and manages where containers get deployed so if you have a cluster of several nodes it will try to balance out your workloads across multiple nodes within your cluster. That is great for high availability and scaling. If you have a peak in traffic you need to scale up your web server, you can do that in swarm mode. I can also move containers from one node to another so if one node runs out of resources or the whole node goes down that is when it will act upon that.
6. Docker Swarm also load balances traffic across multiple containers.
7. Swarm keeps track of the health of the containers. It also allows us to expose services with an ingress solution.
Docker Swarm Architecture
This is a high-level architectural view of Docker Swarm. In the diagram we have three manager nodes (similar to the Master nodes of Kubernetes). A node is an individual Docker Engine participating in the swarm. Swarm is a Mode which consists of multiple Docker hosts which run in a cluster. We always have an odd number of manager nodes. If we have a development or test environment where availability is not a big concern we can only use one manager node, but in production we will generally have either three or five manager nodes. Worker nodes are nodes where where the actual workloads are run. The workers nodes communicate with each other using the gossip protocol.
Swarm Nodes Breakdown
Docker Swarm has two types of nodes - Manager nodes and Worker nodes.
1. Manager nodes
Manager nodes are the machines that we communicate with. Manager nodes are used to assign work to the other nodes. It accepts command from client and creates service object(s).
Manager nodes handle cluster management tasks like maintaining the cluster state, scheduling the services, and serving the swarm mode HTTP API endpoints. It maintains a consistent state of the swarm and services running on it. It Allocates IP addresses to tasks, Assigns nodes to tasks and Checks in on workers
2. Worker nodes
Worker nodes are the nodes where the containers run actually. Worker nodes connects to the dispatcher to check the assigned tasks and executes the tasks assigned to it.
Swarm tasks and stacks
Swarm Tasks
Swarm Tasks are the atomic unit of scheduling in a Swarm. In simpler terms, a Task is a container and the commands that are running it and it's a small schedule unit in Swarm. Swarm manager nodes will assign a task to a Worker node and the worker nodes will run it and report on its status. A Task progresses sequentially through a series of states these are assigned, prepared, running, etc.
Example of a task:
docker service create -name redis -replicas=3 redis:3.0.6
We will learn more about tasks in the tutorial section of this article.
Swarm Stacks
Swarm Stacks is used to define a number of services that make up complete application in a specific environment and is a convenient way to automatically deploy multiple services that are linked to each other, without needing to define each one separately.
Swarm Stack is used to build more complex objects. For example, a stack can include a few replicas of nginx and an instance of mysql and it's all assembled in a docker compose file. It is a similar to the concept of 'yaml' file in Kubernetes that could include multiple deployments and other resources and objects that the application might need.
Tutorial - How to use Docker Swarm
In this tutorial we will see how to use Docker Swarm step by step, follow the steps below to learn using Swarm:
Step 1. So this is the Syntax of the command we need to create a new swarm on our docker desktop:
docker swarm init --advertise-addr <MANAGER-IP>
Hence we will enter the following command in our terminal:
docker swarm init --advertise-addr 192.168.99.100
If this doesn't work in your computer, you can use:
docker swarm init --advertise-addr 127.0.0.1
Our swarm is now created. you will get a similar output:
Step 2. Now we can enter the following to check the state of the swarm:
docker info
This will give you the information about the swarm:
Step 3. if we enter
docker node ls
on the terminal. It will give us the list of nodes running and we can see our leader node there:
Step 4. In order to add a worker nodes to swarm you can enter the following command in your terminal
docker swarm join --token  SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c 192.168.99.100:2377
Step 5. Now let's deploy a service in Docker Swarm, in order to deploy any service in swarm, in syntax of the command is:
docker service create --replicas[NUMBER OF REPLICAS] --name [NAME OF SERVICE] [IMAGE]
Therefore, we can enter the following command, to create a alpine service named gfg:
docker service create --replicas 1 --name gfg alpine ping docker.com
and your gfg service will be created:
Step 6. We can check our list of services using the following command:
docker service ls
you will find the gfg service in the list:
Step 7. Now let's scale this service to 2 replicas, to do that the syntax for the command is:
 docker service scale [NAME_OF_SERVICE] = [NUMBER_OF_REPLICAS]
Enter the following command in your terminal to scale our gfg service to 2 replicas:
 docker service scale gfg=2
Step 8. Now when we check our list of services, we see that our gfg service has 2 replicas:
docker service ls
Step 9. Finally, we would want to delete our service, for that the syntax of the program is
 docker service rm [NAME_OF_SERVICE]
To delete our gfg service we can simply enter this command:
 docker service rm gfg
Upon checking the list of services, we will not find your gfg service anymore:
docker service ls
And with we will learn how to use Docker swarm, we create our first Docker swarm, then we created nodes and services and learned hot to scale them and remove them.
Comparison between Docker swarm and Kubernetes
You might have heard about Kubernetes. A technology that is very much comparable with Docker Swarm is Kubernetes. Docker swarm is basically an alternative to Kubernetes which is a container orchestration tool.
So instead of Docker Deamons, in Kubernetes you would have services called Kubelets that will run on each node and instead of Docker you would have a Kubernetes Engine that actually spends those multiple nodes that make up the cluster and the rest everything is almost the same. You have the same docker containers with the same applications running on that cluster set up.
| Docker Swarm | Kubernetes | 
|---|---|
| Docker Swarm supports auto load balancing. | Kubernetes does not have a support for auto load balancing. | 
| Docker Swarm does not support auto scaling. Manual scaling has to be configured. | Kubernetes offers auto scaling. | 
| Docker Swarm uses third party tools for monitoring | Kubernetes has built in monitoring. | 
| Docker Swarm is simpler to install and set up. | Kubernetes is much more complex to install and set up. | 
| For Docker Swarm you don't have to learn a new command-line tool. | For Kubernetes, you must learn how to use Kubectl. | 
| Docker Swarm is lightweight and limited in functionality. | Kubernetes has a higher learning curve and is more powerful. |
