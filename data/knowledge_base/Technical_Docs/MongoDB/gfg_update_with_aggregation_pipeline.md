# Update with Aggregation Pipeline

> Source: https://www.geeksforgeeks.org/mongodb/update-with-aggregation-pipeline/

The aggregation pipeline is a framework for processing data through a sequence of stages. Each stage performs a specific operation on the documents in the database.
- Stages apply operations like filtering, grouping, sorting, and transforming.
- Output of one stage becomes input for the next stage.
- Enables complex data processing inside MongoDB.
Using Aggregation Pipeline in Updates
MongoDB introduced update operations using aggregation pipelines (since version 4.2), allowing advanced transformations during updates
- Supports in-place transformations of documents during update operations using pipeline stages.
- Uses a limited subset of aggregation pipeline stages (such as $set, $addFields, $project, $unset, $replaceRoot) in update operations; stages like $group, $sort, and $lookup are not supported.
- Improves flexibility and efficiency of updates
- Reduces application-side processing logic
Syntax:
The basic syntax for using aggregation pipeline in update operations is as follows:
db.collection.updateMany(
<filter>,
[
{
$set: {
<field>: <expression>
}
},
// Additional pipeline stages
]
)
- <filter>: Specifies the selection criteria for documents to update.
- $set: Indicates the update operation to perform.
- <field>: Specifies the field to update.
- <expression>: Represents the aggregation expression to compute the new value for the field.
Example of Update with Aggregation Pipeline
To understand Update with Aggregation Pipeline here is a collection and some documents on which we will perform various operations and queries.
[
{
"name": "John Doe",
"salary": 60000,
"department": "Engineering",
"status": "Senior"
},
{
"name": "Jane Smith",
"salary": 45000,
"department": "HR",
"status": "Junior"
},
{
"name": "Alice Johnson",
"salary": 75000,
"department": "Finance",
"status": "Senior"
},
...
]
Example: Update the salary field for all employees by adding a 10% bonus. We can achieve this using the aggregation pipeline in the update operation
db.employees.updateMany(
{},
[
{
$set: {
salary: { $multiply: ["$salary", 1.1] }
}
}
]
)
Output:
[
{
"name": "John Doe",
"salary": 66000,
"department": "Engineering",
"status": "Senior"
},
{
"name": "Jane Smith",
"salary": 49500,
"department": "HR",
"status": "Junior"
},
{
"name": "Alice Johnson",
"salary": 82500,
"department": "Finance",
"status": "Senior"
}
]
- {} matches all documents in the employees collection.
- $set updates the salary field.
- $multiply computes the new salary with a 10% bonus.
Using Aggregation Operators in Updates
MongoDB provides a wide range of aggregation operators that can be used within the aggregation pipeline for update operations. These operators enable users to perform various transformations and computations on the data before updating documents.
Example Using $cond Operator
If the salary is greater than $50,000, set the status to "Senior", otherwise, set it to "Junior". We can achieve this using the $cond operator within the update pipeline.
db.employees.updateMany(
{},
[
{
$set: {
status: {
$cond: {
if: { $gte: ["$salary", 50000] },
then: "Senior",
else: "Junior"
}
}
}
}
]
)
Output:
[
{
"name": "John Doe",
"salary": 60000,
"department": "Engineering",
"status": "Senior"
},
{
"name": "Jane Smith",
"salary": 45000,
"department": "HR",
"status": "Junior"
},
{
"name": "Alice Johnson",
"salary": 75000,
"department": "Finance",
"status": "Senior"
}
...
]
The $cond operator evaluates the condition $gte (greater than or equal) to determine the value of the status field based on the salary.
Combining Multiple Stages
One of the key advantages of using the aggregation pipeline for updates is the ability to combine multiple stages to perform complex transformations in a single operation.
Example of Updating Multiple Fields
Update both the salary and department fields for all employees simultaneously. We can achieve this by adding multiple $set stages to the update pipeline
db.employees.updateMany(
{},
[
{
$set: {
salary: { $multiply: ["$salary", 1.1] }
}
},
{
$set: {
department: "Engineering"
}
}
]
)
Output:
[
{
"name": "John Doe",
"salary": 66000,
"department": "Engineering",
"status": "Senior"
},
{
"name": "Jane Smith",
"salary": 49500,
"department": "Engineering",
"status": "Junior"
},
{
"name": "Alice Johnson",
"salary": 82500,
"department": "Engineering",
"status": "Senior"
},
...
]
Two $set stages are used to update the salary and department fields independently.
