# Running Commands Inside Docker Container

> Source: https://www.geeksforgeeks.org/devops/running-commands-inside-docker-container/

A Docker container is a lightweight, standalone, executable software package. It includes everything needed to run a piece of software: the application code, a runtime, system tools, system libraries, and settings. Docker containers are isolated from one another and from the host system, ensuring they run consistently regardless of the underlying infrastructure.
Run Commands Inside Docker Container
The following are the methods of running commands inside the docker container:
Method 1: Using docker run to Start an Interactive Shell
You can start a new container and immediately get a command prompt (like bash) inside it. This is perfect for exploring a fresh image or setting up a new environment.
The command uses the -it flags:
- -i (--interactive): Keeps standard input (STDIN) open, allowing you to type commands.
- -t (--tty): Allocates a pseudo-terminal, which gives you the interactive shell experience.
sudo docker run -it ubuntu bash
- This command downloads the ubuntu image (if not present), starts a new container from it, and opens itsbash shell. Once inside, you can execute any command.
echo geeksforgeeks
Method 2: Using the Docker exec Command
- The docker exec command is used to run a command inside a container that is already running. This is the most common method for debugging, checking logs, or installing a package on the fly.
First, find the Container ID or Name of your running container.
sudo docker container ls
( or )
sudo docker ps -a
- Once you have the Container ID, you can use the Docker exec command. But you have to confirm that the Container is running before you can execute the exec command. To start the Container, use this command.
sudo docker container start d64b00529582
- After that, execute the exec command.
sudo docker exec -it d64b00529582 echo "GeeksforGeeks"
Method 3: By using the Dockerfile
When building a custom image, you can embed commands directly into the Dockerfile. However, you should only include those commands inside the Dockerfile which you want to execute while building the Container. For executing commands on the go, you can use any of the two methods above. To execute commands through Dockerfile, you can specify them using the Docker Run Commands.
FROM ubuntu:latest
RUN echo "geeksforgeeks"
- After you have created the above Dockerfile, you can build the images using the Docker build command.
sudo docker build -t sample-image .
- You can see that after step 2, "geeksforgeeks" has been printed.
Docker Attach Vs Docker Exec
While both exec and attach connect you to a container, they work in fundamentally different ways.
| Feature | Docker exec | Docker attach | 
|---|---|---|
| Purpose | To run a new command or process inside a running container. | To connect to the main running process (PID 1) of a container. | 
| Process | Creates a new process inside the container. | Does not create a new process; it simply connects to the existing primary process. | 
| Use Case | Best for debugging, running admin tasks, or opening a second shell. | Best for interacting with a foreground application that is already running. | 
| Exiting/Detaching | Exiting an exec shell does not stop the container. | Exiting the attached process (if it's PID 1) will stop the container. | 
In short, use exec to poke around or run a utility, and use attach to get back to the main application you started.
Running Multiple Commands Inside Docker Container
We can run multiple commands inside the docker container with many different ways. Here we are showing it through docker exec command.
- The following command helps you to execute multiple commands interactively within a running container using the docker exec command withsh -c :
docker exec -it <container_id> sh -c "apt-get update && apt-get install -y curl && echo 'Installation complete'"
- Here, try on replacing the <container_id> with your container name or container id.
