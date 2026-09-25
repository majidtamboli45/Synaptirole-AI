# ClusterIP vs NodePort vs LoadBalancer

> Source: https://www.geeksforgeeks.org/devops/kubernetes-cluster-ip-vs-node-port/

Three main service types are used in Kubernetes networking: ClusterIP, NodePort, and LoadBalancer. Each has a specific function in controlling external access and service-to-service communication. Comprehending their distinctions is essential for efficiently coordinating applications. This article explores the differences between NodePort, ClusterIP, and LoadBalancer services and provides guidance on when and how to use each for the best Kubernetes networking experience.
ClusterIP vs NodePort vs LoadBalancer
Here are the key differences between ClusterIP, NodePort, and LoadBalancer services in Kubernetes:
| Feature | ClusterIP | NodePort | LoadBalancer | 
|---|---|---|---|
| Accessibility | Accessible only within the cluster | Accessible externally via node's IP | Accessible externally via cloud load balancer | 
| Use Cases | Internal communication between services | External access for development/testing | External access for production applications | 
| Load Balancing | Load-balanced IP within the cluster | Each node forwards traffic on a specific port | External load balancer distributes traffic | 
| IP Addresses | Single virtual IP address | Each node's IP address | Typically uses a public IP provided by cloud | 
| Scaling | Scales horizontally with additional pods | Scales horizontally with additional nodes | Scales horizontally with additional nodes | 
What is a Kubernetes Service?
The definition of Kubernetes services refers to a” Service which is a method for exposing a network application that is running as one or more Pods in your cluster.” Service is a static IP address or a permanent IP address that can be attached to the Pod. We need Service because the life cycles of Service and the Pod are not connected, so even if the Pod dies, the Service and its IP address will stay so we don’t have to change that endpoint every time the Pod dies.
Therefore, what Service does is it provides stable IP address to the Pods. A Kubernetes Service also provides load balancing because when you have pod replicas, For example, three replicas of a microservice application. The Service will basically get request targeted to the application and forward it to one of those pods. Because of this now clients can call a single stable IP Address instead of calling each pod individually, so services are a good abstraction for loose coupling and for communication within the cluster and outside it as well.
Cluster IP
ClusterIP is a type of service that exposes an internal IP address within the cluster. It enables communication between different components of an application deployed within the Kubernetes cluster. ClusterIP services are typically used for internal communication between pods and are not accessible from outside the cluster. ClusterIP is the most common Service as well as it is the Default type of Service, meaning when you create a Service and not specify a type it will automatically take ClusterIP as a type.
Several pods that satisfy a label selector can handle incoming traffic thanks to the load-balanced IP address provided by Kubernetes' ClusterIP service. To properly forward TCP/UDP communication to containers, this service requires the establishment of one or more ports for listening, with destination ports provided.
- This is the default service type that exposes the service on a cluster-internal IP by making the service only reachable within the cluster.
- A Cluster service is the default Kubernetes service. It gives you a service inside your cluster that other apps inside your cluster can access.
- There is no external process.
When to use Cluster IP?
- There are a few scenarios where you would use the Kubernetes proxy to access your services.
- debugging your services, or connecting to them directly from your laptop for some reason
- Allowing internal traffic, displaying internal dashboards, etc.
Node port
NodePort is a type of service that exposes a port on every node in the cluster. It allows external access to the service by forwarding traffic from the specified port on each node to the corresponding port on the pods targeted by the service. NodePort services are often used when you need to access your application from outside the cluster without requiring a load balancer.
This exposes the service on each Node's IP at a static port. Since a ClusterIP service, to which the NodePort service will route, is automatically created. We can contact the NodePort service outside the cluster.
- A Nodeport service is the most primitive way to get external traffic directly to your service.
- NodePort, as the same implies, opens a specific port on all the Nodes (the VMs), and any traffic that is sent to this port is forwarded to the service.
When to use Node Port?
- There are many downsides to this method
- You can only have one service per port
- You can only use ports 30,000-32,767
- If your Node/VM IP address change, you need to deal with that
- For these reasons, I don't recommend using this method in production to directly expose your service. If you are running a service that doesn't have to be always available, or you are very cost-sensitive, this method will work for you. A good example of such an application is a demo app or something temporary.
LoadBalancer
LoadBalancer service type exposes an application running in the cluster to the outside world. When you create a LoadBalancer service, Kubernetes provisions a load balancer in the underlying cloud infrastructure (such as AWS, GCP, or Azure) and assigns it a public IP address. This allows external users to access the application using this IP address. LoadBalancer services are commonly used for applications that need to be publicly accessible, such as web servers or APIs.
When to use LoadBalancer ?
- Public-facing web applications: If you have a web application that needs to be accessible over the internet, you can use a LoadBalancer service to expose it to external users.
- API services: When you have APIs that need to be consumed by external clients, a LoadBalancer service can provide a stable endpoint for accessing these APIs.
- Microservices architectures: In microservices architectures where different services communicate with each other over the network, LoadBalancer services can be used to expose individual services to other services within the cluster or to external clients.
- High availability: LoadBalancer services can help improve the availability of your application by distributing traffic across multiple pods or replicas, ensuring that your application remains accessible even if one or more pods fail.
ExternalName
Another kind of Kubernetes service that lets you map a Kubernetes service to a DNS name outside the cluster is called ExternalName. By offering a DNS alias for the external resource, it makes it possible to access services hosted outside of the cluster.
The above service definition associates the external DNS name my.database.example.com with the prod namespace service my-service. This implies that my.database.example.com will be the destination for any requests made to my-service inside the prod namespace.
apiVersion: v1
kind: Service
metadata:
name: my-service
namespace: prod
spec:
type: ExternalName
externalName: my.database.example.com
Conclusion
Understanding the differences between ClusterIP, NodePort, and LoadBalancer services in Kubernetes is crucial for efficiently managing your applications. ClusterIP is ideal for internal communication within the cluster, NodePort allows external access without a load balancer, and LoadBalancer is suitable for publicly accessible applications. By selecting the appropriate service type based on your application's requirements, you can optimize performance and ensure seamless connectivity in your Kubernetes environment.
