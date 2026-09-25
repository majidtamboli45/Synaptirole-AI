# Introduction to Amazon Elastic Container Registry

> Source: https://www.geeksforgeeks.org/devops/introduction-to-amazon-elastic-container-registry/

Amazon Elastic Container Registry (ECR) is a fully managed AWS Docker registry service that enables secure storage, management and deployment of container images. ECR is highly scalable and reliable, allowing you to scale resources up or down based on your requirements.
- It uses AWS Identity and Access Management (IAM) to enable resource-based permissions for private
- Docker repositories and through the Docker command-line interface (CLI), you can push, pull, and manage images.
Components
Amazon ECR consists of the following key components:
- Registry: Each AWS account has access to the Amazon ECR registry. Within the registry, you can create image repositories and store container images.
- Authorization Token: Before pushing and pulling images, your Docker client must authenticate to Amazon ECR registries as an AWS user. The AWS CLI provides a command called "get-login" which provides authentication credentials to be passed to Docker.
- Repository: Docker images are contained within Amazon ECR image repositories. Each repository can hold multiple versions of container images.
- Repository Policy: Repository policies enable users to control access to their repositories and the images within them. Policies are managed through IAM and determine who can push, pull, or delete images.
- Image: Container images stored in ECR can be easily pushed or pulled. Images can be used on your local system or referenced in Amazon ECS task definitions and EKS deployments.
Features
- Supports image versioning using tags
- Automatically removes old images with lifecycle policies
- Scans images for security vulnerabilities
- Integrates with ECS, EKS, and AWS Lambda
- Supports cross-region image replication
- Provides both public and private repositories
Benefits
- Easy to Manage: AWS manages the infrastructure, so users can focus on application development.
- Scalable and Reliable: ECR can handle growing workloads while providing reliable image storage.
- Secure Storage: Supports IAM permissions and encryption for secure image access.
- Fast Deployment: Helps developers quickly push and pull container images.
- AWS Integration: Works smoothly with ECS, EKS, and AWS Lambda.
- Cost Effective: Users pay only for the storage and usage they consume.
- Supports Collaboration: Teams can easily share and manage container images together.
- Easy Image Management: Allows simple organization and version management of images.
Use Cases
| Use Case | Description | How ECR Helps | 
|---|---|---|
| Containerized Application Deployment | Storing Docker images for applications deployed on ECS or EKS. | ECR securely stores images that can be easily pulled during deployment. | 
| Microservices Architecture | Managing multiple microservices in containers. | ECR stores and manages separate images for each microservice. | 
| CI/CD Pipelines | Automating build and deployment processes. | ECR integrates with CI/CD tools for smooth image deployment. | 
| Hybrid and Multi-Cloud Deployment | Running applications across AWS and on-premises systems. | ECR allows images to be accessed from different environments. | 
| Image Versioning and Rollback | Managing different image versions. | ECR supports tagging and rollback of container images. | 
| Security and Compliance | Maintaining secure container images. | ECR scans images for vulnerabilities before deployment. | 
| Private Docker Image Storage | Keeping container images private and secure. | ECR provides secure private repositories with IAM access control. | 
| Scalable Image Storage | Storing large numbers of container images. | ECR automatically scales storage as needed. | 
| DevOps Workflow | Improving developer productivity and collaboration. | ECR simplifies pushing, pulling, and managing Docker images. | 
Amazon ECR Pricing
Amazon ECR pricing is based on storage usage, data transfer, and additional features like encryption and image signing.
| Pricing Component | Details | Cost | 
|---|---|---|
| Free Tier | 500 MB/month private repository storage (first year) and 50 GB/month public repository storage | Free | 
| Storage | Charges for storing container images in repositories | $0.10 per GB/month | 
| Data Transfer - Private Repositories | Transfer of images in and out of private repositories | Inbound: FreeOutbound to internet: $0.09 per GB | 
| Data Transfer - Public Repositories | Transfer of images from public repositories | Limited free usage, then $0.09 per GB | 
| Encryption | Supports SSE-S3, SSE-KMS, and DSSE-KMS encryption | SSE-S3: FreeDSSE-KMS: $0.0036 per GB | 
| Managed Signing | Image signing for security verification | $0.02 per signature | 
| Pricing Examples |  |  |
