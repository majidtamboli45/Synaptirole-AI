# Working With Secrets

> Source: https://www.geeksforgeeks.org/devops/kubernetes-working-with-secrets/

Kubernetes Secrets are objects that are used to store secret data in base64 encoded format. Using secrets enables developers not to put confidential information in the application code. Since Secrets are created independently of the pods, there is less risk of secrets being exposed.
Uses of Secrets:
- As files in a volume mounted on one or more of its containers.
- As container environment variable.
- By the kubelet when pulling images for the Pod.
Creating a Secret:
$ kubectl create secret generic [secret-name] \  
--from-file=[key1]=[file1] \  
--from-file=[key2]=[file2]
Decoding Secret:
$ kubectl get secret [secret] -o jsonpath='{.data}'
The above output shows encoded key-value pairs.
Decode them using echo and pipe the output to base64
$ echo '[encoded-value]' | base64 --decode
The above output is the decoded password.
Editing Secret:
$ kubectl edit secrets <secret-name>
The config file during editing would look like this:
Deleting Secret:
$ kubectl delete secret <secret-name>
