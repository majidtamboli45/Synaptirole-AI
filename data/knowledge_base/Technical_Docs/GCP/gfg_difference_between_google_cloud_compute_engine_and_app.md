# Difference Between Google Cloud Compute Engine and App Engine

> Source: https://www.geeksforgeeks.org/cloud-computing/difference-between-google-cloud-compute-engine-and-app-engine/

Google Cloud Platform provides a wide range of computing services that target broad categories of user needs.
The Google Cloud Platform provides mainly 6 types of compute options: -
- App Engine
- Compute Engine
- Kubernetes Engine
- Cloud Functions
- Cloud Run
- VMware Engine
Now let's talk about some of these services in brief.
Compute Engine
The Compute Engine service is Google's unmanaged compute service. We can think of Compute Engine as an Infrastructure as a Service (IaaS) offering by Google Cloud. As the service is unmanaged, it is our responsibility to configure, administer, and monitor the system. On Google's side, they will ensure that resources are available, reliable, and ready for you to use. The main benefit in using compute engine is that you have complete control of the systems.
You can do the following when you build on Compute Engine:
- Create Virtual Instances, which is the smallest unit in the GCP project.
- Create instance groups to easily manage multiple instances together.
- Create virtual machine images.
The virtual machine instances running in zones assigned to them. Zones are data center-like resources. They are located within regions which is a geographical location. The zones are within a region are linked with low-latency and high bandwidth network connections.
Pros of Compute Engine:
- It offers the users complete control over the Virtual Machine instances.
- It is easy to set up, you can spin up a server within few minutes.
- The use of preemptive VM's can reduce the cost by up to 80%.
- Set of predefined VM configurations and VM images are available ready to be used according to needs.
Cons of Compute Engine:
- Requires high expertise level, since everything needs to be installed and configured by yourself.
- Autoscaling is slower than App Engine.
- To enable monitoring, you need to install packages into the VM instances. No direct Stackdriver monitoring is possible.
App Engine
The App Engine is Google's Platform as a Service(PaaS) offering. It is a compute service that provides a managed platform for running applications. As this is a managed service, your focus should be on the application only and Google will manage the resources needed to run the application. Thus App Engine users have less to manage, but you will have less control over the compute resources. The applications hosted on App Engine are highly scalable and run reliably even under heavy load.
The App Engine supports the following languages:
- Python
- Go
- Ruby
- PHP
- Node.js
- Java
- .NET
The App Engine provides two types of runtime environments: standard and flexible.
- The Standard environment provides a secured and sandboxed environment for running applications and distributes requests across multiple servers to meet the demand. The applications run independently of the hardware, OS, and physical location of the server.
- The Flexible environment provides more options and control to the developers who want to use App Engine, but without the language constraints of the standard environment. It uses Docker containers as the basic building blocks. These containers can be auto-scaled according to load.
Pros of App Engine:
- You need to focus only on the application code, the rest of everything is managed by Google. Thus reducing management complexities.
- As it provides version management, thus it is easy to maintain and roll out versions of applications.
- It has faster autoscaling as the size of instances is smaller.
- Easy to deploy and monitor.
Cons of App Engine:
- It is more constrained as the instances are smaller, thus enabling fast autoscaling, but there can be cases when large applications require larger instances.
- As it is a fully managed service, the user has no control over the underlying infrastructure that may be required for some complex applications.
- It is expensive in the long run as the cost adds up quickly.
Difference between Compute Engine and App Engine:
|  | Compute Engine | App Engine | 
|---|---|---|
| Service model | IaaS offering | PaaS offering | 
| Type of Service | Unmanaged Service | Managed Service | 
| Control over resources | More control and flexibility over resources | Less control over computing resources | 
| Costs | Costs less than App Engine | Costs more than Compute Engine | 
| Running Instances | When running application, at least one instance should be running | Can scale down to zero instances when no requests are coming | 
| Use cases | Best for general computing workloads | Best for web-facing and mobile applications | 
| Autoscaling | Slower autoscaling | Faster autoscaling | 
| Security | Less secure than App Engine | Comparatively more secure than Compute Engine | 
| Logging and Monitoring | Need to be manually setup for logging and monitoring | In App Engine, builtin tools are there for logging and monitoring. |
