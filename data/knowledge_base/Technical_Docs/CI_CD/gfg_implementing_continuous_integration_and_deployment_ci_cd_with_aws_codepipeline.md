# Implementing Continuous Integration And Deployment (CI/CD) With AWS CodePipeline

> Source: https://www.geeksforgeeks.org/cloud-computing/implementing-continuous-integration-and-deployment-ci-cd-with-aws-codepipeline

In the Rapid field of software development, implementation of Continuous Integration and Deployment ( CI/CD ) is essential for dependable and effective applications. This Article explores the streamlined process of setting up CI/CD using the AWS Code pipeline automating the build, test, and deployment phases. This user-friendly solution from Amazon web services(AWS) can enhance your development workflow rapidly and error-free releases.
What Is CI/CD On AWS?
When new code is submitted on one end and tested over a series of stages (source, build, test, staging, and production), and then published as production-ready code, CI/CD pipeline is used in that case.
Advantage of using CI/CD
- Frequent releases: Based on customer feedback or monitoring input, we can release the changes with CI/CD.
- Low risk: There won’t be any manual intervention and configuration setup, since its automated process.
- Increased Productivity: Increased developer productivity, as product will be released as different components.
AWS CI/CD Tools and Services
- AWS CodeCommit
- AWS CodeBuild
- AWS CodePipeline
- AWS CodeDeploy
- Amazon Elastic Container Registry
- AWS CodeStar
AWS CodeCommit
- AWS CodeCommit is a secure, highly scalable, fully managed source control service that hosts private Git repositories.
- No need for the user to know Git and manage their own source control system and worry about scaling up or down their infrastructure.Even about provisioning hardware, server, scaling or software which must be installed, configured or updated.
- Codecommit repositories are encrypted so its secured.
- The size of files or file types doesn't bother file storage in Codecommit.
AWS CodeBuild
- AWS CodeBuild is a fully managed build service in the cloud. It compiles source code, runs unit tests, and produces artifacts that are ready to deploy.
- CodeBuild eliminates the need to provision, manage, and scale our own build servers.
- It is On demand which scales on demand to meet our build needs. We pay only for the number of build minutes we consume.
- CodeBuild provides preconfigured build environments for the most popular programming languages which points to our build script to start our first build.
AWS CodeDeploy
- AWS CodeDeploy is a service that automates software deployments that can deliver new features more quickly, avoid application deployment downtime, and handle the complexity of application updates with AWS CodeDeploy.
- We can easily roll out new features, prevent downtime when deploying our apps, and handle the complexity of updating our programs without many of the hazards involved with risky manual deployments.
Amazon Elastic Container Registry
- Amazon Elastic Container Registry (Amazon ECR) is a fully managed container registry which offers high-performance hosting, so we can reliably deploy application images and artifacts anywhere.
- It provides a command-line interface (CLI) and APIs to manage repositories and integrated services, such as Amazon Elastic Container Service (Amazon ECS), which installs and manages the infrastructure for these containers.
- Difference between Amazon ECR and AWS ECS is that while ECR provides the repository that stores all code that has been written and packaged as a Docker image, the ECS takes these files and actively uses them in the deployment of applications.
AWS CodeStar
- AWS CodeStar project can be used to create and integrate Amazon services with the user’s project development toolchain. Based on the CodeStar project template chosen by the user, the toolchain will include source control, build, deployment, virtual servers or server less resources and other resources.
- It can be used to set up application development in the cloud and to manage the user’s application with the help of a single, centralized dashboard.     
To know about how to create AWS Account, Refer this article - create and activate aws account
What is AWS CodePipeline?
AWS CodePipeline is a fully managed continuous delivery service that helps us automate our release pipelines for fast and reliable application and infrastructure updates.
- We will create the pipeline using AWS CodePipeline, a service that builds, tests, and deploys our code every time there is a code change. We will use our GitHub account, an Amazon Simple Storage Service (Amazon S3) bucket, or an AWS CodeCommit repository as the source location for the sample app’s code. We will also use AWS Elastic Beanstalk as the deployment target for the sample app. Our completed pipeline will be able to detect changes made to the source repository containing the sample app and then automatically update our live sample app.
CodePipeline Concepts
1. Pipeline: A pipeline defines release process workflow that describes how a new code change progresses through release process.
2. Stage: Stages (e.g., build, test, and deploy) act as logical divisions in workflow.
3. Revision: A revision is a change made to the source location defined on pipeline.
4. Action: An action is a task performed on a revision.
Create a Deployment Environment On Elastic BeanStalk
Step 1: Open AWS Console and search for service Elastic Beanstalk
Step 2: Choose Create Application.
Step 3: For Application name, enter any name ex- "Deployment App". Select PHP from the dropdown menu under Platform, and choose Create application.Click on next
Step 4: On service access - select create new role
Step 5: On Tab vpc , instance traffic and scaling - leave as default and click next
Step 6: On review page - click submit
Elastic Beanstalk will begin creating a sample environment for you to deploy your application to. It will create an Amazon EC2 instance, a security group, an Auto Scaling group, an Amazon S3 bucket, Amazon CloudWatch alarms, and a domain name for your application.
For Detailing practically stepwise with screenshots refer this Article - Deploy An Application Using AWS Elastic Beanstalk
Integrating CI/CD with AWS CodePipeline
Step 1: Take Github as Source Code. If you would like to use your GitHub accountVisit our GitHub repository containing the sample code at Github repo and then Fork a copy of the repository to your own GitHub account by choosing the Fork button in the upper-right corner.
Step 2: To Create Your Pipeline, Fristly go to CodePipeline service on aws console and choose create pipeline.Step 3: Type Pipeline name as "Demo_Pipeline"
Step 4: Click on next and Select GitHub (Version 2) for the Source provider.
Step 5: Choose Connect to GitHub.
Step 6: On connect to github, you will redirect to page to enter connection name , Enter any name such as "Deployment app" and click on authorize aws connector
Step 7: Click on install app and select github repo only and select our github repo and connect.
Step 8: Select repositrory name and branch name
Step 9: On Add build stage, choose Skip build stage.
Step 10: Activate your pipeline to deploy your code
Step 11: On deployment stage, choose your deployment provider as "ElasticBeanstalk" and select your app and environment name
Step 12: Click on next and create pipeline.
Step 13: After your pipeline is created, the pipeline status page appears and the pipeline automatically starts to run. You can view progress as well as success and failure messages as the pipeline performs each action.
Step 14: To verify your pipeline ran successfully, monitor the progress of the pipeline as it moves through each stage. The status of each stage will change from No executions yet to In progress, and then to either Succeeded or Failed. The pipeline should complete the first run within a few minutes. You can go to beanstalk environment and check endpoint .
Step 15: Now commit any new changes to index.html page on github repo and push to repo, that will be automatically deployed and get reflected to this environment url.
Best Practices for Successful CI/CD on AWS
Use AWS CodeStar with CodePipeline
- CodeStar is a cloud service providing a unified AWS software management UI. It combines AWS resources in a single project toolchain using CodePipeline. The AWS CodeStar dashboard lets us automatically build pipelines, source code, repositories, spec files, and instances. We can choose the coding language and application type.
- We can integrate the relevant IDE into the CodeStar dashboard, where we can add or remove team members and manage user permissions.
Use Amazon VPC
- CodePipeline lets us use Amazon Virtual Private Cloud endpoints, allowing us to connect directly via a private VPC endpoint. All traffic stays inside the VPC and AWS network.
- We define the interface endpoint when connecting the VPC to AWS CodePipeline, allowing VPC to access AWS services. We don’t need a VPN connection or Internet gateway to connect.
Monitor the Pipelines
- To keep our AWS pipelines reliable, available, and performant, we use monitoring. The data collected from monitoring solutions make it easier to debug complex failures.
- Examples of monitoring tools that work with CodePipeline and AWS resources include:
- Event Bridge —monitors CodePipeline events, detecting pipeline changes and routing data to AWS targets like SNS. The events here are identical to Amazon CloudWatch Events.
- The Developer Tools console —supports notifications to monitor CodePipeline events.
- CloudTrail —captures API calls from CodePipeline and delivers log files to Amazon S3 buckets. CloudWatch can send Amazon SNS notifications upon the delivery of log files.
- AWS CLI — lets you view information about your pipeline’s status or execution.
Secure the CI/CD Pipeline
- Here are some ways to secure our CI/CD pipelines:
- Use authentication and encryption for the source repositories connecting to the pipelines.
- Avoid entering secrets directly into the configuration, use secret manager.
- Use encryption on the server-side if pipeline stores artifacts in an Amazon S3 bucket.
Conclusion
AWS CodePipeline is a fully managed continuous delivery service that automates the build, test, and deploy phases of the release process each time a code change occurs. It integrates with various AWS services such as CodeCommit, CodeBuild, and CodeDeploy, and also integrations with external tools like GitHub and Jenkins. We can define our pipeline structure, receive notifications for events, and manage who can change and control the release workflow using AWS IAM.
