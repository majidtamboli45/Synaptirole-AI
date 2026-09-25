# Terraform Cheat Sheet

> Source: https://www.geeksforgeeks.org/devops/terraform-cheat-sheet/

Terraform is an extremely effective solution for cloud resource deployment, administration, and provisioning in the quickly expanding field of infrastructure as code (IaC). Clients may describe their infrastructure in code thanks to Terraform's declarative configuration language and rich ecosystem, which promotes automation, consistency, and scalability.
With its comprehensive instructions and recommended practices for understanding Terraform operations, this Terraform cheat sheet is useful for novices and specialists alike. With the help of this book, readers will be able to effectively explore Terraform's capabilities, such as workspace orchestration, startup, state management, and module usage, and handle infrastructure management chores swiftly. With the help of this cheat sheet, you can utilize Terraform to its greatest advantage for every activity, including creating cloud instances, managing networking resources, and orchestrating complicated structures.
What is Terraform?
HashiCorp developed Terraform, an open-source infrastructure as code (IaC) program. Declarative configuration files allow users to design and provision infrastructure resources. With Terraform, users can automate the deployment and administration of cloud infrastructure across numerous providers. For more details about Terraform go to the linked page
What Is Terraform CLI (Command Line Interface)?
Before going to the Terraform cheat sheet, it is very important to understand the Terraform CLI. The Terraform CLI (Command Line Interface) is a tool that HashiCorp offers for managing infrastructure as code (IaC). Users can define infrastructure configurations in Terraform files, preview changes to the Terraform plan, and deploy changes to the Terraform application. The CLI interacts with multiple infrastructure providers to provide state management and modularization of arrangement for efficient infrastructure automation.
Check Terraform Version Using Single Command
To find out more about the Terraform version that is presently installed, use the command terraform version.
| Command | Description | 
|---|---|
| terraform --version | Utilizing a common format, create Terraform configuration files. | 
What is Terraform Work Flow
Terraform files are used to define infrastructure configurations. Terraform init is used to initialize the working directory. Terraform plan is used to plan changes, and Terraform apply is used to apply changes. Efficient infrastructure management, verification, and maintenance are made possible by this iterative process, which guarantees correct maintenance and achievement of the intended infrastructure state. For more details information about the terraform work flow refer this link.
Terraform CLI Commands Cheat Sheet
For installation of the terraform, refer to the below links.
Terraform Help Command
The following command provides information and a list of available commands and options for Terraform, aiding users in understanding and navigating the Terraform CLI effectively.
| Command | Description | 
|---|---|
| terraform --help | Displays help information and lists available commands and options for Terraform. | 
Optimizing Code Structure
The following commands ensure consistent formatting of Terraform configuration files:
| Command | Description | 
|---|---|
| terraform fmt | Prepare Terraform configuration files using a standard format. | 
| terraform fmt --recursive | Formats every Terraform configuration file automatically in the current directory and all of its subdirectories. | 
| terraform fmt --diff | Format Terraform configuration files and displays the updated version of the file without actually making the changes. | 
| terraform fmt --check | Verifies whether Terraform configuration files follow formatting guidelines without modifying them. | 
Initializing Your Terraform Configuration
The following commands to ensure the initialization of terraform plugin:
| Command | Description | 
|---|---|
| terraform init | Sets the initial Terraform configuration, whether it is new or old. | 
| terraform init -get-plugins=false | Launches Terraform without requiring updates for plugins. | 
| terraform init -lock=false | Initiates a new Terraform configuration or launches an existing one without gaining a lock on state files. | 
| terraform init -migrate-state | Used during initialization to move the Terraform state to an alternate backend. | 
Module Management
Terraform module management involves encapsulating and combining infrastructure configurations into reusable components with the goal to promote modularity and reusability across projects. By using modules, users may streamline collaboration, encourage consistency, and abstract complexity in their Terraform operations.
| Command | Description | 
|---|---|
| terraform get | Download and install any modules referenced in the configuration files. | 
| terraform get -update | Updates modules to their latest versions, ensuring the configuration uses the most recent module releases. | 
Ensuring Syntax Integrity
The following commands to ensure the syntax validation of terraform code:
| Command | Description | 
|---|---|
| terraform validate | Checks the syntax and structure of Terraform configuration files. | 
| terraform validate -json | Checks the syntax of Terraform configuration files and outputs the results in JSON format. | 
Visualize Infrastructure Changes with Terraform Plan
The following commands to ensure the Infrastructure plan of terraform code with out provisioning resources:
| Command | Description | 
|---|---|
| terraform plan | Generates an execution plan, detailing the actions Terraform will take to achieve the desired infrastructure state. | 
| terraform plan -out=<path> | Generates an execution plan for infrastructure changes and saves it to the specified path for later application. | 
| terraform plan -destroy | Generates an execution plan specifically for destroying existing infrastructure resources defined in the Terraform configuration. | 
Provisioning your Infrastructure
The following commands to ensure the Infrastructure provision of terraform code:
| Command | Description | 
|---|---|
| terraform apply | Executes the planned changes defined in the configuration files. | 
| terraform apply --auto-approve | Automatically applies the execution plan without requiring manual confirmation. | 
| terraform apply -var="environment=dev" | Deploys infrastructure defined in Terraform files, while "-var" lets you pass variables, like "environment=dev", during execution. | 
| terraform apply -var-file="varfile.tfvars" | Applies changes to infrastructure defined in Terraform configuration files, using variable values specified in the "varfile.tfvars" file. | 
Clean State
The following commands to delete or clean of the terraform state resources:
| Command | Description | 
|---|---|
| terraform destroy | Removes all resources defined in the Terraform configuration from the infrastructure. | 
| terraform destroy --auto-approve | Automatically destroys all Terraform-managed infrastructure without requiring manual confirmation | 
‘Taint’ or ‘Untaint’ Your Resources
The following commands to taint and untaint the terraform resources:
| Command | Description | 
|---|---|
| terraform taint | Marks a specific resource for recreation during the next apply, effectively forcing it to be destroyed and recreated. | 
| terraform untaint | Inverse of the terraform taint. | 
Syncing State
The following command to refresh the state file in terraform:
| Command | Description | 
|---|---|
| terraform refresh | updates the Terraform state file. | 
Visualize Infrastructure State
The following command to visualize the state file in the terraform:
| Command | Description | 
|---|---|
| terraform show | Displays the current state of Terraform-managed infrastructure. | 
| terraform show <path to statefile> | Displays the current state of infrastructure resources defined in the specified state file. | 
Terraform State Management Commands
The following commands to manage the states of the terraform by using the below commands:
| Command | Description | 
|---|---|
| terraform state | Manages the state of Terraform-managed infrastructure. | 
| terraform state list | List of all resources managed by Terraform within the current state file. | 
| terraform state push | uploads the local state to the configured remote state storage. | 
| terraform state rm | Remove a resource from the Terraform state. | 
| terraform state mv | Move a resource instance from one Terraform state file to another. | 
Exploring Available Providers
The following command to know the installed provider information on the terraform:
| Command | Description | 
|---|---|
| terraform providers | Displays a list of all available providers along with their versions | 
Workspace Management Commands
The following commands to ensure the workspace on the terraform:
| Command | Description | 
|---|---|
| terraform workspace list | Displays a list of available workspaces | 
| terraform workspace show | Displays the current workspace name being used in Terraform. | 
| terraform workspace new <workspace name> | Creates a new isolated workspace for managing Terraform configurations and state | 
| terraform workspace delete <workspace name> | Remove a workspace, effectively deleting its state and associated resources. | 
Visualizing Terraform Outputs
The following commands to visualize the output of the output fields on terraform:
| Command | Description | 
|---|---|
| terraform output | Displays the values of outputs defined in Terraform configurations. | 
| terraform output -json | Displays Terraform output values in JSON format for easy consumption by other tools or scripts. | 
Emergency State Lock Release
The following command to lock the the state file lock forcefully:
| Command | Description | 
|---|---|
| terraform force-unlock <lock_id> | Forcefully release a Terraform state lock identified by <lock_id>. | 
Authentication and Credential Management Commands
The following command to interact with the terraform cloud:
| Command | Description | 
|---|---|
| terraform login | Allows users to authenticate with Terraform Cloud or Terraform Enterprise | 
| terraform logout | Remove locally stored credentials for Terraform Cloud or Terraform Enterprise | 
Visualizing Resource Dependencies
The following commands to displays the Resource Dependencies in graphical representation:
| Command | Description | 
|---|---|
| terraform graph | Generates a visual representation of the dependency graph for Terraform resources | 
| terraform graph -draw-cycles | Generates a visual representation of the dependency graph, highlighting any cycles present within the infrastructure configuration. | 
Exploring Terraform Configuration with terraform console
The following command to configuration with terraform console:
| Command | Description | 
|---|---|
| terraform console | Opens an interactive shell for evaluating expressions and testing | 
Directory-Based Terraform Configuration Application
The following command to Opens an interactive shell for evaluating expressions and testing Terraform configurations in real-time:
| Command | Description | 
|---|---|
| terraform -chdir=”../stage” apply | Applies Terraform configurations located in the "../stage" directory. | 
Enhancing Command-Line Efficiency with Terraform Autocompletion
The following command to enables shell autocompletion for Terraform commands, enhancing command-line efficiency by allowing users to quickly and accurately complete Terraform commands and options as they type:
| Command | Description | 
|---|---|
| terraform -install-autocomplete | Enables shell autocompletion for Terraform commands | 
Debug terraform
The following command which can help troubleshoot issues or understand the internal workings of Terraform:
| Command | Description | 
|---|---|
| terraform -debug <command> | '-debug' flag along with the specific Terraform command you want to debug. | 
Terraform Cheat Sheet For AWS (Amazon Web Services)
- Terraform Configuration file for AWS EC2 Instance: For AWS EC2 instance provisioning, a Terraform configuration file specifies the AWS provider, instance parameters (such as AMI ID and instance type), and extra resources (such security groups) that may be included. Terraform implements the configuration upon execution, guaranteeing automation and consistency in the deployment of AWS EC2 instances. To provision the ec2 instance by following this link.
- Terraform Configuration file for AWS S3: For use with AWS S3 resources, a Terraform configuration file must define the AWS provider, specify bucket properties like name and region, and optionally configure encryption, versioning, and access control. Terraform ensures consistency and scalability in cloud storage provisioning by automating the creation and management of the designated S3 bucket upon application of the configuration. To provision the s3 bucket by following this link.
Terraform Cheat Sheet For Azure
- Terraform Configuration file for Azuer VM: During Azure VM provisioning, a Terraform configuration file identifies the Azure provider and provides details about authentication and region. The VM's size, OS image, and networking configurations are among the parameters that define it. Terraform implements the configuration upon execution, automating the deployment of Azure virtual machines for standardized infrastructure management. To provision the Azure VM by following this link.
- Terraform Configuration file for Azure storage: The Azure provider must be defined, together with the region and authentication requirements, in a Terraform configuration file for Azure storage. It also describes storage account resource blocks, including characteristics like encryption settings, access tiers, and account replication. By automating the creation and administration of Azure storage resources, configuration execution guarantees consistency and scalability in cloud storage provisioning.. To provision the Azure storage by following this link.
Conclusion
People may effectively handle cloud infrastructure using Terraform by using the commands and suggested procedures found in the Terraform cheat sheet. Every command in the Terraform workflow—from workspace orchestration to module utilization, from startup to state management—is designed to make it easier for users to take full use of infrastructure as code. Users may automate their cloud infrastructure, install complex architectures, and confidently handle infrastructure management chores by becoming skilled with these commands. As a result, they become more skilled with Terraform and move faster toward scalable and reliable infrastructure management.
