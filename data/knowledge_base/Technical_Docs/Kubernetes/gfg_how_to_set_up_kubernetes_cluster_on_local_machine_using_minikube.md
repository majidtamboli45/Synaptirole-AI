# How to set up Kubernetes cluster on local machine using minikube ?

> Source: https://www.geeksforgeeks.org/node-js/how-to-set-up-kubernetes-cluster-on-local-machine-using-minikube/

Creating a Kubernetes cluster on AWS, Google Cloud, etc, can be a little difficult and cost you a pretty decent amount of money. If you have a Windows machine or a mac then it is easy to create a multi-container cluster using Docker Desktop for windows/mac and use Kubernetes to manage the cluster.
Perquisites: Have some basic knowledge of Docker and Kubernetes.
But for Linux bases system, you have to either go for a cloud-based solution which is costly. So we can create our own cluster on our local machine using minikube. It is local Kubernetes, focusing on making it easy to learn and develop for Kubernetes. You just need docker installed or any Virtual machine environment. In the following example, we have used the virtual box.
Installing Minikube: To install minikube on Linux, use the following command:
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
Example: To test this out we are going to use a ticket selling web application that is built using NodeJS, ExpressJS, NextJS and used nats-streaming for event transmission, ingress-nginx for networking and loadbalancing. A different docker image for different services and have used minikube to run the cluster locally using minikube.
Github link of Repo: Use the https://github.com/afif1400/gittix link to fork the project.
Note: After you install docker or virtual box and minikube we just have to start minikube and use skaffold to run all the containers or different microservices.
So after you clone the repo go to the root directory, first start minikube --driver is used to specify the environment you can change it to docker as well. But there is a bug in ingress using the docker environment.
minikube start --driver="virtualbox"
Now minikube has started the Kubernetes cluster inside it, you can also configure the resources used by it by going through the docs of the official website provided in the reference.
We need to enable a couple of add-ons on minikube to run the application. First is the dashboard which is a GUI to monitor cluster deployment services etc and the second add-on is ingress.
Command for enabling dashboard:
minikube addons enable dashboard
Command for enabling ingress:
minikube addons enable ingress
Now we need to expose the ingress-nginx deployment so that it can be reached from the outer world. Use the following command to do so:
kubectl expose deployment ingress-nginx-controller --target-port=80 
--type=NodePort -n kube-system
Now to verify that the service is running run: and the output should be similar to the output given below.
kubectl get services -n kube-system
Next, Set an environment variable which is a jwt-secret, to set this, run the following command:
kubectl create secret generic jwt-secret --from-literal=JWT_KEY=asdf
This we will be using in our authentication service for generating the jwt token.
Step to run the application:
Use the following command to run the application:
skaffold dev
When you run this command all the dependencies for each of the services will be installed and build the image, starting the cluster. If skaffold fails in between just re-run the above command.
Output:
Stop minikube: Following is the command to stop minikube:
minikube stop
Delete the cluster: Following is the command to delete the cluster:
minikube delete
References:
- Docker: https://docs.docker.com/get-started/docker-overview/
- Ingressnginx: https://kubernetes.github.io/ingress-nginx/
- Skaffold: https://skaffold.dev/docs/
- Minikube: https://minikube.sigs.k8s.io/docs/
