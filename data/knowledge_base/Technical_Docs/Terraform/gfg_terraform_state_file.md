# Terraform State File

> Source: https://www.geeksforgeeks.org/devops/terraform-state-file/

Terraform automates the provisioning and administration of infrastructure resources of cloud a well-liked infrastructure-as-code solution. It applies configurations to your infrastructure and manages your infrastructure resources using a variety of commands. It employs configuration files defined in the HashiCorp Configuration Language (HCL) to specify the desired state of your infrastructure.
Terraform must store the state of your managed infrastructure and configuration. Terraform uses this state to map real-world resources to your configuration, track information, and boost efficiency for huge infrastructures. This state is stored by default in a local file named "terraform.tfstate".
Terraform uses the state to decide which infrastructure changes to make. Terraform does a refresh before any operation to update the state with the actual infrastructure. Bindings between resources declared in your configuration and objects in a remote system are mostly stored in the Terraform state. When Terraform generates a remote object in reaction to a configuration change, it records the identification of that remote object against a specific resource instance.
Terraform State File Structure
Terraform state files contain each and every detail of any resources along with their current status whether it is "ACTIVE", "DELETED" or "PROVISIONING" etc.
here is a sample example of a compartment resources state file
"module": "module.compartments",
"mode": "managed",
"type": "oci_identity_compartment",
"name": "test_compartment",
"provider": "provider[\"registry.terraform.io/hashicorp/oci\"]",
"instances": [
{
"schema_version": 0,
"attributes": {
"compartment_id": "compartment_id",
"defined_tags": {
"Oracle-Tags.CreatedBy": "user_id",
"Oracle-Tags.CreatedOn": "2023-05-24T10:25:53.737Z"
},
"description": "Compartment for testing ",
"enable_delete": null,
"freeform_tags": {},
"id": "compartment_id",
"inactive_state": null,
"is_accessible": true,
"name": "test",
"state": "ACTIVE",
"time_created": "2023-05-24 10:25:53.87 +0000 UTC",
"timeouts": null
},
"sensitive_attributes": [],
"private": " ",
"dependencies": [
"module.compartments.data.oci_identity_tenancy.tenancy",
]
}
]
Storing Terraform State Files
By default, Terraform saves state files locally in the directory where you run it. This is fine for personal projects or testing, but when working in teams or using automation tools (like CI/CD pipelines), storing state locally becomes a problem. In team environments, multiple people need to access the state file, and automation needs to read and write it as well.
To solve this, it's better to store the state file remotely instead of on your local machine. Services like Azure Storage Accounts or Amazon S3 buckets work well for this purpose. Remote storage ensures that the state file is accessible to everyone who needs it, while allowing you to control permissions.
Here’s an example of how to configure a remote backend using Azure:
terraform {
backend "azurerm" {
resource_group_name = "terraform-rg"
storage_account_name = "terraformsa"
container_name = "terraformstate"
key = "terraform.tfstate"
}
}
It’s important not to store state files in source control because they might contain sensitive data, like secrets. You can use services like Azure Key Vault to keep secrets secure. Version control systems don’t allow locking files, which means people might overwrite each other’s work when accessing the state file. Using a remote backend resolves this by supporting file locks, automatic loading, encryption, and versioning. Plus, it's typically inexpensive.
Organizing and Isolating State Files
To reduce risk and make it easier to manage your infrastructure, it’s best to isolate your state files. If everything is in a single state file, a change to one resource could unintentionally affect others.
A better approach is to use separate state files for different parts of your infrastructure, or different environments. For example, you might want separate state files for development, testing, and production. Here’s how you could organize state files in Azure Storage:
terraformstate
--development
--webapp.tfstate
--sqldb.tfstate
--vnet.tfstate
--UAT
--webapp.tfstate
--sqldb.tfstate
--vnet.tfstate
--production
--webapp.tfstate
--sqldb.tfstate
--vnet.tfstate
Each environment and resource has its own state file, so changes to one environment won’t affect another. For example, the backend configuration for a web app in the development environment would look like this:
terraform {
backend "azurerm" {
resource_group_name = "terraform-rg"
storage_account_name = "terraformsa"
container_name = "terraformstate"
key = "development/webapp.tfstate"
}
}
Using Workspaces for Isolation
Another way to manage state files is through Terraform workspaces. Workspaces allow you to quickly isolate environments, though they’re not meant for use in production. Each workspace has its own state file. When you create a new workspace, Terraform sets up a directory to store the state file for that workspace.
Here’s how to use workspaces:
Create a new workspace:
$ terraform workspace new development
Created and switched to workspace "development"!
Switch between workspaces:
$ terraform workspace new stage
Created and switched to workspace "stage"!
$ terraform workspace new prod
Created and switched to workspace "prod"!
Define variables based on the selected workspace
locals {
cidr_block = terraform.workspace == "dev" ? "10.0.0.0/16" : terraform.workspace == "stage" ? "11.0.0.0/16" : "12.0.0.0/16"
}
output "cidr_block" {
value = local.cidr_block
}
Switch to a workspace and apply changes:
$ terraform workspace select dev
Switched to workspace "dev".
$ terraform apply
By using workspaces, Terraform will keep separate state files for each environment. You can list your workspaces with:
$ terraform workspace list
* dev
stage
prod
This makes it easy to manage separate environments without accidentally changing something you didn’t mean to. You can isolate your work and keep environments clean.
Manage Terraform State File
There are two ways to store these state files:
1. Local File
When we don't define any object storage or bucket to store these files, by default, these states get stored in a local file named "terraform.tfstate" . The disadvantage of using local files to store states is that every team member will have their own local state file, and this local state file will be different for sure. And it will create discrepancies for all resource states, and you might not be able to deploy the resources until you delete or modify the required state of the resource.We would recommend always using an object storage and configuring the backend to store state files.
2. Using Object Storage To Store State Files And Configure The Backend
We can explicitly defined a bucket to store the state files . For that we have to configure the backend . Create block "backend" inside "terraform" block and define these thing as listed below.
Configure the [default] entry in the credentials file with the appropriate Object Storage credentials. Following is an example of Object Storage credentials:
[default]aws_access_key_id=ae37c0....aws_secret_access_key=mSTd.....
Where aws_access_key_id and aws_secret_access_key are user-specific values provided from the Console, mapped to the Object Storage parameters objectStoreKey and objectStoreSecret respectively.
Get Access of Key and Id
Open the navigation menu in cloud and click Identity & Security. Under Identity, click Users. Under User Details, click generate Customer Secret Key.
Code to find
terraform {  backend "s3" {    bucket   = "bucket-name"    key      = "statefilename.tfstate"    region   = "valid-cloud-region-name"    endpoint = "object-storage-bucket-url"    shared_credentials_file     = "./credential-file-name"    skip_region_validation      = true    skip_credentials_validation = true    skip_metadata_api_check     = true    force_path_style            = true  }}
endpoint : https://<namespace>.compat.objectstorage.<region>.<domainname>.com
region :  us-phoenix-1
Terraform init
To know how terraform plan works refer to Terraform plan
terraform init
In bucket , empty state file will gets generated
Now run terraform apply command:
terraform apply
Terraform State Commands
Here are some helpful Terraform commands for working with state files:
- terraform state list : This command shows all the resources that Terraform is currently managing in the state file.
- terraform state rm : Use this command to remove a resource from the state file. It doesn’t affect the actual resource in your infrastructure; it just removes it from Terraform’s control.
- terraform state show : This command displays detailed information about a specific resource in your state file.
Importing Resources into Terraform
If you have resources that were created outside of Terraform (for example, manually or through another tool), you can import them into your Terraform management. The terraform import command allows you to bring these resources into your Terraform configuration.
Each resource type has specific instructions in the Terraform documentation for how to import it. For example, to import an Azure SQL Database, you would use its resource ID, like this:
terraform import azurerm_sql_database.database1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.Sql/servers/myserver/databases/database1
Before running this command, make sure you’ve already written the corresponding resource block in your Terraform configuration. The settings in the configuration file should match the actual resource.
Importing resources can be a slow process, so it's usually a good idea to avoid manual resource creation at the start. Instead, let Terraform handle resource creation to keep everything under its control from the beginning.
Terraform Remote State
Remote state is a way to store your Terraform state file in a shared, secure location, instead of keeping it locally. This is especially useful when working in a team, ensuring everyone can access and modify the infrastructure without issues.
1. Use of Remote State
- Team Collaboration: Multiple team members can access and work on the same infrastructure without overwriting each other's changes.
- State Locking: Remote backends usually support state locking, which ensures that only one person can modify the state at a time, avoiding conflicts.
- Security: Storing state remotely ensures that sensitive data can be encrypted both in transit and at rest.
- Version Control: Remote backends often provide versioning, which makes it easy to roll back if something goes wrong.
- Consistency: Using remote state guarantees that everyone is working with the same version of the state file, avoiding discrepancies.
2. Setting Up Remote State
You can configure remote state by adding a backend to your Terraform configuration. For example, here’s how you’d do it with Amazon S3:
terraform {
backend "s3" {
bucket = "my-terraform-state-bucket"
key = "state/terraform.tfstate"
region = "us-east-1"
encrypt = true
}
}
3. Migrating to Remote State
To move from local to remote state, just configure the backend and run terraform init. Terraform will automatically migrate the state to the remote location.
Best Practices for Managing Terraform State
- Store State Remotely: Avoid storing state files locally, especially when working with a team. Using remote backends ensures smooth collaboration and prevents conflicts.
- Enable Encryption: Always encrypt your state files, both while they’re stored and while they’re in transit, to keep sensitive data safe.
- Review Plans Before Applying: Take the time to review your Terraform plans before applying them. This helps you understand the changes and their potential effects on your infrastructure.
- Version Your Configurations and Use Modules: Keep your configurations under version control for easy rollbacks. Using modules can further simplify management and allow for smoother updates.
- Consider Automation Tools: Tools like Spacelift can help automate state management and improve collaboration without requiring manual effort.
Advantages of using object storage for storing state file
- State file are stored in a centralised way . So Every team can access same state files and deploy each resource with their latest and correct state
- If supported by your backend, Terraform will lock your state for all operations that could write state. This prevents others from acquiring the lock and potentially corrupting your state.
- State locking happens automatically on all operations that could write state. You won't see any message that it is happening. If state locking fails, Terraform will not continue.
So multiple team members can work easily on same infrastructure at the same time.
Troubleshooting Terraform State File Errors
1. Bucket does not exist : Make sure to create a bucket before initialising the s3 backend .
2. Invalid endpoint : Please recheck the defined endpoint url , it should be in following format :
- https://<namespace>.compat.objectstorage.<region>.<domainname>.com
where namespace you can see in tenancy details page , region should be any valid region associated with any cloud service provider.
3. credential-file-name does not exist : This file should be in root folder or define exact location of this file in case you are keeping it somewhere else .
4. No credential found : Make sure to name the profile with [default] . This file can have multiples profiles.
[default]
aws_access_key_id=ae37c0....
aws_secret_access_key=mSTd.....
