# Google Cloud Platform

> Source: https://www.geeksforgeeks.org/devops/key-gcp-compute-services/

To create and run a Virtual Machine in the Google Cloud Platform, one needs Compute Services to perform certain operations. Google Cloud Platform’s Compute Engine provides a variety of computing options according to users’ needs. Whether you’re looking for virtual machines, serverless or a managed platform, there’s something for you. Some of the most popular are Compute Engine, App Engine, Kubernetes Engine (GKE), Cloud Functions and Cloud Run.
Types of Google Cloud Compute Services
The following are some of the important Google Cloud Compute Services:
1. Google Compute Engine(GCE)
Compute Engine gives you virtual machines on Google’s infrastructure. As an Infrastructure as a Service (IaaS), it’s for those who want full control over their system, including the operating system, storage, and networking.
Best For:
- Deep customization, such as a custom operating system kernel.
- High resource usage.
- 1:1 container to virtual machine mapping.
- Migrating on-premise systems to the cloud.
2. Google App Engine(GAE)
App Engine is a Platform as a Service (PaaS) for scalable web applications and IoT backends. It adjusts resources based on the application’s traffic so you can build and manage apps without worrying about the infrastructure.
Best For:
- Stateless apps.
- Building CRUD heavy apps or APIs quickly.
- Apps composed of a few services that benefit from auto-scaling.
- Projects that need a fast development process with built-in APIs.
3. Google Kubernetes Engine (GKE)
If you’re using containers, Google Kubernetes Engine (GKE) is a great option. It’s based on Kubernetes, Google’s open source container orchestration tool and makes it easier to deploy and manage containerized workloads in the cloud.
Best For:
- Already containerized or can be containerized apps.
- Hybrid or multi-cloud.
- Stateful and stateless microservices.
- Strong CI/CD pipelines.
4. Cloud Functions
Cloud Functions is a serverless compute solution for event-driven tasks. With it, you can deploy small pieces of code that respond to specific triggers, without worrying about managing servers or runtime environments.
Best For:
- Trigger-based workflows, such as reacting to log events.
- Simple, lightweight APIs.
- Quick data transformations or ETL processes.
5. Cloud Run
Cloud Run is a flexible, managed platform for running stateless containers. It combines the best of serverless architecture with containerized workloads, allowing you to deploy applications effortlessly.
Best For:
- Stateless applications in containers.
- Event-driven systems.
- Apps with specific system and language dependencies that don’t fit other serverless models.
Choosing the right compute service from Google Cloud depends on your application’s needs. For example, if you need granular control, Compute Engine is a great choice. If you want a fully managed, scalable solution, App Engine or Cloud Run might be a better fit. With these options, you can build, deploy, and scale applications with confidence, no matter the size or complexity.
Additional GCP Services Related to Compute
To create and run a Virtual Machine in the Google Cloud Platform, one needs Compute Services to perform certain operations. Google Cloud Platform's Compute Engine provides a variety of computing options according to users' needs. Some of them are discussed below along with their use cases:
1. Cloud Dataproc
- Cloud Dataproc is a managed Apache Hadoop-based data processing service, which is an ideal solution for Big Data analytics.
- Cloud Dataproc can process and analyze Apache Hadoop-based workloads using clusters of virtual machines.
2. Cloud Functions
- The Google Cloud Platform offers fully managed code execution environments called “Cloud Functions” that developers can use to build event-driven applications in the cloud without having to manage infrastructure or write boilerplate code.
- With just a few lines of JavaScript, you can write small pieces of code that respond to events and do things like send an SMS notification, execute a database query, or generate thumbnails from uploaded images.
3. Cloud Storage API
- The Google Cloud Storage API is a RESTful API that allows developers and partners to store and retrieve data on the Google Cloud Platform.
4. Cloud Pub/Sub
- The Cloud Pub/Sub API is a publish/subscribe messaging system that enables developers to build a global and distributed real-time messaging application in the cloud.
- This API provides a simple, stateless, and scalable model for building applications that need to send real-time messages or updates.
- It allows you to subscribe (create topics) as well as "publish" messages (create topics) on these topics.
- The message payloads are decoded from JSON records, then serialized into JSON format for storage and delivery via an HTTP request.
5. Cloud Bigtable
- The Google Cloud Bigtable API provides programmatic access to Google’s global, distributed, persistent multi-model database.
- This API allows you to read and write data in Cloud Bigtable, create and run administrative and user-defined actions on the tables, as well as delete data from the tables.
6. Cloud Spanner
- The Cloud Spanner API allows developers to access the Cloud Spanner-managed database service using RESTful calls.
- A globally distributed database for horizontal scaling of SQL queries is readily available for applications that need a relational database and high availability without having to manage any infrastructure or be an expert in SQL.
7. Cloud Dataflow
- The Cloud Dataflow API is a fully managed service for data processing pipelines, including both batch and streaming data.
- Apps that process large amounts of data can run as reliably and efficiently as those processing small amounts of data, thanks to the scalability and high availability provided by Google infrastructure.
8. Cloud Tasks
- The Cloud Tasks API is a fully managed task execution service for developers who want their applications to respond quickly to user interactions by executing lightweight code in the cloud.
- Developers can use this API to run tasks on-demand or schedule them to run at specific times or dates.
9. Cloud Pub/Sub
- The Cloud Pub/Sub API is a publish/subscribe messaging system that enables developers to build a global and distributed real-time messaging application in the cloud. This API provides a simple, stateless, and scalable model for building applications that need to send real-time messages or updates. It allows you to subscribe (create topics) as well as "publish" messages (create topics) on these topics.
- The message payloads are decoded from JSON records, then serialized into JSON format for storage and delivery via an HTTP request.
10. Cloud Storage
- The Google Cloud Storage APIs provide programmatic access to Google’s globally distributed object storage service. Using the APIs, developers can store and retrieve objects from Google Cloud Storage buckets, as well as query metadata about those objects.
- It is a highly available and scalable service that stores object data in a bucket, defined by the app developer.
11. Cloud Datastore
- The Google Cloud Datastore API is a managed NoSQL database service that provides global, distributed storage for your application’s data.
- The API includes full CRUD support for Entities, and supports indexing and searching over your Entities using built-in indexes.
- The API supports multiple language bindings including Java, PHP, Python, and Ruby.
GCP Compute Service Pricing
Google Cloud Platform (GCP) offers flexible and cost-effective pricing for its compute services, allowing businesses to pay based on usage. The pricing model varies depending on instance type, workload requirements, and commitment plans.
GCP Compute Services Pricing Overview
| Compute Service | Pricing Model | Free Tier | Cost-Saving Options | 
|---|---|---|---|
| Google Compute Engine (GCE) | Pay-per-use (per second) | No | Preemptible VMs (80% cheaper), Committed Use Discounts (up to 57%), Sustained Use Discounts | 
| Google Kubernetes Engine (GKE) | Pay-as-you-go | No | Node auto-provisioning, Spot VMs, No cluster fee in Standard mode | 
| Google App Engine (GAE) | Pay-per-instance usage | 28 instance hours/day | Flexible pricing for standard and flexible environments | 
| Cloud Functions | Pay for execution time and memory usage | 2 million requests/month | Optimize function duration and trigger usage | 
| Cloud Run | Billed per request and execution time | 50 free vCPU-seconds & 50,000 requests/month | Scale-to-zero feature reduces idle costs | 
Cost Optimization Tips for GCP Compute Services
For the GCP Compute Services Cost Optimization you can use the following ways:
- Use Preemptible VMs for short-lived or non-critical workloads to save up to 80%.
- Enable Auto-scaling to dynamically adjust resources based on demand.
- Leverage Committed Use Discounts (CUDs) to lower long-term costs.
- Monitor usage via GCP Billing Reports to control unexpected expenses.
Best Practices For GCP Compute Services
The following are the best practices we can follow for GCP Compute Services:
1. Security Optimization
- Enable encryption and use IAM roles to control access.
- Secure workloads with Google Cloud Firewalls and VPC Service Controls.
2. Cost Optimization
- Use preemptible VMs for non-critical workloads to reduce costs.
- Leverage auto-scaling to optimize resources.
- Apply committed-use discounts for sustained savings.
3. Performance Optimization
- Optimize compute instances based on workload demands.
- Use load balancers to distribute traffic efficiently.
- Implement caching and CDNs for fast data retrieval.
Conclusion
Google Cloud offers a range of compute services that can handle everything from simple serverless functions to complex, highly customizable virtual machines. Whether you're building a small app or migrating a large enterprise workload, GCP’s compute options are flexible and powerful enough to meet your needs.
