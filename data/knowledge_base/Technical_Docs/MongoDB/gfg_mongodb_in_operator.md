# MongoDB $in Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-in-operator/

MongoDB $in operator provides a powerful way to query documents based on multiple potential values for a specific field within a single query.
In this article, We will learn about the MongoDB $in Operator by understanding various examples in detail.
MongoDB $in Operator
- The MongoDB $in operator is used to match documents where the value of a field equals any value in a specified array.
- It is particularly useful for querying multiple potential values for a field within a single query.
- MongoDB provides different types of comparison query operators and the $in operator is one of them. 
- This operator is used to select those documents where the value of the field is equal to any of the given values in the array. 
- If the field contains an array, then this operator selects only those documents whose field contains an array that holds at least one item that matches a value of the specified array. 
- We can use this operator in methods like find(), update(), etc. according to our requirements.
The $in operator allows you to match documents where a field's value is within a specified array. If you're building full-stack applications that need advanced querying capabilities, the Full Stack Development with Node JS course teaches you how to use operators like $in to filter data effectively
Syntax:
{field: {$in: [value1, value2, value3, ...]}}
The query `{field: {$in: [value1, value2, value3, ...]}}` in MongoDB matches documents where the field `field` has a value that is contained within the specified array `[value1, value2, value3, ...]`.
It efficiently retrieves documents that match any of the values listed, offering a concise way to filter data based on multiple possible criteria in a single query.
Examples of MongoDB $in Operator
In the following examples, we are working with:
Database: GeeksforGeeks Collection: contributor Document: three documents that contain the details of the contributors in the form of field-value pairs.
Output:
Example 1: Use the $in Operator to Match Values 
In this example, we are retrieving only those employee's documents whose name is either Amit or Suman.
db.contributor.find({name: {$in: ["Amit", "Suman"]}}).pretty()
Output:
Example 2: Use the $in Operator to Match Values in an Array
In this example, we are retrieving only those employee's documents who is working with either C#, Python, or both languages.
db.contributor.find({language: {$in: ["C#", "Python"]}}).pretty()
Output:
Example 3: Use the $in Operator to Match Values in an Embedded Array
In this example, we are retrieving only those employee's documents who got the given marks in their semester.
 db.contributor.find({"personal.semesterMarks":{$in: [80, 89, 78]}}).pretty()
Output:
Example 4: Use the $in Operator to Update Data
In this example, we are adding a new field-value pair(i.e, salary: 10000) in the documents of Amit and Suman by using update() method with $in and $set operators.
db.contributor.update({name: {$in: ["Amit", "Suman"]}}, {$set: {salary: 10000}})
Output:
Note: The update() method by default update only one document at a time. If you want to update multiple documents, then set the value of its multi parameter to true. So, in this example, the update() method updated the first document that matches the given condition as shown in the below image. 
Conclusion
The MongoDB $in operator is a versatile tool for querying and updating documents based on multiple values efficiently. It simplifies the process of filtering documents that match any of the specified criteria within a single database operation.
