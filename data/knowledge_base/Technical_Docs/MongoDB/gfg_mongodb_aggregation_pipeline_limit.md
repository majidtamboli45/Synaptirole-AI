# MongoDB Aggregation Pipeline $limit

> Source: https://www.geeksforgeeks.org/mongodb/aggregation-pipeline-limits/

The $limit stage in MongoDB controls how many documents move through the aggregation pipeline, helping reduce processing overhead and optimize query performance.
- Restricts the number of documents passed to the next stage.
- Reduces data processed, improving performance.
- Commonly used to limit final result sets (pagination/top-N).
- Can be placed at any point in the pipeline.
- Accepts a single numeric argument as the maximum limit.
Syntax:
{ $limit: <positive integer> }
- $limit: The keyword indicating the stage.
- <positive integer>: The maximum number of documents to output from the pipeline.
Common Aggregation Pipeline Stages Used with $limit
These stages are commonly combined with $limit to filter, transform, order, and paginate results efficiently within the aggregation pipeline.
- $match: Match filters documents based on conditions before limiting them.
- $group: Group documents by a specified key and performs aggregation operations.
- $project: Reshapes documents by including, excluding, or renaming fields.
- $sort: Sorts documents based on specified fields.
- $skip: Skips a number of documents before applying $limit (useful for pagination).
Example of using $limit in MongoDB
The $limit stage helps control the number of documents returned in an aggregation query, improving efficiency and reducing processing time. Below are practical examples demonstrating how to apply $limit in different scenarios. Let's consider a sample orders collection:
[
{ "_id": ObjectId("60f9d7ac345b7c9df348a86e"), "customer": "Alex", "total": 150 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a86f"), "customer": "Ben", "total": 200 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a870"), "customer": "Clevin", "total": 100 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a871"), "customer": "David", "total": 75 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a872"), "customer": "Eve", "total": 300 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a873"), "customer": "Frank", "total": 180 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a874"), "customer": "Grace", "total": 220 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a875"), "customer": "Harry", "total": 95 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a876"), "customer": "Ivy", "total": 210 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a877"), "customer": "Jack", "total": 125 }
]
Example 1: Retrieve the First 3 Orders
Suppose We want to retrieve only the first three orders from the collection. Here's how we can use the $limit stage to achieve this
db.orders.aggregate([
{ $limit: 3 }
])
Output:
[
{ "_id": ObjectId("60f9d7ac345b7c9df348a86e"), "customer": "Alex", "total": 150 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a86f"), "customer": "Ben", "total": 200 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a870"), "customer": "Clevin", "total": 100 }
]
- db.orders.aggregate([]) starts the aggregation pipeline.
- $limit passes only the first three documents to the next stage.
- Reduces processing time and network load by returning fewer documents.
Example 2: Retrieve the First 5 Orders
Retrieve only the first five orders from the collection. Here's how we can use the $limit stage to achieve this
db.orders.aggregate([
{ $limit: 5 }
])
Output:
[
{ "_id": ObjectId("60f9d7ac345b7c9df348a86e"), "customer": "Alex", "total": 150 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a86f"), "customer": "Ben", "total": 200 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a870"), "customer": "Clevin", "total": 100 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a871"), "customer": "David", "total": 75 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a872"), "customer": "Eve", "total": 300 }
]
- $limit returns the first N documents based on the current pipeline order; without a preceding $sort, the order is not guaranteed.
- Useful for fetching a small result set (e.g., top five recent records).
- Improves performance by reducing processed data.
Example 3: Implement Pagination using $limit and $skip
Pagination is a common use of $limit, enabling efficient page-wise data retrieval (e.g., fetching a specific set of customer orders per page).
const pageSize = 10;
// First page
const pageNumber = 1;
db.orders.aggregate([
{ $sort: { _id:1} }, // define order first
{ $skip: (pageNumber-1)*pageSize},
{ $limit: pageSize}
])
- Pagination requires a defined order using $sort; without it, results may be inconsistent across pages.
Output:
The output will contain the documents corresponding to the specified page of results.
[
{ "_id": ObjectId("60f9d7ac345b7c9df348a86e"), "customer": "Alex", "total": 150 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a86f"), "customer": "Ben", "total": 200 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a870"), "customer": "Clevin", "total": 100 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a871"), "customer": "David", "total": 75 },
{ "_id": ObjectId("60f9d7ac345b7c9df348a872"), "customer": "Eve", "total": 300 }
]
- Calculates documents to skip using page number and page size.
- Applies $skip to move to the correct page.
- Uses $limit to fetch only the required records.
Benefits of Using $limit in MongoDB
The $limit stage can be used in various scenarios, including:
- Enhances Performance: Reducing the amount of data processed in complex aggregation pipelines to improve query performance.
- Pagination Support: Limiting the number of results returned for paginated queries. It is Essential for building paginated APIs and web applications.
- Efficient Sampling: Retrieves only a subset of documents for analysis or testing.
- Reduces Network Load: Minimizes data transfer between MongoDB and the application.
Optimizing Techniques for $limit in Aggregation Pipelines
To work within the limits of the aggregation pipeline and ensure efficient query execution, developers can employ various optimization techniques:
1. Use Indexes for Faster Query Execution
Creating indexes on frequently queried fields improves the efficiency of $limit queries. Utilizing indexes also reduces the number of documents processed by the pipeline.
db.orders.createIndex({ orderDate: -1 });
db.orders.aggregate([
{ $match: { status: "completed" } },
{ $sort: { orderDate: -1 } },
{ $limit: 5 }
])
2. Projection Optimization
Limit the fields returned in output documents using the $project stage to minimize data transfer and processing overhead. By reducing the number of fields, you improve query performance and lower memory usage.
db.orders.aggregate([
{ $project: { customer: 1, total: 1 } },
{ $limit: 5 }
])
3. Apply $match Before $limit
Filtering early reduces the number of documents processed. Place $match stages early in the pipeline to filter out irrelevant documents and reduce computation costs.
db.orders.aggregate([
{ $match: { total: { $gt: 100 } } },
{ $limit: 3 }
])
4. Optimize $sort Before $limit
Sorting should be applied before limiting to reduce processing time. Apply $limit stages to restrict the number of documents processed by the pipeline and improve query efficiency.
db.orders.aggregate([
{ $sort: { total: -1 } },
{ $limit: 3 }
]);
5. Avoiding In-Memory Operations
Minimize in-memory operations within the pipeline to reduce memory usage and prevent out-of-memory errors. Use indexing, early filtering ($match), and projection ($project) to limit data processing and optimize query performance.
