# Backing up a Docker Container

> Source: https://www.geeksforgeeks.org/devops/backing-up-a-docker-container/

If you are a Docker Developer, you would surely know how important it is to backup your Docker Container file system. If you are working on an important Docker Application, it becomes very necessary to backup all the files and folders related to it so that in case anything goes wrong, you can get back all those files. It also helps you in managing different versions of your project and also sharing the files and folders of your project among your team members.
In this article, we are going to see how can we back up a Docker Container by saving it as a tar file in your local system. We will also see how you can push that Docker Image Backup directly into your Docker Hub accounts for ease of sharing. Follow the below steps to backup a docker container:
Step 1: Create a Docker Container
For our example, we are going to create an Ubuntu Container with a single file inside it.
sudo docker run -it ubuntu bash
After you fire up the bash, use the below command to create a file.
echo "geeksforgeeks" > geeksforgeeks.txt
ls
Step 2: Get the Container ID
You will need the Container ID in order to create the backup.
sudo docker container ls
Note that if the container is not running, you can start the Container using the below command.
sudo docker start <container-id>
Step 3: Commit the Docker Container
To create a snapshot, you need to commit the Container.
sudo docker commit -p 6cb599fe30ea my-backup
Step 4: Saving backup as a Tar file
You can use this command, to save the backup as a Tar File in your local machine.
sudo docker save -o ~/my-backup.tar my-backup
You will find the backup Tar file in your Home Directory.
Step 5: Pushing Image to Docker Hub
In order to push it back to the Docker Hub, you need to have an account on Docker Hub.
Login using your command line and push the Tar File.
sudo docker login
sudo docker push my-backup:latest
To conclude, in this article we saw how to create a backup of a Docker Image into a Tar File and pushing it into a Docker Hub account for ease of sharing.
