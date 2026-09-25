# How to Build a CI/CD Pipeline with AWS?

> Source: https://www.geeksforgeeks.org/devops/how-to-build-a-ci-cd-pipeline-with-aws

Building and deploying code manually every time takes a lot of effort and can lead to mistakes. A CI/CD pipeline makes this easier by automating testing, building, and deploying your code for you. Now you might wonder, "Why should I use AWS for this when tools like Jenkins or GitLab CI already exist?"
Let’s try to understand this with a simple example: Imagine you are baking a cake. If you had to go to different places to mix, bake, and decorate, it would take more time. But what if you had one kitchen with everything you need? That’s what AWS provides you all the tools in one place. With AWS, you get CodeCommit to store code, CodeBuild to test and build it, CodeDeploy to release it, and CodePipeline to manage the full flow. It is easy to set up, works well with other AWS services, and saves you from handling the setup yourself.
In this guide, you will learn how to build a CI/CD pipeline using AWS from scratch.
What is CI/CD on AWS?
CI/CD on AWS means using cloud tools to automate the entire software development process, from writing code to testing and launching apps. This approach helps teams build, test, and release software faster and more reliably.
AWS provides special services to make this process easier:
- AWS CodePipeline: connects all the steps of the software release process.
- AWS CodeBuild: automatically compiles code and runs tests.
- AWS CodeDeploy: sends the final app to servers or the cloud for users to access.
AWS also encourages teams to manage infrastructure using code, known as Infrastructure as Code (IaC). This helps ensure everything is consistent and easy to scale. CI/CD on AWS helps developers deliver updates quickly and with fewer errors, by automating and simplifying the whole process.
Also read : What is CI/CD?
Components of AWS CI/CD Pipeline
The following table shows the components of AWS CI/CD pipeline, different tools along with their purpose and explanation:
| Stage | Tool(s) Used | Purpose | Explanation | 
|---|---|---|---|
| Author | AWS Cloud9, AWS IDE Toolkits | Write or edit the application code | Cloud9 provides an integrated environment for writing code, offering features like debugging, testing, and version control integration. | 
| Source | AWS CodeCommit | Store and manage your code version | CodeCommit is a fully managed source control service that helps manage Git repositories, offering version tracking, collaboration, and branching. | 
| Build | AWS CodeBuild | Compile and prepare your code | CodeBuild automates the compilation, testing, and packaging of code, creating the deployable artifacts by using build specifications. | 
| Test | AWS CodeBuild, 3rd Party (e.g., Jenkins) | Test your code for bugs | Continuous testing of code is performed to ensure the build functions as expected and identifies any errors in logic or functionality before deployment. | 
| Deploy | AWS CodeDeploy | Automatically deploy code to servers or cloud | CodeDeploy automates the deployment of applications to EC2 instances, Lambda functions, or on-premises servers, allowing rollbacks in case of failure. | 
| Monitor | Amazon CloudWatch, Prometheus, FluentD | Monitor app performance and errors | CloudWatch collects and tracks metrics, logs, and events, while Prometheus and FluentD monitor app health and logs in real-time to detect issues. | 
| Pipeline | AWS CodePipeline | Connect and automate all the above steps | CodePipeline automates the end-to-end CI/CD pipeline, integrating with other services to automate the flow of code from commit to deployment. | 
How does AWS CI/CD works?
AWS CI/CD works by improving the combination of AWS services and practices the automation of software development lifecycle from code integration to deployment. The Operations of AWS CI/CD is breakdown as follows:
AWS CodePipeline
- Orchestration: CodePipelines acts as an orchestrator in defining the workflows and stages of the CI/CD process.
- Integration With Source Control: It provides a seamless integration with source code repositories like Github, AWS CodeCommit, Bitbucket for knowing changes in the source code.
Continuous Integration (CI)
- AWS CodeBuild: When any changes are detected in the source code CodePipeline notifies it to the CodeBuild. Then CodeBuild build and compile the changes in the source code.
- Artifacts Generation: CodeBuild uses the build process to generate deployable artifacts, such as binaries or packages. It helps in deploying the artifacts to the specified deployment targets may include Amazon EC2 instances, on-premises servers, or Lambda functions.
Continuous Deployment (CD)
- AWS CodeDeploy: After once Build and Test stages are successful then CodePipeline will triggers CodeDeploy to automate the deployment process.
- Deployment Configurations: CodeDeploy facilitates users in defining deployment configurations. Users can specify how they want to proceed the deployment such as canary deployments for gradual rollouts.
- Rollback Mechanism: CodeDeploy facilitates easy rollbacks to previous code applications, In case of any issues arises during deployment.
Continuous Monitoring
- CloudWatch: AWS CloudWatch offers monitoring features for users in creating alerts on the functionality and health of their deployed applications.
- Log And Metrics: Services like CodePipeline, CodeBuild, and CodeDeploy helps in generating logs and metrics for supporting in troubleshooting and performance analysis of the CI/CD pipeline.
Collaboration And Visibility
- Integration With AWS Services: AWS CI/CD tools supports integration with other AWS services such as AWS CodeCommit, Amazon S3, Elastic Beanstalk, and more for providing a complete platform.
- Dashboard And Notifications: AWS comes with providing a user-friendly dashboard for visualizing the pipeline stages and notifications for pipeline events.
Infrastructure as Code (IaC)
- AWS CloudFormation: AWS allows users in defining and provisioning of infrastructure with Infrastracture as Code scripts using the services such as CloudFormation for ensuring consistency across the environments.
AWS CI/CD facilitates with automation of building, testing, and deployment phases of software application providing an optimized and efficient workflow. It promotes collaboration, visibility, and reliability in the software development process. The combination of AWS CodePipeline, CodeBuild, and CodeDeploy services makes a powerful CI/CD solution within the AWS ecosystem.
Prerequisites
- You need an active AWS account to access AWS DevOps services like CodePipeline, CodeBuild, and CodeDeploy.
- Your source code should be stored in a version control system like AWS CodeCommit or GitHub.
A Step-By-Step Guide to Implement AWS CI/CD Pipleline
Lets now build a CI/CD Pipeline with AWS by detailing step by step as follows:
Step 1: Create IAM Role for EC2 and AWS CodeDeploy
- Navigate to IAM service.
- Then go to roles and create a new role.
- Select trusted entity type as AWS Service and use case as EC2
Step 2: Add permissions To IAM Role
- Select AmazonS3ReadOnlyAccess permission. It will allow our EC2 instance to access stored artifacts from the Amazon S3 bucket.
Step 3: Creating The Role For AWS CodeDeploy
- Provide the Name, review and Click on Create for creating the Role.
- Select an appropriate role name and click on create role.
Step 4: Creating New Service Role For CodeDeploy
- Create a new service role for CodeDeploy and attach AWSCodeDeployRole policy which will provide the permissions for our service role to read tags of our EC2 instance, publish information to Amazon SNS topics and much more task.
- Repeat the Above 3 steps again with trusted entity type AWS Service, use case CodeDeploy.
- Add AWSCodeDeployRole permissions to this creating Role
- Provide the Name, review and create the role.
Step 5: Launch An Linux EC2 instance
- Select the instance with AMI such as "Amazon Linux" and connect to CLI Console.
- Switch to root user from ec2-user to gain admin access power by using following command "sudo su" in Linux.
sudo su
Step 6: Update The Packages
- The command "sudo yum update" is used in Amazon Linux, CentOS, and Red Hat Linux distributions to update installed packages on your system to their latest available versions.
sudo yum update
Step 7: Install The Ruby And Wget Software
- The command 'sudo yum install ruby' is used to install the Ruby programming software using the YUM package manager.
sudo yum install ruby
- The command sudo yum install wget is used to install the "wget" package on a system running Amazon Linux, CentOS, or other Red Hat-based Linux distributions that use the YUM package manager.
sudo yum install wget
Step 8: Download CodeDeploy Agent Script
- Downloading the AWS CodeDeploy agent installation script from the AWS S3 bucket is an essential step in setting up AWS CodeDeploy for your infrastructure.
- The CodeDeploy agent is a lightweight, scalable software component that enables AWS CodeDeploy to deploy and manage applications on your EC2 instances or on-premises servers.
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
Step 9: Run Installation Script
- The command chmod +x ./install is used to make a file executable in a Unix-like operating system, including Linux.
chmod +x ./install
The command 'sudo ./install auto' is likely used to run an installation script with superuser (administrator) privileges and pass the "auto" argument to the script.
sudo ./install auto
Step 10: Check CodeDeploy Agent Status
- The command sudo service codedeploy-agent status is used to check the status of the AWS CodeDeploy agent running on your system.
sudo service codedeploy-agent status
Step 11: Modifying IAM Role
- After running the following commands, select the instance and click on "Actions", then click on "Security" and click on "Modify IAM Role". Then choose the above created IAM Role and click on "Update IAM Role".
- After this step, your EC2 instance gets attached with your above created IAM Role.
- Modify the IAM role by clicking on the button Update IAM role as shown in the figure.
Step 12: Finalizing The Configuration
After this process, go to the console where your instance is connected and run the command "exit" to exit from the root folder and go back to the EC2 folder. Make a directory on the EC2 folder named "server", this is the directory where my source code will be deployed.
- Then after doing the above process, come back to the running instances list.
- Select your currently created running instance and go to the "Security" section present at the end of the page.
- Click on the link present under the "Security Groups". After redirecting to the required page, click on "Edit Inbound rules" under the section of "Inbound rules" present at the end of the page.
- Then add a rule, select a port range of your choice and select the source as "Anywhere-IPv4" from the dropdown menu and then click on "Save rules".
- Basically, let me give you a overview what we are actually doing here. In brief, when you add an inbound rule to a security group for an instance with port range (in my case, it was 4000) and set the source to "Anywhere-IPv4," you are allowing any computer or device on the internet to connect to your instance through port 4000.
- This is like opening a door (port 4000) on your server and letting anyone from anywhere access the service or application running on that port.
Step 13: Create A New Pipeline
- Create a CodePipeline using Github, CodeBuild and CodeDeploy
- Firstly Create CodePipeline navigate to CodePipeline via AWS Management Console and click on Create pipeline.
Step 14: Choose Github In Code Source
- After selecting GitHub as the source provider, click on the Connect to GitHub button. You’ll then be prompt to enter your GitHub login credentials.
- Once you grant AWS CodePipeline access to your GitHub repository, you can select a repository and branch for CodePipeline to upload commits to this repository to your pipeline.
Step 15: Configure CodeBuild (Optional)
- If you haven’t created a project prior to creating your pipeline, then you can create a project directly from here by clicking Create project button.
- Note: Buildspec file is a collection of build commands and related settings, in YAML format, that CodeBuild uses to run a build. For my project, I created a buildspec.yaml file and added it in the root of my project directory.
Step 16: Add Deploy Stage
Note : Before going to configure Add Deploy Stage, Let's make duplicate tab of current tab.
- Go to code deploy in the navigation, Select Application, then add create a deployment group.
- Create a deployment Group by clicking on the button "Create deployment group", the following screenshot illustrates with practically.
- In deployment group Select EC2 instances and select Tag and Value
- Provide the Environment configurations such as select the Amazon EC2 Instances and provide the key and values to it.
- Uncheck Load Balancer Option
- Finally Come on Add Deploy Stage and select that created Application name and Deployment group
Step 17: Review And Create
- As a final step review and create it. By creating this we have successful the created a CI/CD pipeline in AWS.
Use Cases and Benefits of AWS CI/CD Pipelines
The following are the well known usecases and benefits of AWS CI/CD pipelines:
| Use Case | Description | Benefits | 
|---|---|---|
| 1. Frequent Software Releases | Delivering new features and updates quickly to stay competitive in the market. | Automates the release process for faster and more reliable deployments, improving business agility. | 
| 2.Microservices Architecture | Using independent microservices that need to be tested and deployed separately. | Automates testing and deployment of each microservice, allowing independent scaling and updates. | 
| 3.Infrastructure as Code (IaC) | Automating infrastructure rollout with repeatable, reliable templates. | Integrates with AWS CloudFormation to apply infrastructure changes consistently across environments, reducing manual errors. | 
| 4.Collaborative Development | Large teams working on the same codebase requiring smooth integration. | Automates integration of code from multiple developers, standardizes releases, and reduces conflicts. | 
Best Practices for successful CI/CD on AWS
The following are the best practices for successful CI/CD on AWS:
- Automate Infrastructure Setup: Use tools like AWS CloudFormation or Terraform to automatically create and manage your infrastructure. This saves time, avoids manual errors, and keeps everything consistent as your system grows.
- Integrate Automated Testing: Add tests like unit tests, integration tests, and end-to-end tests into your pipeline using tools like Jenkins or AWS CodePipeline. This helps catch bugs early and makes sure your code works before it’s deployed.
- Adopt Immutable Infrastructure: Instead of updating existing servers, deploy new ones with your latest code (this is called immutable infrastructure). Combine this with blue-green deployments using AWS Elastic Beanstalk or CodeDeploy to reduce downtime and lower the risk of breaking things in production.
- Continuous Monitoring and Feedback: Use Amazon CloudWatch or other monitoring tools to keep an eye on how your app is performing. This feedback helps you improve your CI/CD process and make your application even better over time.
Conclusion
In conclusion, implementing a CI/CD pipeline using AWS CodePipeline can significantly improves your software development process. It brings automation, efficiency, and reliability to your deployments, allowing you to stay competitive in a rapidly evolving tech landscape. Embrace CI/CD as a mindset for constant improvement and innovation, and AWS CodePipeline as your trusted tool for this journey. Happy coding!
