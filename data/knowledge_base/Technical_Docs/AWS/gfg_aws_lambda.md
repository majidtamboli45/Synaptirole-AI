# AWS Lambda

> Source: https://www.geeksforgeeks.org/devops/introduction-to-aws-lambda/

AWS Lambda is a serverless compute service that runs your code only when triggered by an event, scales automatically, and charges only for the milliseconds of execution time used. Its key features are:
- Lambda functions sit idle and cost nothing until triggered by an event from another AWS service or endpoint.
- Billing is based on the number of requests and the duration of execution in milliseconds, with no charge when code is not running.
- Lambda scales from a handful of daily requests to thousands per second with zero configuration changes.
Micro VM in Lambda
A MicroVM is a very lightweight virtual machine that provides strong isolation for running workloads.
- When AWS Lambda needs an execution environment for your function, it uses Firecracker MicroVM technology to isolate the workload.
- AWS manages this infrastructure automatically—you don't create or configure the MicroVM yourself.
- AWS Lambda runs your code inside a small, secure MicroVM. AWS creates it when needed and can reuse it for other requests instead of creating a new one every time
Benefits of AWS Lambda
- Reduces operational complexity by handling infrastructure automatically.
- Improves developer productivity and speeds up project delivery.
- Enables rapid innovation without large upfront investments.
- Supports modern cloud-native and event-driven applications.
The Event-Driven Model
Every Lambda execution follows a three-part pattern.
- An event occurs, such as a file uploaded to S3, an HTTP request hitting API Gateway, or a message arriving in an SQS queue.
- AWS spins up your code to process that specific event.
- The function performs an action, such as saving data to DynamoDB, returning an HTTP response, or writing a processed file back to S3.
Example: A new image uploaded to an S3 bucket triggers a Lambda function that resizes the image and saves the result to a separate S3 bucket.
When you write a Lambda function (in Python, Node.js, Java, etc.), you are primarily interacting with three components. Here is a standard Python example:
def lambda_handler(event, context):
# 1. The Handler
print("Received event:", event)
# Your business logic here
message = "Hello, " + event.get("key1", "World")
return {
'statusCode': 200,
'body': message
}
- The Handler Function: This is the entry point (lambda_handler above). AWS calls this function when execution starts.
- The event Object: This contains the data from the trigger. If triggered by an API, this holds the HTTP request body. If triggered by S3, it holds the filename and bucket details.
- The context Object: This provides runtime information, such as how much memory is allocated, the function name, and how much time is left before timeout.
Use Cases of AWS Lambda Functions
| Use Case | Description | Example | 
|---|---|---|
| File Processing | Automatically process files as they arrive. | A user uploads a photo to S3; Lambda triggers instantly to create a thumbnail version. | 
| Web APIs | Build serverless backends. | An HTTP request hits API Gateway; Lambda runs the logic to fetch data and return it to the user. | 
| Data Streams | Process real-time data. | IoT sensors send temperature data to Kinesis; Lambda filters and analyzes it in real-time. | 
| Cron Jobs | Scheduled automation. | EventBridge triggers a Lambda function every night at 12:00 AM to generate daily reports. | 
AWS lambda will help you to focus more on your code than the underlying infrastructure. The infrastructure maintenance in AWS was taken care of by AWS lambda.
Working of AWS Lambda Functions
Start off by uploading the code to AWS Lambda. From there, set up the code to trigger from other AWS services, HTTP endpoints, or mobile apps. AWS Lambda will only run the code when it's triggered and will also only use the computing resources needed to run it. The user has to pay only for the compute time used.
Getting Started With AWS Lambda Function
The following are the steps mentioned below to create your own customized AWS lambda functions by using the AWS console. Create an AWS account.
Step 1: Log in to your AWS console and search for Lambda. As shown in the following image.
Step 2: Click on Create function.
Step 3: Here we are going to use a sample hello world program by using Author from scratch and configure the details according to your requirement.
Step 4: Successfully our function is created.
Pricing
AWS Lambda offers a generous Free Tier that includes 1 Million requests and 400,000 GB-seconds of compute time per month forever. Beyond the free tier, you are billed on two factors:
- Requests: The total number of times your function triggers.
- Duration: The time (in milliseconds) your code takes to execute, multiplied by the amount of RAM you allocated to the function.
Note: If your code is inefficient and takes 10 seconds to run, you pay for 10 seconds. If you optimize it to run in 200ms, your bill drops significantly.
Common Use Cases
- Trigger a function to resize images, transcode videos, or perform OCR on documents as they are uploaded to S3.
- Use Amazon API Gateway to create a REST API that triggers Lambda functions to handle HTTP requests for your web or mobile application.
- Process and transform real-time data from streams like Amazon Kinesis or DynamoDB Streams.
- Schedule functions to run at regular intervals using Amazon EventBridge to perform tasks like generating daily reports, cleaning up resources, or running backups.
Monitoring Your AWS Lambda Usage
Monitoring your AWS Lambda usage is crucial for understanding and controlling costs, especially as your workloads scale beyond the AWS Free Tier limits. Here are some ways to effectively track and manage Lambda usage:
- Track invocation counts, execution duration, error rates and memory use. You can set alarms to alert you when usage exceeds specific thresholds.
- Visualize and analyze your spending patterns by breaking down Lambda expenses. Set budgets and alerts to manage monthly costs effectively.
- Access detailed reports in the AWS Billing Console for monthly usage across AWS services, helpful for teams needing cost allocation across functions.
- Use tools like Datadog, Lumigo and New Relic for advanced monitoring and insights, allowing for more detailed performance tracking and cost optimization.
