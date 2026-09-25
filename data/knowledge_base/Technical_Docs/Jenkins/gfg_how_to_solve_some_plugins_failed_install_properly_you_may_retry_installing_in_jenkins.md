# How to Solve "Some plugins failed to install properly, you may retry installing..." in Jenkins?

> Source: https://www.geeksforgeeks.org/devops/how-to-solve-some-plugins-failed-to-install-properly-you-may-retry-installing-in-jenkins/

Jenkins can be installed in many ways - but after installation, the way to set up Jenkins in all the systems is the same. The steps are as follows
- Step 1 - Open 'localhost:8080' in the browser if you haven't changed the port of Jenkins.
- Step 2 - Unlock Jenkins using the Initial Admin password and provide your administrator account details.
- Step 3 - Install the recommended or required plugins.
While you have performed the installation process of Jenkins step by step perfectly, you meet an error - "Some plugins failed to install properly, you may retry installing them or continue without the failed plugins" in Step 3 of setting up Jenkins, which pops up when the suggested plugin's installation in Jenkins is not able to complete its installation.
Solutions
Solution 1: Check your network connection and troubleshoot it.
Solution 2: Try clicking the Retry button at the bottom of the page. Sometimes installation of plugins works by retrying the installation several times.
Solution 3: Try restarting Jenkins.
Windows:
# (In browser)
http://[jenkins-url]/safeRestart
# use it when you have installed Jenkins using .exe file (In terminal)
jenkins.exe restart
Unix-based OS:
#(In terminal)
sudo systemctl restart jenkins
#another method (In terminal)
sudo /etc/init.d/jenkins restart
MAC:
# (In browser)
http://[jenkins-server]/restart
# use it when Jenkins-LTS is installed (In terminal)
brew services restart jenkins-lts
Solution 4: When installed using jenkins.war file, try running Jenkins in Java-enabled mode.
Command - (In terminal) [works on all OS]
#after this command  refresh the browser page
java -jar jenkins.war --enable-future-java flag
