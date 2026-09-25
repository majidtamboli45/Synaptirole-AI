# Managing Access using IAM in BigQuery

> Source: https://www.geeksforgeeks.org/devops/google-cloud-platform-manging-access-using-iam-in-bigquery/

While big data brings us valuable insights and opportunities, it also brings the responsibility to ensure that data is secure, meaning that only the right data is shared with the right people. In this article, we're talking about how to use Google Cloud's Identity and Access Management Service to define which users can query in your projects and access your data sets.
BigQuery's a fully managed service. That means it takes advantage of Google's infrastructure security. Google secures its infrastructure end to end, from the physical security of its services to stringent operational practices.
But this article is about the role you play in keeping your projects and data secure. Specifically, how you share project and data set access with different end-users and groups in your company. The key to managing access to your projects and data is the Identity and Access Management Service or IAM.
Cloud IAM allows you to manage access control by defining three things:
- Member
- Role
- Policy
Meaning you specify who has what access to which resource. Let's take a closer look at each of these.
Member:
First, the member, or who has access. You can define a member in several ways. One way is to identify end-users by their email address if it's associated with a Google account. You can also set access for a group of users by using a Google Group, G Suite domain, or Cloud Identity domain as the member. Sometimes it's not a person, but an application or service that needs access to your BigQuery data. In this case, you can create a service account, which is a special type of Google account intended to represent a non-human user. When you create a service account, it is assigned a special address which can be used as the member's identity when defining access. When you give a data set access to any logged user, there is a special identifier called, all authenticated users, which you can use as the member in this case. This is exactly how we make our BigQuery public data sets available to all BigQuery users.
Role:
Once you have defined the member, you need to decide what role to give that member. A role includes a set of permissions that determines which operations the member is allowed to perform. Cloud IAM provides several predefined roles that include a combination of these permissions.
| Role | Description | 
|---|---|
| BigQuery Admin | Manage all resources and data within the project | 
| BigQuery Data Owner | Access to edit and share datasets and tables | 
| BigQuery Data Editor | Access to edit datasets and all its tables | 
| BigQuery Data Viewer | Access to view datasets and all its tables | 
| BigQuery Job User | Access to run jobs, including queries | 
| BigQuery User | Access to run queries and create datasets | 
| BigQuery Metadata Viewer | Access to view table and dataset metadata | 
They include things like the ability to view or edit data sets, and the ability to run queries and store data that are billed to the project. It is also possible to create custom roles. These allow you to bundle one or more permissions into a role to meet your specific needs. You will have to manage your custom role as new features, permissions, and services are added to Google Cloud. So for this reason, it is recommended to stick with predefined roles. You can always assign more than one predefined role to a member.
Policy:
Together, the member and the role make up the policy, which is then applied to a specific resource. The policy could be attached to a specific table, data set, or the GCP project itself. At the project level, permissions apply to all current and future data sets that are part of the project.
Let's see how it works in a specific scenario. Suppose you're a retail company with two groups of data analysts. The first group analyzes your retail sales, and the second analyzes customer service requests. These two types of data are stored in separate data sets within your project. Both groups of analysts need full access, read and write, to the data set that they work on and access to run queries on the project.
Let's head to the console and set up the policies. You'll start by giving the sales analysts the BigQuery data editor role for the retail sales data set. To set roles at the data set level, select the data set from resources, then click share data set near the right-hand side of the window. On the data set permissions tab, enter the entity you want to add into the Add Members text box. To select a role, select BigQuery data editor and click Add. Then click done.
Then follow the same steps to give the customer service analysts the BigQuery data editor role for the customer service data set. You'll notice we're using Google groups to grant roles. Google groups are a convenient way to create a policy for the collection of users. You can grant and change access for a whole group at once, instead of individual users one at a time.
Then you can easily add or remove members directly from the Google Group itself. Giving the analyst the data editor role at the data set level gives them the ability to access all the tables within that particular data set, but it does not give them the permission to actually run queries billed to that project. For that, they must be granted the project level role called, BigQuery user. To grant roles at the project level, you'll need to head to the navigation window. Hover over IAM in admin and then click to select IAM.
At the top of the screen, click add. In the new members box, enter both email addresses to represent your analyst groups.
Select the BigQuery user role and click Save.
Now your two teams are ready and equipped to analyze their data securely.
