# Insert() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-insert-method-db-collection-insert/

The insert() method in MongoDB is used to add one or more documents to a collection, automatically generating a unique _id when not provided, though it is now deprecated in favor of newer methods.
- Adds single or multiple documents to a collection.
- Automatically generates a unique _id if not specified.
- User-provided _id values must be unique.
- Supports usage within multi-document transactions.
- Deprecated in the MongoDB shell (mongosh).
- Recommended alternatives are insertOne() or insertMany().
Syntax
db.Collection_name.insert(
<document or [document1, document2,...]>,
{
writeConcern: <document>,
ordered: <boolean>
})
Parameters
- document: A document or array of documents to insert into the collection. Documents are a structure created of file and value pairs, similar to JSON objects.
- optional: The second parameter is optional which includes writeConcern and ordered.
Optional parameters
- writeConcern: It is only used when you do not want to use the default write concern. The type of this parameter is a document.
- ordered: The default is true which inserts documents in order while false allows unordered insertion.
Return Type
- This method returns WriteResult when you insert single document in the collection.
- This method returns BulkWriteResult when you insert multiple documents in the collection.
Examples of MongoDB Insert() Method
- Database: gfg
- Collection: student
Example 1: Insert a Document without Specifying an _id Field
Insert a document into the "student" collection with the name "Lee" and marks "500". By not specifying the _id field, MongoDB will automatically generate a unique identifier for this document.
Query:
db.student.insert({Name: "Lee", Marks: 500})
Output:
- Creates a new document in the student collection.
- Automatically generates a unique _id field.
- Stores fields Name and Marks with the given values.
Example 2: Insert Multiple Documents
Insert multiple documents into the collection by passing an array of documents to the insert method. This allows for batch insertion, which is more efficient than inserting documents one at a time.
Query:
db.student.insert([
{Name: "Ben", Marks: 550},
{Name: "Nicol", Marks: 430},
{Name: "Denis", Marks: 499}
])
Output:
This operation inserts three new documents into the student collection. Each document will have its own automatically generated _id.
Example 3: Insert a Document Specifying an _id Field
Insert a document into the student collection with a specified _id field. This demonstrates how to manually set the identifier for a document.
Query:
db.student.insert({_id: 102, Name: "Ryan", Marks: 400})
Output:
- Inserts a document with a custom _id value of 102.
- Stores the fields Name and Marks.
- Fails with a duplicate key error if _id: 102 already exists.
Behaviors of Insert() Method
The insert method in MongoDB is used to add documents to a collection. Here’s how it behaves based on the aspects of Write Concern, Create Collection and the _id field:
1. Write Concern
Write concern defines how MongoDB acknowledges write operations, using options like w (write) and j (journal) to control data durability.
- Default Write Concern: If not specified, MongoDB uses the default write concern, which is to acknowledge the write operation after it has been written to the primary node.
- Configurable Write Concern: You can specify the write concern as an option to the insert method. For example:
db.collection.insert(document, { writeConcern: { w: 1, j: true } })
- w: 1 means the operation will be acknowledged only after the primary node confirms the write.
- j: true means the write operation will be acknowledged only after the write has been committed to the journal.
2. Create Collection
In MongoDB, collections are created implicitly when a document is inserted into a non-existent collection.
- Implicit Collection Creation: If the specified collection does not exist, MongoDB will create it implicitly when the first document is inserted.
db.newCollection.insert({ name: "Alex", age: 25 })
- Explicit Collection Creation: While not common, we can also create a collection explicitly using the createCollection method before inserting documents.
db.createCollection("explicitCollection")
db.explicitCollection.insert({ name: "Luca", age: 30 })
3. _id Field
The _id field is MongoDB’s primary key, must be unique, is auto-generated if omitted, and custom duplicate values cause errors.
