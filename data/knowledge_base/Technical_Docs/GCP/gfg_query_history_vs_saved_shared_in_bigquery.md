# Query History vs Saved Query vs Shared Query in BigQuery

> Source: https://www.geeksforgeeks.org/devops/google-cloud-platform-query-history-vs-saved-query-vs-shared-query-in-bigquery/

The process of writing and running SQL queries doesn't always follow a straight line. A particular query can be in constant iteration while you use it to explore and clean up your data, or as you fine-tune it to optimize its performance. In this article, we will highlight the ways to save and share queries in BigQuery.
So you ran a query last Friday for your colleague and sent them the results. It's Monday now and there's another request for additional data fields on the same query. The new request requires you to join data from another table. A join which you actually did in a separate query a few weeks ago. But you can't quite remember how you did it.
BigQuery has features built-in that allow you to view your query history, proactively save specific queries, and share queries with others. Let's take a look at each of these features a bit further.
Query History:
Your first line of defense for revisiting past queries in BigQuery is your query history. This feature is automatic and includes the text of all queries you have run. You can view your query history in the console by selecting Query History in the top left-hand navigation bar.
Click on a specific query and you'll see the text of the query and be able to open it in the editor so you can modify and rerun it. Just note, this history is limited to 1,000 queries and looks back up to six months.
Saved Queries:
Going a step further, you can decide to proactively name and save a specific query. Just enter the query in the editor. Then click Save Query, located just to the right of the Run button. Give the query a name and then click Save.
You can find a list of your saved queries in the left-hand nav. Similar to the functionality in your query history, you can now click to open the query in the editor, modify it, and run it.
Shared Queries:
If you want to share one of your queries with a colleague, you can create shared queries. You can create a shared query by first saving a query, turning on link sharing, and then sharing the unique URL.
A shared query provides the query text only, so users that open your shared query will still need to have appropriate access to the tables referenced in the query to be able to run it.
Other users will be restricted from editing your personal saved queries. If you're looking to make saved queries editable by your team members, you'll need to change the saved query visibility to Project and then grant your team members the permissions to get, list, and update saved queries on your project.
