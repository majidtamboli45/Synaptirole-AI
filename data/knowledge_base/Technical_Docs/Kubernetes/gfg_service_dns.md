# Service DNS

> Source: https://www.geeksforgeeks.org/devops/kubernetes-service-dns/

Kubernetes creates DNS records for Services and Pods. we can use consistent DNS names instead of IP addresses to contact services. After scheduling a DNS Pod and Service on the cluster, Kubernetes DNS instructs the kubelets to tell the individual containers to use the DNS Service's IP to resolve DNS names.
Every service that is defined in a cluster is given a DNS name, this includes the DNS server itself. The client Pod's search list will include the Pod's own name and cluster definition by default.
Namespaces of Services
A DNS query may return different results. The returned value is based on the namespace of the Pod that is making it. It is not specified by DNS queries that the namespace is limited to DNS queries.
Think of a data service in the prod namespace and a pod in the test namespace. Due to the usage of the pod's test name case, a query for data yields no results, while a query for data does. Prod produces the desired outcome because the namespace is provided there.
DNS Records
DNS records are just like a address book for the internet, it translatesd the domain names into the IP address that computer can be understandable. It includes various types of records such as a records that used for pointing a domain to a specific IP address, MX records that used for email servers, and CNAME records that used for aliasing one domain to another. Proper management of DNS records is crucial for establishing smooth internet connectivity and service accesibility.
DNS in Kubernetes
Kubernetes provides an internal DNS service that enables communication between Pods and Services using DNS names instead of IP addresses. Whenever a Service is created, Kubernetes automatically assigns it a unique DNS name. This allows applications to locate and communicate with Services even if the underlying Pod IP addresses change. By default, modern Kubernetes clusters use CoreDNS to provide DNS resolution within the cluster.
CoreDNS
CoreDNS is a flexible and extensible DNS server written in Go and is the default DNS server in modern Kubernetes clusters. It resolves DNS queries for Kubernetes Services and Pods and automatically updates DNS records whenever cluster resources change. CoreDNS uses a plugin-based architecture, allowing administrators to customize DNS behavior using the Corefile.
Key Features of CoreDNS
- Default DNS server in Kubernetes.
- Resolves DNS names for Services and Pods.
- Automatically updates DNS records based on cluster changes.
- Supports a plugin-based architecture for customization.
- Configured using the Corefile.
Kube-DNS
Kube-DNS was the original DNS server used in Kubernetes to provide DNS-based service discovery for Services and Pods. It automatically created and managed DNS records within the cluster, allowing applications to communicate using DNS names instead of IP addresses. In modern Kubernetes versions, CoreDNS has replaced kube-dns as the default DNS server due to its improved performance, flexibility, and extensibility.
Kube-DNS Vs CoreDNS
The following are the difference between kube-DNS and CoreDNS:
| Features | Kube DNS | CoreDNS | 
|---|---|---|
| Architecture | kube-DNS is based on skyDNS that is mainly trained for kubernetes cluster | CoreDNS is a general purpose DNS server that comes with modular design | 
| Extensibility | It has limited extensibility and cusomization options | It is highly extensible through using middleware plugins | 
| Performance | It's performance has optimized for kubernetes workloads for having efficient service discovery | It has efficient performance with configurable caching. | 
| Flexibility | It is mainly designed for k8s environments only. | It can be suitable for the various environments and usecases. | 
| Adoption | It is widely adoptable within the kubernetes ecosystem. | It has gaining the popular outside the k8s as well. | 
Corefile Configuration
The Corefile is a configuration file that is used for DNS servers. It contains the definition and configurations regarding how CoreDNS should operates. It includes which plugins to use, their order and configuraiton parameters. Its simple syntax and modular design facilitates users to use coreDNS to their specific needs.
.:53 {
    kubernetes cluster.local
    forward . /etc/resolv.conf
    cache 30
    reload
}
DNS for Services And Pods
DNS for services and pods are vital for communication within the cluster for having communication with their names.
- DNS For Services: It enables the support of establishing communication between the services through their names. It will map the name of service with respecitve their IP address and lets to have communication with names instead of IP addresses.
- DNS For Pods: It facilitatest intra-cluster communication of pods with their hostnames instead of having with their IP addresses. It lets pods can communicate with each other using these hostnames without the needing to known their IP addresses directly with providing abstraction in networking.
Kubernetes Service DNS
Every Kubernetes Service is automatically assigned a DNS name, allowing applications to communicate using service names instead of IP addresses. The fully qualified domain name (FQDN) of a Service follows this format:
<service-name>.<namespace>.svc.cluster.local
For example, a Service named nginx in the default namespace can be accessed using:
nginx.default.svc.cluster.local
Pods within the same namespace can simply use the Service name (for example, nginx) instead of the full DNS name. When a Pod sends a DNS query, CoreDNS resolves the Service name to its corresponding ClusterIP, enabling reliable service discovery even if the backing Pods are recreated or their IP addresses change.
Types of DNS Services
The types of DNS Services are listed as follows:
1. A/AAAA Records
2. SRV Records
A/AAAA Records
Normal services are assigned to a DNS A or AAAA record. For a name of the type my-svc.my-namespace.svc.cluster-domain.example, this will resolve to the cluster IP of the Service. This relies on the IP family of the Services.
Additionally, dependent on the IP family of the service, headless services are given a DNS A or AAAA record with the name of the format my-svc.my-namespace.svc.cluster-domain.example. This will resolve to the collection of pod IPs that the service has chosen.
SRV Records
They were primarily developed for named ports that were essential to Headless Services or regular services. Every named port will have an SRV record of the format _my-port-name. my-port-protocol.my-svc.my-namespace.svc.cluster-domain.example. This resolves to the port number and, in the case of a typical service, the domain name my-svc.my-namespace.svc.cluster-domain.example.
Features of Kubernetes DNS
Kubernetes DNS simplifies communication between applications by providing automatic name resolution for Services and Pods. Some of its key features are:
- Automatic DNS Records: Creates DNS records for Services and Pods automatically.
- Namespace-Aware Resolution: Supports Services with the same name in different namespaces.
- Stable Service Names: Enables communication using DNS names instead of Pod IPs.
- Dynamic Updates: Updates DNS records automatically when cluster resources change.
- Headless Service Support: Resolves individual Pod IPs for headless Services.
Customizing DNS Service
Customization of DNS service in a network involves in configuring the DNS servers that will be suitable for specific needs. It may include in setting up the custom domain names, integrating with external DNS providers. By implementing DNS based security measures like DNS filtering facilitates with optimizing the performance of the DNS resolution. It facilitates with ensuring effiicient and secure resolutions of domain names across the network infrastructure.
Using CoreDNS for Service Discovery
CoreDNS enables service discovery by mapping Kubernetes Service names to their corresponding IP addresses. Instead of connecting to Services using IP addresses, Pods can use DNS names, allowing applications to communicate reliably even when Pod IP addresses change. This simplifies networking and improves the scalability and reliability of Kubernetes applications.
Steps to Configure DNS for A Cluster
The following are the steps for configuring DNS for a Kubernetes Cluster:
Step 1 : Choose DNS Solution
- Select the DNS solution like CoreDNS or kube-DNS on considering its comptability with the kuberentes version and the specific reqirements.
Step 2: Install DNS Add-on
- Deploy the chosen DNS add-on to the kubernetes cluster using appropriate deployment method such as YAML manifests or package managers like Helm.
Step 3: Customize Configuration
- Try to modify the configuration file of the DNS server as per the requirements that suits for the cluster's requirements. It involves in adjusting the DNS policies, specifying the custom DNS providers or configuring additional plugins.
Step 4: Update CoreDNS/Corefile
- If the using the DNS server is CoreDNS then update the corefile for defining the DNS zones, plugins, and upstream resolvers as per needed. Make ensure that the desired changes are reflected on DNS behaviour for the cluster.
Step 5: Verify Configuration
- Now, test the configurations by resolving its domain names from within the cluster and ensuring that the DNS querires are properly routed to the DNS service.
Step 6: Monitor and Maintain
- By regularly maintaining the DNS performances, we can resolve any issues promptly. Maintaince of DNS configurations by updating it respective to the cluster evolves is recommended practice.
Trouble Shooting Issues of Kubernetes DNS
The following are the some of the trouble shooting issues of kubernetes DNS:
- Check Pod Network: Ensure that pod networking is correctly configured and functioning. DNS resolution relies on network connectivity between pods and DNS services.
- Verify DNS Service: Confirm that the DNS service is running and healthy within the Kubernetes cluster. Check for any errors or warnings in the DNS service logs.
- DNS Configurations: Review DNS configurations, such as ConfigMaps and CoreDNS settings, for any misconfigurations or conflicts. Ensure that DNS policies align with the cluster's requirements.
- Pod Resolvability: Verify that pods can resolve DNS names both within and outside the cluster. Test DNS resolution from various pods to ensure consistency and correctness.
