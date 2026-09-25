# Amazon S3 Notifications to SNS

> Source: https://www.geeksforgeeks.org/devops/amazon-web-services-amazon-s3-notifications-to-sns/

Amazon S3 Event Notifications enable you to automate dynamic workflows by triggering immediate responses whenever actions occur inside your storage buckets. By integrating S3 with Amazon Simple Notification Service (SNS), you can build robust event-driven systems that distribute alerts or execute processes asynchronously.
- Decouples S3 bucket activities from downstream processing systems to improve scalability.
- Supports prefix and suffix rules to trigger event notifications exclusively for target file extensions or directories.
- Broadcasts single S3 events to multiple destinations simultaneously via the SNS Fan-Out pattern.
- Tracks specific actions such as object creation, multi-part uploads, deletions, and archival restorations.
- Operates dynamically without the overhead of provisioning, maintaining, or scaling monitoring servers.
S3 to SNS Notification Architecture
The automated workflow processes events through a series of decoupled AWS services:
- A client or application uploads an object to an Amazon S3 Bucket.
- The S3 bucket detects the specified action, matching an event type such as s3:ObjectCreated:Put .
- S3 publishes an event notification JSON payload to a configured Amazon SNS Topic.
- Amazon SNS routes the notification payload to all active subscribers, such as an email inbox, SQS queue, or AWS Lambda function.
Step-by-Step Configuration Guide
1. Create the SNS Topic
First, set up the Amazon SNS topic that will serve as the communication endpoint for incoming S3 events:
- Log in to the AWS Management Console and navigate to the Simple Notification Service (SNS) dashboard.
- In the left navigation menu, click Topics and select Create topic.
- Choose Standard as the topic type, type a name (e.g., S3-Upload-Notifier) in the Name field, and click Create topic.
2. Configure the SNS Access Policy
You must configure the SNS topic access policy to grant the Amazon S3 service permissions to publish event messages:
- From your new SNS topic details screen, click on the Access policy tab and select Edit.
- Update the JSON policy to allow the S3 service principal to perform sns:Publish on this specific resource.
{  "Version": "2012-10-17",  "Statement": [    {      "Sid": "AllowS3ToPublishToSNSTopic",      "Effect": "Allow",      "Principal": {        "Service": "s3.amazonaws.com"      },      "Action": "sns:Publish",      "Resource": "arn:aws:sns:REGION:ACCOUNT-ID:S3-Upload-Notifier",      "Condition": {        "ArnEquals": {          "aws:SourceArn": "arn:aws:s3:::YOUR-S3-BUCKET-NAME"        }      }    }  ]}
3. Create the Topic Subscriber
Establish an active listener to confirm the successful distribution of event payloads:
- Scroll down within the S3-Upload-Notifier details screen and click Create subscription.
- Select Email from the Protocol dropdown menu.
- Enter your valid email address in the Endpoint field and click Create subscription.
- Open your email client, locate the verification message from AWS, and click Confirm subscription to activate it.
4. Create the Amazon S3 Bucket
Set up the Amazon S3 bucket that will host your files and generate event notifications:
- Navigate to the S3 service console and click Create bucket.
- Type a globally unique identifier (e.g., your-unique-bucket-name) in the Bucket name field.
- Select the AWS Region, ensuring it is the identical region where you deployed your SNS topic.
- Leave other settings at their default parameters and click Create bucket.
5. Configure S3 Event Notifications
Establish the connection link between your S3 bucket and the target SNS topic:
- Click your newly created bucket name and select the Properties tab.
- Scroll down to the Event notifications section and click Create event notification.
- Enter a descriptive tag (e.g., Notify-SNS-On-Upload) in the Event name field.
- Specify prefix or suffix rules (such as .jpg ) if you wish to filter notifications, or leave them blank to notify on all uploads.
- Under Event types, check the box next to All object create events.
- In the Destination section, select SNS topic, select S3-Upload-Notifier from the dropdown menu, and click Save changes.
Verifying Event Notifications
Confirm the S3 to SNS routing pipeline is operating correctly with a live test:
- Upload Object: Upload a test file (e.g., sample-image.jpg) directly to your S3 bucket. This triggers an object creation event.
- Verify Emailed Notification: Open your registered subscriber email inbox. You will receive an automated AWS JSON metadata email outlining the target S3 event.
Troubleshooting Common Issues
- Access Denied Errors: Ensure you configured your SNS access policy to grant the principal `s3.amazonaws.com` permission to perform `sns:Publish`. Without this, S3 will fail to save settings.
- Region Discrepancies: Confirm that both the Amazon S3 bucket and the Amazon SNS topic are configured inside the exact same AWS Region.
- Missed Email Notifications: Check spam folders or verify that you successfully activated the subscription link sent to your endpoint.
