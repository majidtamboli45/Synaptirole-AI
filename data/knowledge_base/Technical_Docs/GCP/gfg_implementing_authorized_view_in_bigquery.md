# Implementing Authorized View in BigQuery

> Source: https://www.geeksforgeeks.org/devops/google-cloud-platform-implementing-authorized-view-in-bigquery/

In this article, we will look into how you can implement an Authorized view in BigQuery.You can follow along in your own BigQuery sandbox, which you can set up for free. For this, we're using two sandboxes in order to represent the perspectives of the data admin.
As a data admin follow the below steps to implement Authorized views:
Step 1: You'll need a dataset to store your full source data containing the sensitive address field. From the BigQuery Console, select your project and click CREATE DATASET. Give your dataset a name and click the Create dataset button.
Now you'll populate a table within the dataset using a SQL query. Click COMPOSE NEW QUERY and copy and paste the Source Data Query given below into the Query Editor.
Before running the query, go into Query Settings and check the box for Set a destination table for query results. Verify your project and dataset name are selected, then name your table service_requests. Click Save.
Now click Run. When the query completes, you can select your new table in the left-hand nav and click Preview to see that the data was populated.
Step 2: Now it is time to create a separate dataset where you'll put the view for your analyst. You'll follow the same steps we just performed. Select your project and click CREATE DATASET. Name your dataset shared_views and click Create dataset.
Step 3: Now you'll create the view for your analysts. Click COMPOSE NEW QUERY and copy and paste the View Query given below into the Query Editor. This query selects all the columns from the source data, except for the sensitive address field. Now click save view. Make sure your project and dataset are selected and give the view a name. Click SAVE.
You can see that the view is now populated in the left-hand nav. We have our source table and our analyst view set up. Time to start assigning access controls for our analyst.
Step 4: Give the analyst permission to query in the project by assigning the BigQuery user role. From the navigation menu, head to IAM & Admin and click IAM. Click ADD.
In the members field, enter the analyst's email address that contains your analysts. In the roles field, click Select a role and choose BigQuery User. Click Save.
Head back to BigQuery by using the search bar in the console.
Step 5: Next, you'll give the analyst permission to read the dataset that contains the view. Select the shared_views dataset and then click SHARE DATASET.
Click Add members. Again, enter the email or group for your analysts. Select the role BigQuery Data Viewer, then click Add, and finally, click Done.
Step 6: You need to give the view itself access to the source dataset. This is what is meant by an authorized view. From the source dataset, click SHARE DATASET.
And then this time, head to the AUTHORIZED VIEWS section. Change the dataset to shared_views and select your view for the table. Click Add and then click Done.
Your authorized view configuration is now complete.
