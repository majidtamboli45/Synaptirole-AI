# Docker Volume VS Bind Mount

> Source: https://www.geeksforgeeks.org/devops/docker-volume-vs-bind-mount/

Docker volume and Bind mount are the docker components. Using bind mounts, you may mount a file or directory from your host computer onto your container and access it using its absolute path. Because Docker does everything independently, it is not dependent on the host computer's operating system or your directory structure. The Docker CLI commands or the Docker API may be used to manage Docker Volumes. It is safer to share quantities among many containers. The host computer's absolute path to the file or directory serves as a point of reference. Conversely, when a volume is used, Docker makes a new directory in the host machine's storage directory and keeps it updated.
Difference between Docker volume and Bind mount
| Docker volume | Bind mount | 
|---|---|
| Docker volume is the recommended method for storing data created and utilized by Docker containers is to use volumes. | Bind mount has existed from Docker's early versions. Comparatively speaking, bind mounts are less useful than volumes. | 
| Docker volumes may be interacted with using CLIs and APIs. | Bind mounts cannot be accessed by CLI commands. You may still work instantly with them on the host system. | 
| All you need is the volume name to mount it. | When using bind mounts for mounting, a route to the host computer must be supplied. | 
| In /var/lib/docker/volumes, the volumes are stored. | On the host computer, a bind mount can be located anywhere. | 
What is Docker volume?
Docker volume is the recommended method for storing data created and utilized by Docker containers is to use volumes. Docker manages volumes entirely, whereas bind mounts rely on the host machine's operating system and directory structure. Bind mounts are more difficult to transfer or backup than volumes. Volumes may be managed via the Docker API or Docker CLI commands. Volumes are compatible with Windows and Linux containers. Sharing volumes among several containers is safer.
Use Cases of Docker volume
- A volume should be used to store the data that your application creates, such as documents, profile pictures, and file uploads.
- By mirroring /var/lib/docker/volumes to a different place, Docker's centralized volume storage makes it simple to back up container data. The operation may be automated with community tools and Docker Desktop extensions, making it far easier than manually transferring each bind-mounted directory.
- It is recommended that you mount a volume to the storage directories that Mongo, Postgres, and MySQL databases utilize. Your data will remain intact even after the container shuts down thanks to this.
- It is possible to mount Docker volumes to several containers at once. Containers can see modifications made by their neighbors in real time.
Advantages of Docker volume
- Docker Desktop volumes perform far better than bind mounts from Windows and Mac computers.
- Docker Volume drivers enable you to add more functionality, encrypt the contents of volumes, and store volumes on distant hosts or cloud providers.
- For flexibility and scalability, Docker volumes may be set up to leverage external storage options like cloud storage services or network-attached storage.
- Docker Volumes may be managed via the Docker API or Docker CLI commands.
Disadvantages of Docker volume
- The Docker platform is open source overall, certain container solutions are not compatible with others, mostly because of competition between the companies who provide support for them.
- It may be difficult to move volumes across various Docker environments, particularly if the underlying storage drivers or settings change.
- Docker Volumes may raise security issues depending on how they are configured, particularly if they are shared by several containers.
- The only monitoring solution offered by Docker is the stats command. If we just need the bare minimum of information about the containers, then that is adequate.
What is Bind mount?
Bind mounts have existed from Docker's early versions. Comparatively speaking, bind mounts are less useful than volumes. A file or directory on the host computer gets mounted into a container when you use bind mount. The absolute path of the file or directory on the host computer is used as a reference. On the other hand, when you utilise a volume, Docker creates and maintains a new directory within the host machine's storage directory.
Use Cases of Bind mount
- Bind mounts replicate the website's directory into the home directory of a jailed user, therefore limiting access to specific areas of the website for selected users.
- Processes operating within a container allow you to modify the host filesystem.
- The instant a file is saved, the container is notified of the modifications you make to the code.
- This includes adding, removing, and altering system folders and files, all of which might have dangerous security repercussions.
Advantages of Bind mount
- Bind mounts are frequently used in local development environments. One benefit is that not all build environments and tools need to be installed on the developer workstation.
- These allow you to reference a file or directory on your host system through its absolute path, which is mounted onto your container.
- Docker gathers tools and dependencies with a single docker run command.
- Bind mounts offer a simple method of linking particular directories or files from the host to the container, and they are quick to set up.
Disadvantages of Bind mount
- In order to provide a way to distribute server programmes without a graphical user interface, Docker bind mount was developed.
- Security issues may arise from improperly setup bind mounts. The host's files and folders are accessible to the container.
- Numerous feature requests are being worked on, such as file transfer from the host to the container, self-inspections and registration of containers, and many more.
- Performance may be impacted by bind mounts, particularly when handling big volumes of data.
Conclusion
So this is docker volume vs bind mount.Docker volume is the recommended method for storing data created and utilised by Docker containers is to use volumes and Bind mounts have existed from Docker's early versions. Comparatively speaking, bind mounts are less useful than volumes.
