# MongoDB $log10 Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-log10-operator/

In MongoDB, the $log10 operator is a powerful tool that allows users to perform mathematical computations directly within the database. This operator returns the base 10 logarithm of a specified number and making it invaluable for data analysis and transformation tasks. 
In this article, We will learn about the MongoDB $log10 Operator by understanding various examples in detail and so on.
MongoDB $log10 Operator
- MongoDB $log10 operator returns the base 10 logarithms of a specified number.
- It can be used within aggregation expressions to perform mathematical operations on document numerical values. 
- This operator is used to find the log base 10 of the specified number and returns the result as a double.
Syntax:
{ $log10: <number> }
Here, the number is a valid expression until it resolves to a non-negative number.
- If the entered value is null, then this operator will return null.
- If the entered value is NaN, then this operator will return NaN.
- If the entered value is a missing field, then this operator will return null.
Examples of MongoDB $log10 Operator
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: example
Document: two documents that contain the details of the shapes in the form of field-value pairs.
Output:
Example 1: Using $log10 Operator
In this example, we are going to find the log base 10 of the value of the side field in the square document.
db.example.aggregate([{$match:{name: "Square"}},
... {$project: {logbas10: {$log10: "$side"}}}])
Output:
Example 2: Using $log10 operator in the embedded document
In this example, we are going to find the log base 10 of the value of the measurement.height field in the rectangle document.
db.example.aggregate([{$match:{name: "Rectangle"}},
... {$project: {logbase10: {$log10: "$measurement.height"}}}])
Output:
Conclusion
The $log10 operator in MongoDB simplifies the process of performing logarithmic calculations within the database, enhancing the efficiency and effectiveness of data analysis tasks. By using this operator, users can perform complex mathematical transformations directly in their MongoDB queries, reducing the need for additional data processing steps outside the database.
