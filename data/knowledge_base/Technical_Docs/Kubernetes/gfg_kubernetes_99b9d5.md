# Kubernetes Services

> Source: https://www.geeksforgeeks.org/devops/kubernetes-services/

Kubernetes Services provide a stable way to expose and access applications running on dynamic sets of pods. They enable seamless service discovery, load balancing, and network connectivity within a cluster without requiring changes to the application. Services are a key building block in Kubernetes for reliably connecting and scaling containerized applications.t.
Services
- A Service in Kubernetes provides an abstract way to expose applications running on a set of pods as a network service.
- Applications don’t need modification to use Kubernetes’ built-in service discovery mechanism.
- Each pod gets a unique IP, while the Service provides a single DNS name and can load balance traffic across multiple pods.
- Pods are ephemeral; they can be created or destroyed dynamically, so the set of running pods may change over time even though the Service remains stable.
Service Resources:
In Kubernetes, a service can be defined as an abstraction whose main function is to define a logical set of Pods and a policy by which they can be accessed later or when necessary. It is the duty of a Selector to target a set of Pods. Consider a stateless image-processing backend that is currently running with 3 replicas. These replicas are fungible, frontends do not care about the backend use.
Types of Services present in Kubernetes:
ClusterIp: 
A ClusterIP service in Kubernetes exposes a service internally within the cluster using a virtual IP. It allows pods to communicate with each other without exposing the service to the outside world. ClusterIP is the default service type and is ideal for internal communication between microservices. External access requires using a NodePort or LoadBalancer in addition to ClusterIP.
apiVersion: v1
kind: Service
metadata:
  name: my-app-clusterip
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80        # Service port
      targetPort: 80  # container port
  type: ClusterIP
NodePort:
A NodePort service in Kubernetes exposes a pod on a static port on every node in the cluster. It allows external traffic to access the service by connecting to <NodeIP>:<NodePort>. NodePort is useful for testing or simple external access without a cloud load balancer. It forwards traffic to the corresponding ClusterIP service inside the cluster.. 
apiVersion: v1
kind: Service
metadata:
  name: my-app-nodeport
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80         # Service port
      targetPort: 80   # container port
      nodePort: 30080  # Port on nodes (30000-32767)
  type: NodePort
Load Balancer:
A LoadBalancer service in Kubernetes exposes an application externally using a cloud provider’s load balancer. It automatically distributes incoming traffic across all healthy pods in the service. This ensures high availability and scalability by balancing the load. It’s ideal for production applications that need public access.
apiVersion: v1
kind: Service
metadata:
  name: my-app-loadbalancer
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80        # Service port
      targetPort: 80  # container port
  type: LoadBalancer
Config file of service  with Selectors:
apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80       # Service port
      targetPort: 8080  # container port
  type: ClusterIP
Multi-Port Service Creation:
apiVersion: v1
kind: Service
metadata:
  name: multi-port-service
spec:
  selector:
    app: my-app
  ports:
    - name: http
      protocol: TCP
      port: 80        # Service port
      targetPort: 8080 # container port
    - name: metrics
      protocol: TCP
      port: 9090      # Service port
      targetPort: 9090 # container port
  type: ClusterIP
