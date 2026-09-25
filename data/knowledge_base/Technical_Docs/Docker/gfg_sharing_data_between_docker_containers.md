# Sharing Data between Docker Containers

> Source: https://www.geeksforgeeks.org/devops/sharing-data-between-docker-containers/

When you use Docker, each container runs separately, like its own small computer. This helps keep things organized and secure, but it can be a problem when containers need to work together. For example, if one container saves data (like a database) and another needs to use that data (like a web app), they need a way to share it. Without that, they can't talk to each other properly, and your app won’t run as it should.
Also, any data stored inside a container disappears when the container stops. So if you want to keep files, logs, or database records even after stopping or restarting, you need a way to store that data safely.
Methods of Sharing Data between Docker Containers
Below are 2 ways to share data between containers using Docker volumes and Bind Mount:
Which One Should You Use?
Use volumes for most cases, especially in production they're managed by Docker, portable, and ideal for sharing persistent data between containers. Use bind mounts during development when you need to sync files from your host, like live code changes. Volumes are more secure and stable; bind mounts offer more flexibility but are host-dependent.
Method 1: Share Data Using Docker Volumes
The steps below will help you to share data using Docker Volumes:
Step 1: Create a Docker Volume
We can create a Docker Volume by using the following command
docker volume create shared-data
Step 2: Run Container A with the Volume
Mount the volume to a path inside Container A
docker run -d --name container-a -v shared-data:/data busybox sleep 3600
Here, /data is the path inside the container where the volume is mounted.
Step 3: Add Data in Container A
We are putting a message inside the volume folder from Container A. This file (message.txt) is saved in /data, which is the shared volume.
docker exec container-a sh -c "echo 'Hello from A' > /data/message.txt"
Step 4: Run Container B with the Same Volume
Now, you start Container B and connect it to the same volume. It will also see whatever is in /data, just like Container A.
docker run -d --name container-b -v shared-data:/data busybox sleep 3600
Step 5 : Access the Data in Container B
Inside Container B, you read the file message.txt. This shows the message written by Container A. That means sharing worked!
docker exec container-b cat /data/message.txt
Method 2: Share Data Using Bind Mounts
This method is best for sharing host directories across containers. The following are the steps you can follow to share data using bind mounts:
Step 1: Create a Directory on the Host
Make a folder on your own computer (outside Docker) and save a file in it. This folder will be shared with containers.
mkdir /tmp/shared-dataecho "Hello from host" > /tmp/shared-data/host.txt
Step 2: Run Container A with Bind Mount
You start Container A and link it to your host folder. Inside the container, that folder will appear as /data.
docker run -d --name container-a -v /tmp/shared-data:/data busybox sleep 3600
Step 3: Run Container B with Same Bind Mount
Now, Container B also connects to the same host folder. Both containers are now seeing the same /tmp/shared-data content.
docker run -d --name container-b -v /tmp/shared-data:/data busybox sleep 3600
Step 4: Check Shared File in Container B
Inside Container B, you check if it can read the file placed by the host. If you see the message, the data sharing worked.
docker exec container-b cat /data/host.txt
Output:
