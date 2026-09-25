# Using Config Sync for Managing Kubernetes

> Source: https://www.geeksforgeeks.org/devops/google-cloud-platform-using-config-sync-for-managing-kubernetes/

In this article, we will look into how we can manage Kubernetes using Config Sync. To do so let's create a problem statement and resolve the same.
Problem Statement:
Ravi has a new role, Platform Administrator, and he is tasked with ensuring all the infrastructure created by all of his company's teams is in compliance with governance requirements. Let's see how Config Sync makes his life easier. Ravi's team is using Kubernetes for development.
Solution:
One of the many benefits of Kubernetes is its declarative workflow. You can specify how many instances of an application you want running, and be sure that Kubernetes, will ensure that state for you. Kubernetes
But sometimes, the state of running clusters itself can become out of sync with what's on paper when un-vetted changes are applied to a live cluster. It can be difficult to know what's actually going on in your cluster. When this happens, getting your cluster back into a last known good state when something goes wrong becomes problematic. That's why Ravi proposes using Config Sync for git ops workflow. Config Sync allows cluster operators to manage Kubernetes clusters using files called configs, stored in git repositories.
Config Sync watches, for updates to those files and applies changes to all relevant clusters automatically. By locking down direct access to Kubernetes API, he can require that all cluster configuration changes are propagated using Config Sync. The below command is used for the same:
$ kubectl delete pod my_pod --ns namespace_1
This way all changes are reviewed before they are submitted. Declarative tooling like Config Sync means that git will become the source of truth and accurately reflect what's happening in your live cluster. For a platform administrator like Ravi, this is a win. And as the entire system becomes easier to manage, debug, and monitor.
Let's see an example of how Config Sync can be used to keep a repository in sync. In this example, we've created a cluster, made ourselves a cluster admin, and installed the normal command and the Config Sync operator onto the cluster we operate on.
The first step is to configure the git repo storing the Configs our cluster will be synced from. We'll create a configuration file called config-management-yaml that will be applied to all of our clusters. This file tells Kubernetes which clusters to operate on. And it provides information about the git repository, including which branch and folder to sync from. We can set up credentials for accessing the private repository as needed. It would look something like below:
$ cat config-management.yaml
apiVersion: configmanagement.gke.io/v1
kind: ConfigManagement
metadata:
    name: config-management
spec:
    clusterName: my_cluster
git:
syncRepo: https://github.com/GoogleCloud Platform/csp-config-management/ syncBranch: 1.0.0
secretType: none
policyDir: "geeksforgeeks.org'
Once that's applied, you can see that Config Sync operator actually creates pods in the Config Management namespace. These are services that run to make sure the cluster's desired state matches up with its actual state.
With Config Sync, you can pair the git ops approach with git for storage and versioning. And your changes will be automatically synced to the cluster to ensure a consistent review process. With this approach, all configuration changes follow the consistent review process that is validated and approved before being applied, just like code would be. This makes it much easier for Ravi to ensure all teams follow this process consistently so it can scale across the company.
