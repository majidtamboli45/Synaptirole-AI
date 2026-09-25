# Use Cloud Datastore For NoSQL Database On GCP

> Source: https://www.geeksforgeeks.org/devops/how-to-use-cloud-datastore-for-nosql-database-on-gcp/

Cloud Datastore is a fully managed, scalable NoSQL document database designed for modern cloud applications on Google Cloud Platform. It enables developers to store, retrieve, and query structured data efficiently without worrying about infrastructure management.
- Fully managed NoSQL document database with automatic scaling and high availability.
- Schema-flexible data model based on entities, keys, and kinds.
- Seamless integration with other Google Cloud services.
- Optimized for high-performance reads and writes in large-scale applications.
Architecture of Cloud Datastore
Cloud Datastore follows a serverless and distributed architecture, abstracting all infrastructure concerns from the user.
Key Architectural Components
- Client Applications: Applications communicate with Datastore using SDKs available for multiple languages such as Java, Python, Go, and Node.js.
- Entities and Kinds: Data is organized into entities, grouped by kinds. Each entity has a unique key, which enables efficient lookups.
- Indexes: Datastore automatically creates single-property indexes and allows developers to define composite indexes for complex queries.
- Distributed Storage Layer: Data is stored across multiple nodes and regions, enabling horizontal scalability and fault tolerance.
- Transaction and Consistency Model: Supports ACID transactions within entity groups, providing strong consistency where required.
Cloud Datastore Working
Cloud Datastore stores data as entities, which are objects containing one or more properties. Each entity is uniquely identified by a key and grouped under a kind, similar to a table in relational databases.
The workflow typically involves:
- Applications interacting with Cloud Datastore using client libraries or REST APIs.
- Requests being handled by Google-managed services that automatically manage indexing, replication, and scaling.
- Queries executed using indexed properties to ensure fast and consistent performance.
Cloud Datastore automatically handles data replication across multiple locations, ensuring durability and high availability with minimal developer effort.
Why Use Cloudstore?
You may decide to use Cloud Datastore as your NoSQL database solution on Google Cloud Platform (GCP) for a number of reasons, including:
- Scalability and Performance: Cloud Datastore increases its resources automatically as your application grows to accommodate more read and write operations. It is built to manage high-scale workloads. It offers reliable performance that is predictable, ensuring a seamless user experience even during periods of high usage.
- Fully Managed Service: Google Cloud controls the infrastructure, including the creation, scalability, and upkeep of the database, with the help of Cloud Datastore. Since database administration duties are no longer necessary, you can concentrate on creating your apps rather than running the supporting infrastructure.
- Flexible Data Model: A flexible and schemaless data model is provided by Cloud Datastore. As your data requirements change over time, it enables you to store and retrieve structured data without the use of established schemas, giving you flexibility.
Create a Cloud Datastore Database
Follow these steps to build a Cloud Datastore database:
Step 1: Set up a Google Cloud Platform (GCP) project
Create a new GCP project if you don't already have one by going to the Google Cloud Console (console.cloud.google.com) and following the instructions. Make sure you have the authorizations required to add resources to the project.
Step 2: Enable the Cloud Datastore API
Go to the API Library in the Cloud Console and look for "Cloud Datastore API." To enable the API for your project, click on it. You can interface with Cloud Datastore and manage databases using this step.
Inserting and Updating Data
Learn several techniques for adding and updating entities in Cloud Datastore by utilizing the available client libraries or APIs. Discover upsert operations and handling data changes best practices.
Create Entities and Store Data
Once the connection has been made, you can begin building entities and adding data to your Cloud Datastore database. Use the client library or SDK functions provided to enter data into the database after defining the structure of your entities, including their types and properties.
Step1: Click on the "CREATE ENTITY" button to start creating a new entity
Step 2: Enter the desired kind or type of entity you want to create in the "Entity Kind" area. The group or category to which the entity belongs is represented by this.
Step 3: By selecting the "ADD PROPERTY" button, you may specify the entity's properties. For each property you want to include, specify its name, data type, and value. As necessary, you can add other characteristics.
How To Query Cloud Datastore?
These steps can be used to query Cloud Datastore as a NoSQL database on Google Cloud Platform (GCP):
Step 1: Set up a GCP project and enable the Cloud Datastore API.
Create a GCP project if you haven't previously, and then enable the Cloud Datastore API for that project. You can now query the Cloud Datastore and interact with it.
Step 2: Install the necessary libraries or SDK.
Install the necessary SDKs or libraries for the programming language of your choice Install the required prerequisites so that you may connect to Cloud Datastore and run queries from there.
Step 3: Authenticate with GCP
Make sure you are using the correct credentials to authenticate your application with GCP. Performing this step guarantees that your application has the rights necessary to access Cloud Datastore. According to the needs of your application, you can utilize service account credentials or different authentication techniques.
Step 4: Create a query object
Use the client library or SDK to create a query object. Indicate the categories of entities you want to search. If you had entities of the type "Person," for instance, you would do a query for that kind.
Step 5: Execute the query
Execute your query using the relevant method offered by the client library or SDK after building it with any necessary filters and sorting. In order to process the query, this sends it to Cloud Datastore.
Best Practices for Using Cloud Datastore
- Deleting Entities: Learn how to remove entities from Cloud Datastore using a variety of methods, such as deleting by key or running queries to delete numerous instances. Recognize the effects of entity deletion and the proper way to handle cascade deletions.
- Transactions and Consistency: Learn how to use Cloud Datastore's transactional operations to keep your data consistent. To guarantee ACID qualities for your data operations, be aware of the concepts of entity groups and ancestor queries.
- Managing Large Datasets: Learn strategies for effectively managing huge datasets in Cloud Datastore. Investigate techniques for handling large amounts of data, such as data splitting, sharding, and distributed transactions.
- Monitoring and Managing Cloud Datastore: The Cloud Console provides insights into read and write operations, object counts, and storage use, allowing you to track your database's health. Set up backups to secure your data and define retention policies to manage long-term data storage.
