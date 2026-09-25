# What is Terraform Configuration Language (HCL)

> Source: https://www.geeksforgeeks.org/devops/what-is-terraform-configuration-language-hcl/

HashiCorp Configuration Language (HCL) is the open-source toolkit that powers Terraform, enabling engineers to define infrastructure as code (IaC). At its core, HCL is a domain-specific language designed to strike a balance between human readability and machine precision.
Unlike JSON (which is hard for humans to write) or YAML (which can be ambiguous), HCL allows developers and operations teams to clearly define, version, and share infrastructure configurations across multiple cloud providers and on-premises systems.
Key Features of HCL
HCL is the industry standard for IaC because of these specific characteristics:
- Human-Readable Syntax: HCL is designed to be read by humans first. It supports comments, clear block structures, and logic, making it easier for teams to collaborate and review code.
- Declarative Nature: You define the "Desired State" (what you want), not the steps to get there.
- Example: You ask for "3 Servers." Terraform figures out if it needs to create 3 new ones, or just add 1 because you already have 2 running.
- Modularity: HCL supports Modules, allowing you to create reusable components (e.g., a standard "Web Server" module) that can be shared across teams to enforce best practices and reduce code duplication.
- Interpolation & Functions: HCL is more than just static configuration. It allows for dynamic behavior using built-in functions (like cidrsubnet, format, or lookup) and variable interpolation to make your infrastructure flexible.
- Provider Agnostic: While HCL is the language, Terraform uses "Providers" to talk to APIs. This supports everything from massive clouds (AWS, Azure, GCP) to platforms like Kubernetes, Helm, and GitHub.
Structure and Syntax of Terraform Configuration Language
The structure of HCL is straightforward, consisting of blocks, arguments, and expressions:
- Blocks: Each block defines a specific resource or component. For example, a resource block specifies a cloud resource, while aprovider block configures the cloud provider being used.
provider "aws" {
region = "us-west-2"
}
resource "aws_instance" "example" {
ami = "ami-12345678"
instance_type = "t2.micro"
}
- Arguments: These are key-value pairs within blocks that define the properties of the resource. In the example above, ami andinstance_type are arguments of theaws_instance resource.
- Expressions: HCL supports expressions that can be used to reference variables or perform operations. For example, you can use interpolation to construct values dynamically.
The Terraform Workflow
Writing HCL is just the first step. To actually manage infrastructure, you follow the core Terraform lifecycle:
- Write: Define your infrastructure in .tf files using HCL.
- Initialize (terraform init): This command downloads the necessary provider plugins (e.g., the code that knows how to talk to AWS) into your working directory.
- Plan (terraform plan): A dry run. Terraform compares your HCL code against your State File (and the real world) to show you exactly what will happen. It might say: "I will create 1 resource and modify 1."
- Apply (terraform apply): Terraform executes the plan, making API calls to the cloud provider to build the resources.
- State Management: Terraform writes the results to a terraform.tfstate file, which maps your HCL code to the real-world IDs of your resources.
Best Practices for Using Terraform Configuration Language (HCL) Effectively
To maximize the benefits of HCL and Terraform, consider the following best practices:
- Use Modules: Make your configurations manageable, buildable and reusuable by organizing them in modules. It helps to encapsulate related resources and make the config easier.
- Keep Configurations DRY: Use variables and modules as a way to not repeat yourself.
- Version Control: Alway put your HCL files under version control. It enables this concept of collaboration, auditing changes and rolling back.
- Document Your Code: Comments give you an opportunity to explain some difficult configurations or decisions translated in your code. It makes it easier for others (and you later on) to understand why some choices were made.
- Use Terraform Workspaces: If you have multiple environments (e.g., development, staging, production), having the ability to deploy and manage these environments is useful; for that you can use terraform workspaces to encapsulate the configurations and states.
Finally, Terraform Configuration Language (HCL) is such a beautiful tool to define and manage infrastructure in an efficient and effective manner. HCL’s key features empower organizations to manage their infrastructure in a streamlined manner, by following best practices, and improve the collaboration between the teams.
