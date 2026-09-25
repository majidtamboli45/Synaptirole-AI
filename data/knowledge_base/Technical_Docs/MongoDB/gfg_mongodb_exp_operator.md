# MongoDB $exp Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-exp-operator/

MongoDB's aggregation framework provides a powerful set of tools for data manipulation and processing. One such tool is the $exp operator which allows users to perform exponential calculations within aggregation pipelines. In this article, We will learn about the MongoDB $exp Operator in detail.
MongoDB $exp Operator
- The $exp operator in MongoDB is used to raise the mathematical constant e (approximately equal to 2.718) to the power of a given number.
- It is commonly used in mathematical computations and can be included in aggregation pipelines to perform exponential calculations.
Syntax:
{ $exp: <exponent> }
Here, the exponent is a valid expression until it resolves to a number.
- If the entered value resolves to null, then this operator will return null.
- If the entered value resolves to NaN, then this operator will return NaN.
- If the entered value refers to a missing field, then this operator will return null.
Examples of MongoDB $exp
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: example
Document: two documents that contain the details of the shapes in the form of field-value pairs.
Output:
Example 1: Using $exp Operator
In this example, we are going to find the exponent of the value of the side field.
db.example.aggregate([ {$match: {name: "Square"}},
... {$project: {result: {$exp: "$side"}}}])
Output:
Example 2: Using $exp Operator in the Embedded Document
In this example, we are going to find the exponent of the difference of the values of measurement.height and measurement.width fields.
db.example.aggregate([ {$match: {name: "Rectangle"}},
... {$project: {result: {$exp:
... {$subtract: ["$measurement.height", "$measurement.width"]}}}}])
Output:
Conclusion
The $exp operator in MongoDB is a useful tool for performing exponential calculations within aggregation pipelines. By raising e to a specified power, it facilitates complex mathematical computations in your MongoDB queries.
