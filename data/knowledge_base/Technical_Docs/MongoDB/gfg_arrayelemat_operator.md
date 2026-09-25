# $arrayElemAt Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-arrayelemat-operator/

The $arrayElemAt operator retrieves a specific element from an array by index and is commonly used in aggregation pipelines to extract targeted values efficiently.
- Returns an element at a specified position in an array.
- Useful for accessing first, last, or any indexed value.
- Works within aggregation stages for data transformation.
- Useful for directly accessing specific elements in an array without needing additional processing logic.
Syntax
{ $arrayElemAt: [ <array>, <index> ] }
- <array>: An array or an expression that resolves to an array.
- <index>: The index of the element to retrieve. It can be a positive or negative integer.
Features of $arrayElemAt Operator
Here are some features:
- Positive Index: Retrieves the element starting from the beginning of the array (0-based index).
- Negative Index: Retrieves elements counting backward from the end of the array.
- Out-of-Bounds Index: Returns null if the index is outside the array range.
Examples of MongoDB $arrayElemAt
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: arrayExample
Document: Three documents that contain the details in the form of field-value pairs.
Example 1: Retrieving First and Last Items
Find the elements of the array(i.e., the value of fruits field) on the specified index using $arrayElemAt operator.
db.arrayExample.aggregate([
{ $match: { name: "Bruno" } },
{
$project: {
firstItem: { $arrayElemAt: ["$fruits", 0] },
lastItem: { $arrayElemAt: ["$fruits", -1] }
}
}
])
Output:
- The $arrayElemAt operator extracts the first and last elements of the fruits array.
- The element at index 0 is "Mango", and the element at index -1 (last) is "Apple".
Example 2: Using $arrayElemAt Operator in the Embedded Document
Find the elements from the outdoorGames array, which is inside the embedded document favGame, for a document with name: "Pika" using $arrayElemAt operator.
db.arrayExample.aggregate([
{ $match: { name: "Pika" } },
{
$project: {
firstItem: { $arrayElemAt: ["$favGame.outdoorGames", 0] },
item: { $arrayElemAt: ["$favGame.outdoorGames", 2] }
}
}
])
Output:
- Extracts specific elements from favGame.outdoorGames using $arrayElemAt.
- Returns "Cricket" (index 0) and "Hockey" (index 2).
Best Practices for Using MongoDB $arrayElemAt
When working with the $arrayElemAt operator, it's important to follow best practices to ensure efficiency and correctness:
- Ensure Valid Index Values: Verify indices before access; out-of-range indices return null (use $size to compute bounds).
- Use Within Aggregation Pipeline: Apply $arrayElemAt in stages like $project, $addFields, and $group for transformations.
- Combine with Other Operators: Pair with $ifNull, $cond, and $size to handle missing or empty arrays safely.
- Optimize Performance: Use judiciously in complex MongoDB queries to avoid overhead on large datasets.
Use Cases for MongoDB $arrayElemAt
Here are some use cases discussed:
- Retrieve the first or last element of an array using index 0 or -1.
- Access elements at specific positions within arrays in MongoDB queries.
- Extract elements from arrays inside embedded (nested) documents.
- Create derived fields in aggregation results using specific array elements.
- Avoid processing entire arrays when only one value is needed.
