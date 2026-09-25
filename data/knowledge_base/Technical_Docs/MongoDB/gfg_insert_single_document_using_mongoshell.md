# Insert Single Document Using MongoShell

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-insert-single-document-using-mongoshell/

In MongoDB, insert operations are used to insert new documents in the collection. Whether you are creating a new collection or inserting into an existing one, MongoDB makes it easy to insert single documents by employing the insertOne() method within the Mongo shell. In case the collection does not exist, the insertOne() operation will create the collection by inserting the document. When the collection already exists, the operation will just insert new documents into the existing collection
What is insertOne() Method?
The insertOne() function in MongoDB is employed to add a single document into a collection. This function can be used within multi-document transactions as well, which guarantees atomicity and consistency in case of requirement. In this function, you can insert a document in the collection with or without _id field. If you insert a document without _id field, then MongoDB itself inserts a _id field and populates it with a unique ObjectId.
How Does insertOne() Work?
- You can include a document with or without specifying the _id field.
- If you exclude the _id field, MongoDB automatically generates a unique ObjectId for the document.
- You can also specify a custom _id if needed.
Syntax:
db.collection.insertOne(
    <document>,
   {
      writeConcern: <document>
 
   }
)
Parameters:
- document: First parameter of this method. It represents a document that will insert in the collection.
- writeConcern: It is an optional parameter. It is only used when you do not want to use the default write concern. The type of this parameter is document.
Return
The method returns an object containing:
- acknowledged: A boolean indicating whether the write operation was acknowledged (true) or not (false).
- insertedId: The _id of the inserted document.
Examples: Inserting Documents in the student Collection of GeeksforGeeks Database
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: student
1. Inserting a Single Document without _id field:
In this example, we are inserting a document in the student collection without _id field using db.collection.insertOne() method.
This inserts a new document into the student collection with an automatically generated _id.
2. Inserting a Single Document with Custom _id field:
In this example, we are inserting a document in the student collection with _id field using db.collection.insertOne() method.
Here, the document uses 101 as the _id instead of MongoDB generating one.
Tips for Using insertOne()
- Use unique _id values to avoid duplicate key errors.
- For bulk inserts, consider insertMany() for better performance.
- Always check the return object to verify if the insert succeeded.
- Use writeConcern options for critical data to ensure durability.
Conclusion
The insertOne() method is a straightforward and powerful way to add single documents into your MongoDB collections. Understanding its syntax, parameters, and return structure helps ensure your data insertion is accurate and efficient. Whether you’re inserting with an automatic or custom _id, MongoDB provides flexibility and reliability in managing your data. It’s an essential tool for developers working with MongoDB who need to manage individual records efficiently.
