# $size Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-size-operator/

The $size operator in MongoDB returns the count of elements in an array field and is widely used in aggregation pipelines to filter documents and compute derived values based on array length.
- Returns the total number of elements in an array; errors if the input is not an array (unless handled, e.g., with $isArray).
- Works inside $project and $addFields; in $match it can only be used via $expr.
- Combine with $isArray to avoid errors on non-array fields.
- Helps filter documents based on array length (e.g., non-empty arrays).
Syntax
{ $size: <expression> }
- <expression> must evaluate to an array field or array expression.
- Returns the number of elements in the array.
Examples of MongoDB $size Operator
In following examples, we are working with:
- Database: GeeksforGeeks
- Collection: arrayExample
- Document: Three documents that contain the details in the form of field-value pairs.
Example 1: Counting Array Elements Using $size
Count the number of elements in the numbers1 array for a document where the name is "Lorenzo" using a $size operator.
db.arrayExample.aggregate([
{ $match: { name: "Lorenzo" } },
{ $project: { number1Size: { $size: "$numbers1" } } }
])
Output:
- Match the document where name is "Lorenzo".
- Uses $size to return the count of elements in the numbers1 array (7 elements).
Example 2: Using $size Operator in the Embedded Document
Find the size of the indoorGames array inside the favGame embedded document for a document where name is "Pika"
db.arrayExample.aggregate([
{ $match: { name: "Pika" } },
{ $project: { resultSize: { $size: "$favGame.indoorGames" } } }
])
Output:
- $size calculates the number of elements in favGame.indoorGames.
- The result is 2, since the array contains two elements (["Ludo", "Chess"]).
Example 3: Filtering Documents Based on Array Size
This example shows how to filter documents where the size of the numbers1 array is greater than 2.
db.arrayExample.aggregate([
{
$match: {
$expr: {
$and: [
{ $isArray: "$numbers1" },
{ $gt: [{ $size: "$numbers1" }, 2] }
]
}
}
}
])
Output:
- Returns only documents where numbers1 exists and is an array with more than 2 elements.
- Matches Lorenzo, since numbers1 contains 7 values.
Use Cases for the MongoDB $size Operator
Here are some use cases:
- Count the number of elements in an array field within a document.
- Filter documents by comparing array size with a specific value (e.g., >, <, =).
- Add derived fields representing array length for further analysis and transformations.
- Use within aggregation stages like $project, $match (via $expr), and $addFields.
- Handle flexible schemas (use $isArray to avoid errors on non-array or missing fields).
- Enable efficient analysis and manipulation of array data in documents.
