# MongoDB $toUpper Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-toupper-operator/

The $toUpper operator converts string values to uppercase within the aggregation pipeline, enabling consistent text normalization, formatting, and case-insensitive operations.
- Converts all alphabetic characters in a string to uppercase.
- Leaves numbers and special characters unchanged.
- Accepts string expressions, including fields and embedded document fields.
- Works on string expressions; non-string values must be explicitly converted using operators like $toString before applying $toUpper.
- Commonly used for normalization, case-insensitive comparisons, and uniform display formatting in aggregation stages (e.g., $project, $addFields).
Syntax
{ $toUpper: <expression> }
- <expression> : Any value or field that resolves to a string and will be converted to uppercase.
- Null Handling: If the expression resolves to null, $toUpper returns null, not an empty string.
Use Cases for MongoDB $toUpper Operator
The $toUpper operator is versatile and can be used in various scenarios:
- Case Normalization: Ensure uniformity in text fields by converting all text data to uppercase.
- Case-Insensitive Comparisons: Use it for comparing strings without worrying about their case (e.g., "apple" vs. "APPLE").
- Data Formatting: Display data in a specific format (e.g., converting names or addresses to uppercase for consistency).
- Non-String Fields: To use $toUpper on non-string fields (e.g., numbers or dates), first convert them using $toString, then apply $toUpper.
Examples of MongoDB $toUpper Operator
Sample collection employee in the GeeksforGeeks database, where each document contains employee details like name and department.
- Database: GeeksforGeeks
- Collection: employee
- Document: Three documents that contain the details of the employees in the form of field-value pairs.
Example 1: Using $toUpper Operator
Convert the value of the department field in uppercase and assign the result of the $toUpper operator as a value of dept field. This can be useful when we need to display or compare department names in a consistent case.
db.employee.aggregate([
{
$project: {
dept: { $toUpper: "$department" }
}
}
])
Output:
- Applies $toUpper to the department field.
- Stores the transformed value in a new field dept.
- Displays all department names in uppercase.
Example 2: Using $toUpper in the Embedded Document
Convert the value of the name.first field in uppercase and assign the result of the $toUpper operator as a value of firstName field.
db.employee.aggregate([
{
$project: {
firstName: { $toUpper: "$name.first" }
}
}
])
Output:
- Applies $toUpper to the name.first field.
- Stores the result in the firstName field.
- Converts all first names to uppercase.
Usage of $toUpper Operator
Here are some uses listed:
- Convert string values to uppercase within aggregation stages.
- Apply to any expression that resolves to a string (including convertible non-string fields).
- Handle null inputs by returning an empty string.
- Use for normalization, case-insensitive comparisons, and consistent formatting.
- Designed for the aggregation framework (use in $project, $addFields, $match with $expr), not for direct update operations.
