# Query Documents using Mongo Shell

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-query-documents-using-mongo-shell/

MongoDB is a popular NoSQL database known for its flexible document-based storage. Retrieving documents efficiently is a core task when working with MongoDB, and the find() method in the Mongo shell is your primary tool for querying documents in a collection. MongoDB provides us read operations to retrieve documents from the collection or query a collection for a document. 
We can perform read operations using the db.collection.find() method. This method selects or views the documents from the collection and returns the cursor to the selected document. In this article, we will explore how to query documents using the Mongo shell.
What is the find() Method in MongoDB?
The find() method is a MongoDB shell function that can also be used within multi-document transactions. By default, the documents returned by find() are displayed in a compact, non-structured format. It returns a cursor to the matching documents, allowing you to iterate through the results. To view the results in a more readable, formatted way, we can chain the pretty() method with find(), like this: 
db.collection.find().pretty()
When executing find(), the shell automatically iterates the cursor to display the first 20 documents. To view additional documents beyond the initial 20, simply press Enter to continue iterating through the remaining results.
Syntax:
db.collection.find(filter, projection)
Parameters
- filter: It is an optional parameter. It specifies the selection filter with the help of query operators. And if you want to get all the documents present in the collection, then omit these parameters or pass an empty document in the method. The type of this parameter is a Document.
- projection: It is an optional parameter. It specifies that only those fields return to the document that matches the given query filter. And if you want to get all the fields in the document, then omit this parameter.
Return
- This method returns a cursor to the documents that match the specified query criteria. When you use find() method, it returns documents which means the method is actually returning the cursor to the documents.
Examples
In the following examples, we are working with a collection named contributor which stores contributor details.
Database: GeeksforGeeks
Collection: contributor
Document: five documents that contain the details of the contributors in the form of field-value pairs.
1. Selecting all the documents
In this example, we are selecting all the documents of the contributor collection and displaying on the screen using db.collection.find() method. 
Syntax: 
db.contributor.find()
2. Select All Documents in Organized Form
In this example, we are selecting all the documents of the contributor collection and displaying them in the organized form using db.collection.find() method with pretty() method. 
Syntax: 
db.contributor.find().pretty()
3. Select documents that satisfy the given condition
In this example, we are selecting only those documents that satisfy the given condition, i.e, language: "C#". Or in other words, we are selecting only those contributors who are working with C# language. 
Syntax: 
db.collection.find({field: value})
4. Using the $in Operator
In this example, we are selecting only those documents that satisfy the given condition, here the condition is created using query operators. Or in words, we are selecting only those contributors who are working with C# or Java language. 
Syntax: 
db.collection.find({field: {operator: value}})
Here, we are using $in operator. This operator is used to matches any of the values specified in the given array.
db.contributor.find({language: {$in:[ "Java", "C#"]}}).pretty()
5. Using Logical AND Condition
In this example, we are creating a compound query in which we specify the condition for more than one field using logical AND. Here the logical AND connects the clauses of a compound query so that the query selects only those documents in the collection that satisfy all the conditions. Or in other words, in this example, we are retrieving only those contributors that are from the CSE branch and working with the Java language. 
 
6. Using Logical OR Condition
In this example, we are creating a compound query in which we specify the condition using $or operator. Here the $or operator connects the clauses of a compound query so that the query selects only those documents in the collection that satisfy at least one condition. Or in other words, in this example, we are retrieving only those contributors that are from the CSE branch or working with the Java language. 
 
7. Combining AND and OR Conditions
In this example, we are setting filter using both AND and OR operators. or in other words, in this example, we are retrieving only those contributors that are from the ECE branch and either age is 23 or working with the Java language. 
Conclusion
MongoDB’s find() method, combined with powerful query operators, offers flexible and efficient ways to retrieve documents from collections. Whether you want all documents, documents matching specific fields, or complex conditions combining AND/OR logic, the Mongo shell provides simple and effective syntax to do so. Mastering these queries helps you unlock the full power of MongoDB for your applications, making data retrieval fast and precise.
