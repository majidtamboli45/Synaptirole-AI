# Log in to Docker for Pulling and Pushing Images

> Source: https://www.geeksforgeeks.org/devops/docker-for-pulling-and-pushing-images/

Logging in to Docker is the first step before pulling or pushing images to Docker Hub. By authenticating with your Docker Hub credentials, you can securely access both public and private repositories.
Setting up your Docker Environment
Install Docker on your system
Windows and macOS:
- Download Docker Desktop from the official Docker website.
- Run the installer and follow the on-screen instructions.
- After installation, launch Docker Desktop and follow the setup wizard.
Ubuntu:
For Ubuntu based distributions you can use the following commands.
#Check Docker's official documentation for further info
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu//gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu/ \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
#install latest version of docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#verify docker engine installation is successful
docker --version
For other distributions please refer to the official docker documentation.
Configuration
1. Verify Installation:
To verify docker's installation open a terminal and run `docker --version`
docker --version
2. Start Docker
- On Windows and macOS, Docker Desktop should start automatically. You can manually start or stop the docker engine by clicking the start/stop button in the bottom left corner of docker desktop
Logging into Docker Hub
To interact with Docker Hub, you first need to create an account and log in via the command line.
Creating a Docker Hub Account
- Go to Docker Hub.
- Click on "Sign Up" and fill in the required information.
- Verify your email to activate your account.
Logging in via Command Line
Step 1: Open a terminal
Step 2: use the `docker login` command
docker login
Step 3: Enter your username and password when prompted
username:<enter your username>
password: <enter your password>
Step 4: On Successful login you will be prompted with: `login succeeded`
login succeeded
Pulling and Pushing Docker Images From Docker Hub
Pulling Images from Docker Hub
docker search <image_name>
2. Pull the image using `docker pull`
docker pull <image_name>
Example:
Building And Pushing Your Own Docker Images
1. Create a dockerfile:
A `dockerfile` contains instructions for building a Docker image. Example:
FROM ubuntu:latest
RUN apt-get update && apt-get install -y python3
COPY . /app
WORKDIR /app
CMD ["python3", "app.py"]
2. Build the image:
build the docker image using the following command:
docker build -t <your_image_name> .
3. Tag the image for a specific repository:
docker tag <your_image_name> <your_dockerhub_username>/<repository_name>:<tag>
4. Push the image to docker hub using the following command:
You can use docker push to push your image to docker hub as follows
docker push <your_dockerhub_username>/<repository_name>:<tag>
Upon successful execution you'll find your image uploaded to docker hub.
