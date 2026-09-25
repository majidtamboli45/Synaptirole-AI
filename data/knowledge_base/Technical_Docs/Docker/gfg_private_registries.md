# Private Registries

> Source: https://www.geeksforgeeks.org/devops/docker-private-registries

Docker registry is your own private repository where you can store your own Docker images and share them with others. Docker Registry is basically organized into Docker Repositories. Within the docker Repository, you can maintain specific versions of a Docker Image.
What is Docker Private Registry?
A Docker Private Registry is a dedicated storage and distribution system for your container images, hosted on your own infrastructure or private cloud. While Docker Hub is an excellent public resource, professional development teams require a secure, fast, and controlled environment for their proprietary application images. A private registry is the cornerstone of a secure and efficient software supply chain.
Why Choose a Private Registry?
Using a public registry like Docker Hub for private business applications is often not feasible. While Docker Hub offers private repositories, a dedicated private registry provides far more significant advantages, especially at scale.
- Security & Compliance: This is the primary reason. A private registry allows you to host images within your own network perimeter. This is essential for applications in air-gapped environments or those subject to strict data-privacy regulations like HIPAA or GDPR. You have complete control over access, authentication, and security policies.
- Performance & Network Latency: When your CI/CD pipelines and production servers are constantly pulling images, network speed matters. Pulling a multi-gigabyte image from an internal network registry is significantly faster than pulling it from the public internet. This drastically reduces build and deployment times, especially for large-scale Kubernetes or Swarm deployments.
- Cost Control at Scale: Cloud-hosted private repositories often charge per repository or based on storage and data transfer. For an organization with hundreds of microservices and thousands of image builds, these costs can spiral. A self-hosted registry can be more cost-effective in the long run.
- Control & Customization: A private registry gives you full control. You can integrate it with your organization's existing authentication systems (like LDAP or Active Directory), customize storage backends (like S3 or Google Cloud Storage), and implement custom garbage collection or security scanning policies.
Steps To Setup Private Docker Registry
Follow the below steps to setup the docker registry:
Run a Private Docker Registry
Step 1: Pull the Docker registry image using the below request:
$ docker pull registry
This command will pull the docker latest image from the docker registry
Step 2: Configure and run the docker registry image using the below command:
$ docker run -d -p 5000:5000 --name localregistry registry
This command will start the docker container registry on localhost port 5000. The base image used is the registry. The local registry will be the container name.
Now we will also look into how you can pull, push and delete images from the local registry container. When the local registry container is pushed successfully, it will return the container ID in the console.
You can verify by running the below command:
$ docker ps
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
25a66bd4219f registry "/entrypoint.sh /etc…" 10 seconds ago Up 9 seconds 0.0.0.0:5000->5000/tcp, :::5000->5000/tcp localregistry
Step 3: Pull images from DockerHub.
Let's try to pull some images from DockerHub and push them to your docker private registry. For demonstration, let's one version of the Ubuntu image and the latest Nginx server image.
Push an Image to the Private Registry
Step 1: Tag the images which were pulled from DockerHub.
- localhost:5000 -> host for your docker private registry
- ubuntu: repository name
- 18.04: tag to identify the version
Step 2: Push the tagged images to your docker private registry.
Push an Image to the Private Registry
Step 1: Pull the docker nginx image from the private docker registry. We are here pulling the docker image of Nginx: latest hosted at private registry i.e at localhost:5000
