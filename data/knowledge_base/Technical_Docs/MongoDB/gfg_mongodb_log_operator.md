# MongoDB $log Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-log-operator/

The MongoDB $log operator is used within the aggregation pipeline to calculate the logarithm of a number with a specified base. This operator helps perform logarithmic calculations on fields whether in simple documents or embedded documents.
The syntax is straightforward by requiring a number and a base to compute the log value. In this article, We will learn about the MongoDB $log Operator by understanding various examples and so on.
MongoDB $log Operator
- The $log operator in MongoDB is used in aggregation pipeline stages to compute the logarithm of a number.
- It supports both natural logarithms (base e ) and logarithm to a specified base.
- This operator can be useful for various mathematical transformations and analyses within our data.
Syntax:
{ $log: [ <number>, <base> ] }
Here, the number is a valid expression as long as it resolves to a non-negative number and base is a valid expression until it resolves to a positive number greater than 1.
- If the entered value is null, then this operator will return null.
- If the entered value is NaN, then this operator will return NaN.
- If the entered value is a missing field, then this operator will return null.
Examples of MongoDB $log Operator
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: example
Document: two documents that contain the details of the shapes in the form of field-value pairs.
Output:
Example 1: Using $log Operator
In this example, we are going to find the log of the value of the side field in the square document. Here, the base value is 10.
db.example.aggregate([{$match:{name: "Square"}},
... {$project: {side:1, logSide: {$log: ["$side", 10]}}}])
Output:
Example 2: Using $log Operator in the Embedded Document
In this example, we are going to find the log of the value of the measurement.width field in the rectangle document. Here, the base value is 2.
db.example.aggregate([{$match:{name: "Rectangle"}},
... {$project: {"measurement.width": 1,
logWidth: {$log: ["$measurement.width", 2]}}}])
Output:
Conclusion
Overall, the MongoDB $log operator is a valuable tool for performing logarithmic calculations directly within the database, making it easier to analyze numerical data effectively. By using MongoDB $log operator syntax and various MongoDB $log operator examples, users can apply the operator to both simple and MongoDB log for embedded documents, enhancing their data manipulation capabilities. So, the $log operator is essential for developers and data analysts looking to extract meaningful insights from their datasets in MongoDB.
