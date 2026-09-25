# Insert Multiple Document Using MongoShell

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-insert-multiple-document-using-mongoshell/

MongoDB is a scalable and flexible NoSQL database that stores data in JSON like documents. Inserting multiple documents in a batch is much faster in MongoDB than inserting them individually.
Irrespective of whether you are working with batch processing operations or big data, knowing how to insert more than one document efficiently is crucial. We will detail the steps involved in inserting multiple documents into a MongoDB collection from the Mongo shell in this article.
Why Use insertMany() for Bulk Insert Operations?
The insertMany() is a mongo shell method, which can insert multiple documents. This method can be used in the multi-document transactions, which is significantly faster than callinginsertOne()repeatedly. In this method, we can add documents in the collection with or without _id field. If you add documents without _id field, then mongodb will automatically add _id fields for each documents and assign them with a unique ObjectId. This method by default insert documents in order.   
- Better Performance: Inserting multiple documents in bulk decreases network round trips and can greatly enhance performance.
- Atomic Operation: insertMany() is an atomic operation, which means all the documents are inserted together.
- Flexibility: It works with both new and existing collections. If the collection does not exist, MongoDB will create it automatically.
Syntax:
db.collection.insertMany(
   [  <Document1>, <Document2>, <Document3> ... ],
   {
      writeConcern: <Document>,
      order: <Boolean> 
   }
)
Parameters
- Document:It represents the array of the documents that will insert in the collection
- writeConcern (Optional): It is only used when you do not want to use the default write concern,
- order (Optional): It specifies whether the mongodb instance performs an ordered or unordered insert, the default value of this parameter is true.
Return
When you use insertMany(), MongoDB returns an object containing:
- acknowledged: A boolean indicating whether the write operation was acknowledged (true) or not (false).
- insertedIds: An object containing the _id values of the inserted documents. Each inserted document gets a unique_id .
Examples: Inserting Multiple Documents into the student Collection
Assume you're working with a collection called studentin the GeeksforGeeksdatabase. Here’s how to insert multiple documents at once:
Database: GeeksforGeeks
Collection: student
1. Inserting Multiple Documents Without Custom _id field
In this example, we are inserting multiple documents in the student collection without _id field db.collection.insertManymethod. Here, three documents are inserted at once. MongoDB will automatically generate the _id for each document.
2. Inserting Multiple Documents with Custom _id
In this example, we are inserting multiple documents in the student collection with _id field db.collection.insertMany() method. Here, we manually assign the _id for each document, ensuring uniqueness across all inserted documents.
3. Inserting Documents with Mixed Data Types
MongoDB allows you to insert documents with varying data types. This flexibility is useful when working with diverse data sets. This example demonstrates inserting documents where fields have different data types, including arrays and booleans.
db.student.insertMany([
{ name: "Alice", age: 22, courses: ["Computer Science", "Mathematics"], active: true },
{ name: "Bob", age: 24, courses: ["Mechanical Engineering", "Physics"], active: false }
])
This example demonstrates inserting documents where fields have different data types, including arrays and booleans.
Handling Errors and Failures in insertMany()
- Duplicate Key Errors: If you try to insert documents with duplicate _id values, MongoDB will return an error. To handle this, use theordered: false option, which allows MongoDB to continue inserting documents even after encountering an error.
Example of inserting with ordered: false:
db.student.insertMany([
{ _id: 101, name: "Alice", age: 22, course: "Computer Science" },
{ _id: 101, name: "Bob", age: 24, course: "Mechanical Engineering" } // Duplicate _id
], { ordered: false })
In this example, MongoDB will insert the first document successfully and skip the second one due to the duplicate _id.
Best Practices for Inserting Multiple Documents
- Limit the Batch Size: For very large datasets, break the insert operation into smaller batches to prevent overwhelming the system and ensure better performance.
- Use ordered: false When Necessary: When you don't mind skipping over errors and want to continue the insertion process, use the ordered: false option.
- Verify for Duplicates: Prior to inserting, verify for possible duplicate entries by using MongoDB's query mechanism in order not to make unnecessary errors.
- Use Bulk Operations for Performance: For mass inserts, use bulk operations such as bulkWrite() for improved performance and greater control over how insertions occur.
Conclusion
Inserting several documents simultaneously using theinsertMany()method is a critical skill when dealing with MongoDB. It offers a fast and scalable means of inserting lots of data into your collections. With best practice and knowledge of the syntax, you can carry out insert operations smoothly and at high speed. Whether you're managing a small project or dealing with large datasets, mastering insertMany() will significantly enhance your MongoDB workflow
