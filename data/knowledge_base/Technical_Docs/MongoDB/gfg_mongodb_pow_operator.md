# MongoDB $pow Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-pow-operator/

MongoDB's $pow operator is a powerful tool within the aggregation framework which is designed to compute exponentiation operations directly on numeric fields. In this article, We will learn about the MongoDB $pow Operator in detail by understanding various examples and so on.
MongoDB $pow Operator
The MongoDB $pow operator is a mathematical aggregation operator used to calculate the exponentiation of a specified base to a specified exponent within a MongoDB aggregation pipeline. 
Syntax:
{ $pow: [ <number>, <exponent> ] }
Here, the number and exponent are valid expressions until it resolves to a number.
- If the entered value resolves to null, then this operator will return null.
- If the entered value resolves to NaN, then this operator will return NaN.
- If the entered value refers to a missing field, then this operator will return null.
The result will be in the same type as the input, but it can be changed when it cannot be represented accurately in that type like in the following cases:
- The 32-bit integer will be converted to a 64-bit integer if the result is represented as a 64-bit integer.
- The 32-bit integer will be converted to a double if the result is not represented as a 64-bit integer.
- The 64-bit integer will be converted to double if the result is not represented as a 64-bit integer.
Examples of MongoDB $pow Operator
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: example
Document: two documents that contain the details of the shapes in the form of field-value pairs.
Output:
Example 1: Calculate Area of Square
In this example, we are going to find the area of square (i.e., (side)2 ) using a $pow operator. Here, the $pow operator contains two arguments, first one is the value of side field(i.e., 2) and the second one is the exponent(i.e., 2).
db.example.aggregate([
... {$match: {name: "Square"}},
... {$project: {area: {$pow: ["$side", 2]}}}])
Output:
Example 2: Using $pow Operator in the Embedded Document
In this example, we are going to find the value of (measurement.height +measurement.width)2 using a $pow operator. Here, $pow operator contains two arguments, first one is the sum of the values of measurement.height and measurement.width fields and the second one is the exponent(i.e., 2).
db.example.aggregate([ {$match: {name: "Rectangle"}},
... {$project: {result:
... {$pow: [{$add:["$measurement.height", "$measurement.width"]}, 2]}}}])
Output:
Example 3: Negative Exponent
> db.example.aggregate([
  {
    $project: {
      name: 1,
      side: 1,
      area: { $pow: ["$side", -2] } // Calculating area for squares using side length
    }
  }
]).pretty()
Output
{
  "_id": ObjectId("5f0b039892e6dfa3fc48de0a"),
  "name": "Square",
  "side": 4,
  "area": 0.0625
}
Explanation:
- The $pow operator is used to calculate the area of a square with side length4 .
- Negative exponent -2 computes the reciprocal of the square of the side length, resulting in0.0625 .
Example 4: Null Exponent
> db.example.aggregate([
  {
    $project: {
      name: 1,
      side: 1,
      power: { $pow: ["$side", null] } // Using null exponent
    }
  }
]).pretty()
Output:
{
  "_id": ObjectId("5f0b039892e6dfa3fc48de0a"),
  "name": "Square",
  "side": 4,
  "power": 1
}
{
  "_id": ObjectId("5f0b03aa92e6dfa3fc48de0b"),
  "name": "Rectangle",
  "measurement": {
    "height": 10,
    "width": 15
  },
  "power": 1
}
Explanation:
- The $pow operator with anull exponent results in1 for any value of the base ($side in this case).
- Both documents are returned with power equal to1 , regardless of the value ofside ormeasurement .
Example 5: Non-Existent Fields
> db.example.aggregate([
  {
    $project: {
      name: 1,
      side: 1,
      area: { $pow: ["$length", 2] } // Using non-existent field `length`
    }
  }
]).pretty()
Output:
{
  "_id": ObjectId("5f0b039892e6dfa3fc48de0a"),
  "name": "Square",
  "side": 4,
  "area": null
}
{
  "_id": ObjectId("5f0b03aa92e6dfa3fc48de0b"),
  "name": "Rectangle",
  "measurement": {
    "height": 10,
    "width": 15
  },
  "area": null
}
Explanation:
- When using a non-existent field like $length , the$pow operator returnsnull for each document.
- Both documents show area asnull becauselength field does not exist in the documents.
Conclusion
Overall, MongoDB $pow operator calculates the exponentiation of a base value to a specified power within aggregation pipelines. It supports mathematical operations on numeric fields which allowing for efficient calculation of powers. This operator is useful for scenarios requiring computations like squared values or raising numbers to specific powers directly within MongoDB queries.
