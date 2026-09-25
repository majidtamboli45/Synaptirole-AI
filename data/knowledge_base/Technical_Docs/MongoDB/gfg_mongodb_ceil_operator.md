# MongoDB $ceil Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-ceil-operator/

In MongoDB, the $ceil operator is a powerful tool used in aggregation pipelines to round numbers up to the nearest integer greater than or equal to the original number. In this article, We will learn about the MongoDB $ceil Operator in detail.
MongoDB $ceil Operator
MongoDB $ceil operator is used in aggregation pipelines to perform mathematical rounding of a number to the smallest integer greater than or equal to that number. It is similar to the CEIL function in many programming languages and SQL. 
{ $ceil: <number> }
Here, the number is a valid expression until it resolves to a number.
- If the entered value is null, then this operator will return null.
- If the entered value is NaN, then this operator will return NaN.
- If the entered value is a missing field, then this operator will return null.
Examples of MongoDB $ceil
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: employee
Document: three documents that contain the details of the employees in the form of field-value pairs.
Output:
Example 1: Using $ceil Operator
In this example, we are going to find the smallest integer greater than or equal to the value of the perfoPoint field in the development department.
db.employee.aggregate([{$match: {department: "Development"}}, 
{$project: {perfoPoint: 1, ceilingPoint: {$ceil: "$perfoPoint"}}}])
Output:
Example 2: Using $ceil Operator in the Embedded Document
In this example, we are going to find the smallest integer greater than or equal to the value of the perfoPoint.firstMonthPoint field in the HR department.
db.employee.aggregate([{$match: {department: "HR"}},
... {$project: {"perfoPoint.firstMonthPoint": 1,
ceilingPoint: {$ceil: "$perfoPoint.firstMonthPoint"}}}])
Output:
Conclusion
The $ceil operator in MongoDB is a valuable tool for rounding numbers up to the nearest integer. It can be used in aggregation pipelines to perform mathematical operations on numeric fields, ensuring data accuracy and consistency. By understanding how to use $ceil effectively, you can enhance your MongoDB queries and streamline your data processing tasks.
