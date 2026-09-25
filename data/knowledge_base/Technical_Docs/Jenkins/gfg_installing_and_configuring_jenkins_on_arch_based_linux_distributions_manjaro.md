# Installing and configuring Jenkins on Arch-based Linux Distributions (Manjaro)

> Source: https://www.geeksforgeeks.org/installation-guide/installing-and-configuring-jenkins-on-arch-based-linux-distributions-manjaro/

Jenkins is an open-source, cross-platform automation server that is used to build, test and deploy software. It simplifies and accelerates Continuous Integration/Continuous Delivery (CI/CD) environments by creating jobs, scripts, and pipelines. The application is primarily written in Java and requires a specific version of the Java Runtime Environment (JRE). Jenkins can be used to build and deploy software written in almost any modern programming language and framework. Furthermore, it integrates easily with third-party applications such as GitHub, Puppet, Docker, etc.
Installation of Jenkins
Step 1: Update and upgrade your system by executing the following command
$ sudo pacman -Syu
Step 2: Ensure that you have the exact version of Java Runtime Environment (JRE) required by Jenkins before proceeding any further.
$ sudo pacman -S jdk8-openjdk
Step 3: Once the installation is finished changed the default version JRE on your machine.
$ sudo archlinux-java set java-8-openjdk/jre
Step 4: Install Jenkins from the official repository using pacman command
$ sudo pacman -S jenkins
Step 5: Now, start Jenkins by using systemctl command.
$ sudo systemctl start jenkins
$ sudo systemctl status jenkins
Step 6: Once again use systemctl command to enable Jenkins. Now, Jenkins will restart whenever your machine boots up.
$ sudo systemctl enable jenkins
Step 7: Start configuring Jenkins by navigating to http://localhost:8090 or https://your-server-ip-address:8090. Unlock the admin privileges by entering the default password created during the installation.
$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword
Step 8: Create a new account by entering a username, password, and email address.
Step 9: Select Install suggested plugins and wait till all the plugins are successfully downloaded and installed on your machine.
Step 10: At this point, you have successfully installed and configured Jenkins on your Linux machine.
Uninstallation of Jenkins
To uninstall Jenkins and all of its config files run
$ sudo pacman -Rcns jenkins
