# Denying Access using IAM policy for EC2 and EBS Instance

> Source: https://www.geeksforgeeks.org/devops/amazon-web-services-denying-access-using-iam-policy-for-ec2-and-ebs-instance/

In any growing AWS environment, untagged resources create real operational problems:
- Untagged resources are difficult to audit and secure consistently.
- Without tags, attributing AWS spend to teams, projects, or environments becomes nearly impossible.
- Automated pipelines that rely on tags will fail or behave unpredictably when tags are missing.
- The most reliable point to enforce tagging is during resource creation using IAM policy conditions.
- IAM's explicit Deny overrides any Allow, making it the ideal mechanism for mandatory tag checks.
IAM Policy Evaluation
IAM has one rule that makes this whole approach work: an explicit Deny always overrides any Allow, regardless of what other policies say.
Note: An explicit Deny statement in a policy will ALWAYS override any Allow statement.
That asymmetry is what the tagging enforcement strategy is built on. You grant broad permission to create resources, then add Deny statements that block the action only when a required tag is missing or malformed. The mechanism is the "Condition" block in an IAM policy statement, which evaluates context keys in the request. For tag enforcement, the relevant key is "aws:RequestTag/your-tag-key".
Policy Logic
Two things need to happen in the policy:
- An Allow statement grants the base permissions needed : for example, "ec2:RunInstances".
- One or more Deny statements block that action if required tags are absent or incorrectly formatted.
Tagging Requirements for EC2 Instances
To launch an EC2 instance under this policy, the creation request must include all four of the following tags:
- cost_center: any non-empty value (e.g., 123)
- Production: the key must be present, spelled exactly as shown (case-sensitive)
- identifier: the value must be exactly five characters (e.g., xyzab)
- env: the value must be one of sandbox, dev, or prod
Working of Conditions
The policy uses StringNotLike to deny instance creation when a tag is missing or incorrectly formatted. StringNotLike supports wildcards: ? matches exactly one character, and * matches any sequence. The pattern ?* enforces that at least one character is present.
Note: The StringNotLike operator supports wildcards: a single ? matches exactly one character, and * matches any sequence of characters. The pattern "?*" enforces at least one character is present. The ForAnyValue modifier with aws:TagKeys ensures that at least one tag key in the request matches the specified value.
Creating the IAM Policy
Step 1 : Open the IAM console. Log in to the AWS Management Console, navigate to IAM, select Policies in the left navigation pane, and click Create Policy.
Step 2 : Switch to JSON view and paste the policy.
{
"Version": "2012-10-17",
"Statement": [
{
"Sid": "AllowToDescribeAll",
"Effect": "Allow",
"Action": ["ec2:Describe*"],
"Resource": "*"
},
{
"Sid": "AllowRunInstances",
"Effect": "Allow",
"Action": "ec2:RunInstances",
"Resource": [
"arn:aws:ec2:*::image/*",
"arn:aws:ec2:*::snapshot/*",
"arn:aws:ec2:*:*:subnet/*",
"arn:aws:ec2:*:*:network-interface/*",
"arn:aws:ec2:*:*:security-group/*",
"arn:aws:ec2:*:*:key-pair/*"
]
},
{
"Sid": "AllowRunInstancesWithRestrictions1",
"Effect": "Deny",
"Action": ["ec2:CreateVolume", "ec2:RunInstances"],
"Resource": [
"arn:aws:ec2:*:*:volume/*",
"arn:aws:ec2:*:*:instance/*"
],
"Condition": {
"StringNotLike": {
"aws:RequestTag/cost_center": "?*"
}
}
},
{
"Sid": "AllowRunInstancesWithRestrictions2",
"Effect": "Deny",
"Action": ["ec2:CreateVolume", "ec2:RunInstances"],
"Resource": [
"arn:aws:ec2:*:*:volume/*",
"arn:aws:ec2:*:*:instance/*"
],
"Condition": {
"ForAllValues:StringNotLike": {
"aws:TagKeys": "Production"
}
}
},
{
"Sid": "AllowRunInstancesWithRestrictions3",
"Effect": "Deny",
"Action": ["ec2:CreateVolume", "ec2:RunInstances"],
"Resource": [
"arn:aws:ec2:*:*:volume/*",
"arn:aws:ec2:*:*:instance/*"
],
"Condition": {
"StringNotLike": {
"aws:RequestTag/identifier": "?????"
}
}
},
{
"Sid": "AllowRunInstancesWithRestrictions4",
"Effect": "Deny",
"Action": ["ec2:CreateVolume", "ec2:RunInstances"],
"Resource": [
"arn:aws:ec2:*:*:volume/*",
"arn:aws:ec2:*:*:instance/*"
],
"Condition": {
"StringNotLike": {
"aws:RequestTag/env": ["sandbox", "dev", "prod"]
}
}
},
{
"Sid": "AllowRunInstances1",
"Effect": "Allow",
"Action": ["ec2:CreateVolume", "ec2:RunInstances"],
"Resource": [
"arn:aws:ec2:*:*:volume/*",
"arn:aws:ec2:*:*:instance/*"
]
},
{
"Sid": "AllowCreateTagsOnRunInstance",
"Effect": "Allow",
"Action": "ec2:CreateTags",
"Resource": "*",
"Condition": {
"StringEquals": {
"ec2:CreateAction": "RunInstances"
}
}
}
]
}
All four tags must be present for the instance launch to go through.
Step 3 : Understand what each Deny does.
- Restriction 1: cost_center: Uses ?* to require at least one character. An empty value triggers the Deny.
- Restriction 2: Production: Uses ForAllValues:StringNotLike against aws:TagKeys to check that the key Production is present in the request. Case-sensitive.
- Restriction 3: identifier: Uses ????? (five question marks) to require exactly five characters. Leading and trailing spaces are ignored by the condition operator.
- Restriction 4: env: Denies creation if the value is anything other than sandbox, dev, or prod.
Step 4 : Name and save the policy. Click Next, enter a name (e.g., EnforceEC2Tagging), review, and click Create policy.
Step 5 : Attach the policy to a user. Go to Users, select the target user (e.g., user1), choose Add permissions, select Attach existing policies directly, check the new policy, and confirm.
Step 6 : Test it. Log in as user1 and try to launch an instance without the required tags : the launch will be denied. Add all four tags with valid values and try again. You should see: Your instances are now
