# Data Storage in Docker

> Source: https://www.geeksforgeeks.org/cloud-computing/data-storage-in-docker/

Docker images are built-in form of layers and docker containers store all the data being used, on the container writable layer which is only persisted till the lifespan of the container i.e. it is no longer accessible once the container is removed. This also makes it difficult to get the data out of the container if it is required by some other processes.
To persist the data irrespective of the container's lifecycle so that the files are available in the host filesystem even if the container is no longer available, Docker provides two options:
- Docker volumes
- Bind mounts
Though we can also use tmpfs mount if you're using Docker on Linux and named pipes if using Docker on Windows.
In this article, we'll be covering the docker volumes and bind mounts with their differences in terms of use cases and effectiveness.
1. Docker Volume
Volumes are the directories or files that exist on the host filesystem and are mounted to the containers for persisting data generated or modified by them. They are stored in the part of the host filesystem managed specifically by Docker and it should not be modified by non-Docker processes. Volumes are the most preferred way to store container data as they provide efficient performance and are isolated from the other functionalities of the Docker host.
We can use the following command to create docker volume -:
docker volume create <volume_name>
We can mount a volume to multiple containers simultaneously and Docker doesn't remove them even if they're not being used by any running container. To remove a volume, we can use the following command -:
docker volume prune
In a Linux filesystem, we can find the available volumes at the following path '/var/lib/docker/volumes/ ', while in Windows, we can get the location of the volume by running the following command in file explorer -:
\\wsl$\docker-desktop-data\version-pack-data\community\docker\volumes
To learn more about volumes and how to mount them to a container click here.
2.) Bind Mounts
This is also a mechanism provided by Docker to store container data on localhost, but the directory or file mounted using bind mounts can be accessed by non-Docker processes as well and it relies on the host machine's filesystem having a specific directory structure available because it uses absolute path for binding.
Bind mounts have limited functionality and can't be managed directly through Docker CLI, thus making it less preferable in comparison to volumes. Moreover, it allows the container to modify the host filesystem i.e. it can create, modify or delete important file directories which can impact security and non-Docker processes as well.
3.) tmpfs mounts
When using Docker in Linux, you can also create storage volume for containers using tmpfs mount. But contrary to bind mounts and volumes, this type of mount is temporary and persists on host memory.
Once the container is stopped, the tmpfs mount is removed and files stored using it won't be available anymore. This type of mount has very limited use and can only be used by Linux users. Moreover, it does not allow sharing of mounted data among containers.
4.) Named pipes
When to use Volumes
Following are some potential use cases for volumes -:
- Volumes can be used to share data among multiple containers in a secure manner without affecting the host filesystem.
- They provide convenient backup and data migration from one Docker host to another.
- We can easily manage volumes using Docker CLI and Docker APIs, which is a limitation in terms of bind mounts.
- The insignificance of host filesystem structure provides decoupling of Docker host configuration from container runtime.
- It provides volume drivers which help in storing data to remote hosts or cloud providers.
- Volumes are stored in Linux VM thus providing lower latency and higher throughput. They are highly performant on the Docker desktop, thus making them a better choice for write-intensive applications like data storage.
When to use Bind Mounts
Despite limited functionalities, we can use bind mounts in the following cases -:
- It can be used to provide shared configuration files between host and container. Ex- Docker mounts '/etc/resolv.conf ' to containers for DNS resolution.
- In case the host file system is guaranteed to remain consistent and the mounted volume is not accessed by non-Docker processes, we can use bind mounts for storing data.
