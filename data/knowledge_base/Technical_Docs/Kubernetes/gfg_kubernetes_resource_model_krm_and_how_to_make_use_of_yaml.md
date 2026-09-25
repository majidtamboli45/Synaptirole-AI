# Kubernetes Resource Model (KRM) and How to Make Use of YAML?

> Source: https://www.geeksforgeeks.org/linux-unix/kubernetes-resource-model-krm-and-how-to-make-use-of-yaml/

Here we will explain how YAML can simplify system management and automation of most processes so that Kubernetes is a convenient working system.
Basic Kubernetes Models: KRM and Everything-as-Code
According to Kubernetes co-founder Brian Grant, Kubernetes is very convenient thanks to the Kubernetes Resource Model (KRM) resource model. This is a way to create a declarative configuration file in a readable format to define the desired system state using code. A key aspect of KRM is the uniform declarative metadata. Therefore, KRM is often expressed as YAML and declares the basic idea that everything in Kubernetes is YAML.
A similar idea underlies the Everything-as-Code paradigm (EaC, all as code). According to its principles, the entire IT infrastructure can be configured with code from configuration to security systems. This makes it declarative, which allows you to focus not on implementing individual functions but on the final goals and states. Nevertheless, YAML is important to have a better balance in using these technologies flawlessly.
Kubernetes and YAML
Kubernetes is called the 21st century Linux kernel. This idea compares the ability to search for any information about the system through proc in Linux and through the API in Kubernetes: first - all files (file streams), second - all YAML. You can get information about any parts of the system and applications implemented in the form of Kubernetes operators and custom resources. Using YAML dramatically simplifies these tasks.
In fact, thousands of projects - from CNI(Container Network Interface) and ServiceMeshs to Security and Infrastructure - are native to Kubernetes in the form of Kubernetes operators and custom Kubernetes resources. Cilium, Istio, Gloo, Knative, ClickHouse, and other services can be managed and monitored natively by simply changing and tracking YAML files. This confirms that Kubernetes and YAML are closely related and interdependent.
Here is a list of pros to using YAML files:
- Humans can readily understand them. YAML files are flexible and expressive.
- They're simple to set up and operate.
- They are easily transferable from one programming language to another.
- They are compatible with agile languages' inherent data structures.
- To facilitate generic tools, YAML files have a consistent model.
- They are capable of one-pass processing.
- They're simple to use, so you won't have to type in all of your arguments on the command line.
- You can do maintenance. To track changes, YAML files may be added to source control.
- They are adaptable. YAML allows you to design more complicated structures than you can on the command line.
Why it is essential to have the same type ensured by using YAML?
The same type of implementation was always necessary, and its importance only increases with the popularization of the DevSecOps-approach(Developer Security Operations). Now many different commands can work with the cluster, and each of them should be able to see the overall picture of what is happening and clearly understand it. This is essential for the timely implementation of mandated tasks and the coherence of all departments.
If the exact implementation is not ensured, it is easy to have specialists from different departments see only fragments of information about services and infrastructure without any coordination. This complicates both everyday work and debugging. Such cases are unacceptable - all should equally see what is happening in the infrastructure.
Real-Life Example:
Let's suppose, the development team, operation, has been solving the problem for a long time: for some reason, in one particular environment, the application worked normally on the network(environment), and in another, it did not work. 
One image, one setup, all completely identical, but something is wrong. After a few hours, they despaired and went to the security team. It turned out that the development team/operation team used a third-party commercial solution, which for its work introduces third-party libraries into processes running in containers. And these processes blocked what they thought was the wrong behavior. The lock could only be seen inside the process memory and directly in the interface, which only the security command has.
Now one question arises i.e."if something does not work in the infrastructure, you need to go to security, and then understand?". Basically, we shouldn’t be practicing that in real-life to go to the security guards with any problem. Everything that happens in infrastructure should be equally transparent to everyone.
Kubernetes is a framework. It is designed to be as flexible as possible to create infrastructure for its teams and processes, in this case, not only the infrastructure associated with high availability, directly with the rapid expansion of services, but also with all aspects related to databases serviceless-loads, security, and others.
YAML is a «friendly» format of serialization(converting one form to another). It is not only simple syntax and allows you to store data in a compact and readable form, but also suitable for all programming languages. This allows you to use it to ensure the same type of design is understandable and convenient for all devs.
Kubernetes can be much more complicated than you think
In most Source-code managers (SCM) used by companies, projects are placed in several ways:
- YAML resources are provided by service.
- YAML resources are placed according to the name of the service and its type: Deployment, Service, Ingress, and so on.
- Resources are stored by category and subcategory.
So, resources are tied. And connections are essential for supporting and understanding the device of the services and other entities of the cluster, as is the lack of communication - it can point to typos and errors. But this requires maintaining and understanding a vast array of different projects with their linkage logic.
Example:
kubectl -n namespace get all
Kubernetes, provide the following command. From its description, it seems that it will return all the resources in this namespace. 
But that’s not true: the team sees only a particular set of resources. Therefore, you will get a partial idea of the specified namespace if you use it.
How to Link Resources?
There are 3 highlighted ways of linking resources - they will be useful if you will understand someone else’s project or write your Kubernetes operator with your custom resources:
- ownerReference (UID)
- Selector
- targetRef
1. ownerReference
Allows one resource to refer to its «parent» In this way, the change or removal of the «parent» affects all descendants. This option is used, for example, when Deployment - «parent» ReplicaSet, and ReplicaSet - «parent» pod.
ownerReference actively uses GarbageCollector: if a parent is deleted, all resources associated with it on ownerReference will be deleted. For more understanding, removing an image for a container in a descriptive model will also delete the resource that stores the associated scan results and reports.
2. Selector
The most common way to link resources among themselves - is by selectors and labels
Key/value pairs called labels are stuck/attached to things like pods. Although labels are not designed to explicitly suggest semantics to the main system, they are intended to be used to indicate distinguishing qualities of objects that are meaningful and important to users.
3. targetRef
One way to organize communication is targetRef. It implies specifying the API version of the resource, its name, and the resource type.
This way gives a clear understanding of all the relationships, so targeted (name may vary depending on the implementation, but the idea remains the same) is considered best for linking resources to each other.
