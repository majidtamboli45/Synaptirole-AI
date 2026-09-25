# Terraform Input Variables

> Source: https://www.geeksforgeeks.org/devops/terrafom-input-variables/

Terraform is a tool you can use to manage infrastructure on various cloud providers through code. The most prominent feature is input variables that increase the flexibility and reusability of configurations. Input variables is used to specify configurable values in Terraform files. It represents dynamic inputs to make the infrastructure deployable in a customizable way instead of using hard-coded values.
Terraform Input Variables let you customize values in Terraform configurations without hardcoding, making your code more flexible and reusable. With input variables, you can easily tailor settings for different environments—such as development, staging, or production—by simply changing a few key values.
Terraform Input Variable Types
Terraform uses the type argument in variable blocks to enforce rules about what kind of data can be passed as input. This helps ensure the variables provided by users are valid and consistent. Terraform supports a variety of types, such as string, number, bool, list, map, set, object, tuple, and any.
If you don’t specify the type of a variable, Terraform automatically assigns it the any type, meaning it can accept any value. Let’s break these types into two main categories: primitive types and complex types.
1. Primitive Types
Primitive types are the building blocks of Terraform variables. They represent basic, straightforward data types.
- string: This is used for text data, like words or phrases. For example, a value like "hello world" is a string.
- number: This type represents numbers, which can be either whole numbers (e.g., 42) or decimals (e.g., 3.14).
- bool: This is for true/false values. Boolean variables are helpful when you need to toggle a setting, such as enabling or disabling a feature.
2. Complex Types
Complex types allow you to store collections of values or structured data. They are incredibly useful when dealing with configurations that require multiple inputs or parameters.
A list is an ordered collection of values, where all items must be of the same type. Lists are numbered starting from zero.
variable "fruit_list" {
type = list(string)
default = ["apple", "orange", "banana"]
}
This list contains three strings: apple, orange, and banana.
A map is a collection of key-value pairs where the keys are strings, and the values can be of any type. Maps are helpful when you need to associate specific values with labels.
Example:
variable "storage_types" {
type = map(string)
default = {
westus2 = "Premium_LRS"
eastus = "Standard_LRS"
}
}
In this case, the map stores storage types for two regions: westus2 and eastus.
An object is a more advanced type that can store multiple attributes, each with a defined type. Objects let you group related information together, even if the attributes are of different types.
Example:
variable "os_config" {
type = object({
name = string
version = number
})
default = {
name = "ubuntu"
version = 20.04
}
}
Here, the object holds information about an operating system, including its name and version number.
Use of Input Variables in Terraform
The use of input variables in Terraform promotes modularity and reuse.
- Abstract configuration values: Replace intrinsic code values with variant, dynamic runtime values.
- Environment-specific custom configurations: Input variables for customization of provisioning resources such as instances or regions for a particular environment, for instance, development, staging, and production.
- Reduce code maintenance: Use input variables to change configuration values centrally on a number of resources or modules, thereby cutting out manual changes to the code.
Define and Use Input Variables in Terraform Configurations
Terraform input variables can be defined in any .tf file and are referenced in resources or modules.
1. Defining a Variable
Variables are defined using the variable block in Terraform.
variable "instance_type" {
description = "The type of instance to create"
type = string
default = "t2.micro"
}
2. Using Variables
You can reference variables using the following syntax:
resource "aws_instance" "example" {
instance_type = var.instance_type
ami = "ami-12345678"
}
3. Setting Variable Values
You can provide values to input variables in various ways:
- Via command-line arguments: terraform apply -var="instance_type=t2.large"
- Using .tfvars files: Define variables in a file (e.g., terraform.tfvars or production.tfvars)
instance_type = "t2.large"
Variable Definition Precedence If you define the same variable in multiple places, Terraform follows a specific order of precedence (highest priority wins):
- CLI Flags (-var or -var-file) — Highest Priority
- *.auto.tfvars (or *.auto.tfvars.json)
- terraform.tfvars (or terraform.tfvars.json)
- Environment Variables (TF_VAR_name)
- Default Value (in variables.tf) — Lowest Priority
4. Environment Variables
Prefix the variable with TF_VAR_, e.g., TF_VAR_instance_type="t2.large"
5. Practical Examples of Input Variables for Dynamic Resource Management
Dynamic instance size:Use variables to define compute instance sizes based on the needs of the environment.
variable "instance_size" {
type = string
default = "t2.micro"
}
resource "aws_instance" "web_server" {
instance_type = var.instance_size
ami = "ami-0abcdef1234567890"
}
Environment-specific configurations: You can use different resource values for development and testing.
variable "environment" {
type = string
default = "dev"
}
resource "aws_s3_bucket" "bucket" {
bucket = "${var.environment}-app-bucket"
}
Dynamic number of resources: Use variables to control how many resources Terraform creates.
variable "instance_count" {
type = number
default = 3
}
resource "aws_instance" "example" {
count = var.instance_count
instance_type = "t2.micro"
ami = "ami-12345678"
}
Arguments for Terraform Input Variables
- default: This argument sets a default value for the input variable, which makes it optional. If no value is provided during runtime, Terraform will use the default one you’ve defined.
- type: Here, you specify the kind of value the variable can hold, such as string, number, bool, list, or map. This helps ensure that the variable's value is of the correct type.
- description: This gives a brief explanation of what the input variable is for. It helps anyone working with the configuration understand the purpose of the variable and how it should be used.
- validation: This feature lets you define custom rules that the variable’s value must meet. It’s an extra layer of control, ensuring that input values follow specific conditions beyond just type checks.
- sensitive: When this is set to true, Terraform hides the value of the variable from appearing in the output. This is particularly useful for sensitive information like passwords or API keys, ensuring they are not exposed unintentionally.
- nullable: This argument defines whether the variable can accept a null value. It’s useful when you want the variable to be optional in a module, allowing it to be left blank without causing errors.
Best Practices
1. Use default values for optional variables: Set default values for all optional variables that rarely change.
variable "instance_size" {
default = "t2.micro"
}
2. Use descriptive variable names: Descriptive names make configurations more readable and understandable.
variable "db_instance_size" {
description = "Database instance size"
default = "db.t2.micro"
}
3. Group variables by environment: Use .tfvars files or modules to hold different variables for various environments.
4. Validate input variables: Terraform checks variables to ensure they meet specified criteria.
variable "instance_count" {
type = number
default = 1
validation {
condition = var.instance_count > 0
error_message = "The number of instances must be greater than zero."
}
}
5. Avoid hardcoding sensitive data: Never hard code sensitive values (for example, passwords) in your configuration; use variables and manage your secrets with tools like HashiCorp Vault or AWS Secrets Manager.
