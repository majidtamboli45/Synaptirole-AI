# MongoDB $subtract Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-subtract-operator/

The $subtract operator in MongoDB is an aggregation arithmetic operator used to subtract numbers and perform date/time calculations, helping transform fields in MongoDB queries.
- Subtracts two numbers and returns the difference.
- Subtracts two dates and returns the difference in milliseconds.
- Subtracts milliseconds from a date and returns a new date.
- Takes exactly two expressions: { $subtract: [expr1, expr2] }.
- Second value is subtracted from the first.
- Supports number–number, date–date (returns milliseconds), and date–number (subtracts milliseconds from date).
Syntax
{ $subtract: [ <expression1>, <expression2> ] }
- $subtract: MongoDB aggregation operator for subtraction.
- [ ... ]: Array containing exactly two values.
- <expression1>: The base value (number or date).
- <expression2>: The value to subtract from the first.
- Type compatibility: Expressions must be compatible (numbers or dates).
Examples of MongoDB $subtract Operator
In the following examples, we are working with:
- Database: GeeksforGeeks
- Collection: Employee
- Document: four documents that contain the details of the employees in the form of field-value pairs.
Example 1: Subtract Numbers
Subtract the value of firstSalary field from the value of secondSalary field using $subtract operator.
Query:
db.Employee.aggregate([
{ $match: { department: "Development" } },
{
$project: {
result: { $subtract: ["$secondSalary", "$firstSalary"] }
}
}
])
Output:
Example 2: Subtract Two Dates
Subtract two dates, i.e, the value of projectStartDate field from the value of projectEndDate field using a $subtract operator.
Query:
db.Employee.aggregate([
{ $match: { department: "Testing" } },
{
$project: {
diffResult: { $subtract: ["$projectEndDate", "$projectStartDate"] }
}
}
])
Output:
Example 3: Subtract Milliseconds from a Date
Subtract 5*24*60*60000 milliseconds (i.e., 5 days) from the value of projectEndDate field using a $subtract operator.
Query:
db.Employee.aggregate([
{ $match: { department: "Testing" } },
{ $project: {
newprojectEndDate: {
$subtract: ["$projectEndDate", 5 * 24 * 60 * 60000]
}
}
}
])
Output:
Use Cases of MongoDB $subtract Operator
The $subtract operator is useful for various scenarios, including:
- Age calculation: Find age using the difference between the current date and birth date.
- Time-based calculations: Measure the duration between two events.
- Date manipulation: Add or subtract days, months, or years from a date.
- Financial calculations: Compute differences between amounts (e.g., salary, balance).
