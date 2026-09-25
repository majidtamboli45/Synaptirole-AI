# Configure AWS Lambda

> Source: https://www.geeksforgeeks.org/python/how-to-configure-aws-lambda/

When you create an AWS Lambda function, the default settings are rarely optimal for production. Configuring Lambda correctly is the difference between a cost-efficient, secure application and one that is slow, expensive, or vulnerable.
How Lambda Function and Serverless Architecture Works
Step 1: Event Source Generates an Event
An action occurs in the system such as:
- Uploading a file to Amazon S3
- Sending an API request
- Updating a DynamoDB table
- Running a scheduled EventBridge rule
This action generates an event.
Step 2: Event is Sent to Lambda
The generated event is automatically passed to an AWS Lambda function. Lambda executes the code without requiring server management.
Step 3: Lambda Processes the Request
The function processes the event by performing:
- Validation
- Data transformation
- Business logic
- Automation tasks
Step 4: Lambda Interacts with AWS Services
After processing, Lambda can interact with services such as:
- Amazon DynamoDB
- Amazon S3
- Amazon SNS
- Amazon SQS
- AWS Step Functions
This completes the event-driven workflow
Anatomy of Lambda Console
When you open a function in the AWS Lambda console, you are presented with a dashboard that serves as your central hub for configuration. We will explore the most critical sections.
1. Performance & Cost Configuration
These settings directly affect how fast your code runs and how much you pay. You find these under Configuration > General configuration.
Memory (RAM)
- What it is: The amount of RAM, in megabytes, allocated to your function's execution environment. You can set this from 128 MB to 10,240 MB.
- Why it matters: This is the primary lever for performance tuning. Lambda allocates CPU power proportionally to the amount of memory you configure. A function with 512 MB of memory will have roughly twice the CPU power of one with 256 MB. For CPU-bound tasks, increasing memory is the best way to decrease execution time.
- Best Practice: The default of 128 MB is fine for simple tasks, but for any real workload, you should test different memory settings. Use tools like the AWS Lambda Power Tuning tool to automatically find the most cost-effective memory allocation for your specific function.
Cold Starts
- What it is: A cold start happens when AWS Lambda creates a new execution environment before running a function.
- Why it matters: Cold starts can slightly increase response time, especially for large functions or functions with heavy dependencies.
- Best Practice: Keep deployment packages small and remove unnecessary dependencies to reduce cold start delays.
Timeout
- What it is: The maximum amount of time your function is allowed to run per execution, up to a maximum of 900 seconds (15 minutes).
- Why it matters: This is a critical safety mechanism. It prevents a function with a bug (e.g., an infinite loop) from running indefinitely and incurring huge costs. The timeout should be set just long enough to accommodate your function's longest expected execution time, including any potential "cold start" delays.
- Best Practice: Set a realistic timeout. A 3-second default for a function that should take 500ms is a good starting point. Avoid setting it to the 15-minute maximum unless absolutely necessary.
Ephemeral Storage (/tmp)
- What it is: Temporary scratch space available to your function during execution. Defaults to 512 MB but can be increased to 10 GB.
- Use Case: Use this if your function needs to download large files (like unzipping a big archive) before processing them.
- Connecting Your Function: Triggers, Destinations, and Layers.
2. Security Configuration (IAM Roles)
Security in Lambda is handled via IAM Execution Roles. This is the most critical configuration for functionality. By default, a Lambda function cannot access anything not even logs. You must explicitly grant permissions. How to Configure:
1. Navigate to Configuration > Permissions.
2. Click the Role name to open IAM.
3. Add Policies:
- Basic: AWSLambdaBasicExecutionRole (Required for CloudWatch Logging).
- Specific: If your code reads from S3, attach a policy allowing s3:GetObject on that specific bucket.
Note: Never use AdministratorAccess for a Lambda role. Always follow the Principle of Least Privilege.
3. Integration
This is how your function connects to the outside world.
Triggers (Input)
A trigger is the event source that wakes up your function.
- Examples: An S3 upload, an API Gateway request, a DynamoDB update, or an EventBridge schedule (cron job).
- Configuration: Click + Add trigger in the function designer. You can often configure filters here (e.g., "Only trigger on .jpg files in S3").
Destinations (Output)
Destinations allow you to handle the result of an asynchronous function without writing extra code.
- Success: If the function works, send the result to another Lambda.
- Failure (Dead Letter Queue): If the function fails (after retries), send the error details to an SQS queue or SNS topic so you can debug it later.
Layers (Dependencies)
Layers are a way to manage external libraries (like pandas, numpy, or boto3) separately from your code.
- Use case: Instead of uploading a 50MB zip file every time you change one line of code, you put the heavy libraries in a Layer. This keeps your function code small and easy to edit in the console.
Configuring AWS Lambda
In order to configure AWS Lambda for the first time follow the below steps:
Step 1: Sign In to your AWS Account.
Step 2: Open AWS Lambda Service
- Click on Services.
- Search for Lambda.
- Select AWS Lambda from the Compute section.
Step 3: Create a Lambda Function
- Click on the Create function button.
- Choose "Use a Blueprint"
- Search for the blueprint named "hello-world-python."
- Select the blueprint.
- Enter the required details: 
  - Function Name
  - Runtime
  - Execution Role
- Click on Create function
Step 4: The created function's page looks like this:
Step 5: Add a Trigger to the Function
- In the Function Overview section, click + Add trigger.
-  Select a supported AWS service such as: 
  - Amazon S3
  - API Gateway
  - DynamoDB
  - EventBridge
  - SQS
- Configure the required settings.
- Click Add.
Step 6: View Logs Using CloudWatch
- Open the Lambda function.
- Select the Monitor tab.
- Click View CloudWatch Logs.
Benefits of AWS Lambda
- No need to register lambda tasks like Amazon SWF activities.
- Existing Lambda functions can be reused in workflows.
- Lambda functions are called directly by Amazon SWF, there is no need to design a program to implement and execute them.
- Lambda provides the metrics and logs for tracking function executions.
Limits in AWS Lambda
There are hard limits you cannot exceed. Knowing these helps you design better architectures.
| Resource | Limit | Note | 
|---|---|---|
| Max Memory | 10,240 MB (10 GB) | CPU scales with memory. | 
| Max Timeout | 15 Minutes | Use AWS Step Functions for longer tasks. | 
| Payload Size | 6 MB (Sync) / 256 KB (Async) | Use S3 for large data transfer. | 
| Deployment Pkg | 50 MB (Zipped) | Use Layers or Container Images for larger apps. | 
| Disk Space (/tmp) | 512 MB - 10 GB | Configurable. | 
| Concurrency | 1,000 per Region | Can be increased via support ticket. |
