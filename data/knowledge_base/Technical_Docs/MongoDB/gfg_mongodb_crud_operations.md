# MongoDB CRUD Operations

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-crud-operations/

CRUD operations are fundamental database actions in MongoDB that enable users to insert, read, update, and delete documents within collections.
1. Create Operations
Create (insert) operations are used to add new documents to a collection, creating the collection automatically if it does not already exist.
- Adds new documents to a collection.
- Automatically creates the collection if missing.
- Generates a unique _id if not provided.
- Supports inserting single or multiple documents.
Example 1: We are creating a student collection in the database using the db.createCollection() method.
Example 2: We are inserting details of a single student in the form of document in the student collection using db.collection.insertOne() method.
Example 3: We are inserting details of the multiple students in the form of documents in the student collection using db.collection.insertMany() method.
2. Read Operations
Read operations are used to retrieve or query documents from a MongoDB collection.
- Fetch documents from a collection.
- Support filtering, projection, sorting, and limiting results.
- Used to read and analyze stored data.
Examples 1: We are retrieving the details of students from the student collection using db.collection.find() method.
Note: pretty() method is used to decorate the result such that it is easy to read.
Example 2: We are retrieving the details of a single student from the student collection using the db.collection.findOne() method.
3. Update Operations
Update operations are used to modify existing documents in a MongoDB collection based on specified query conditions.
- Update single or multiple matching documents.
- Use update operators like $set, $inc, and $unset.
- Can replace entire documents if required.
Example 1: We are updating the age of Alen in the student collection using db.collection.updateOne() method.
Example 2: We are updating the year of course in all the documents in the student collection using db.collection.updateMany() method.
Example 3: We are replacing the complete details of a single student document in the student collection using the db.student.replaceOne() method.
4. Delete Operations
Delete operations are used to remove documents from a MongoDB collection.
- Delete documents based on specific conditions.
- Can remove a single document or multiple documents
- Supports deleting all documents in a collection
Example 1: We are deleting a document from the student collection using db.collection.deleteOne() method.
Example 2: We are deleting multiple documents from the student collection using db.collection.deleteMany() method (all documents are deleted only if an empty filter {} is used).
