# DynamoDB Backups: PITR and On-Demand

> Source: https://www.geeksforgeeks.org/devops/aws-dynamodb-working-with-backups/

Data loss can occur due to accidental deletions, application errors, or malicious activities. To help protect data, Amazon DynamoDB provides two backup and recovery options: Point-in-Time Recovery (PITR) and On-Demand Backups.
Types of DynamoDB Backups
Understanding the difference between these two and knowing when to use which is critical for any production application.
1. Point-in-Time Recovery (PITR)
PITR is your "Safety Net" against accidental writes or deletes.
- How it works: When enabled, DynamoDB continuously backs up your data with per-second granularity. You don't schedule it; it just happens in the background.
- Retention: You can restore to any second in the last 35 days.
- Use Case: "Oops, I just deployed a bug that deleted 1,000 user records. I need to rewind the database to 10:00 AM this morning."
- Performance: Enabling PITR has zero impact on your table's performance or provisioned throughput.
2. On-Demand Backups
On-Demand backups are for long-term archiving and compliance.
- How it works: You manually trigger a backup (or schedule it via AWS Backup). It takes a full snapshot of the table at that moment.
- Retention: These backups last forever until you explicitly delete them.
- Use Case: "I need to keep a monthly snapshot of our data for 7 years for financial auditing."
- AWS Backup Integration: You can use AWS Backup to manage these snapshots, automate schedules, and copy them to other AWS Regions or Accounts for Disaster Recovery (DR).
NOTE: In DynamoDB, restoring a backup does not replace or modify your existing table. Whenever you restore a backup, DynamoDB automatically creates a new table with the restored data.
For example, if you restore UsersTable to its state at 12:00 PM, DynamoDB creates another table such as UsersTable-Restored containing the recovered data.
DynamoDB Backup Options Comparison
| Feature | Point-in-Time Recovery (PITR) | On-Demand (Native) | AWS Backup (Managed) | 
|---|---|---|---|
| Purpose | Accidental deletion protection. | Long-term archival. | Enterprise compliance & DR. | 
| Schedule | Continuous (Automatic). | Manual triggering. | Automated Schedules (Cron). | 
| Retention | Max 35 Days. | Indefinite. | Configurable (e.g., 7 years). | 
| Restore To | Any second in the window. | The exact time of backup. | The exact time of backup. | 
| Cross-Region | Yes (Restore to new region). | Yes (Copy then restore). | Yes (Automated copy). | 
| Cold Storage | No. | No. | Yes (Cheaper storage tier). | 
Features
- Supports Point-in-Time Recovery (PITR)
- Supports On-Demand backups
- Automatically encrypts backup data
- Allows restoration to new DynamoDB tables
- Integrates with AWS Backup
Advantages
- Data Protection: Helps recover data from accidental deletion, corruption, or application failures.
- Easy Management: Users can create, restore, and manage backups with minimal administrative effort.
- High Scalability: Supports backup and restore operations for DynamoDB tables of any size.
- Business Continuity: Ensures applications can recover quickly during unexpected failures.
Backing Up a DynamoDB Table
Step 1
- Log in to the AWS Management Console.
- Open the DynamoDB service.
Step 2
- Select the required table from the Tables section.
Step 3
- Open the Backups tab.
- Click Create backup.
- Select Source table
- Click Create backup to start the backup process.
Step 4
- Monitor the backup status.
- Once completed, the status changes to Running
Restoring a DynamoDB Table from a Backup
Step 1
- Open the DynamoDB console.
- Select Backups from the left navigation panel.
Step 2
- Choose the required backup from the list.
- Click the Restore button.
Step 3
- Enter the new table name.
- Configure additional settings if required.
- Click Restore table to begin the restoration process.
Step 4
- Wait for the restore status to become Available.
Deleting a DynamoDB Table Backup
Step 1
- Open the DynamoDB console.
- Navigate to the Backups section.
Step 2
- Select the backup you want to delete.
- Click the Delete button.
- Click Continue to AWS Backup to open the backup vault.
- In the AWS Backup console, select the recovery point you want to delete
- Click the Delete button from the top-right corner.
- Type delete in the confirmation field.
- Click Delete recovery point to permanently remove the backup.
Using IAM with DynamoDB Backup and Restore
AWS Identity and Access Management (IAM) allows administrators to control access to DynamoDB backup and restore operations securely using IAM policies.
IAM permissions can be used to:
- Create DynamoDB backups
- Restore tables from backups
- Manage and access table data
- Control user access to backup resources
Example: Allow CreateBackup and RestoreTableFromBackup Permissions
{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Action": [
"dynamodb:CreateBackup",
"dynamodb:RestoreTableFromBackup",
"dynamodb:PutItem",
"dynamodb:UpdateItem",
"dynamodb:DeleteItem",
"dynamodb:GetItem",
"dynamodb:Query",
"dynamodb:Scan",
"dynamodb:BatchWriteItem"
],
"Resource": "arn:aws:dynamodb:us-east-1:123456789012:table/WebSeries"
}
]
}
Pricing Models
- PITR: Charged based on the size of the table per month (approx. $0.20 per GB-month).
- On-Demand Storage: Charged for the total size of all backups (approx. $0.10 per GB-month).
- Restore Costs: You are charged by the GB for the amount of data restored.
Cost Tip: If you use AWS Backup, you can move older backups to "Cold Storage" tiers to save significantly on costs for data you rarely access.
Best Practices
- Always Enable PITR: For production tables, the cost is negligible compared to the safety of being able to rewind to any second.
- Use AWS Backup for Compliance: Don't write custom scripts to trigger On-Demand backups. Use AWS Backup policies to handle schedules and retention (e.g., "Daily backup, keep for 30 days").
- Test Restores: Regularly test restoring a table to ensure your IAM permissions and recovery time objectives (RTO) are met.
