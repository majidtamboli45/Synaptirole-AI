# Kubernetes Secrets

> Source: https://www.geeksforgeeks.org/devops/kubernetes-secrets/

A secret in Kubernetes can be defined as an object that contains a small quantity of sensitive data like a password, a token, or a key.
- Reduces the risk of losing or exposing sensitive data during the workflow of creating, viewing, and editing Pods.
- Secrets are created independently of the Pods in which they are used.
- Secrets are similar to ConfigMaps, but are specifically designed to store confidential data.
Using A Kubernetes Secret
- Secrets can be consumed by Pods as environment variables or mounted volumes, and can also be used directly by system components without exposing them to Pods. A common example is storing credentials for external systems.
- The secret volume sources are validated to ensure that the specific object's reference actually points to an object of a particular object of secret type. Due to this, the secret should be created before any pods that depend on it. If the required secret cannot be fetched due to its non-existence or due to the temporary lack of connection to the AOI server the kubelet periodically retires running that specific Pod. Kubelet also reports the event for that Pod including all the details of the problems fetching the secret.
- When defining environment variables from Secrets, they are required by default. Pods will not start until all non-optional Secrets are available. You can mark them as optional, but if a Pod references a missing key in a Secret, startup will fail.
Dotfiles in a Kubernetes Secret Volume
In this example, the dotfiles .api_key1 and .api_key2 stores the sensitive API keys within api-keys-secret secret. These keys remains hidden and secured when mounted with api-keys-container ensuring only authorized processes can access them.
apiVersion: v1
kind: Secret
metadata:
name: api-keys-secret
type: Opaque
stringData:
.api_key1: abcdefg
.api_key2: defghijklm
---
apiVersion: v1
kind: Pod
metadata:
name: api-keys-pod
spec:
volumes:
- name: secret-volume
secret:
secretName: api-keys-secret
containers:
- name: api-keys-container
image: registry.k8s.io/busybox
command: ["ls", "-la", "/etc/secret-volume"]
volumeMounts:
- name: secret-volume
readOnly: true
mountPath: "/etc/secret-volume"
Kubernetes Secret Visible to One Container in a Pod
- Sensitive information in a Pod can be restricted to only the container that needs it.
- Example scenario:-
- Frontend container → handles user interaction and business logic.
- Backend (signer) container → responsible for message signing.
- The signer container requires access to a private key stored in a Kubernetes Secret.
- The frontend container does not need access to this secret.
- By mounting the secret only in the signer container:-
- The signer has secure access to .private-key.
- The frontend is fully isolated from sensitive data.
- This setup ensures least privilege access within the Pod.
apiVersion: v1
kind: Secret
metadata:
name: signing-secret
type: Opaque
stringData:
.private-key: password
---
apiVersion: v1
kind: Pod
metadata:
name: secure-pod
spec:
containers:
- name: frontend-container
image: myregistry.io/frontend-app
# Frontend does NOT get secret access
- name: signer-container
image: myregistry.io/signer-app
command: ["ls", "-la", "/etc/signing"]
volumeMounts:
- name: signing-volume
readOnly: true
mountPath: "/etc/signing" # Only signer sees the secret
volumes:
- name: signing-volume
secret:
secretName: signing-secret
Types Of Kubernetes Secrets
The following are the types of kubernetes Secrets and Its Usage inshort:
| Built-in Type | Usage | 
|---|---|
| Opaque | It is used for storing user-defined data | 
| k8s.io/service-account-token | It is used for storing ServiceAccount Token | 
| k8s.io/dockercfg | It is used for storing serialized ~/.dockercfg file | 
| k8s.io/dockerconfigjson | It is used for storing serialized ~/.docker/config.json file | 
| k8s.io/basic-auth | It is for storing basic authentication credentials | 
1. Opaque Secrets
- These are the default secret types i.e., if don't specify any type while creating, this Opaque secrets type is used default. It is used for storing general user-defined data values. We have to generic as subcommand to use this type, if want to specify. The following is an empty
- Example: Used for storing API keys or database passwords
- The following command creates a empty secret type Opaque:
kubect create secret generic mysecret
2. ServiceAccount Token Secrets
- This type of secret type is used to identify the serviceAccount It is used for storing credentials that are used by pods to authenitcate with the kubernetes API Server.
- Example: Used for storing Access Tokens for communicating with kubernetes resources.
- The following yaml code illustrates it clearly:
apiVersion: v1
kind: Secret
metadata:
name: sa-token-secret
annotations:
kubernetes.io/service-account.name: "sa-name"
type: kubernetes.io/service-account-token
3.Docker Config Secrets
- It used for serializing the docker configuration files that are used for authenticating with docker registries.
- Example: Used for storing credentials for accessing private docker repositories.
- The following yaml code helps in you better understanding of docker config secrets:
apiVersion: v1
kind: Secret
metadata:
name: docker-config-secret
type: kubernetes.io/dockerconfigjson
stringData:
.dockerconfigjson: |
{
"auths": {
"https://index.docker.io/v1/": {
"username": "my-username",
"password": "my-password",
"auth": "bXktdXNlcm5hbWU6bXktcGFzc3dvcmQ="
}
}
}
4. Basic Authentication Secrets
- It is used for storing credentials of basic HTTP authentication. The following yaml code illustrates you clearly about creating basic Authentication secrets types with yaml code:
- Example: It is used for storing Username and Password for accessing a web service.
apiVersion: v1
kind: Secret
metadata:
name: basic-auth-secret
type: kubernetes.io/basic-auth
stringData:
username: myuser
password: mypassword
5. SSH Authentication Secrets
- It is used for storing credentials for SSH Authentication.The following yaml code helps you in better understanding the ssh Authentication secrets creation.
- Example: Used for storing Username and passwords for accessing a web service.
apiVersion: v1
kind: Secret
metadata:
name: ssh-auth-secret
type: kubernetes.io/ssh-auth
stringData:
ssh-privatekey: |
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA7xyzasv..
-----END RSA PRIVATE KEY-----
Using the SSH Secret in a Pod
apiVersion: v1
kind: Pod
metadata:
name: ssh-pod
spec:
containers:
- name: my-container
image: busybox
command: ["cat", "/etc/ssh/ssh-privatekey"]
volumeMounts:
- name: ssh-volume
mountPath: "/etc/ssh"
readOnly: true
volumes:
- name: ssh-volume
secret:
secretName: ssh-auth-secret
6. TLS Secrets
- It is used for storing data that is used for TLS encryption and decryption. The following yaml code helps you in better understanding of creating TLS secrets type:
- Example: Stores TLS certificates and keys for securing communication between services.
apiVersion: v1
kind: Secret
metadata:
name: tls-secret
type: kubernetes.io/tls
stringData:
tls.crt: |
-----BEGIN CERTIFICATE-----
MIIC+zCCAeOgAwIBAgIJAK6EXAMPLECERTIFICATE
-----END CERTIFICATE-----
tls.key: |
-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCEXAMPLEPRIVATEKEY
-----END PRIVATE KEY-----
Using in a Pod:
apiVersion: v1
kind: Pod
metadata:
name: tls-pod
spec:
containers:
- name: nginx-container
image: nginx
volumeMounts:
- name: tls-volume
mountPath: "/etc/tls"
readOnly: true
volumes:
- name: tls-volume
secret:
secretName: tls-secret
7. BootStrap Token Secrets
- This secret type is used for storing tokens that are used during the node bootstrap process to sign. The following yaml code helps in understanding and creating the bootstrap token secrets:
apiVersion: v1
kind: Secret
metadata:
name: bootstrap-token-abcdef
namespace: kube-system
type: bootstrap.kubernetes.io/token
stringData:
description: "Bootstrap token for joining nodes"
token-id: abcdef
token-secret: 0123456789abcdef
usage-bootstrap-authentication: "true"
usage-bootstrap-signing: "true"
Ways To Create Kubernetes Secrets
When we working with kubernetes, the management of passwords, tokens and certificaties are important. Kubernetes comes up with multi mode of solutions for securly store and access the data. Here, lets discuss the 3 general methods for creating kubernetes secrets.
1. Create kubernetes secrets using kubectl
2. Create kubernetes secrets using A manifest file
Creating Kubernetes Secrets Using Kubectl
- It is a quick and straightforward way of creating kubernetes secrets from command line. It is suitable for creating secrets on the fly during development or testing phases.
- In this secrets creation, it supports accessing data from literals, files offering flexibility of handling sensitive data. The following command is used for creating secrets with string literals:
kubectl create secret generic my-secret --from-literal=username=admin --from-literal=password=secretpassword
- The following command is used for creating secrets from one or more files:
kubectl create secret generic my-secret --from-file=ssh-privatekey=~/.ssh/id_rsa
Create Kubernetes Secrets Using A Manifest File
- It comes with facilitating a declarative way of defining secrets using YAML or JSON manifest files. It facilitates with easy sharing and replication of secrets configurations on different environments.
- The following is the simple Yaml file for creating kubernetes secrets.
apiVersion: v1
kind: Secret
metadata:
name: my-secret
type: Opaque
data:
username: YWRtaW4= # base64 encoded username
password: cGFzc3dvcmQ= # base64 encoded password
- After the saving the above file code as mysecret-file.yaml execute the file and create secrets using following command:
kubectl apply -f mysecret-file.yaml
Manage Kubernetes Secrets
Management of kubernetes secrets involves steps for securly handing sensitive data within the kubernetes cluster. Some of the managing kubernetes secrets are discussed as follows:
- Creation: On using kubectl commands create secrets for storing sentive data such as passwords, tokens or certificates.
- Access Control: Implement Role Based Access Control ( RBAC ) to restrict the access of secrets based on users.
- Encryption: Consider on using external solutions like Hashicorp Vault for enhancing security of secret data at rest and in transit.
- Rotation: Regularly rotating the secrets helps in minimizing the risk of unauthorization and maintaining the security policies.
To know more about this, refer this - Article
Alternatives to Kubernetes Secrets
If there is a need to protect your data then secret is not the only option available. There are some other alternatives available.
- We can use ServiceAccount and its tokens to identify the cluster if the cloud native component has the need for authentication to another application that is also running within the same Kubernetes Cluster.
- We can use third-party tools that can be run by us either outside or from within the cluster that provides secrets management.
- If we need authentication we can implement a custom signer for X.509 certificates and then use CertificateSigningRequests to let that custom signer issue certificates to Pods that required them.
- We can use a device plugin to expose node local encryption hardware to a specific Pod.
There is no compulsion to use only services or one of these options. We can even combine two or more options based on our requirements.
