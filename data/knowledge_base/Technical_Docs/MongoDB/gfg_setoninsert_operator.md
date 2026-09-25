# $setOnInsert Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-setoninsert-operator-setoninsert/

The $setOnInsert operator in MongoDB is a powerful tool used in updating operations with the upsert option. It allows us to specify values that should be set only when a new document is inserted. In this article, we will learn about the $setOnInsert Operator in MongoDB in detail and so on.
MongoDB $setOnInsert Operator
- MongoDB $setOnInsert Operator is a type of field update MongoDB offers various array expression operators for use in the aggregation pipeline stages and $arrayElemAt is one such operator. The MongoDB $setOnInsert operator is used in MongoDB update operations with the upsert option. 
- When a new document is inserted, it assigns specified values to the fields in the document. This operator only acts during the insertion of a new document.
- This operator can also work with embedded/nested documents. You can use this operator in methods like update(), findAndModify(), etc according to our requirements. 
- If the update() or findAndModify() method with upsert: true has found a matching document then MongoDB will ignore $setOnInsert and apply the $set operator.
Syntax:
db.collection.update(
<query>,
{ $setOnInsert: { <field1>: <value1>, <field1>: <value2>, ... } },
{ upsert: true }
)
Examples of MongoDB $setOnInsert Operator
In these examples, we will work with:
Database: GeeksforGeeks
Collection: Example
Document: one documents that contain the details of the employees in the form of field-value pairs.
Output:
Example 1: Upsert Results in an Insert
In this example, we are creating a new document in the Example collection with the help of update() method by setting the value of an upsert field to true and using $setOneInsert operator assign the values to the department and salary fields in the document.
Query:
db.Example.update(
{
"name.first": "Mina",
"name.last": "Singh",
"personalDetails.age": 24,
"personalDetails.contactInfo": 345678901
},
{
$setOnInsert: { department: "Development", salary: 45000 }
},
{ upsert: true }
)
Output:
Example 2: Inserting New Embedded Fields in New Document
In this example, we are creating a new document in the Example collection with the help of update() method by setting the value of an upsert field to true and using $setOneInsert operator assign the values to embedded fields i.e., in the document. 
Query:
db.Example.update(
{ "name.first": "Vinod", "experienceYear": 5 },
{
$setOnInsert: {
"personalDetails.age": 27,
"personalDetails.contactInfo": 345678901
}
},
{ upsert: true }
)
Output:
Example 3: Effect of $setOnInsert Operator on Matched Documents
In this example, we are checking if $setOnInsert operator work with matched document or not. This $setOnInsert operator does not work with already present documents.
Query:
db.Example.update(
{ "name.first": "Mina" },
{
$setOnInsert: {
"personalDetails.age": 27,
"personalDetails.contactInfo": 345678901
}
},
{ upsert: true }
)
Before:
Output After:
Key Takeaways About $setOnInsert Operator
- The $setOnInsert operator in MongoDB is used to insert specific values during an upsert operation.
- It does not affect existing documents or update operations that do not result in an insert.
- The operator can also be used with embedded/nested documents using dot notation.
- If an update operation finds a matching document, MongoDB will ignore the $setOnInsert operator and apply the $set operator instead.
- The $setOnInsert operator is useful for setting default values or initializing fields only during the insertion of new documents.
Conclusion
The $setOnInsert operator in MongoDB provides a way to set specific values during an upsert operation, ensuring that these values are applied only when inserting new documents. This operator enhances the flexibility and functionality of MongoDB's update operations, making it easier to manage data in your collections.
