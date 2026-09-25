# $each Modifier

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-each-modifier/

MongoDB $each modifier is used within array update operators like $push and $addToSet to insert multiple elements into an array field in a single update operation. This feature is particularly useful for efficiently adding several values to an existing array without performing multiple update commands.
In this article, We will learn about the MongoDB $each Modifier in detail
MongoDB $each Modifier
- MongoDB $each modifier is used within array update operators to insert multiple elements into an array field in a single update operation.
- MongoDB $each facilitates inserting multiple values into an array field instead of just one at a time. It is particularly useful when we need to add several elements to an existing array.
- It is primarily used with array update operators like $push and$addToSet .
- Allows specifying an array of values that MongoDB will insert into the target array field.
Syntax:
{ $each: [value1, value2, ...] }
Here, [value1, value2, ...] represents an array of values that you want to insert into the array field.
Examples of MongoDB $each Modifier
In the following examples, we are working with:
Database: GeeksforGeeks Collection: contributor Document: two documents that contain the details of the contributor in the form of field-value pairs.
Output:
Example 1: Use $each with $addToSet Operator
In this example, we are updating a contributor's document whose name is Sumit using $each modifier with $addToSet operator. Here, this operation only adds "Ruby" and "C" in the language field and does not add "Java", "C#" because they already exists in the language field.   
db.contributor.update({name: "Sumit"}, 
... {$addToSet: {language: {$each: ["Ruby", "Java", "C", "C#"]}}})
Output:
Example 2: Use $each with $push Operator 
In this example, we are updating a contributor's document whose name is Rohit using $each modifier with $push operator. Here, this operation appends the specified value, i.e., ["Java", "C", "Python"] to the end of the language field. It does not remove duplicate values.  
db.contributor.update({name: "Rohit"}, 
... {$push: {language: {$each: ["Java", "C", "Python"]}}})
Output:
Conclusion
The MongoDB $each modifier simplifies the process of adding multiple elements to arrays within documents, enhancing operational efficiency and reducing the need for multiple update commands. By leveraging $each with operators like $addToSet and $push, MongoDB developers can efficiently manage array updates in their applications.
