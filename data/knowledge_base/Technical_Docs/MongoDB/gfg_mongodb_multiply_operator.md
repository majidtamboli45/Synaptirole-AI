# MongoDB $multiply Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-multiply-operator/

The $multiply operator multiplies two or more numeric values or expressions within MongoDB aggregation pipelines to compute results directly in the database.
- Multiplies two or more numeric expressions and returns a single result.
- Used inside aggregation stages like $project, $addFields, $group.
- Helpful for calculations (totals, discounts, conversions, scores).
- Works with fields, constants, and computed expressions.
- May return null if any argument evaluates to null or is missing, depending on expression evaluation.
- Improves performance by doing math inside the database.
Syntax
{ $multiply: [ <expression1>, <expression2>, ... <expressionN> ] }
- Takes two or more numeric expressions inside an array: { $multiply: [ <exp1>, <exp2>, ... ] }.
- Each expression can be a field, constant value, or computed expression.
- Returns the product of all values. May result in an error or null, depending on the context, if non-numeric values are used.
Examples of MongoDB $multiply Operator
In the following examples, we are working with:
- Database: GeeksforGeeks
- Collection: employee
- Document: Three documents that contain the details of the employees in the form of field-value pairs.
Example 1: Using $multiply Operator
Multiply the salary of the development department's employees by 2.
db.employee.aggregate([
{ $match: { department: "Development" } },
{
$project: {
name: 1,
newSalary: { $multiply: ["$salary", 2] }
}
}
])
Output:
Example 2: Multiply Using $multiply Operator in the Embedded Document
Multiplies the salary of employees in the "HR" department, where the salary is stored inside an embedded document.
db.employee.aggregate([
{ $match: { department: "HR" } },
{
$project: {
name: 1,
newSalary: { $multiply: ["$details.salary", 3] }
}
}
])
Output:
Combine $multiply with Other Operators
$multiply can be combined with other arithmetic operators in aggregation pipelines to build complex calculations like bonuses or adjusted totals directly in MongoDB.
- Enables multi-step formulas in a single pipeline stage.
- Supports nesting with $add, $subtract, and $divide.
- Works with both field values and constants.
- Helps derive new computed fields on the fly.
Example combining $multiply with $add
Given below is the sample data:
Query:
db.employee.aggregate([
{
$project: {
name: 1,
totalPay: {
$add: [
"$salary",
{ $multiply: ["$salary", "$bonusRate"] },
1000
]
}
}
}
])
Output:
Benefits of Using the $multiply Operator in MongoDB
Here are some benefits:
1. Perform Complex Calculations
The $multiply operator allows you to perform arithmetic operations in MongoDB aggregation pipelines, saving time by eliminating the need for complex post-processing in your application.
2. Flexible Arithmetic Operations
You can multiply numeric fields, constants, or values from embedded documents, offering great flexibility in manipulating your data directly within MongoDB.
3. Efficient Data Transformations
The $multiply operator is ideal for transforming data in real-time, whether adjusting salaries, calculating totals, or making adjustments to other numerical values.
