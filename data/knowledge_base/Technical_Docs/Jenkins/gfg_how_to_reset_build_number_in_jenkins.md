# How To Reset Build Number In Jenkins?

> Source: https://www.geeksforgeeks.org/devops/how-to-reset-build-number-in-jenkins/

Jenkins is an open-source automation server that is mainly used in building, testing, and deploying software projects. In some scenarios, you must have found yourself in a situation where you want to reset the build number in Jenkins. Whether it is because of organizational reasons, or you want to start new, or any other specific reason. You can reset the build number in Jenkins by following the mentioned steps in the article and also we will going to discuss it in detail.
What are Build Numbers in Jenkins?
A build number is a unique identifier assigned to every instance of software build for a continuous integration or continuous delivery (CI/CD) system like Jenkins. It acts as a sequential label for a particular build of a software project that helps in tracking, referencing, and organizing different versions of the codebase. The build number is normally an integer value that starts from 1 and gets incremented with each new build. This process helps in differentiating between different builds and also helps in understanding the order in which builds are executed.
In Jenkins, the build numbers that are associated with each build of a job can be used for various purposes like as identifying build-in logs, monitoring changes over time, and also referencing specific builds in the CI/CD pipeline.
Prerequisites
- Jenkins Installed: Before proceeding further our first step is to install Jenkins so make sure you already have installed Jenkins and it is running on your server. You can also download their latest version by visiting their website.
- Access to Jenkins Dashboard: Make sure you have all the necessary credentials and access rights to log into the Jenkins dashboard.
- Knowledge of Jenkins File System: You must have all the knowledge of the Jenkins file system, like the location of job directories and key files like "build.xml" and "nextBuildNumber."
- Backup Strategy: Before making any changes, make sure you have a proper backup to ensure that you can recover it when it is required also it is very important to prevent data loss in case if system fails.
How to reset the build number in Jenkins?
To reset the build number in Jenkins you can follow this step-by-step guide. Here is the detailed description of every step to reset the build number in Jenkins:
Step 1: Log in to Jenkins Dashboard
You can simply log in to your Jenkins dashboard by using your user ID and password.
Step 2: Navigate to Manage Jenkins
After successful login you will be redirected to the Jenkins dashboard, on the left hand side you can see option of manage Jenkin, click on it.
Step 3: Script Console
Now click on the script console after that run this command:
Jenkins.instance.getItemByFullName("test-job").updateNextBuildNumber(42) Step 4: Verify Build Number
We can verify this build number by again going to dashboard, then click on the test job and then run the job to verify it.
After that, click on the Build now
You can verify your build number
Step 5: Reset Build number in Jenkins
Now to reset the build number in Jenkins, again go the script console and then run this command:
item = Jenkins.instance.getItemByFullName("test-job")
Item.builds.each() { build -> build.delete() }
item.updateNextBuildNumber(1)
item.getNextBuildNumber()
After running command you will see result 1 means you have reset build number successfully
Step 6: Verify Reset of Build Number
After running the command successfully, you can navigate to dashboard section in this you can clearly see that there no built which clearly indicates that you have successfully reset the build number in Jenkins.
Conclusion
It must be concluded here that you can successfully reset build number in Jenkin by simply following the mentioned steps of the article. You must remember all the prerequisite before resetting the build number in Jenkins.
