# MongoDB Aggregation $group Stage

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-aggregation-group-command/

The $group Stage in MongoDB aggregation groups documents by a specified field and applies accumulator operators (like $sum, $avg, $max) to compute aggregated values for each group.
- Allows grouping by multiple fields for detailed analysis.
- Can be combined with other stages such as $match, $sort, and $project.
- Efficiently summarizes large datasets.
Syntax:
{
$group: {
_id: <expression>,
<field1>: { <accumulator1>: <expression1> },
<field2>: { <accumulator2>: <expression2> }
}
}
- $_id: The field used to group documents. It can be an existing field or a computed expression.
- <field1>, <field2>: Fields to include in the output.
- <accumulator1>, <accumulator>: Aggregate functions to apply to grouped data.
- <expression>, <expression>: Expressions to compute values for grouping or aggregation.
Examples of $group Stage in MongoDB
The $group stage aggregates and analyzes transaction data in MongoDB by summarizing values like counts and totals. To illustrate, consider a sales collection with fields such as product, category, and amount.
[
{
"product": "Product A",
"category": "Category 1",
"amount": 100
},
{
"product": "Product B",
"category": "Category 2",
"amount": 150
},
{
"product": "Product C",
"category": "Category 1",
"amount": 120
},
{
"product": "Product D",
"category": "Category 2",
"amount": 200
}
]
Example 1: Count the Number of Documents in a Collection
This query calculates the total number of documents present in the sales collection, providing a quick way to determine the dataset size.
db.sales.aggregate([
{
$group: {
_id: null,
count: { $sum: 1 }
}
}
])
Output:
[
{
"_id": null,
"count": 4
}
]
- _id: null - Groups all documents together without a specific field.
- $sum: 1 - Adds 1 for each document, effectively counting the total number of documents.
- The result shows that there are 4 documents in the sales collection
Example 2: Retrieve Distinct Values
This query retrieves unique category values from the sales collection, helping identify different product categories available in the dataset.
db.sales.aggregate([
{
$group: {
_id: "$category"
}
}
])
Output:
[
{ "_id": "Category 1" },
{ "_id": "Category 2" }
]
- _id: "$category" - Groups documents by the category field, effectively extracting distinct category values.
- The result lists the unique categories present in the sales collection, which are "Category 1" and "Category 2".
- This approach is useful for filtering unique values in large datasets efficiently.
Example 3: Group by Category and Calculate Total Amount
This query groups documents by category and calculates the total sales amount for each category in the sales collection
db.sales.aggregate([
{
$group: {
_id: "$category",
totalAmount: { $sum: "$amount" }
}
}
])
Output:
[
{ "_id": "Category 1", "totalAmount": 220 },
{ "_id": "Category 2", "totalAmount": 350 }
]
- _id: "$category" - Groups documents by the category field.
- $sum: "$amount"- Adds up the amount values for each category.
- The result shows that Category 1 has a total sales amount of 220, while Category 2 has 350.
- This query is useful for financial analysis, revenue tracking, and sales reporting
Example 4: Calculate Count, Sum, and Average
This query groups documents by category and calculates the total count of documents, sum of sales amount, and average sales amount per category in the sales collection.
db.sales.aggregate([
{
$group: {
_id: "$category",
count: { $sum: 1 },
totalAmount: { $sum: "$amount" },
averageAmount: { $avg: "$amount" }
}
}
])
Output:
[
{
"_id": "Category 1",
"count": 2,
"totalAmount": 220,
"averageAmount": 110
},
{
"_id": "Category 2",
"count": 2,
"totalAmount": 350,
"averageAmount": 175
}
]
- _id: "$category" - Groups documents by category.
- $sum: 1 - Counts the number of documents in each category.
- $sum: "$amount" - Computes the total sales amount per category.
- $avg: "$amount" - Calculates the average sales amount per category.
- Category 1 totals 220 (avg 110) across 2 transactions, while Category 2 totals 350 (avg 175) across 2 transactions.
Example 5: Group by null
This query calculates the total sum of the amount field across all documents in the sales collection, without grouping by any specific field.
db.sales.aggregate([
{
$group: {
_id: null,
totalAmount: { $sum: "$amount" }
}
}
])
Output:
[
{ "_id": null, "totalAmount": 570 }
]
- _id: null - Groups all documents together as a single group, meaning the entire collection is aggregated.
- $sum: "$amount" - Computes the total sum of the amount field across all documents.
- The output shows that the total sales amount in the collection is 570.
