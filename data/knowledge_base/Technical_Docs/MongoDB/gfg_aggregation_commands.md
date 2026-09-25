# Aggregation Commands

> Source: https://www.geeksforgeeks.org/mongodb/aggregation-commands/

MongoDB aggregation commands process and transform data through pipeline stages to perform filtering, grouping, and calculations for analytics and reporting.
- Process data through multiple pipeline stages (e.g., $match, $group, $project, $sort).
- Support advanced computations like totals, averages, counts, and custom expressions.
- Enable server-side filtering and transformation to reduce application-side processing.
- Allow combining data across collections using $lookup (join-like behavior).
Aggregation Methods
Aggregation methods in MongoDB provide different ways to perform data analysis and transformations, ranging from the powerful aggregation pipeline to simple single-purpose aggregation functions.
Types of Aggregation Methods
1. Aggregation Pipeline: Processes documents through a sequence of stages to filter, group, transform, and compute results.
Method:
- db.collection.aggregate()
2. Map-Reduce (Legacy): Performs aggregation using JavaScript map and reduce functions (deprecated in modern MongoDB).
Method:
- db.collection.mapReduce()
3. Single-Purpose Aggregation Methods: Provide simple aggregation operations like counting documents or retrieving distinct values without using a pipeline.
Methods:
- db.collection.distinct()
- db.collection.countDocuments()
- db.collection.estimatedDocumentCount()
Some Examples of Aggregation Pipeline Stages
To understand common Aggregation Pipeline Stages, we’ll use queries on a products collection containing fields like name, price, category, and quantity.
[
{
"name": "Product A",
"price": 150,
"category": "Category 1"
},
{
"name": "Product B",
"price": 200,
"category": "Category 2"
},
{
"name": "Product C",
"price": 120,
"category": "Category 1"
},
{
"name": "Product D",
"price": 180,
"category": "Category 2"
}
]
1. $match
The $match stage filters documents based on specified criteria, similar to the find() method. It allows users to select only those documents that match the given conditions.
Example: To retrieve products with a price greater than $100, we can use the $match command.
db.products.aggregate([
{ $match: { price: { $gt: 100 } } }
])
Output:
[
{
"_id": "Category 1",
"total_products": 2
},
{
"_id": "Category 2",
"total_products": 2
}
]
2. $group
The $group stage groups documents together based on a specified key and applies aggregate functions to the grouped data, such as sum, count or average.
Example: Group products by their category and calculate the total number of products in each category.
db.products.aggregate([
{ $group: { _id: "$category", total_products: { $sum: 1 } } }
])
Output:
[
{ "_id": "Category 1", "total_products": 2 },
{ "_id": "Category 2", "total_products": 2 }
]
3. $project
The $project stage reshapes documents by including, excluding, or renaming fields. It allows users to define the structure of the output documents.
Example: Retrieve only the name and price fields of products from the products collection.
db.products.aggregate([
{ $project: { _id: 0, name: 1, price: 1 } }
])
Output:
[
{ "name": "Product A", "price": 150 },
{ "name": "Product B", "price": 200 },
{ "name": "Product C", "price": 120 },
{ "name": "Product D", "price": 180 }
]
4. $sort
The $sort stage sorts documents based on specified fields in ascending or descending order.
Example: To retrieve products from the products collection sorted by price in descending order, we can use the $sort command.
db.products.aggregate([
{ $sort: { price: -1 } }
])
Output:
[
{
"name": "Product B",
"price": 200,
"category": "Category 2"
},
{
"name": "Product D",
"price": 180,
"category": "Category 2"
},
{
"name": "Product A",
"price": 150,
"category": "Category 1"
},
{
"name": "Product C",
"price": 120,
"category": "Category 1"
}
]
5. $limit
The $limit stage restricts the number of documents returned by an aggregation operation.
Example: To retrieve only the top 5 highest-priced products from the products collection, we can use the $limit command.
db.products.aggregate([
{ $sort: { price: -1 } },
{ $limit: 5 }
])
Output:
[
{ "name": "Product B", "price": 200, "category": "Category 2" },
{ "name": "Product D", "price": 180, "category": "Category 2" },
{ "name": "Product A", "price": 150, "category": "Category 1" }
]
6. Combining Aggregation stages
One of the strengths of MongoDB's aggregation framework is the ability to chain multiple commands together to perform complex operations.
Example: Find the average price of products in each category from the products collection. We can achieve this by combining the $group and $project commands.
db.products.aggregate([
{ $group: { _id: "$category", avg_price: { $avg: "$price" } } },
{ $project: { _id: 0, category: "$_id", avg_price: 1 } }
])
Output:
[
{
"category": "Category 1",
"avg_price": 135
},
{
"category": "Category 2",
"avg_price": 190
}
]
This aggregation pipeline first groups products by category, calculates the average price for each category, and then projects the category and average price fields in the output.
Aggregation Accumulators Operators
Aggregation accumulator operators compute values across grouped documents and are used within the $group stage of the aggregation pipeline.
| Accumulator | Description | 
|---|---|
| $sum | Calculates the sum of numeric values. | 
| $avg | Computes the average of numeric values. | 
| $min | Finds the minimum value in a set of values. | 
| $max | Finds the maximum value in a set of values. | 
| $addToSet | Adds unique values to an array. | 
| $push | Adds values to an array, including duplicates. | 
| $first | Returns the first document in a group. | 
| $last | Returns the last document in a group. |
