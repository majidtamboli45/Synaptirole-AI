# Enable Remote Debugging For Java Application Deployed in Kubernetes Environment

> Source: https://www.geeksforgeeks.org/java/enable-remote-debugging-for-java-application-deployed-in-kubernetes-environment/

During Development, developers have to debug their applications to resolve code problems. In order to debug a java application which is deployed on remote machine in a Kubernetes cluster, first developer has to do some steps to enable its application ready for debugging. Below are the manual steps to enable remote debugging for any java application running as a container in Kubernetes environment.
Step by Step Implementation
Step 1: Edit the deployment. Let's say deployment name is "my-app".
kubectl edit deployment my-app
Step 2: Add the java options (JAVA_OPTS )and its value for enabling debugging as a variable in "env" section in the deployment as follows:
- name: JAVA_OPTS
value: "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=9991"
After saving the changes to the deployment, Kubernetes will automatically redeploy all the pods with the new changes.
Step 3: Create a debug service for your application. Let's say you have named it as "my-app-debug-svc.yaml" or change the existing service yaml file if present. Refer below sample service yaml file, do the highlighted changes in your service yaml file. Adding nodePort enables outside application (here your IDE) to access containers deployed in Kubernetes Cluster.
apiVersion: v1
kind: Service
metadata:
name: my-app-debug-svc
namespace: <namespace>
labels:
service: my-app-debug
release: "1.0"
spec:
type: NodePort
ports:
- port: 9991
nodePort: 9991
protocol: TCP
name: debug-port
selector:
app: my-app
service: my-app-debug
release: "1.0"
Step 4: Start the debug service using below command.
Kubectl create -f my-app-debug-svc.yaml
Step 5: Edit configuration in your IDE to do remote debugging. Here are the steps to edit configuration in IntelliJ IDE:
- Open your codebase in InteliiJ IDE.
- Go to Edit Configuration:
- Click on + sign and select Remote. Give any name for your remote-debugging configuration. For say, my-debug. Give Host name and port of the server machine where application is running which you want to debug. "Command line arg for remote jvm" field value will be automatically populated. Click Apply and then OK.
- Set the breakpoints.
- Click on debug icon.
- Check the console. It should say "Connected to the target VM, address: '<hostname>:<portnumber>', transport: 'socket'".
That's all you are ready to debug your Java Application remotely!
