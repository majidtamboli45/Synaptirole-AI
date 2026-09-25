# Upsert in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/upsert-in-mongodb/

In MongoDB, efficient data management is crucial for maintaining performance and consistency. The upsert operation, which combines update and insert functionalities, provides a powerful tool for managing documents in our collections. By enabling a single operation to either update an existing document or insert a new one when no match is found, MongoDB’s upsert feature simplifies database interactions and ensures data consistency.
What is an Upsert in MongoDB?
In MongoDB, an "upsert" operation is a combination of an update and an insert operation. It allows us to update an existing document if it matches a specified query or insert a new document if no such document exists. The term "upsert" is a mix of "update" and "insert."
Upsert operations are atomic. This ensures that the operation is completed in a single step without any interference from other operations. This atomicity guarantees data consistency as it prevents race conditions where concurrent operations might lead to inconsistent data states.
Syntax:
upsert: <boolean>
- upsert: true : Specifies that MongoDB should perform an upsert operation. If no document matches the query, a new document will be inserted.
Benefits of MongoDB Upsert
1. Atomic Operation
MongoDB guarantees that the upsert operation is atomic, which ensures data integrity. Whether updating an existing document or inserting a new one, the operation is performed without interruptions from other concurrent operations, which eliminates race conditions.
2. Simplified Code
The upsert operation combines the functionality of both update and insert into a single query. This reduces the complexity of your application code, as you no longer need to write separate logic to first check for the existence of a document and then perform either an update or insert.
3. Improved Performance
Using upsert reduces the number of database queries. Instead of performing multiple checks and operations, MongoDB handles everything in a single step. This results in more efficient queries and reduced latency.
4. Data Consistency
Upsert operations help maintain consistent data in dynamic environments where documents may or may not already exist. If a document does not exist, it is created with the required data, ensuring the data is always up-to-date.
How to Use the Upsert Operation in MongoDB
1. Upsert with findAndModify() method
We can use upsert option with findAndModify() method. In this method, the default value of this option is false. If we set the value of this option is true, then the method performs one of the following operation:
- If a document or documents found that matches the given query criteria then the findAndModify() method updates the document/documents.
- If no document/documents match the given query criteria, then the findAndModify() method inserts a new document in the collection.
Syntax:
db.Collection_name.findAndModify(
{
selection_criteria:<document>,
sort: <document>,
remove: <boolean>,
update: <document>,
new: <boolean>,
fields: <document>,
upsert: <boolean>,
bypassDocumentValidation: <boolean>,
writeConcern: <document>,
collation: <document>,
arrayFilters: [ <filterdocument1>, ... ]
})
Example
In this example we are working with
- Database: gfg
- Collection: employee
- Database: three documents that contains details of employees
Now we are going to insert a new document in employee collection by setting the value of upsert option to true.
db.employee.findAndModify({
query:{name:"Ram"},
update:{$set:{department:"Development"}},
upsert:true
})
Output:
Explanation: Here, no document matches the name "Ram", so the findAndModify() method inserts a new document that contains two fields(i.e., name: "Ram" and department: "Development") because the value of the upsert option is set to true.
2. Upsert with update() method
We can use upsert option with update() method. In this method, the default value of this option is false. If we set the value of this option is true, then the method performs one of the following operations:
- If a document or documents found that matches the given query criteria, then the update() method updates the document/documents.
- If no document/documents match the given query criteria, then the update() method inserts a new document in the collection.
Note: To prevent MongoDB from inserting the same document more than once, create a unique index on the name field. With a unique index, if multiple documents want the same update with upsert: true, only one update operation successfully inserts a new document.
Syntax:
db.Collection_name.update({Selection_criteria}, {$set:{Update_data}}, {
upsert: <boolean>,
multi: <boolean>,
writeConcern: <document>,
collation: <document>,
arrayFilters: [ <filterdocument1>, ... ],
hint: <document|string>
})
Example
In this example, we are working with
- Database: gfg
- Collection: employee
- Database: three documents that contains details of employees
Now we are going to insert a new document in employee collection by setting the value of upsert option to true.
db.employee.update(
{ name: "Priya" },
{ $set: { department: "HR" } },
{ upsert: true }
)
Output:
Explanation: Here, no document matches the name "Priya", so the update() method inserts a new document that contains two fields(i.e., name: "Priya" and department: "HR") because the value of the upsert option is set to true.
3. Upsert with Operator Expressions
- If no document matches the filter from the given collection and the update parameter is a document that contains update operators, also the value of upsert option is set to true then the update operation creates new documents from the equality clauses in the given query parameter and applies the expressions from the update parameter. 
- Or in other words, when the value of upsert option is true and no document matches the given filter, then the update operation inserts a new document in the given collection and the fields inserted in this new document are the fields that specify in the query and update documents.
Example
In this example, we are working with
- Database: gfg
- Collection: example
- Database: five documents that contains details of students
Now we are going to insert a new document in the example collection by setting the value of the upsert option to true.
db.example.update(
{ Name: "Rekha" }, // Query parameter
{
$set: { Phone: '7841235468' }, // Update document
$setOnInsert: { Gender: 'Female' }
},
{ upsert: true } // Upsert option
)
Output:
Here, the update() method creates a new document with field "Name: Rekha" from the query condition and then applies the $set and $setOnInsert operations to this document
4. Upsert with Replacement Document
- If no document matches the filter from the given collection and the update parameter contains a replacement document, also the value of upsert document is set to true, the update operation inserts a new document in the collection and the fields inserted in this new document are the fields that specify in the replacement document. 
- Here, if the replacement document contains an _id field then MongoDB does not create a new _id field for the new document. 
- Or if the replacement document does not contain an _id field then MongoDB does create a new _id field for the new document.
Note: We are not allowed to specify different _id field values in the query parameter and replacement document. If we do, then we will get errors.
Example
In this example, we are working with
- Database: gfg
- Collection: example
- Database: four documents that contains details of students
Now we are going to insert a new document in the example collection by setting the value of the upsert option to true.
db.example.update(
{ Name: "Hema" }, // Query parameter
{ Name: "Hema", Phone: 8332564578 }, // Replacement document
{ upsert: true } // Upsert option
)
Output:
5. Upsert with Aggregation Pipeline
- The aggregation pipeline is a multi-stage pipeline, so in each state, the documents taken as input and produce the resultant set of documents now in the next stage(id available) the resultant documents taken as input and produce output, this process is going on till the last stage. 
- The pipeline can have 1 to n number of stages. If no document matches the given filter and the update parameter contains aggregation pipeline, also the value of upsert option is set to true then update operation inserts a new document in the collection. 
- This new document is created from the equality clause present in the query parameter and after that applies the pipeline to the document to create the document to insert.
Example
In this example, we are working with
- Database: gfg
- Collection: employee
- Database: three documents that contains details of employees
Now we are going to insert a new document in the employee collection by setting the value of the upsert option to true.
db.employee.update({name:"Ram"}, [{$set: {department: "HR", age:30}}],{upsert:true})
Output:
6. Upsert with Dotted _id Query
Till now, we have studied that the update() method can modify data in the collection based on the query and if any matching document is not found with help of upsert option new field can be added to the collection. But upsert with a dotted _id query is an exception and if we attempt to insert a document in this way MongoDB will show us an error.
Example:
Consider the following update operation. Since the update operation specifies upsert:true and the query specifies conditions on the _id field using dot notation, then the update will result in an error when constructing the document to insert.
Query:
db.employee.update({"_id.name":"Roma", "_id.uid":0},{age:20}, {upsert:true})
Output:
Conclusion
The MongoDB Upsert operation is a versatile and powerful tool for managing data in MongoDB. It helps simplify our code, improve performance, and maintain data consistency by combining the functionality of both update and insert operations into one atomic operation. Whether we are updating simple fields, performing complex transformations with aggregation, or replacing entire documents, upsert can significantly enhance our MongoDB workflow.
