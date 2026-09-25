# Google Cloud Platform

> Source: https://www.geeksforgeeks.org/devops/google-cloud-platform-tables-in-bigquery/

Tables in BigQuery or any database for that matter is used to store data in a structured manner. In this article, we will explore the concepts of the three types of table available in BigQuery:
- Temporary Tables
- Permanent Tables
- Views (Virtual Tables)
Temporary Tables:
Just as BigQuery automatically saves your query history, it also by default caches the results of your successfully run queries in temporary tables. These tables expire after 24 hours. And within this time, you can browse the results through your query history.
Just select the query and scroll to find a link to the temporary table.
Here you can preview the data and also export the full table to cloud storage. If you rerun the query, BigQuery will use the cached results if it can, meaning if you are still within the 24-hour period and the underlying data has not had any changes. By using cached results, you won't incur any query costs.
Permanent Tables:
Temporary tables are available only to the specific user that runs the query. So if you're looking to share the query results, you should consider saving them to a permanent table. You can make the switch from saving in a temporary table to a permanent table by opening the query settings and setting a destination table for the results.
Click Run. And after the query is complete, you will see the new table in the left-hand navigation bar. You can then use IAM to share the destination data set or table with your collaborators. It's important to note, permanent tables will incur storage costs, while temporary tables do not. Another method for sharing results is to use the option to save them immediately after running your query. Click the Save Results button and choose between several options for saving results like locally, in Google Drive, or directly to a Google Sheet.
Views(Virtual Tables):
We've now reviewed how to save and share query text and query results. But there is one more tool to cover, which is called views. A view is a virtual table defined by a query. A view can be queried just like you query a table. Views are listed next to tables in a data set, denoted with a different icon.
When running a query that references a view, BigQuery will also run the query that defines that view. views can help hide the complexity of data by allowing you to join multiple tables into a single virtual table ready to query. Views can be a good alternative to sharing query text, because then you can take advantage of the finer grain controls available in Cloud IAM to share the view and the underlying tables. Views do not require storage. Since they're virtual tables, there's not a storage cost associated with them.
To create a view, write the query that defines the view in the Query Editor and then click Save View. Choose the project and data set where you'd like the view to live, and then give the view a name. Click Save.
The view will populate under the destination data set and can be queried just like you query a table.
