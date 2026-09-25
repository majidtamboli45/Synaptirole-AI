# Automating AWS Network Firewall Configurations with Terraform

> Source: https://www.geeksforgeeks.org/devops/automating-aws-network-firewall-configurations-with-terraform/

The most crucial aspect in protecting and safeguarding network infrastructure in the landscape of cloud computing is applying security to a network. AWS Network Firewall offers high-performance, fully managed security services that provide flexible protection for all your Amazon VPCs to define, implement, and manage network traffic rules that help protect applications and data.
However, manually configuring the AWS Network Firewall is a time-consuming and error-prone process that does not scale well with the number of resources, this is where Terraform, an open-source IaC tool, enters the game: it allows you to define and provision cloud resources in a descriptive, repeatable, and version-controlled way.
The automated configurations for the AWS Network Firewall using Terraform will make it easier to implement consistent security policies, reduce human errors, and reduce the challenge of handling network security, this blog takes you through configuring AWS Network Firewall with Terraform while giving step-by-step, explained examples so that you can set up your network security infrastructure more efficiently.
Primary Terminologies
- AWS Network Firewall: An AWS-managed network security service that improves the security posture of your Amazon VPCs with fully customizable policies. It enables you to create stateful and stateless traffic filtering rules to control inbound and outbound traffic.
- Terraform: Developed by HashiCorp, it's an open-source IaC tool that helps define, provision, and manage cloud resources through configuration files that deliver automation, consistency, and versioning.
- Amazon VPC (Virtual Private Cloud): It allows you to create a logically isolated set of networks in the AWS cloud. Use VPCs to define an IP address range, subnets, route tables, and network gateways.
- Firewall Policy: Ruleset with more settings, which define the behavior of the AWS Network Firewall. A firewall policy consists of the stateful and stateless rule groups involved in determining the allowance or rejection of the traffic.
- Rule Group: A list of rules to filter network traffic. The rule group could be used by more than a policy. There are two types of Rule Groups, which are stateful and stateless.
- Stateful Rule Group: Route states inspection towards the networking. These rules are more complex than the simple packet filter and can control the traffic depending on the connection status, such as new or already established.
- Stateless Rule Group: This group independently handles every packet, without maintaining the state of the connection. These rules are more straightforward and, therefore, appropriate for high-speed filtering.
- Stateful Rules: This involves the rules within the stateful rule group that tracks the current status of network connections and their examination. They permit elaborate forms of traffic filtering that include returning traffic for an initiated session.
- Stateless Rules: They contain rules within a stateless rule group that treats each packet independently. They are implemented for more straightforward types of high-speed traffic filtering tasks because they have no mechanism to maintain state information about individual connections.
- Infrastructure as Code (IaC): Management and provisioning of computing infrastructure using configuration files, either in machine-readable form or in some standard declarative language, rather than physical hardware infrastructure or the use of interactive configuration tools. The most common tool used for IaC is Terraform.
Step-by-Step Process to Automating AWS Network Firewall Configurations with Terraform
Step 1: Launch an ec2 instance
- Go to AWS Console and launch an EC2 Instance
Step 2: Install Terraform
- Now install terraform on our local machine by using following commands
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
Step 3: Create a file for Terraform Configuration
- Now create a file with .tf extension. Inside this file we are defining terraform configuration
Provider Configuration: In this Provider Configuration we are proving provider details
provider "aws" {
region = "eu-north-1"
}
VPC configuration
In this block we are defining VPC configuration
resource "aws_vpc" "main" {
cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "subnet1" {
vpc_id = aws_vpc.main.id
cidr_block = "10.0.1.0/24"
}
resource "aws_subnet" "subnet2" {
vpc_id = aws_vpc.main.id
cidr_block = "10.0.2.0/24"
}
Security group configuration
- In this block we are providing security group configuration
resource "aws_security_group" "allow_all" {
name = "allow_all"
vpc_id = aws_vpc.main.id
ingress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}
Network Firewall Rule Group
- It's Configures stateful rules for traffic filtering based on source, destination, and protocol.
resource "aws_networkfirewall_rule_group" "stateful_group" {
capacity = 100
name = "stateful-group"
type = "STATEFUL"
rule_group {
rules_source {
stateful_rule {
action = "DROP"
header {
protocol = "TCP"
source = "ANY"
source_port = "ANY"
direction = "ANY"
destination = "ANY"
destination_port = "ANY"
}
rule_option {
keyword = "sid"
settings = ["1"]
}
}
stateful_rule {
action = "PASS"
header {
protocol = "TCP"
source = "10.0.1.0/24"
source_port = "ANY"
direction = "ANY"
destination = "ANY"
destination_port = "80"
}
rule_option {
keyword = "sid"
settings = ["2"]
}
}
stateful_rule {
action = "PASS"
header {
protocol = "TCP"
source = "ANY"
source_port = "ANY"
direction = "ANY"
destination = "10.0.2.0/24"
destination_port = "443"
}
rule_option {
keyword = "sid"
settings = ["3"]
}
}
}
}
}
Network Firewall Policy
- This block Creates a firewall policy named example-policy and Associates the stateful rule group created earlier with the firewall policy
resource "aws_networkfirewall_firewall_policy" "example_policy" {
name = "example-policy"
firewall_policy {
stateful_rule_group_reference {
resource_arn = aws_networkfirewall_rule_group.stateful_group.arn
}
stateless_default_actions = ["aws:forward_to_sfe"]
stateless_fragment_default_actions = ["aws:forward_to_sfe"]
}
}
Network Firewall Configuration
- This block Associates the firewall policy with the firewall.
resource "aws_networkfirewall_firewall" "example_firewall" {
name = "example-firewall"
firewall_policy_arn = aws_networkfirewall_firewall_policy.example_policy.arn
vpc_id = aws_vpc.main.id
subnet_mapping {
subnet_id = aws_subnet.subnet1.id
}
subnet_mapping {
subnet_id = aws_subnet.subnet2.id
}
}
Step 4: Applying the Configuration
- To create these resources, run the following Terraform commands:
terraform initterraform validateterraform apply --auto-approve
- Here we see that total 7 Resources are created
Step 5: Verify Resources Created
- Security Groups
- Subnets
- VPCs
- Rule Groups
Firewall Policies
Firewalls
Step 6: Execute Terraform Destroy Command
- Now execute terraform destroy command. It destroy all created resources
terraform destroy --auto-approve
- Here we see that Destroy was completed
Conclusion
Automating AWS Network Firewall configurations with Terraform is a firm solution to maintaining network security within your Amazon VPCs. In this manner, by using the infrastructure as code capability of Terraform, you can undertake consistent, repeatable, version-controlled deployment of the firewall policies and rules. It will enhance security and make managing and scaling network infrastructure relatively easy.
This guide has introduced the critical terminologies of AWS Network Firewall and Terraform, how to deploy or implement infrastructure, and how to create and configure firewall policies and rules in AWS. The provided steps can be followed on time to protect your cloud resources from unwanted traffic and different threats.
From the above, Terraform automated on the AWS Network Firewall will result in efficiency, reduce the risk of manual errors, and make updates and security policies manageable. This will help ensure that your security architecture is capable of standing threats and scalable for the needs of modern cloud environments.
