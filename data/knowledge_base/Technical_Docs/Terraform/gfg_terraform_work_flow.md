# Terraform Work Flow

> Source: https://www.geeksforgeeks.org/devops/terraform-work-flow/

Terraform is an open-source infrastructure as code (IaC) tool developed by HashiCorp. It enables you to define, provision, and manage your infrastructure resources across various cloud providers and on-premises environments in a declarative manner.
With Terraform, you can describe your desired infrastructure state using a declarative configuration language (HCL - HashiCorp Configuration Language). The configuration files define the resources, their properties, and the relationships between them. This allows you to treat your infrastructure as code, providing version control, collaboration, and repeatability benefits.
Terraform supports a wide range of cloud providers, including Amazon Web Services (AWS), Microsoft Azure, Google Cloud Platform (GCP), and many others. It also supports managing resources in on-premises environments and various other services such as DNS providers, content delivery networks (CDNs), and databases.
Terraform workflow
Terraform workflow consists of the following steps:
1. Define Infrastructure
Create a directory for your Terraform project and define your infrastructure using Terraform configuration files. These files describe the desired state of your infrastructure resources, such as virtual machines, networks, databases, and more. The main configuration file is usually named main.tf, but you can split the configuration across multiple files as needed.
2. Terraform Initialize
In the project directory, run Terraform init to initialize Terraform. This command downloads the necessary provider plugins and sets up the backend configuration. The backend configuration determines where Terraform stores its state file, which tracks the current state of your infrastructure. Now run terraform init command in the terminal as shown in the figure below.
terraform init
2. Terraform Validate
The Terraform validate command is used to validate the syntax and configuration of your Terraform files without actually applying or modifying any infrastructure. It performs a static analysis of your code and checks for any errors or warnings in the configuration.
To use the Terraform validate command, navigate to the directory containing your Terraform files and execute the following command:
Terraform validate
Here are the typical outcomes of running terraform validation:
- If your Terraform configuration is valid and error-free, the command will exit with a success message, indicating that the configuration is syntactically correct.
- If there are any syntax errors or issues in your Terraform files, the command will display specific error messages pointing to the problematic lines or elements in your configuration.
Example output:
In this case, you need to review the error message, correct the syntax issue, and run Terraform validate again until the configuration is error-free.
Note that terraform validation only checks for syntax errors and basic configuration issues. It does not perform any validation against the actual resources or services you are provisioning. For a more thorough validation that includes checking for potential errors and issues related to specific providers, you can use the terraform init command followed by terraform plan.
By regularly running Terraform validate during your development process, you can catch syntax errors early and ensure that your Terraform configuration is properly structured and ready for execution.
3. Terraform Plan
Run terraform plan to create an execution plan. This command analyzes your configuration and compares it with the current state, identifying the changes necessary to achieve the desired state. It provides an overview of what resources will be created, modified, or deleted. Now add terraform plan command you will see the execution plan by terraform.
terraform plan
4. Terraform Apply
Use Terraform apply to execute the plan and apply the changes to your infrastructure. Terraform prompts for confirmation before proceeding. Once confirmed, it provisions the resources according to your configuration and updates the state file. Now run terraform apply command you will see this as output and with a resource that you have mentioned.
5. Review and Iterate
After applying the changes, review the resulting infrastructure. You can validate that the resources were created correctly and are functioning as expected. If necessary, iterate on your configuration by making modifications to the Terraform files and repeating steps 3 to 5.
6. Terraform Destroy
When you want to tear down the infrastructure, use Terraform destroy. This command reads the state file and destroys all the resources managed by Terraform. It's important to exercise caution with this command as it permanently deletes resources.
Throughout the workflow, it's crucial to maintain the Terraform state file, which tracks the current state of your infrastructure. This file should be stored securely and version-controlled to ensure consistency and facilitate collaboration.
Additionally, you can use other Terraform commands and features as needed, such as Terraform validate to check your configuration for syntax errors, terraform state to interact with the state file directly, and modules to organize and reuse infrastructure code.
It's important to note that while this provides a general workflow, actual practices may vary depending on your specific use case, team processes, and best practices in your organization.
Terraform Code For Aws Provider and Terraform Block
Create a main.tf file and add this code to practice the Workflow mentioned above
terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "4.45.0"
}
}
}
provider "aws" {
region = "us-east-1" #The region where the environment
#is going to be deployed # Use your own region here
access_key = "" # Enter AWS IAM
secret_key = "" # Enter AWS IAM
}
resource "aws_ecr_repository" "app_ecr_repo" {
name = "app-repo"
}
The provided code is a Terraform configuration file written in HashiCorp Configuration Language (HCL).
Terraform Block
Specifies the required providers for your Terraform configuration. In this case, it declares that the configuration requires the AWS provider from the "hashicorp/aws" source and expects version 4.45.0. This ensures that the correct provider is available to provision AWS resources.
Provider aws block
Configures the AWS provider. It specifies the region where the environment will be deployed as "us-east-1". Additionally, it requires the access key and secret key, which should be provided for authentication with AWS. You need to replace the empty strings with the actual access key and secret key values associated with your AWS IAM user or role.
Resource block
defines an AWS Elastic Container Registry (ECR) repository resource named "app_ecr_repo". It creates a repository in AWS ECR with the name "app-repo". ECR repositories are used to store and manage Docker container images.
To summarize, the provided Terraform configuration sets up the required AWS provider, specifies the region, access key, and secret key for authentication, and creates an AWS ECR repository resource named "app-repo". By running Terraform apply with this configuration, Terraform will create the specified ECR repository in the AWS region specified.
