# MongoDB $add Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-add-operator/

The $add operator in MongoDB is an aggregation arithmetic operator used to add numeric values and combine numbers with dates, helping transform and compute fields in MongoDB queries.
- Performs addition on numeric values.
- Combines numbers with dates in the aggregation pipeline.
- Works with integers, decimals, and dates.
- Operands must be compatible; $add supports number + number or date + number (milliseconds).
- Useful for field calculations and data transformation.
Syntax
{ $add: [ <Expression1>, <Expression2>, ... <ExpressionN>] }
- $add: MongoDB aggregation operator for addition.
- [ ... ]: Array of values to be added.
- <Expression1>, <Expression2>, ...: Fields, constants, or expressions.
- Type compatibility: All expressions must be compatible (numbers or dates).
Examples of $add Operator
In the following examples, we are working with:
- Database: GeeksforGeeks
- Collection: Employee
- Document: Four documents that contain the details of the employees in the form of field-value pairs.
Example 1: Add Numbers Together
Calculate the total salary of every employee in the development department by adding their firstSalary and secondSalary fields.
db.Employee.aggregate([
{ $match: { department: "Development" } },
{
$project: {
name: 1,
tSalary: { $add: ["$firstSalary", "$secondSalary"] }
}
}
])
Output:
Example 2: Adding numbers in the embedded document
Find a total of three months' salary of the employee in the HR department by adding three months' worth of salary, which is stored in an embedded document.
db.Employee.aggregate([
{ $match: { department: "HR" } },
{ $project: { name: 1, tSalary: { $add: ["$salary.firstMonth", "$salary.secondMonth", "$salary.thirdMonth"] } } }
])
Output:
Example 3: Adding to a Date Field
Extend the project end date for the Testing department by adding 5 days (in milliseconds) to projectEndDate.
db.Employee.aggregate([
{ $match: { department: "Testing" } },
{ $project: { extendProjectDate: { $add: ["$projectEndDate", 5 * 24 * 60 * 60 * 1000] } } }
])
Output:
