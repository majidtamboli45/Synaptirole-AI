# Insert Data Using AWS Lambda

> Source: https://www.geeksforgeeks.org/python/aws-dynamodb-insert-data-using-aws-lambda/

AWS Lambda can be integrated with DynamoDB to build scalable serverless applications. In this setup, Lambda executes Python code, IAM manages permissions, and DynamoDB stores the application data. Its architecture components are:
- Lambda: Executes the Python code
- IAM Role: Grants permissions to access DynamoDB
- DynamoDB: Stores the data items
Implementation
Step 1: Sign in to your AWS account at the AWS Management Console.
Step 2: Create a DynamoDB Table
- Search for DynamoDB in the AWS services search bar and open it.
- Click Create table
- Enter Table name and Partition key
- Optionally add a sort key if required.
- Click Create table
Note: The partition key you define here must be included in every put_item call from your Lambda function.
Step 3: Create an IAM Role for Lambda
- Search for IAM in the AWS console
- Navigate to Access Management → Roles
- Click Create role
Step 4: Configure Trusted Entity
- Select AWS service as the trusted entity type.
- Select Lambda as the use case.
- Click Next.
- Attach Permissions
- Search for and attach "AmazonDynamoDBFullAccess"
- Click Next
- Name the Role
- Enter a role name
- Click Create role
Note: For production systems, follow the Principle of Least Privilege and grant only the specific DynamoDB actions your function requires (e.g., dynamodb:PutItem) instead of full access.
Step 5: Create the Lambda Function
- Navigate to AWS Lambda.
- Click Create function.
- Select Author from scratch.
- Enter Function name
- Choose Runtime Python 3.x
Step 6: Configure Execution Role
- Expand Additional settings while creating the Lambda function.
- Open Custom execution role.
- Select Use an existing role.
- Choose the IAM role created earlier.
- Click on Save
- Click Create function.
Step 7: Add Python Code
- Open the Code tab of the Lambda function.
- Replace the default Lambda handler code with the following:
import json
import boto3
def lambda_handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    # Replace 'sample' with your DynamoDB table name
    table = dynamodb.Table('sample')
    response = table.put_item(
        Item={
            'empid': 101,
            'name': 'Samar'
        }
    )
    return response
Step 8: Deploy and Test the Function
- Click Deploy to save the code.
- Open the Test tab.
- Create a new test event.
- Click Test to invoke the Lambda function.
Step 9: Verify Data in DynamoDB Table
- Open DynamoDB from the AWS Console.
- Select your table from the list.
- Navigate to the Explore table items tab.
- Click Scan or Run to view the table data.
Troubleshooting Common Errors
| Error | Cause | Solution | 
|---|---|---|
| AccessDeniedException | Missing IAM permissions. | Add "AmazonDynamoDBFullAccess" (or "dynamodb:PutItem") to Lambda's execution role under Configuration > Permissions. | 
| ResourceNotFoundException | Wrong table name. | Check "dynamodb.Table('name')". Match the DynamoDB table name exactly (case-sensitive). | 
| ValidationException | Missing partition key. | Ensure your " put_item" call includes the exact partition key defined during table creation. |
