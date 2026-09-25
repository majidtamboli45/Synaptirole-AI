# MongoDB $cmp Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-cmp-operator/

The MongoDB $cmp operator compares two values and returns their order. It is used in aggregation pipelines for sorting and conditional logic, and follows BSON type ordering for different data types.
- Compares two expressions and returns their relative order.
- Outputs 0, 1, or -1 based on the comparison result.
- Useful for building comparison-based expressions within aggregation pipelines.
- Helps implement conditional logic in pipelines.
- Works across different data types using BSON ordering.
Syntax
{ $cmp: [ <expression1>, <expression2> ] }
- <expression1>: The first value or field to compare.
- <expression2>: The second value or field to compare.
Features of the MongoDB $cmp Operator
Here are some features discussed:
- Returns -1 if the first value is smaller, 1 if greater, and 0 if equal.
- Supports comparisons on nested (embedded) fields.
- Considers both value and data type during comparison.
- Follows BSON type ordering when comparing different data types.
- Used within aggregation pipeline stages like $project, $sort, and conditional expressions.
MongoDB $cmp Operator Examples
Examples of the $cmp operator in MongoDB. In the following examples, we are working with:
- Database: GeeksforGeeks
- Collection: example
- Document: Two documents that contain the details of the shapes in the form of field-value pairs.
Example 1: Using $cmp to Compare a Field with a Static Value
The $cmp operator compares the value of the side field with 4 and returns 0, which indicates that both values are equal.
Query:
db.example.aggregate([{$match: {name: "Square"}}, {$project: {result: {$cmp:["$side", 4]}}}])
Output:
Example 2: Using $cmp Operator in the embedded Document
Comparing the value of the measurement.height field with the value of the measurement.width field and $cmp operator return -1 which means both values of measurement.height field is less than the value of the measurement.width field.
Query:
db.example.aggregate([{$match: {name: "Rectangle"}}, {$project: {result: {$cmp:["$measurement.height", "$measurement.width"]}}}])
Output:
