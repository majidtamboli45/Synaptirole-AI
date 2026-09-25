# MongoDB $toLower Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-tolower-operator/

The $toLower operator converts string values to lowercase within MongoDB’s aggregation pipeline to lowercase within MongoDB’s aggregation pipeline, enabling consistent text normalization and case-insensitive comparisons for reliable search and formatting.
- Converts all alphabetic characters in a string to lowercase.
- Accepts any expression that resolves to a string.
- Returns an empty string ("") if the input resolves to null.
- Behavior depends on MongoDB’s collation and Unicode handling; for language-specific or locale-aware transformations, use collation.
- Designed for aggregation stages only (e.g., $project, $addFields, $match with $expr), not for direct update operations.
Syntax
{ $toLower: <expression> }
- <expression>: Any valid expression that evaluates to a string.
- If the expression resolves to null, $toLower returns an empty string ("").
Examples of Using MongoDB $toLower Operator
In the following examples, we are working with:
- Database: GeeksforGeeks
- Collection: employee
- Document: Three documents that contain the details of the employees in the form of field-value pairs.
Example 1: Using $toLower Operator
Convert the value of the department field in lowercase.
db.employee.aggregate([
{ $match: { "name.first": "Diego" } },
{ $project: { dept: { $toLower: "$department" } } }
])
Output:
- Filters the document where name.first is "Diego".
- Converts department to lowercase using $toLower.
- Outputs the transformed value as dept.
Example 2: Using $toLower on nested fields (via dot notation)
Convert the name.first field to lowercase for employees in the "Development" department
db.employee.aggregate([
{ $match: { department: "Development" } },
{ $project: { name: { $toLower: "$name.first" } } }
])
Output:
- Filters employees in the Development department.
- Converts name.first to lowercase using $toLower.
- Outputs the transformed value as name.
Usage of $toLower Operator
Here are some uses listed:
- Convert string values to lowercase within aggregation stages.
- Apply to any expression that resolves to a string.
- Handle null inputs by returning an empty string ("").
- Use within the aggregation framework (e.g., $project, $addFields), not in direct update operations.
- Suitable for string transformations, with behavior depending on collation and locale settings for proper Unicode handling.
