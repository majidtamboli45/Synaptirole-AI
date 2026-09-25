# Google Cloud Deployment Manager

> Source: https://www.geeksforgeeks.org/devops/google-cloud-deployment-manager/

Google Cloud Deployment Manager is an infrastructure automation service that allows users to deploy and manage Google Cloud resources programmatically. It uses declarative configuration files to define the desired infrastructure state. The service then automatically creates, updates, or deletes resources to match that configuration.
- Enables infrastructure as code (IaC) using YAML configuration files.
- Automatically provisions and manages resources such as VMs, firewall rules, and networks.
- Provides reusable templates for deploying common infrastructure components.
- Helps organizations automate deployments and reduce manual configuration errors.
Pre-requisite: Google Cloud Platform
Core Architecture Components
The architecture centers on several key file types that work together to define and deploy resources:
- Configuration File: A mandatory YAML file that acts as the blueprint for a deployment. It defines the specific resources to be deployed, their properties, and any imported templates or helper files.
- Template Files: Optional files written in Python or Jinja2 that allow for modularity, reusability, and programmatic generation of configuration content. They are useful for creating standardized, reusable infrastructure patterns.
- Schema Files: These define rules and constraints that a configuration file must follow when using a specific template, enforcing best practices and validation.
How the Architecture Works
- Definition: A user creates a set of configuration and, optionally, template files that specify the desired Google Cloud resources (e.g., Compute Engine VMs, Cloud Storage buckets, Cloud SQL databases) and how they should be configured to work together.
- Expansion: When a deployment is initiated (via the gcloud CLI or API), Deployment Manager recursively expands all templates and imports into a single, fully detailed YAML configuration on the server side.
- Orchestration: The service analyzes the expanded configuration and determines the necessary actions (create, update, or delete) to achieve the specified desired state. It uses dependency tracking to ensure resources are created in the correct order.
- API Calls: Deployment Manager makes calls to the underlying APIs of the various Google Cloud services to provision the actual resources.
- State Management: The service internally manages the state of the deployed infrastructure, removing the need for users to manage a separate state file.
Configuration in Deployment Manager
Configuration refers to defining the desired state of infrastructure using declarative templates. In Google Cloud Deployment Manager, configuration files specify:
- Resources to be created (VMs, storage, networks).
- Properties of each resource.
- Relationships between resources.
- Deployment parameters and settings.
These configuration templates act as the source of truth for infrastructure, enabling automated deployments and easier infrastructure management. Configuration management is also an essential component of DevOps practices, allowing teams to automate infrastructure provisioning and maintain reliable environments.
Limitations of Configurations
There are certain limits and restrictions related to the configuration in Google Cloud Deployment Manager:-
- Resource Names: The length of resource names in Deployment Manager is limited to 63 characters.
- Template size: The maximum size of a Deployment Manager template is 2 MB.
- The Number of Deployments: There is a limit of 200 deployments per project in the Google Cloud Platform.
- The Number of Resources: There is a limit of 1000 resources per deployment in Deployment Manager.
- Resource Properties: Some Google Cloud Platform resources have limits on the number of properties that can be set, such as the number of firewall rules that can be created for a Compute Engine instance.
- Rate of Resource Creation: There may be limits on the rate at which resources can be created, which can impact the performance of large deployments.
Key Features of GCP Deployment Manager
- Declarative Configuration: Deployment Manager uses a declarative YAML configuration to define the desired state of resources, making it easy to manage and automate deployments.
- Resource Management: Deployment Manager supports the management of a wide variety of Google Cloud resources, including virtual machines, databases, load balancers, and networking components.
- Template Library: Deployment Manager includes a library of reusable templates that can be used to deploy common infrastructure configurations, reducing the time and effort required to set up and manage resources.
- Automated Deployments: Deployment Manager automates the deployment of resources, reducing the risk of manual errors and making it easier to manage resources at scale.
- Preview Mode: Deployment Manager includes a preview mode, allowing you to preview the changes that will be made to your resources before they are actually deployed.
- Rollback: In the event of a failure, Deployment Manager can automatically roll back to the previous state, helping to ensure that your resources remain stable and consistent.
- Resource Tracking: The deployment Manager tracks the state of resources over time, making it easy to see what changes have been made and when they were made.
- Access Control: Deployment Manager supports access control, allowing you to control who has access to your resources and what actions they can perform.
Use Cases of GCP Deployment Manager
- Infrastructure as Code: Deployment Manager enables you to manage your infrastructure as code, making it easier to version control your infrastructure and automate deployments.
- Resource Management: You can use Deployment Manager to manage resources such as virtual machines, databases, load balancers, and networking components, ensuring that they are always up-to-date and that changes are applied consistently.
- Automated Provisioning: You can use Deployment Manager to automate the provisioning of Google Cloud resources, such as virtual machines, databases, and load balancers, reducing the risk of manual errors and speeding up the deployment process.
- Automated Deployments: Deployment Manager can automate the deployment process, reducing the risk of manual errors and making it easier to manage resources at scale.
- Disaster Recovery: With Deployment Manager, you can define and automate the deployment of disaster recovery solutions, helping to ensure that your infrastructure remains available even in the event of a disaster.
- Hybrid and Multi-Cloud Deployments: Deployment Manager can be used to manage resources across multiple cloud providers, making it easier to deploy and manage hybrid and multi-cloud infrastructure.
