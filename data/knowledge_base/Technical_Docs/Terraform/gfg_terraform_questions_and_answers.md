# Terraform Interview Questions and Answers

> Source: https://www.geeksforgeeks.org/devops/terraform-interview-questions/

Terraform is an Infrastructure as Code (IaC) tool that enables you to provision and manage cloud and on-premises infrastructure using declarative configuration files. Preparing for a Terraform interview requires understanding IaC concepts, Terraform workflows, state management, modules, providers, and best practices.
1. What is Terraform's primary purpose?
- Its primary purpose in DevOps is to automate the infrastructure lifecycle, enabling teams to build, change, and version infrastructure safely and efficiently.
- It acts as a single tool to manage infrastructure across multiple cloud providers and on-premises data centers, fostering a consistent workflow.
2. What is Infrastructure as Code (IaC) and what are its main benefits?
- Infrastructure as Code is the practice of managing and provisioning infrastructure through machine-readable configuration files rather than manual processes or interactive tools.
- Its main benefits include faster, more consistent deployments through automation, uniformity across environments (dev, staging, production), and improved scalability.
- Because configurations are version-controlled, teams can track changes, collaborate effectively, and reduce the risk of human error.
3. Explain the difference between declarative and imperative IaC.
- Declarative and imperative are two different approaches to IaC.
- A declarative approach, used by Terraform, focuses on the "what" you define the desired end-state of your infrastructure, and the tool is responsible for figuring out how to achieve it.
- An imperative approach, often seen in shell scripts, focuses on the "how" you provide explicit, step-by-step commands that must be executed in order to reach the desired state.
- Declarative IaC is generally less complex and more reliable for managing state over time.
4. How does Terraform differ from configuration management tools like Ansible?
- Terraform is primarily a provisioning tool, focused on creating, managing, and destroying infrastructure resources like virtual machines, networks, and databases.
- It excels at managing the lifecycle of these foundational components.
- Ansible, on the other hand, is primarily a configuration management tool, focused on installing and managing software on existing servers.
5. What makes Terraform a cloud-agnostic tool?
- Terraform is cloud-agnostic due to its provider-based architecture.
- It uses plugins called "providers" that act as a translation layer between Terraform's universal configuration language and the specific API of a cloud provider (like AWS, Azure, GCP) or other services.
- This allows a single Terraform configuration and workflow to manage resources across multiple platforms simultaneously.
- This contrasts with cloud-specific tools like AWS CloudFormation, which only work within their native ecosystem.
6. Who are Terraform's main competitors in the IaC space?
- Ansible – agentless configuration management with some provisioning capability; simpler learning curve but less purpose-built for multi-cloud provisioning.
- AWS CloudFormation – native IaC for AWS only; deeply integrated with AWS services but not multi-cloud.
- Google Cloud Deployment Manager – Google's native IaC offering, limited to GCP.
- Azure Resource Manager (ARM) / Bicep – Microsoft's native templating layer for Azure resources.
- Pulumi – IaC using general-purpose programming languages (Python, TypeScript, Go) instead of a DSL.
- OpenTofu – an open-source fork of Terraform .
7. Describe the core Terraform workflow.
- The core Terraform workflow consists of three main steps: Write, Plan, and Apply.First, you Write infrastructure as code in HCL files.
- Next, you run terraform plan to generate an execution Plan, which previews the changes Terraform will make to your infrastructure without actually applying them.
- Finally, you use terraform apply to Apply the changes and provision or modify the resources as described in the plan.
- This cycle provides a safe and predictable way to manage infrastructure.
8. What are the core components of Terraform's architecture?
- CLI (Command-Line Interface): the primary interface through which users issue commands like plan andapply .
- Core Engine: reads HCL configuration, builds a resource dependency graph, and computes the difference between desired and current state.
- Providers: plugins that translate Terraform's configuration into API calls for a specific platform (AWS, Azure, GCP, etc.).
- State: a file that records the current status of managed infrastructure, allowing Terraform to determine what changes are needed on future runs.
9. What are Terraform providers and resources?
- Providers are plugins Terraform uses to interact with the APIs of cloud providers, SaaS platforms, or other services.
- A provider (e.g., aws ,azurerm ) understands how to authenticate and make API calls, and it exposes a set of resources and data sources.
- Resources are the fundamental building blocks of infrastructure in HCL — for example aws_instance orazurerm_resource_group .
- Each resource block declares an infrastructure object that Terraform will create and manage.
10. Explain the basic structure of a Terraform configuration file.
- Terraform configuration files use HCL (HashiCorp Configuration Language).
- Common block types include: terraform (settings like required providers and backend),provider (which platform to talk to),resource (infrastructure to create),data (read-only lookups of existing infrastructure),variable (inputs),locals (internal named values),module (calls to reusable configuration), andoutput (values to expose). Each block takes arguments that define the settings of that component.
11. What is the purpose of terraform init?
- The terraform init command is used to initialize a working directory containing Terraform configuration files.
- It performs three primary tasks: it downloads and installs the provider plugins declared in the configuration, initializes the configured backend for state file storage, and downloads any modules referenced in the configuration.
- This command must be run before any other Terraform commands can be executed in a new or cloned project directory.
12.Explain what terraform plan does and why it's important.
- The terraform plan command creates an execution plan by comparing the desired state defined in your configuration files against the current state of the real-world infrastructure recorded in the state file.
- The output shows exactly which resources will be created, updated, or destroyed.
- This command is critically important because it provides a "dry run" or preview of changes, allowing for review and validation before any modifications are made to the actual infrastructure, thereby preventing unintended or destructive actions.
13. What is the difference between terraform apply and terraform apply tfplan?
- Running terraform apply without an argument will first generate a new execution plan and then prompt for interactive approval before executing it.
- This is suitable for manual workflows.
- In contrast, terraform apply tfplan, where tfplan is a file saved from a terraform plan -out=tfplan command, applies the exact changes outlined in that pre-saved plan file without generating a new one or prompting for approval.
- The latter is a best practice for automation and CI/CD pipelines, as it ensures that only the previously reviewed and approved changes are executed.
14. What are terraform validate and terraform fmt used for?
- terraform validate checks the syntax and internal logical consistency of configuration files (e.g., invalid arguments, undeclared variables) without contacting any remote provider APIs.
- terraform fmt rewrites configuration files into Terraform's canonical style for consistency and readability across a team. Neither command affects infrastructure.
15. What do terraform console, terraform graph, terraform show, and terraform output do?
- terraform console opens an interactive REPL for evaluating expressions and functions against the current state — useful for testing interpolations before putting them in code.
- terraform graph generates a visual representation (DOT format) of the resource dependency graph, useful for understanding or debugging execution order.
- terraform show prints a human-readable (or JSON, with-json ) summary of the current state or a saved plan file.
- terraform output prints the values of declared output variables, useful for scripting (e.g., piping an IP address into another tool).
16. What is terraform destroy and how do you destroy only specific resources?
- terraform destroy tears down all resources managed by the current configuration's state.
- To remove only specific resources, use targeting: terraform destroy -target=aws_instance.example .
- Targeting should be used sparingly and only for exceptional cases (e.g., recovering from a bad apply), since it bypasses Terraform's normal dependency-aware planning and can leave infrastructure in an inconsistent state if used routinely.
17. How do you recover from a stuck state lock?
- If a Terraform operation is interrupted (e.g., the process crashes or loses network connectivity) while holding a state lock, the lock may not be released automatically.
- terraform force-unlock <LOCK_ID> manually releases it.
- This should only be used after confirming no other process is genuinely running, since forcing an unlock while another operation is active can corrupt the state.
18. What is the purpose of the Terraform state file?
- The state file (terraform.tfstate ) is a JSON file that acts as the single source of truth mapping resources in your configuration to real resources in your infrastructure.
- It also tracks resource metadata and dependencies, which lets Terraform build an accurate plan for creating, updating, or destroying infrastructure.
- The state file is essential for drift detection and for applying changes correctly.
19. Why is storing state remotely a best practice?
- Remote backends (e.g., AWS S3, Azure Blob Storage, Terraform Cloud) provide a central, shared location for state that the whole team can access, which enables collaboration.
- They also provide critical features such as state locking (preventing concurrent modification), versioning (for rollback), and encryption at rest — all of which are far more secure and reliable than a state file sitting on someone's laptop.
20. What is state locking, and why does it matter for collaboration?
- State locking prevents multiple users or automated processes from running Terraform operations against the same state file simultaneously.
- When an operation like terraform apply starts, Terraform places a lock; a conflicting operation must wait until the lock is released.
- This prevents race conditions that could corrupt the state file, silently overwrite changes, or leave infrastructure inconsistent.
21. How can you secure sensitive data stored in the Terraform state file?
- By default, resource attributes — including some that are sensitive — are stored in plaintext inside the state file, which is a real security risk.
- Mitigations include: using a remote backend with encryption at rest ; tightly restricting access to the backend via IAM policies; and, for secrets used inside configuration, fetching them dynamically from a secrets manager , so they still land in state but never in source code.
- Marking variables sensitive = true also prevents values from being echoed in CLI output and logs .
22. What happens if you manually edit the terraform.tfstate file?
- This is strongly discouraged and should be a last resort.
- Manual edits can easily corrupt the file or create a mismatch between recorded state and actual infrastructure, causing Terraform to unexpectedly plan to destroy and recreate resources, or to fail to manage existing resources correctly.
- If state manipulation is genuinely required, use the dedicated terraform state subcommands orterraform import , which perform the operations safely.
23. What is infrastructure drift, and what commonly causes it?
- Drift is the divergence between the real-world state of your infrastructure and what's recorded in your Terraform state/configuration.
- Common causes: manual changes via the cloud console (often urgent hotfixes), changes made by other automated tools not managed by Terraform, and failed or partial apply runs.
- Drift undermines the reliability of IaC and can introduce security gaps or unexpected behavior.
24. How do you detect and remediate infrastructure drift?
- Drift is detected by running terraform plan : if it proposes changes even though your configuration hasn't changed, real infrastructure has drifted from the recorded state.
- Remediation options: run terraform apply to revert infrastructure back to what the code describes, or update the code to match the manual change.
- terraform plan -refresh-only can be used to update state to match reality without proposing further changes, so you can inspect drift before deciding how to act.
25. What is the purpose of the terraform import command, and how do you import existing infrastructure?
terraform import brings existing, manually-created resources under Terraform's management by adding them to the state file — it does not generate configuration code for you. The workflow: write a resource block that you believe matches the real resource, then run:
terraform import aws_instance.example i-1234567890abcdef0
- If the written configuration doesn't match the actual resource's attributes, the next terraform plan may show unexpected changes , so the configuration typically needs manual adjustment after import untilplan shows no diff.
26. What is the import block, and how does it differ from the terraform import CLI command?
Since Terraform 1.5, the import block lets you declare an import inside your .tf files instead of running an imperative CLI command:\
import {
to = aws_instance.example
id = "i-1234567890abcdef0"
}
- Running terraform plan shows the resulting import as part of the plan, andterraform apply executes it.
- Terraform 1.5+ can also generate matching configuration for the imported resource via terraform plan -generate-config-out=generated.tf .
- This is more GitOps-friendly than the CLI command because the import is code-reviewable, repeatable across environments, and doesn't require direct state access from every engineer's machine.
27. What is the moved block used for?
The moved block declaratively records that a resource (or module) has been renamed or relocated in configuration — for example, moved into a module — without Terraform treating it as a destroy-and-recreate:
moved {
from = aws_instance.old_name
to = aws_instance.new_name
}
- On the next plan /apply , Terraform recognizes the move and updates the state address accordingly instead of destroying the old resource and creating a new one.
- This replaces the older, more error-prone terraform state mv CLI workflow for refactors, and is especially valuable when restructuring large configurations into modules.
28. What is the removed block?
Introduced in Terraform 1.7, the removed block lets you declare that Terraform should stop managing a resource — removing it from state — without destroying the underlying infrastructure, as a declarative, reviewable alternative to terraform state rm:
removed {
from = aws_instance.legacy
lifecycle {
destroy = false
}
}
29. A Terraform state file became corrupted due to an unexpected system failure. How do you recover it?
- If state is stored remotely with versioning enabled (e.g., S3 with bucket versioning, or Terraform Cloud's built-in history), restore the last known-good version from that history.
- If using local state and the file is lost or corrupted with no backup, you'll need to manually reconstruct state by re-importing existing resources with terraform import (orimport blocks) and ensuring your
- .tf files accurately describe them.
- If nothing can be recovered, infrastructure may need to be rebuilt from configuration as a last resort.
- Best practice: always use a remote backend with versioning enabled to avoid this scenario entirely.
30. Explain the difference between input variables and local values (locals).
- Input variables, declared with a variable block, parameterize a configuration and act as its inputs — values passed in from outside, similar to function arguments.
- Local values, defined in a locals block, are named expressions used to avoid repeating a complex expression or a value used multiple times within a module — similar to a local variable inside a function's scope.
- Locals are computed internally and cannot be set from outside the module.
31. What are three common ways to assign values to Terraform variables?
- Command-line flags:-var or-var-file duringplan /apply (e.g.,terraform apply -var="region=us-west-2" ).
- Variable definition files (.tfvars ): files namedterraform.tfvars or*.auto.tfvars are loaded automatically.
- Environment variables: prefixing with TF_VAR_ (e.g.,export TF_VAR_region="us-west-2" ) is picked up automatically.
32. What is a .tfvars file and how is it used?
- A .tfvars file assigns values to input variables declared elsewhere in.tf files.
- Terraform automatically loads terraform.tfvars and any*.auto.tfvars file.
-  Teams commonly use this to separate environment-specific values (dev.tfvars ,prod.tfvars ) from core infrastructure logic, so the same configuration can be applied with different parameters per environment.
33. What is the purpose of output values in Terraform?
- Output values expose information about managed resources.
- In the root module, outputs are printed to the CLI after apply (e.g., a server's public IP) and can be queried later withterraform output .
- In a child module, outputs act like return values, letting the parent module consume data about the child's resources. Outputs are the primary way to pass data between modules.
34. How do you mark an output as sensitive, and what does that actually protect?
Setting sensitive = true on an output (or variable) block:
output "db_password" {
value = aws_db_instance.main.password
sensitive = true
}
- suppresses the value from CLI output (plan /apply logs show(sensitive value) ) and from accidental display viaterraform output (unless explicitly requested with-raw or by name).
- It does not encrypt or remove the value from the state file — the state must still be protected via a secure, encrypted backend.
35. What is a terraform_remote_state data source, and when would you use it?
terraform_remote_state reads outputs from another Terraform configuration's state file, typically used to share data across separate "stacks" (e.g., a networking stack exposing a VPC ID that an application stack consumes):
data "terraform_remote_state" "network" {
backend = "s3"
config = {
bucket = "my-tf-state"
key = "network/terraform.tfstate"
region = "us-east-1"
}
}
# Usage: data.terraform_remote_state.network.outputs.vpc_id
This is a common pattern for splitting large infrastructure into independently-managed, loosely-coupled state files.
36. What are Terraform's built-in functions? Give a few examples.
- HCL has no user-defined functions, but Terraform ships many built-in ones for string, numeric, collection, and type-conversion operations, used inside expressions.
- Examples: lookup() ,merge() ,join() /split() ,length() ,coalesce() ,jsonencode() /jsondecode() ,cidrsubnet() (compute a subnet from a CIDR block), andtemplatefile() (render a file as a template).
- These are heavily used in dynamic blocks, for expressions, and outputs.
37. What is a Terraform module, and why are they used?
- A module is a container for a set of related resources managed together.
- Modules organize, encapsulate, and make infrastructure code reusable.
- The main benefits are reduced duplication, better maintainability, and standardized, reusable components — e.g., a module for a VPC or a web-server cluster ensures consistency and best practices across environments.
38. Describe the typical file structure of a Terraform module.
- A standard module typically has: main.tf (core resource definitions),variables.tf (input variable declarations — the module's parameters), andoutputs.tf (output values the module returns to its caller).
- Best practice also includes a README.md for documentation and aLICENSE file if the module is published.
39. What is the difference between a root module and a child module?
- The root module is the main set of configuration files in your working directory, from which you run Terraform commands.
-  A child module is a separate module invoked from another configuration (typically the root) via a module block.
- The root module is the entry point, orchestrating deployment by calling child modules and wiring their inputs/outputs together.
40. Why is it important to lock module (and provider) versions, and how do you do it?
- Locking versions creates stable, predictable deployments.
- Without pinning, a future terraform init could pull a new, potentially incompatible module or provider version, causing unexpected errors or breaking changes.
- You pin a module version with the version argument on amodule block (e.g.,version = "~> 1.2" ), and pin provider versions in therequired_providers block insideterraform {} .
41. What do Terraform's version constraint operators mean?
- = (or no operator): an exact version.
- != : excludes an exact version.
- > ,>= ,< ,<= : comparisons.
- ~> ("pessimistic constraint"): allows only the rightmost version component to increment — e.g.,~> 1.2 allows1.2.x but not1.3.0 ;~> 1.2.0 allows only patch-level updates within1.2.x .
42. What is the .terraform.lock.hcl file?
- The dependency lock file, generated by terraform init and typically committed to version control, records the exact provider versions (and their checksums) selected for a configuration.
- It ensures every team member and CI run uses identical provider versions until someone deliberately runs terraform init -upgrade , preventing silent drift caused by different provider builds across machines.
43. What is provider aliasing, and when do you need it?
An alias lets you configure multiple instances of the same provider — for example, to manage resources in two AWS regions or two AWS accounts from one configuration:
provider "aws" {
region = "us-east-1"
}
provider "aws" {
alias = "west"
region = "us-west-2"
}
resource "aws_instance" "west_server" {
provider = aws.west
# ...
}
44. What is the difference between the count and for_each meta-arguments?
- Both create multiple instances of a resource, but differently: count takes an integer and creates that many copies, referenced by numeric index (resource.name[0] ).
- for_each takes a map or set of strings and creates one instance per item, referenced by key (resource.name["key"] ).
- Key-based referencing makes for_each more stable when the collection changes.
45. When would you choose for_each over count?
- Choose for_each when the resources aren't truly identical, or when the underlying collection may change over time. Removing an item from afor_each collection destroys only that specific keyed resource.
- With count , removing an item from the middle of a list re-indexes everything after it, causing Terraform to destroy and recreate all subsequent resources — highly disruptive in production.
46. How does Terraform handle dependencies between resources?
- Terraform builds a dependency graph from both implicit and explicit dependencies.
- Implicit dependencies are inferred automatically when one resource's argument references another resource's attribute (e.g., vpc_id = aws_vpc.main.id ).
- Explicit dependencies are declared with depends_on when there's no direct attribute reference but an ordering requirement still exists (e.g., IAM policy propagation).
- Terraform provisions resources in the order the graph requires.
47. How can you conditionally create a resource in Terraform?
- Typically via count with a ternary expression:count = var.create_resource ? 1 : 0 .
- If the condition is true, count = 1 and the resource is created; if false,count = 0 and it isn't created at all.for_each can achieve the same with a conditional empty map/set.
48. What are dynamic blocks, and what's a common use case?
- Dynamic blocks let you generate repeatable nested configuration blocks programmatically, for arguments that accept multiple sub-blocks whose count isn't known ahead of time.
- A common example: generating multiple ingress /egress rules on anaws_security_group by iterating over a list of ports, instead of writing a separate static block per rule.
49. What is the lifecycle meta-argument, and what does each setting do?
lifecycle is a nested block inside any resource that controls how Terraform manages that resource's lifecycle:
- create_before_destroy = true — creates the replacement resource before destroying the old one (useful to avoid downtime on replacement, e.g., for a load balancer).
- prevent_destroy = true — makes Terraform error out (refuse) if a plan would destroy this resource, protecting critical resources from accidental deletion.
- ignore_changes = [tags] (or a list of attributes, orall ) — tells Terraform to ignore drift on specific attributes, useful when another process (e.g., autoscaling) legitimately manages them outside Terraform.
- replace_triggered_by — forces replacement of this resource whenever a referenced resource or attribute changes, even if this resource's own arguments didn't change.
50. What is terraform_data (and what was null_resource)?
- null_resource (from thenull provider) is a resource with no direct infrastructure of its own, historically used as an anchor for runningprovisioners or to trigger actions based on atriggers map.
- terraform_data , added as a built-in Terraform resource, replacesnull_resource for most new use cases without needing an external provider, and adds first-class support forinput andoutput values alongside triggers — commonly paired with provisioners orreplace_triggered_by .
51. What are Terraform provisioners, and why are they considered a "last resort"?
- Provisioners execute scripts or commands on a local or remote machine after a resource is created (or before it's destroyed).
- They're a last resort because Terraform can't model their actions in its execution plan — their outcome is far less predictable than declarative resource management.
52. What are Terraform workspaces, and how do they differ from modules?
- Workspaces let you maintain multiple distinct state files for the same configuration — commonly used for lightweight environment separation (dev/staging/prod) without duplicating code.
- Modules, by contrast, are reusable configuration fragments you compose together to build infrastructure.
- Workspaces are about state isolation; modules are about code reuse.
- Many teams prefer separate directories/backends over workspaces for strong production isolation, since workspaces share the same backend configuration and credentials.
53. How can you manage different environments (dev, staging, prod) with Terraform?
Common approaches: maintain a distinct state file per environment (via separate directories, separate backends, or workspaces); parameterize environment-specific values with variables and .tfvars files; and reuse shared logic through modules so each environment calls the same module with different inputs. Example:
variable "environment" {
default = "dev"
}
resource "aws_instance" "example" {
count = var.environment == "prod" ? 2 : 1
# other configuration...
}
54. What is Terraform Cloud, and how does it differ from Terraform Enterprise and open-source Terraform?
- Open-source Terraform is the CLI and core engine run locally or in your own CI/CD.
- Terraform Cloud is HashiCorp's managed SaaS offering built on top of it, adding a hosted remote backend, remote plan/apply execution, a private module/provider registry, policy enforcement (Sentinel/OPA), and team-based access controls.
- Terraform Enterprise is the self-hosted version of the same platform, for organizations that need it to run inside their own network for compliance reasons.
55. What is Policy as Code, and how do Sentinel and OPA fit in?
- Policy as Code lets organizations codify and automatically enforce infrastructure rules as part of the Terraform workflow, rather than relying on manual review.
- Sentinel is HashiCorp's policy-as-code framework, integrated into Terraform Cloud/Enterprise, that can block a plan from being applied if it violates a policy.
- Open Policy Agent (OPA), with its Rego language, is a vendor-neutral alternative that can be integrated similarly, often via terraform plan -json output fed intoconftest or a custom OPA check in CI.
56. What is OpenTofu, and how does it relate to Terraform?
- OpenTofu is an open-source fork of Terraform, created after HashiCorp changed Terraform's license from MPL 2.0 to the Business Source License (BSL) in 2023.
- It's maintained under the Linux Foundation and aims to remain a drop-in, fully open-source alternative with a compatible CLI and HCL syntax.
- A notable feature difference is that OpenTofu supports native client-side state encryption, whereas Terraform typically relies on the backend's own encryption at rest.
57. What is Terragrunt, and why do teams use it alongside Terraform?
- Terragrunt is a thin open-source wrapper around Terraform that helps keep configurations DRY across many environments/accounts.
- It provides features Terraform doesn't natively offer, such as automatic backend/provider generation, easy variable inheritance across a directory hierarchy, and orchestrating apply /plan across multiple dependent modules ("stacks") in the right order.
58. What is Terraform's native testing framework?
- Since Terraform 1.6, .tftest.hcl files let you write automated tests for a module directly in HCL, run viaterraform test .
- Tests define run blocks that apply a configuration and assert conditions on the resulting plan or applied state — enabling unit- and integration-style testing of infrastructure code as part of CI, before it's used to affect anything.
59. What is cost estimation in a Terraform CI/CD pipeline, and what tools support it?
- Cost estimation tools (most commonly Infracost) analyze a Terraform plan and estimate the monthly cost impact of the proposed changes, posting it as a comment on the pull request .
- This gives reviewers cost visibility before merging, catching expensive misconfigurations (like an oversized instance type) early.
60. What is Atlantis, and how does it relate to GitOps for Terraform?
- Atlantis is a self-hosted application that listens for pull request webhooks and automatically runs terraform plan and, on approval/comment command,terraform apply .
- It's a common way to implement a GitOps workflow for Terraform, where infrastructure changes are only ever applied through reviewed, merged pull requests rather than engineers running apply from their laptops.
61. What are best practices for structuring Terraform configurations?
Use modules to organize related resources by responsibility; use variables and outputs to parameterize and keep configuration DRY; follow consistent naming conventions for resources and modules; use separate state for environment isolation; pin provider and module versions; and commit the .terraform.lock.hcl file.
62. How do you debug and troubleshoot Terraform configurations?
Run terraform plan before applying to catch unexpected changes early. Run terraform validate to catch syntax/consistency errors without touching remote APIs. Inspect and manage drift with the terraform state subcommands. For deep visibility into HTTP calls and internal decision-making, enable verbose logging:\
TF_LOG=DEBUG terraform apply
Log levels available are TRACE, DEBUG, INFO, WARN, and ERROR.
63. Explain how you'd use a data source to fetch a secret from AWS Secrets Manager.
Use the aws_secretsmanager_secret_version data source, referencing the secret by ID or ARN:
data "aws_secretsmanager_secret_version" "db_creds" {
secret_id = "prod/db/password"
}
Terraform queries the AWS API during plan to retrieve the value, which can then be referenced elsewhere (e.g., passed into an aws_db_instance resource) without ever hardcoding the secret in source code. 
64. Your Terraform configuration deploys an EC2 instance, but a team member manually changed the instance type in the AWS console. How do you detect and reconcile this?
- Run terraform plan to surface the drift between configuration and real infrastructure.
- To reconcile: if the manual change should be kept, update main.tf to match it; if it should be reverted, runterraform apply to enforce the original configuration.
- To prevent recurrence, restrict console access via IAM policies so infrastructure changes must go through Terraform.
65. A junior developer accidentally removed an S3 bucket from the configuration, and terraform apply now plans to delete it. How do you prevent accidental deletions?
Add the prevent_destroy lifecycle rule to critical resources:
resource "aws_s3_bucket" "important_bucket" {
bucket = "my-secure-bucket"
lifecycle {
prevent_destroy = true
}
}
With this set, Terraform refuses to destroy the resource unless the flag is explicitly removed first, applied, and only then destroyed — a deliberate two-step process that prevents accidental deletion of production-critical resources.
66. Multiple engineers apply Terraform changes on a shared project, and state conflicts occasionally occur. How do you prevent this?
Use a remote backend with state locking, e.g., S3 with DynamoDB:
backend "s3" {
bucket = "terraform-state-bucket"
key = "state/terraform.tfstate"
region = "us-east-1"
dynamodb_table = "terraform-lock"
}
The DynamoDB table enforces the lock so only one engineer can apply at a time. Reinforce this with process: always run terraform plan before apply, and coordinate changes with the team (or route all changes through CI/CD, e.g., via Atlantis, so nobody applies directly from a laptop).
67. Your configuration needs database credentials. How should you store and manage sensitive information securely?
Mark the variable as sensitive:
variable "db_password" {
type = string
sensitive = true
}
Pull the actual value from a dedicated secrets manager  or environment variables rather than hardcoding it in .tf or .tfvars files committed to source control. And store state remotely with encryption enabled, since the secret will still be present in state regardless of how it was sourced.
Q68. Deployment failed because a security group needed by an EC2 instance wasn't created in time. How do you ensure Terraform manages dependencies correctly?
Prefer implicit dependencies by referencing the security group's attribute directly:
resource "aws_security_group" "web_sg" {
name = "web-sg"
}
resource "aws_instance" "web" {
ami = "ami-123456"
instance_type = "t2.micro"
security_groups = [aws_security_group.web_sg.name]
}
Terraform automatically orders creation correctly here. If no attribute reference exists but an ordering requirement still does, add an explicit dependency:
resource "aws_instance" "web" {
depends_on = [aws_security_group.web_sg]
ami = "ami-123456"
instance_type = "t2.micro"
}
69. You modified an RDS parameter in Terraform, but instead of updating it in place, Terraform plans to destroy and recreate the instance. Why, and how do you avoid downtime?
- Some arguments force replacement rather than an in-place update .
- To minimize downtime: check provider documentation to see which arguments trigger ForceNew /replacement before changing them; where possible, modify only attributes that support in-place update; if replacement truly is unavoidable, migrate data, cut over, and only then remove the old one.
70. Your company has multiple AWS accounts, and each team needs an S3 bucket with identical security policies. How do you avoid repeating code?
Build a reusable module. Directory modules/s3/main.tf:
resource "aws_s3_bucket" "bucket" {
bucket = var.bucket_name
acl = "private"
}
modules/s3/variables.tf:
variable "bucket_name" {
type = string
}
Consume it from any project:
module "s3" {
source = "./modules/s3"
bucket_name = "project-storage"
}
71. Your team wants to integrate Terraform into a CI/CD pipeline to automate infrastructure deployment. How do you set it up?
- Store Terraform code in GitHub/GitLab. Use Terraform Cloud, Jenkins, GitHub Actions, GitLab CI/CD, or Atlantis to run it automatically. \
- The pipeline should, in order: run terraform fmt -check , runterraform validate , runterraform plan and require approval on the output, then apply withterraform apply -auto-approve only after that approval. State should be stored remotely with locking throughout.
72.terraform apply fails with an error saying a required resource doesn't exist. How do you troubleshoot?
Run terraform plan to see exactly what Terraform is trying to modify. Check whether the resource was manually deleted outside Terraform. Re-run with debug logging for full detail:
TF_LOG=DEBUG terraform apply
If a dependent resource is genuinely missing, recreate it first (via apply targeting it, or by fixing the configuration) before re-applying the rest.
73. You need to replace an EC2 instance behind a load balancer (e.g., changing its AMI) without causing downtime. How do you achieve this with Terraform?
Use create_before_destroy so the new instance is provisioned and passes health checks before the old one is destroyed:
resource "aws_instance" "web" {
ami = var.new_ami
instance_type = "t2.micro"
lifecycle {
create_before_destroy = true
}
}
74. Your team's single Terraform state file has grown to manage hundreds of resources, and plan/apply runs have become slow and risky (one bad change can affect unrelated systems). How do you address this?
- Split the monolithic configuration into smaller, independently-managed state files ("stacks") organized by logical boundary — e.g., networking, IAM, and each application's infrastructure as separate root configurations with their own backend key.
- Use terraform_remote_state to pass values like a VPC ID from one stack to another.
- This reduces blast radius, speeds up individual plan /apply runs, and lets different teams own different stacks with appropriate access controls.
