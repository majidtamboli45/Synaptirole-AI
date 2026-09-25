# Physical Servers vs Virtual Machines vs Containers

> Source: https://www.geeksforgeeks.org/devops/kubernetes-physical-servers-vs-virtual-machines-vs-containers/

Kubernetes is an open-source framework for managing containerized workloads and services that allows declarative configuration as well as automation. It has a huge and fast-expanding ecosystem. Services, support, and tools for Kubernetes are widely available.
Kubernetes is a Greek word that means "helmsman" or "pilot." The acronym K8s comes from counting the eight letters between the letters "K" and "s." In 2014, Google made the Kubernetes project open source. Kubernetes blends Google's 15 years of experience operating production workloads at scale with community-sourced best-of-breed ideas and practices.
Physical servers:
Organizations used to run apps on physical servers. In a physical server, there was no method to set resource boundaries for apps, which resulted in resource allocation issues. When numerous apps operate on a physical server, for example, there may be times when one programme consumes the majority of the resources, causing the other applications to underperform.
A possible option is to run each programme on a separate physical server. However, this did not scale because resources were underutilized, and maintaining a large number of physical servers was costly.
Virtual Machines:
Virtualization was introduced as a solution. It enables you to operate several Virtual Machines (VMs) on the CPU of a single physical server. Virtualization allows programmes to be isolated between virtual machines (VMs) and provides a level of security by preventing one application's information from being freely accessed by another.
Virtualization improves resource efficiency on a physical server, improves scalability by allowing applications to be quickly added or changed, lowers hardware costs, and much more. You can offer a collection of physical resources as a cluster of disposable virtual machines using virtualization.
On top of the virtualized hardware, each VM is a whole machine with all of its components, including its own operating system.
Containers:
Containers are comparable to virtual machines (VMs), except they allow programmes to share the same operating system (OS). As a result, containers are considered light. A container, like a virtual machine, has its own filesystem, CPU, memory, process space, and other resources. They are portable across clouds and OS distributions because they are divorced from the underlying infrastructure.
Containers have grown in popularity as a result of their additional benefits, which include:
- Container image creation is more simple and efficient than using VM images for developing and deploying agile applications.
- Continuous development, integration, and deployment: enables the creation and deployment of dependable and frequent container images, as well as quick and efficient rollbacks (due to image immutability).
- Separation of concerns between development and operations: produce application container images during build/release rather than deployment, isolating apps from infrastructure.
- Observability: this feature exposes not just OS-level data and metrics, but also application health and other signals.
- Consistency in the environment during development, testing, and production: On a laptop, it works the same as it does in the cloud.
- Portability of cloud and operating system distributions: Runs on Ubuntu, RHEL, CoreOS, on-premises, on major public clouds, and everywhere else.
- Application-centric management: Moves away from operating an OS on virtual hardware and toward running an application on an OS with logical resources.
- Micro-services that are loosely linked, distributed, elastic, and liberated: instead of a monolithic stack operating on a single large single-purpose machine, applications are split down into smaller, independent components that can be deployed and managed dynamically.
- Application performance is predictable due to resource separation.
- High efficiency and density in resource usage.
