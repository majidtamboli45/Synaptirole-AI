# MongoDB $divide Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-divide-operator/

The $divide operator in MongoDB performs division between two numeric values or expressions within aggregation pipelines, enabling precise, in-database calculations for analytics and data transformation.
- Divides one value (dividend) by another (divisor).
- Arguments are passed as an array: [dividend, divisor].
- Works with fields, constants, and computed expressions.
- Used in stages like $project, $addFields, and $group.
- Returns a numeric result for further processing.
- Errors if arguments don’t resolve to numbers or if division by zero occurs.
Syntax
{ $divide: [ <expression1>, <expression2> ] }
- Expression1: The dividend (the number to be divided).
- Expression2: The divisor (the number by which the dividend will be divided).
Both expressions must resolve to valid numeric values (integers or floats). The operator returns the result of dividing Expression1 by Expression2
Features of the MongoDB $divide Operator
Here are some key features of $divide operator:
- Arithmetic Precision: Performs accurate division directly in the database.
- Flexible Inputs: Supports fields, constants, and computed expressions.
- Aggregation Support: Integrates with aggregation pipelines for calculations.
- Server-Side Processing: Handles large datasets efficiently on the server.
Examples of MongoDB $divide Operator
In the following examples, we are working with:
- Database: GeeksforGeeks
- Collection: employee
- Document: Three documents that contain the details of the employees in the form of field-value pairs.
Example 1: Divide using $divide operator
Use the $divide operator to divide the salary of employees in the "Development" department by 2. This could be used, for example, to calculate a bonus or a tax deduction.
db.employee.aggregate([
{ $match: { department: "Development" } },
{
$project: {
name: 1,
halfSalary: { $divide: ["$salary", 2] }
}
}
])
Output:
Example 2: Perform Divide in the Embedded Document
Divide the salary of the HR department's employees into half, where the salary is part of an embedded document.
db.employee.aggregate([
{ $match: { department: "HR" } },
{ $project: { name: 1, halfsalary: { $divide: ["$details.salary", 2] } } }
])
Output:
