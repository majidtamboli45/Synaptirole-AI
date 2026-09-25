# What is Google Cloud Platform (GCP)?

> Source: https://www.geeksforgeeks.org/devops/google-cloud-platform-gcp/

Google Cloud Platform (GCP) is a cloud computing platform that provides infrastructure and services for building, deploying, and managing applications.
- Compute and Storage: Provides services for running applications, storing data, and managing virtual machines.
- Data and AI: Offers tools such as BigQuery and Vertex AI for data analytics and machine learning.
- Scalability and Security: Provides global infrastructure, security features, and scalable resources for businesses of all sizes.
Regions and Zones
Let's start at the finest grain level (i.e. the smallest or first step in the hierarchy), the Zone. A zone is an area where Google Cloud Platform Resources like virtual machines or storage are deployed.
- For example, when you launch a virtual machine in GCP using Compute Engine, it runs in a zone you specify (suppose Europe-west2-a).
- Although people consider a zone as being sort of a GCP Data Center, that's not strictly accurate because a zone doesn't always correspond to one physical building.
- You can still visualize the zone that way, though.
- Zones are grouped into regions which are independent geographic areas and much larger than zones (for example- all zones shown above are grouped into a single region Europe-west2) and you can choose what regions you want your GCP resources to be placed in.
- All the zones within a neighbourhood have fast network connectivity among them. Locations within regions usually have trip network latencies of under five milliseconds. 
As a part of developing a fault-tolerant application, you'll need to spread your resources across multiple zones in a region.
- That helps protect against unexpected failures. You can run resources in different regions too.
- Lots of GCP customers do this, both to bring their applications closer to users around the world, and also to guard against the loss of a whole region, say, due to a natural disaster.
- A few GCP Services supports deploying resources in what we call a Multi-Region. For example, Google Cloud Storage, lets you place data within the Europe Multi-Region.
- What that means is that it is stored redundantly in a minimum of two different geographic locations, separated by at least 160 kilometers within Europe. Previously, GCP had 15 regions.
Google Cloud Services
Google Cloud Platform (GCP) offers three primary methods for interacting with its services and resources:
1. Google Cloud Console
The Google Cloud Console is a web-based, graphical interface that allows you to manage and configure your GCP projects and resources. You can either create a new project or select an existing one to use resources within the project. The console provides an easy-to-navigate dashboard to monitor and control various Google Cloud services.
2. Command-Line Interface (CLI)
For those who prefer command-line operations, Google Cloud provides the Cloud SDK, which includes the gcloud CLI. This tool allows you to manage GCP resources directly from a terminal window. For example, to create a Compute Engine virtual machine (VM), you can use the `gcloud compute instances create` command. You can use the gcloud CLI in two ways:
- Install it locally on your computer.
- Use Cloud Shell, a browser-based terminal environment accessible directly from the Google Cloud Console, eliminating the need for local installation. Cloud Shell provides features such as a built-in code editor, 5 GB of persistent storage, and pre-installed tools, including the gcloud CLI. It supports multiple programming languages like Java, Python, Go, Node.js, and more.
To know more about GCP installation in windows & linux you can refer to this Installation of GCP CLI In Linux and Windows
3. Client Libraries
Google Cloud also offers client libraries that simplify resource management and application development. These libraries expose APIs tailored to specific languages such as Python and Node.js, allowing you to interact with GCP services more intuitively. Client libraries are available for:
- App APIs for accessing services with less code and seamless integration with GCP.
- Admin APIs for managing resources, ideal for building automation tools.
Additionally, these libraries can be used for services like Google Maps, Drive, and YouTube.
Google Cloud vs Google Cloud Platform
| Aspect | Google Cloud | Google Cloud Platform (GCP) | 
|---|---|---|
| Definition | A broad suite of services offered by Google over the internet to support digital transformation. | A subset of Google Cloud that provides public cloud infrastructure for hosting applications. | 
| Key Services | Includes products like Google Workspace, Android Enterprise, Chrome OS, and machine learning APIs. | Focused on cloud infrastructure services such as computing, storage, networking, and databases. | 
| Example Offerings |  |  | 
| Target Use Case | Provides collaboration tools, device management, and APIs for enterprise use. | Enables businesses to run and scale web-based applications on the cloud. | 
Google Cloud Platform Services
Here are some of the services offered by Google Cloud Platform categorized by their functionalities:
| Category | Service | Description | 
|---|---|---|
| Cloud Computing | Compute Engine | Compute Engine lets you create and manage virtual machines, giving you control over the resources you need, like memory, storage, and security settings for your applications. | 
|  | Google Kubernetes Engine (GKE) | GKE is a managed Kubernetes service that helps you deploy applications while automatically handling scaling and load balancing for you. | 
|  | App Engine | App Engine is a scalable platform for running web applications. It dynamically adjusts to changing demand and provides a secure environment to ensure your app performs well. | 
| Storage | Cloud Storage | Cloud Storage is designed to store large amounts of data that need to be highly available and easily accessed. | 
|  | Persistent Disk | Persistent Disk provides durable storage that can be attached to virtual machines and reused when necessary, making it versatile for various use cases. | 
|  | Cloud SQL | Cloud SQL is a fully managed database service that supports MySQL, PostgreSQL, and SQL Server, taking the hassle out of database management. | 
| Networking | Virtual Private Cloud (VPC) | With VPC, you can run your applications inside a private network, offering more control and security for your infrastructure. | 
|  | Cloud Load Balancing | This service ensures your application traffic is distributed evenly across multiple instances, helping your app stay fast and responsive. | 
|  | Cloud CDN | Cloud CDN caches content and delivers it from the closest edge location to users, speeding up delivery and reducing load times. | 
| Data Analytics | BigQuery | BigQuery is a powerful data warehouse that makes analyzing huge amounts of data easy and fast, giving organizations deep insights from their data. | 
|  | Dataflow | Dataflow helps you understand how data flows through your system, allowing you to optimize and analyze data processes for better performance. | 
|  | Pub/Sub | Pub/Sub is a messaging system that decouples services, allowing them to communicate asynchronously, improving system efficiency and preventing bottlenecks. | 
| Machine Learning | Vertex AI Platform | Vertex AI Platform is Google Cloud's suite for building and managing AI models, helping organizations unlock the potential of AI for business transformation. | 
|  | AI Platform Training | AI Platform Training lets you train machine learning models in the cloud, giving you the computing power to handle complex AI tasks. | 
|  | AI Platform Prediction | This service allows you to make predictions using your trained machine learning models, helping you apply AI to real-world problems. | 
| Productivity and Collaboration | Cloud Identity and Access Management (IAM) | IAM allows administrators to control who can access what within an organization, ensuring that only authorized users have the appropriate level of access to resources. | 
To know more, refer to: Create a Free Tier Account on GCP
Higher-Level Services on Google cloud
Here are some of the higher-level services offered by Google Cloud Platform:
- Big Data and Analytics Services: Big Data and Analytics Services offer insights from large volumes of data to help businesses make informed decisions.
- Machine Learning and AI Services: Machine learning and AI services are technologies that enable computers to learn from data and perform tasks without being explicitly programmed.
- Serverless Computing: Serverless computing is a cloud computing model where the cloud provider manages the infrastructure, allowing developers to focus solely on writing and deploying code without worrying about servers.
Use Cases
Google Cloud Platform is well suited for the build and deploy and manage the applications.
- E-commerce: You deploy and manage the e-commerce websites by autoscaling and load balancing you can manage the millions of users and transactions.
- Media and entertainment: You can store the static and dynamic data can deliver it to the across the world with out any latency to the end users.
- Financial services: Google Cloud Platform is well suited for the sinical application because of the level of security it is offering.
- Healthcare: You can store the data of patient and take care the outcomes of the health of patient.
Security
Google Cloud Platform offers following security options.
- Encryption: Google cloud platform offers security like encryption at rest and in transit for all of your data.
- Access control: You can control the access to the individual users like which services they can access and which service they can't depending on the use cases.
- Network Security: You can create the VPC where you can secure the application by deploying the application in the private network and also you can configure the firewalls and security groups etc.
- Identity-Aware Proxy (IAP): With IAP, users may manage application access according to their context and identity. It aids in preventing unwanted access.
Future of Google Cloud Platform
Google Cloud Platform (GCP) is evolving constantly by expanding its resources and increasing its regions and availability zone across the world which make it mote available for the users to use reduces the latency. GCP is upgrading itself according to the market trends GCP play an major role in the upcoming years it will play major role it will helps for the businesses to thrive in the increasingly data-driven and interconnected world.
- Artificial intelligence (AI) and Machine Learning (ML)
- Edge computing
- Data analytics and data management
- Cybersecurity
- Sustainability
GCP Pricing and Free Tier
Google was the primary major Cloud provider to bill by the second instead of rounding up to greater units of your time for its virtual machines as a service offering. This may not sound like a big deal, but charges for rounding up can really add up for customers who are creating and running lots of virtual machines. Per second billing is obtainable for a virtual machine use through Compute Engine and for several other services too. 
Compute Engine provides automatically applied use discounts which are discounts that you simply get for running a virtual machine for a big portion of the billing month. When you run an instance for at least 25% of a month, Compute Engine automatically gives you a reduction for each incremental minute you employ it. Here's one more way Compute Engine saves you money. 
Normally, you choose a virtual machine type from a typical set of those values, but Compute Engine also offers custom virtual machine types, in order that you'll fine-tune the sizes of the virtual machines you use. That way, you'll tailor your pricing for your workloads. 
Free Tier: Google Cloud Platform offers a generous free tier with limited usage of various services, allowing users to explore and experiment with GCP without incurring charges. The free tier typically includes a certain amount of usage for services like Compute Engine, App Engine, Cloud Storage, BigQuery, and more.
GCP Open APIs and Avoiding Vendor Lock-in
Some people are afraid to bring their workloads to the cloud because they're afraid they'll get locked into a specific vendor. But in many ways, Google gives customers the power to run their applications elsewhere, if Google becomes not the simplest provider for his or her needs. Here are some samples of how Google helps its customers avoid feeling locked in. GCP services are compatible with open source products. For example, take Cloud Bigtable, a database that uses the interface of the open-source database Apache HBase, which provides customers the advantage of code portability. Another example, Cloud Data provides the open-source big data environment Hadoop, as a managed service, etc.
Google Cloud Certification Paths
Google Cloud Platform offers wide range of certifications to validate you skills some of the certifications as mentioned follows.
- Foundational: It is an basic certification to test your basics on google cloud platform like features, benefits and use cases of google cloud.
- Associate Cloud Engineer: Associate Cloud Engineer this certification will test your fundamentals on google cloud platform which are like deploying and maintaining the projects.
- Professional Cloud Architect: Professional Cloud Architect will test you depth knowledge on the complete overview of the services implementation of and managing the services of google cloud.
- Professional Cloud DevOps Engineer: Professional Cloud DevOps Engineer will test you knowledge on the services like deployment automation and scaling the application at the sudden loads.
- Professional Cloud Network Engineer: Professional Cloud Network Engineer will validates the you ability on the desging of the networks for the business use in cloud environments.
Why Choose Google Cloud Platform?
- GCP allows you to choose between computing, storage, big data, machine learning, and application services for your web, mobile, analytics, and, back-end solutions.
- It's global and it is cost-effective.
- It's open-source friendly.
- It's designed for security.
Advantages and Disadvantages of Google Cloud Platform
The following are the advantages and disadvantages of Google Cloud Platform:
| Advantages | Disadvantages | 
|---|---|
| Good Documentation: Detailed API Reference guide. | High Support Fee: Around $150 per month for the most basic service (Silver class). | 
| Different Storage Classes: Regional (frequent use), Nearline (infrequent use), Coldline (long-term storage). | Expensive Data Downloads: $0.12 per GB for downloading from Google Cloud Storage. | 
| High Durability: Data survives even with the loss of two disks simultaneously. | Confusing Web Interface: Navigation can be tricky, with menus sometimes hard to follow. | 
| Multiple Regions for Data Storage: Available in North America, South America, Europe, Asia, and Australia. | Higher Storage Costs: Prices are higher compared to Microsoft Azure and Backblaze B2. | 
| Console Tab for SDKs: Try different SDKs for free, useful for developers. | High Pricing Schema: Similar to AWS S3, which can lead to unexpected costs (e.g., requests, transfers). | 
Cloud Service Categories: IaaS, PaaS, SaaS
| Cloud Service Model | Description | Examples | 
|---|---|---|
| Infrastructure as a Service (IaaS) | IaaS provides essential hardware components over the internet, allowing users to access computing power, storage, networking, and more. With IaaS, users control the configuration of their virtual infrastructure, giving them flexibility and scalability without the hassle of managing physical hardware. | Compute engines, Storage, Memory | 
| Platform as a Service (PaaS) | PaaS offers a ready-to-use platform for developers to build, deploy, and manage applications, without worrying about the underlying infrastructure. It includes tools like development frameworks, databases, and runtime environments, letting developers focus on coding and innovation. | Google App Engine, Microsoft Azure App Service | 
| Software as a Service (SaaS) | SaaS provides fully functional software applications hosted and managed by a third-party provider. These applications can be accessed through a web browser or API, eliminating the need for local installation or maintenance. | Google Workspace, Google Cloud Identity, Google Maps Platform | 
Google Cloud Competitors
Google Cloud competes with several prominent public cloud providers in a fiercely competitive market.
- Amazon Web Services (AWS): AWS is the largest cloud computing provider globally, offering a vast array of services including compute, storage, databases, machine learning, and more. It dominates the market and is often considered the primary competitor to Google Cloud.
- Microsoft Azure: Azure is another major player in the cloud computing industry, offering a comprehensive suite of services similar to AWS and Google Cloud. It benefits from Microsoft's strong enterprise presence and integration with other Microsoft products and services.
- IBM Cloud: IBM Cloud provides a range of cloud computing services, including infrastructure as a service (IaaS), platform as a service (PaaS), and software as a service (SaaS). It is known for its focus on hybrid cloud solutions and enterprise-grade services.
GCP vs AWS
Here's the comparison between Google Cloud Platform (GCP) and Amazon Web Services (AWS):
| Aspect | Google Cloud Platform (GCP) | Amazon Web Services (AWS) | 
|---|---|---|
| Market Share and Adoption | Gaining traction, especially among enterprises and startups | Holds the largest market share in the cloud industry | 
| Global Infrastructure | Data centers in multiple regions worldwide | Extensive global infrastructure with more regions and zones | 
| Compute and Storage Services | Compute Engine, Cloud Storage, Cloud SQL | Amazon EC2, Amazon S3, Amazon RDS | 
| Machine Learning and AI Services | Cloud AI, AutoML, TensorFlow | Amazon SageMaker, AWS AI/ML services | 
| Developer Tools and Ecosystem | Wide range of developer tools and integration with Google products | Extensive ecosystem of third-party tools and services |
