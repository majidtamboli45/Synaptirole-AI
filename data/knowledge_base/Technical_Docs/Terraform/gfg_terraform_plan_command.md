# Terraform Plan Command

> Source: https://www.geeksforgeeks.org/devops/terraform-plan-command/

When we talk about an open-source infrastructure as a code (IaC) tool Terraform automatically comes into the picture. Terraform allows declarative definition and provisioning of infrastructure resources. The Terraform command-line interface (CLI) allows you to establish and maintain your infrastructure across several cloud providers after defining it using a straightforward and legible configuration language. 'terraform plan' is one of the primary commands in the workflow. You can preview the adjustments Terraform will make to your infrastructure using the 'terraform plan' command before actually implementing those adjustments. To further understand the 'terraform plan' command's significance in infrastructure design, we shall examine it in-depth in this article and offer real-world examples.
Terraform Plan
You can establish an execution plan for your Terraform configurations using the 'terraform plan' command. It examines the desired state specified in your configuration files, assesses it against the infrastructure's present condition, and produces a thorough report of the suggested adjustments. This command is quite helpful for figuring out how changes to your infrastructure will affect things and for seeing any potential problems before making such changes.
Terraform Plan Syntax
The basic syntax for running the 'terraform plan' the command is as follows:
terraform plan [options] [DIR]
- [options]: This is an optional command-line flag that we can use with the terraform plan command.
- [DIR]: This optional directory path contains all the Terraform configuration files. If nothing is specified, by default it considers it to be the current directory.
Terraform Plan Examples
To further understand how the terraform plan command functions, let's look at some examples:
Terraform Plan Previewing Infrastructure Changes
Example 1
Let's say we have a Terraform configuration that outlines our infrastructure in a file called main.tf. Navigate to the directory containing the configuration file and use the following command to see a preview of the adjustments Terraform will make:
terraform plan
The existing status of the infrastructure will be examined, compared to the ideal state specified in the configuration, and a thorough report of the suggested adjustments will be shown. The results will list the resources that will be created, changed, or eliminated along with any related dependencies.
Terraform Plan Verbose Output
Example 2
Use the -detailed-exit code argument with the terraform plan command if you need more specific information about the alterations. For example:
terraform plan -detailed-exitcode
This option offers additional exit codes for various adjustments, which makes it simpler to include terraform plans into pipelines or scripts that run automatically.
Terraform Plan Input Variable Values
Example 3
Your Terraform configuration files could occasionally need input variables. During the planning stage, you can specify the values for these variables. For instance:
terraform plan -var 'region=us-east-1' -var 'instance_type=t2.micro'
You are able to precisely assess the effects of various setups and prevent unpleasant surprises during the actual deployment phase by providing variable values.
Terraform Plan Additional Options
To further personalize the planning process, the Terraform plan command provides a number of options, including:
- -out=path: Indicates a file directory where the execution plan will be saved. If you wish to evaluate or implement the plan later, this can be helpful.
- -destroy: Creates a plan that depicts the destruction of all resources specified in the configuration.
- -parallelism=n: Sets the maximum allowed number of concurrent operations.
- -refresh=true: Before producing the plan, forces a refresh of the current state.
Conclusion
The 'terraform plan' command is an essential tool for effectively and confidently managing infrastructure upgrades. It lets you spot any potential problems or conflicts and make decisions about your infrastructure by giving you a thorough overview of the suggested changes. Simulating changes before implementing them improve risk mitigation and eliminates any unanticipated downtime or disruptions. Your infrastructure-building approach will be more streamlined and reliable if you incorporate the terraform plan command. You may work together by utilizing the information obtained from the execution plan.
