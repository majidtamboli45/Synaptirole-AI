# MongoDB Aggregation $lookup

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-aggregation-lookup/

The $lookup stage in MongoDB performs a left outer join between collections, enabling relational-like queries within the aggregation framework to combine related data from multiple collections.
- Joins documents from a source collection with a foreign collection.
- Matches records based on specified local and foreign fields.
- Returns matched documents as an array field in the result.
- Preserves source documents even when no match is found (empty array).
Usage of $lookup
Here are some usage discussed below:
- Combine data across multiple collections without creating redundant data.
- Eliminate the need for multiple queries by fetching related data in a single operation.
- Perform SQL-like joins while leveraging MongoDB's flexible document structure.
- Efficient reporting & analytics by aggregating data from different collections
Syntax
{
$lookup: {
from: <foreignCollection>,
localField: <fieldInInputDocument>,
foreignField: <fieldInForeignDocument>,
as: <outputArrayField>
}
}
- from: The name of the foreign collection to join with.
- localField: The field from the input documents that will be used for matching.
- foreignField: The field from the foreign collection that will be used for matching.
- as: The name of the output array field that will contain the joined documents.
Examples of MongoDB Aggregation $lookup
We need a collection and some documents on which we will perform various operations and queries. Here we will consider a collection called orders and customers which contains various information shown as below:
Collection: orders
[
{
"_id": ObjectId("60f9d7ac345b7c9df348a86e"),
"order_number": "ORD001",
"customer_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"customer_details": [
{
"_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"name": "John Doe",
"email": "john@example.com"
}
]
},
// Other order documents...
]
Collection: customers
[
{
"_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"name": "John Doe",
"email": "john@example.com"
},
// Other customer documents...
]
Example 1: Perform a Single Equality Join with $lookup
Retrieve orders from the orders collection along with corresponding customer details from the customers collection based on matching customer_id and _id.
db.orders.aggregate([
{
$lookup: {
from: "customers",
localField: "customer_id",
foreignField: "_id",
as: "customer_details"
}
}
])
Output:
[
{
"_id": ObjectId("60f9d7ac345b7c9df348a86e"),
"order_number": "ORD001",
"customer_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"customer_details": [
{
"_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"name": "John Doe",
"email": "john@example.com"
}
]
},
// Other order documents with appended customer details...
]
- Uses $lookup to perform a left outer join between orders and customers.
- Matches customer_id (orders) with _id (customers).
- Appends matched records to the customer_details array.
- Returns an empty customer_details array when no match is found.
Example 2: Use $lookup with Pipeline and $expr
By default, $lookup always adds the output array field, and if no match is found, it returns an empty array for that document.
db.orders.aggregate([
{
$lookup: {
from: "customers",
let: { customerId: "$customer_id" },
pipeline: [
{
$match: {
$expr: { $eq: ["$_id", "$$customerId"] }
}
}
],
as: "customer_details"
}
}
])
Output:
[
{
"_id": ObjectId("60f9d7ac345b7c9df348a86e"),
"order_number": "ORD001",
"customer_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"customer_details": [
{
"_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"name": "John Doe",
"email": "john@example.com"
}
]
},
// Other order documents...
]
- $lookup is used with an array and a pipeline ($match and $expr) to join orders with customers.
- It matches customer_id from orders with _id in customers, appending customer details into customer_details.
Example 3: Use $lookup with $mergeObjects
Multiple $lookup stages can be used in a single pipeline to join data from different collections, such as enriching orders with customer and product details.
db.orders.aggregate([
{
$lookup: {
from: "customers",
localField: "customer_id",
foreignField: "_id",
as: "customer_info"
}
},
{
$addFields: {
customer_details: {
$mergeObjects: { $arrayElemAt: ["$customer_info", 0] }
}
}
}
])
Output:
[
{
"_id": ObjectId("60f9d7ac345b7c9df348a86e"),
"order_number": "ORD001",
"customer_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"customer_info": [
{
"_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"name": "John Doe",
"email": "john@example.com"
}
],
"customer_details": {
"_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"name": "John Doe",
"email": "john@example.com"
}
},
// Other order documents...
]
- $lookup is followed by $mergeObjects to combine fields from customers with fields in orders.
- It merges matched customer details into a single customer_details object within each order document.
Example 4: Perform Multiple Joins and a Correlated Subquery with $lookup
$lookup lets you join data from multiple collections in one aggregation pipeline, improving query efficiency and performance.
db.orders.aggregate([
{
$lookup: {
from: "customers",
let: { customerId: "$customer_id" },
pipeline: [
{
$match: {
$expr: { $eq: ["$_id", "$$customerId"] }
}
},
{
$lookup: {
from: "products",
localField: "_id",
foreignField: "customer_id",
as: "products_ordered"
}
}
],
as: "customer_details"
}
}
])
Output:
[
{
"_id": ObjectId("60f9d7ac345b7c9df348a86e"),
"order_number": "ORD001",
"customer_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"customer_details": [
{
"_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"name": "John Doe",
"email": "john@example.com",
"products_ordered": [
{
"_id": ObjectId("60f9d7ac345b7c9df348a870"),
"customer_id": ObjectId("60f9d7ac345b7c9df348a86d"),
"product_name": "Product A"
}
]
}
]
},
// Other order documents...
]
- Uses multiple $lookup stages in one pipeline.
- Joins orders with customers, then customers with products.
- Adds nested product details to each order.
