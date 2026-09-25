# How to Build a Web Server Docker File?

> Source: https://www.geeksforgeeks.org/devops/how-to-build-a-web-server-docker-file/

In this article, you can learn how to create your own docker customized image and get familiar with the docker file. Similarly, you can build a web server image that can be used to build containers. Here we will be exploring the process of using an Apache Web Server on Ubuntu to build our docker image.
Requirements:
- Installed docker software in your respective operating system.
Follow the below steps to achieve so:
Step 1: The first step is to build our Docker file for which you can use vim editor.
vim Dockerfile
Note:- Name of the file has to be "Dockerfile"
Write the below information into the Docker file.
FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]
Description of the above commands
- Ubuntu is our base image in which we are launching our server.
- In the second line, is to set a non-interactive environment.
- In the third line, the apt-get update command is used to update all the packages on Ubuntu.
- In the fourth line, we are installing apache2 on our image.
- In the fifth line, we are installing all the necessary utility Apache packages.
- In the sixth line, the apt-get clean command cleans all the unnecessary files from the system.
- In the seventh line, the EXPOSE command is used to expose the port 80 of Apache in the container.
- The last command is used to run apache2 in the background.
Step 2: Next step is to build the docker file by using the docker build command.
docker build -t="mywebserver"
Command:
-t: this option is to tag the image, mywebserver is the tag to our image.
After the building of the image is finished, a message will print in the end that the has to build.
Step 3:
The web server file has built, the next step is to create a container from the image for that we use the docker run command.
docker run -d -p 80:80 tag_name
Commands:
-d: This option is used to run the container in detached mode i.e the container 
    can run in the background.
-p: This option is used to map our port number with 5000 port numbers on our localhost.
Now run the docker images command to see the built image.
If you go to your web browser and write localhost_ip:80 your Apache server is up and running on that port.
This is the complete process to build a web server docker file.
