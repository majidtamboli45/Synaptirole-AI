# Kubernetes Jobs

> Source: https://www.geeksforgeeks.org/devops/kubernetes-jobs/

Pre-requisite: Kubernetes
In the Kubernetes world, jobs are considered an object to act as a supervisor or controllers of a task. The Kubernetes job will create a pod, monitor the task, and recreate another one if that pod fails for some reason. Upon completion of the task, it will terminate the pod. Unlike deployment and pods, you can specify a job in Kubernetes which can be an always one job or time-based job, or a task-based job. This allows you to tolerate error or failure which can cause unexpected pods termination.
When you submit a job it will create one or more pods based on the requirement, will complete the task defined in the job, and keep the pods running until the task is completed. The Job keeps track of the successful completions when pods finish up. When a job is suspended, all of its active Pods are deleted until the job is restarted.
Job Types:
- Non-Parallel Job: A simple job where a single task is defined and which will create one pod and upon successful completion of the job the pod will terminate.
- Parallel Job with fixed completion count: A complex task is defined as a job that requires multiple pods to complete the task which can run in parallel and each Pod receives a unique index between 0 and.spec.completions-1 based on the number specified in config `.spec.completions`. The job will be considered completed successfully when there is a successful spec. completions Pods.
- Parallel Job with a work queue: In parallel jobs with a work queue, multiple pods are running in parallel to complete complex data with decencies. To decide what each Pod should focus on, the Pods will need to cooperate with one another or with an outside service. For instance, a Pod might pull up to N items in a batch from the work queue. Each Pod is capable of autonomously determining whether or not all of its peers are finished, and hence if the entire Job is finished.
Use Cases:
- A simple use case for a job to perform some system operations task. For example to set up a cluster or service you need to perform some tasks in multiple places. You can create a job and use that, again and again, to bring up the same service or perform a similar task.
- Another use case is performing some data backups or some computation tasks. A more complex use case can be a series of task which needs to be performed in order where jobs will be created pods and managed until the no of completions is met. As part of establishing services, Helm Charts employ Jobs to conduct install, set up, or test commands on clusters.
Key Terminologies:
There are a few key terminologies we are using throughout the article.
- Kubernetes: Kubernetes is an open-source system, from Google for orchestrating containers. Allow automation of most of the operational tasks around containerized applications.
- Pods: The smallest deployable compute units that Kubernetes allows you to construct and control are called pods. It can be a single container or a combination of containers.
- Minikube: A local version of Kubernetes to get you started and testing your work locally.
Steps To Setup Job:
Today, we will consider an example of setting up a job that will use Docker Busybox image and ping geeksforgeeks.org.
Step 1. Start your minikube
$ minikube start
Step 2. Create the job definition file in YAML format.
$ cat ping-job.yaml
Step 3. Submit the job definition to Kubectl, you should see the job created message on execution.
 $ kubectl apply -f ping-job.yaml
Step 4. List the job using get jobs, we can see the no of completion of our job as well as the duration and age.
 $ kubectl get jobs
Step 5. Get the job details.
$ kubectl describe job ping 
Step 6. Get the pods running for our jobs, here you can see the pod name, how many containers, its status, whether its restarted or not, and the age of the pod.
$ kubectl get pods
You can check the logs of the container.
To delete the job use kubectl delete command, If you delete the job, the pods associated with it will be deleted as well.
$ kubectl delete job ping
$kubectl get job
