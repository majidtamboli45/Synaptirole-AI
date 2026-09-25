# How To Use Kubernetes Network Policies?

> Source: https://www.geeksforgeeks.org/devops/how-to-use-kubernetes-network-policies/

Kubernetes is the kind of container-centric management software used for the deployment and operation of cont energized applications. It was originally developed by google clouds. It improves your reliability and reduces the time, workload and provides developers resources attributes to daily operations. It allows you to scale up and down your application.
How do Kubernetes Network Policies Work?
Initially, in a Kubernetes cluster, all pods are considered non-isolated systems and are free to connect with other pods of different sources.
Now, consider policy named policy 1 to pod A this pod is a targeting pod because the policy is granted at this pod. The policy allows under the rules to pod A to talk to pod B.
- Target pod A can talk to pod B, and can talk to pod B only, because B is the only pod you allowed in the policy. Due to the nature of the policy rules, you can call the rule a whitelist.
- For target pod A only, any connections that are not explicitly allowed by the whitelist of this network policy 1 will be rejected. You don’t need to explicitly define this in policy1, because it will be enforced by the nature of Kubernetes network policy. Let’s call this implicit policy the deny-all policy.
- As for other non-targeted pods, for example, pod B or pod C, which are not applied with policy1, nor to any other network policies, will continue to follow the allow-any-any model. Therefore they are not affected and can continue to communicate to all other pods in the cluster. This is another implicit policy, an allow-all policy.
The Core Components
A Network Policy manifest has a few key sections:
- podSelector : This selects the group of Pods that the policy will apply to. If this is left empty, the policy applies to all Pods in the namespace.
- policyTypes : This field specifies whether the policy will include rules forIngress ,Egress , or both.
- ingress : A list of rules that define allowed incoming traffic. Each rule specifies a source (from ) and optionally the ports.
- egress : A list of rules that define allowed outgoing traffic. Each rule specifies a destination (to ) and optionally the ports.
Traffic sources (from) and destinations (to) can be defined in three ways:
- podSelector : Selects other Pods in the same namespace. You can use anamespaceSelector in combination to select Pods in other namespaces.
- namespaceSelector : Selects all Pods in a particular namespace.
- ipBlock : Specifies a CIDR range of IP addresses, used for traffic coming from or going to systems outside the cluster.
How To Create Kubernetes Network Policies?
- To use network policies for Kubernetes you must be using a network solution as network policies are implemented by network plugins.
- Kubernetes network policies are created using the kubectl command-line tool.
Yaml file
#policy1-do.yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
name: policy1
namespace: dev
spec:
podSelector:
matchLabels:
app: webserver-dev
policyTypes:
- Ingress
- Egress
ingress:
- from:
- ipBlock:
cidr: 10.169.25.20/32
- namespaceSelector:
matchLabels:
project: jtac
- podSelector:
matchLabels:
app: client1-dev
ports:
- protocol: TCP
port: 80
egress:
- to:
- podSelector:
matchLabels:
app: dbserver-dev
ports:
- protocol: TCP
port: 80
$ kubectl apply -f policy1-do.yaml
networkpolicy.networking.k8s.io/policy1-do created
$ kubectl get netpol -n dev
NAME POD-SELECTOR AGE
policy1 app=webserver-dev 6s
$ kubectl describe netpol policy -n dev
Name: policy1
Namespace: dev
Created on: 2019-10-01 11:18:19 -0400 EDT
Labels: <none>
Annotations: <none>
Spec:
PodSelector: app=webserver-dev
Allowing ingress traffic:
To Port: 80/TCP
From:
IPBlock:
CIDR: 10.169.25.20/32
Except:
From:
NamespaceSelector: project=jtac
From:
PodSelector: app=client1-dev
Allowing egress traffic:
To Port: 80/TCP
To:
PodSelector: app=dbserver-dev
Policy Types: Ingress, Egress
According To Ingress Policy
The following clients can reach the webserver-dev server pod located in the dev namespace.
- client1-dev from the dev namespace
- all pods from the JTAC namespace, that is a client- JTAC pod in our setup
- clients with source IP 10.169.25.20 (cent222 in our setup).
According To Egress Policy
The webserver-dev server pod in the dev namespace can initiate a TCP session toward dbserver-dev pod with destination port 80 to access the data.
- For the target pod server-dev, all other accesses are denied.
- Communication between all other pods is not affected by this network policy.
Post Kubernetes Network Policies Creation
After successfully creating policy 1 for Kubernetes, let's examine the accessing of the HTTP server in the webserver-dev pod from pod client-1 dev, client jtac, and node cent 222
$ kubectl exec -it client1-dev -n dev -- curl http://$webserverIP | webpr
Hello
This page is served
by a Contrail pod
IP address =
10.47.255.234
Hostname = webserver-dev
The access from these two pods to webserver-dev is okay and that is what we want. Now, if we repeat the same test from the other pod client2-dev, client-qa and another node cent333 now get timed out:
$ kubectl exec -it client2-dev -n dev --
curl http://$webserverIP -m 5 curl: (28)
Connection timed out after 5000
milliseconds
command terminated with exit code 28
$ kubectl exec -it client-jtac -n jtac --
curl http://$webserverIP -m 5 curl: (28)
Connection timed out after 5000
milliseconds
command terminated with exit code 28
$ curl http://$webserverIP -m 5
curl: (28) Connection timed out after 5000 milliseconds
Examples of Kubernetes network policies
- Here are some examples of Kubernetes network policies:
$ kubectl apply -f policy1-
do.yaml
networkpolicy.networking.k8
s.io/policy1 created
$ kubectl get networkpolicies --
all-namespaces NAMESPACE
NAME POD-
SELECTOR AGE
dev policy1 app=webserver-dev 17s
How Network Policies Ensure Security
Implementing Network Policies is a cornerstone of modern Kubernetes security.
- Principle of Least Privilege: Policies enforce a "need-to-know" basis for network traffic. A Pod can only communicate with the specific components it needs to function, drastically reducing the attack surface.
- Defense in Depth & Preventing Lateral Movement: If an attacker compromises your frontend Pod, they still cannot directly access thedatabase . The Network Policy acts as a second layer of defense, preventing the attacker from moving laterally through your network.
- Segmentation: You can create secure, logical network segments for different applications, teams, or environments (e.g., dev vs.prod ) within the same physical cluster.
- Controlling Egress: Egress rules are vital for preventing compromised Pods from exfiltrating data to malicious external IPs or being used in a botnet.
