# Replacing Unhealthy EC2 Instance in Elastic Beanstalk Environment

> Source: https://www.geeksforgeeks.org/devops/amazon-web-services-replacing-unhealthy-ec2-instance-in-elastic-beanstalk-environment/

Elastic Beanstalk environment's Auto Scaling group uses the EC2 health check type, which only performs a basic status check on the instance itself. To automatically replace instances that fail Elastic Load Balancer (ELB) health checks, you must switch the Auto Scaling group health check type from EC2 to ELB using an .ebextensions configuration file.
- Default Behavior: The EC2 health check type only verifies that an instance is running ; it does not check whether the application is serving traffic correctly.
- ELB Health Checks: The ELB health check type evaluates whether instances are passing load balancer health checks, providing a more accurate signal of application health.
- Automation via .ebextensions : A .config file placed in the .ebextensions folder lets you modify Auto Scaling group settings as part of your application source bundle.
Steps to Automate EC2 Instance Replacement
Step 1. Navigate to Your Working Directory: Open a terminal and navigate to your local project's working directory. Confirm that an .ebextensions folder exists, or create one if it does not.
Step 2. Create the Configuration File: Inside the .ebextensions folder, create a new configuration file named autoscaling.config.
Step 3. Edit the Configuration File: Open autoscaling.config in a text editor and add the following configuration, then save the file. This instructs Elastic Beanstalk to set the Auto Scaling group health check type to ELB.
Note: HealthCheckGracePeriod defines how long (in seconds) Auto Scaling waits after an instance launches before checking its health. A value of 300 seconds is recommended to give the application time to start up before health checks begin.
Step 4. Create a New Application Source Bundle: Navigate back to the root of your working directory and package the project into a new ZIP file to create an updated source bundle.
Step 5. Upload the Bundle in the Elastic Beanstalk Console
- Log in to the AWS Management Console and navigate to the Elastic Beanstalk console.
- Select your application, then select the target environment.
- Click Upload and Deploy.
Step 6. Deploy the Updated Configuration
- Click Choose file and browse to your working directory to select the new ZIP file.
- Enter a unique, descriptive Version label.
- Click Deploy.
Note: Deployment time varies depending on your deployment strategy (e.g., rolling, immutable, all-at-once). Once complete, your Auto Scaling group will automatically replace any EC2 instance that fails ELB health checks.
