# Security Best Practices

> Source: https://www.geeksforgeeks.org/devops/docker-security-best-practices

Container security involves implementing a robust set of practices and tools to protect the entire container lifecycle, from the underlying infrastructure to the applications running within them. It focuses on ensuring the integrity, confidentiality, and availability of containerized environments. The need for dedicated container security arises from several core risks :
- Isolation Breach: Unlike virtual machines, containers share the host operating system's kernel. This architecture creates a potential single point of failure. Without proper security measures, a kernel exploit could allow an attacker to "escape" a container, gaining access to the host and all other containers running on it.
- Vulnerability Management: The speed of modern development means container images are built and deployed frequently. Continuous scanning and monitoring of these images are critical to prevent attacks that exploit vulnerabilities in outdated packages or dependencies.
- Access Control: Misconfigured permissions can grant unauthorized access to the Docker daemon or running containers. Proper access management is essential for detecting suspicious behavior and responding promptly to security threats during runtime.
Securing The Docker Host and Daemon
The security of your entire container ecosystem rests on the security of the host machine and the Docker daemon. A compromise at this foundational level can render all other security measures ineffective.
Hardening the Host System
Because containers share the host's kernel, a vulnerability at the host level can be catastrophic. Hardening the host is the first line of defense.
- Keep the Host and Docker Engine Updated: Regularly apply security patches to the host OS and the Docker Engine. This is the most critical step to protect against known kernel exploits and container escape vulnerabilities.
- Use a Minimalist Host OS: Reduce the host's attack surface by using a minimal OS distribution that only includes packages necessary for running Docker.
- Enforce OS-Level Security: Activate mandatory access control (MAC) frameworks like SELinux or AppArmor to confine the Docker daemon and mitigate the impact of a compromise.
Securing the Docker Daemon
The Docker daemon (dockerd) runs as a root process by default, making it a high-value target. Gaining access to the daemon is equivalent to gaining root access on the host.   
Do Not Expose the Daemon Socket: The Docker daemon socket (/var/run/docker.sock) is the primary API entry point. Never expose it to containers, as this would allow them to control the Docker host. If remote access is required, secure it with TLS (HTTPS) or SSH.   
- Use a JSON Configuration File: The preferred method for configuring the daemon is via the /etc/docker/daemon.json file. This centralizes all settings in a version-controllable location.
- Disable Inter-Container Communication (ICC): Set "icc": false indaemon.json to prevent containers on the default bridge network from communicating with each other, enforcing a default-deny network posture.
Advanced Isolation: Rootless Mode and User Namespaces
- Rootless Mode: This feature allows the Docker daemon and containers to run as a non-root user, significantly mitigating vulnerabilities that could lead to privilege escalation on the host. It executes the daemon and containers inside a user namespace, meaning that even if an attacker compromises a container, they won't gain root privileges on the host.
- User Namespace Remapping (userns-remap ): For environments where rootless mode isn't feasible,userns-remap provides strong isolation. It maps the root user (UID 0) inside the container to a high-numbered, unprivileged user on the host, neutralizing many privilege escalation attacks.
Building and Managing Secure Images
The security of a running container begins with the image it's built from. A vulnerability introduced during the build process will be replicated across every container instance.
Best Practices for Writing Secure Dockerfiles
- Use Trusted and Minimal Base Images: Always start with official images from trusted sources like Docker Hub. Prefer minimal base images like    alpine ,slim variants, or "distroless" images, which contain only the application and its runtime dependencies, drastically reducing the attack surface by removing shells and package managers.
- Run as a Non-Root User: This is a critical security control. Create a dedicated unprivileged user in the Dockerfile and switch to it using theUSER instruction to mitigate privilege escalation risks.
- Use Multi-Stage Builds: This technique creates lean production images by separating the build environment from the runtime environment. Only the necessary compiled artifacts are copied to the final image, discarding all build-time dependencies and tools.
- Pin Image Versions: Avoid using the latest tag, which is mutable. Pin base images to specific version tags (e.g.,alpine:3.19 ) to ensure reproducible and secure builds.
- Lint Dockerfiles: Use tools like Hadolint to statically analyze Dockerfiles for misconfigurations and violations of best practices before the build process begins.
Vulnerability Scanning with Trivy and Docker Scout
Integrating automated image scanning into your CI/CD pipeline is essential for a "shift-left" security approach. Tools like Trivy, Clair, Snyk, and Docker Scout analyze image layers for known vulnerabilities (CVEs).
- What is Trivy? Trivy is a popular open-source scanner that quickly detects vulnerabilities in container images and other artifacts. It provides structured reports, classifying issues by severity (low, medium, high, critical), and can be easily integrated into CI/CD pipelines for automated checks.
- What is Docker Scout? Docker Scout is a tool from Docker that analyzes container images for packages and vulnerabilities, offering suggestions for remediation. It integrates with the Docker toolchain to provide continuous feedback throughout the development lifecycle.
A Step-by-Step Guide to Using Trivy
This example demonstrates how to find and fix vulnerabilities in a Docker image using Trivy.
Step 1: Create a Dockerfile with a Vulnerable Base Image Here, we use an old version of Alpine Linux as the base image.
FROM alpine:3.7
RUN apk add --no-cache curl
Step 2: Build and Push the Docker Image Build the image and push it to a registry like Docker Hub.
docker build -t <your-username>/gfg-demo.
docker push <your-username>/gfg-demo
Step 3: Scan the Image with Trivy Run the Trivy scanner against your image.
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
-v $HOME/Library/Caches:/root/.cache/ aquasec/trivy:latest \
image <your-username>/gfg-demo
Step 4: Analyze the Results Trivy will output a list of vulnerabilities, including critical issues found in the old Alpine image.
Step 5: Fix the Vulnerabilities Update the Dockerfile to use a recent, patched version of the base image.
FROM alpine:3.19
RUN apk add --no-cache curl
Step 6: Rebuild, Push, and Rescan Repeat Step 2 to build and push the updated image. Then, run the Trivy scan from Step 3 again. You will now observe that the critical vulnerabilities have been resolved.
Ensuring Image Integrity with Docker Content Trust
Docker Content Trust (DCT) provides a mechanism for cryptographically signing and verifying images. When enabled ( export DOCKER_CONTENT_TRUST=1), the Docker client will refuse to pull or run any image tag that is not signed, preventing man-in-the-middle attacks or the use of tampered images
What are Control Groups?
Control groups or groups are the crucial features in Linux that facilitate resource allocation, prioritization, and limitation of the system resources such as CPU, memory, and I/O bandwidth among the processes. By grouping the processes and assigning the resource limits to these groups, groups enable the administrators to manage the system resources more efficiently.
It helps prevent the individual processes from consuming excessive resources and leading it to system instability. It helps in optimizing the system performance and ensures in equitable resource distribution across the applications and users.
Securing Running Containers
Once a container is running, security shifts to hardening its isolation boundaries and monitoring its behavior.
Applying the Principle of Least Privilege
Containers should run with the minimum permissions necessary to function.
- Drop Linux Capabilities: By default, Docker drops many capabilities, but not all. It is best practice to drop all capabilities (--cap-drop=all ) and add back only those that are strictly required (--cap-add=NET_BIND_SERVICE ).
- Prevent Privilege Escalation: Use the --security-opt=no-new-privileges flag to prevent processes inside the container from gaining additional privileges.
- Use a Read-Only Filesystem: Running a container with a read-only root filesystem (--read-only ) prevents an attacker from modifying application files or writing malware to disk. Use an in-memorytmpfs mount (--tmpfs /tmp ) for directories that require write access.
- Limit Resources: Set resource quotas for CPU (--cpus ), memory (--memory ), and process IDs (--pids-limit ) to prevent denial-of-service (DoS) attacks where a compromised container exhausts host resources.
Network Security and Segmentation with Calico
By default, Docker allows unrestricted communication between containers on the same host, creating a flat network where a single compromised container can attack others. Network segmentation is crucial for isolation.
- Use Custom Bridge Networks: Avoid the default bridge network. Instead, create custom user-defined networks to isolate different application stacks.
- Enforce Network Policies with Calico: For advanced network security, especially in orchestrated environments like Kubernetes, tools like Calico are essential. Calico is an open-source solution that provides fine-grained network policy enforcement. You can define rules to control traffic between containers based on IP addresses, ports, and protocols, effectively creating a zero-trust network that prevents unauthorized access and lateral movement.
Monitoring and Logging for Threat Detection
Comprehensive logging and monitoring are vital for detecting security incidents in a dynamic container environment.
- Centralize Container Logs: Configure applications to log to STDOUT andSTDERR . Use Docker's logging drivers to forward these logs to a centralized analysis platform.
- Monitor Docker Events: The Docker Events API provides a real-time stream of activities such as container creation, image pulls, and network modifications. Monitor this stream for suspicious events, such as a privileged container starting or a sensitive host directory being mounted.
- Use Runtime Security Tools: Tools like Sysdig Falco use kernel-level instrumentation to detect abnormal behavior within containers, such as unexpected shell access or modifications to sensitive files, and can provide real-time alerts.
