# Adding and Querying the Data in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/adding-and-querying-the-data-in-mongodb/

In MongoDB, data is stored in BSON format within collections. This guide covers the essential steps for adding and querying data in MongoDB, including creating collections, inserting single and multiple documents and using various query operators to filter data. In this article, We will learn about How to Add and Query the data in MongoDB in detail.
Adding Data in MongoDB
MongoDB stores documents in BSON, a binary form of JSON (JavaScript Object Notation). The documents are stored in the collection.
To insert documents in MongoDB follow the steps mentioned below:
Step 1: Create Collection
Syntax:
use collection_name
It will create a database if it does not exist otherwise it returns the existing database.
To show the currently selected database use 'db' command as shown below:
Step 2: Insert Data into Collection
Documents in MongoDB can be inserted using two methods:
1. db.collection_name.insertOne(): The db.collection_name.insertOne method is used to insert single document in collection. Syntax:
db.collection_name.insertOne(item:'item1'}) // OR
db.collection_name.insert(item:'item1'})
Example:
Here we can specify the _id field. If we don't specify then MongoDB adds the _id field with value objectId.
2. db.collection_name.insertMany(): The db.collection_name.insertMany() can insert multiple documents into a collection. Only you need to pass array of documents to this method.  
Syntax:
db.collection_name.insertMany([{item:'item1'}, {item:'item2'}, 
{item:'item3'}, {item:'item4'}])
Example 1:
Inserting Multiple Documents without _id
Example 2: Inserting Multiple Documents with _id
Querying the data in MongoDB
The query operation performs using db.collection.find() method in MongoDB. To query documents in MongoDB follow the steps mentioned below:
Step 1: Create collection and Insert documents using Mongo Shell
Step 2: Select All Documents in a Collection:
To select all documents in the collection, pass an empty document as the query filter parameter to the find method. This statement is similar to the SELECT * FROM table statement in MySQL.
Syntax:
db.collection_name.find({})
Step 3: Specify Equality Condition:
To filter the result of db.collection_name.find() method you need to specify conditions for method.
Syntax:
db.collection_name.find({ <field1>: <value1>, ... })
Step 4: Specify Conditions Using Query Operators:
A query filter document can use the query operators to specify a condition.
Syntax:
db.collection_name.find({ <field1>: { <operator1>: <value1> }, ... })
1. 'in' Operator ($in): The following example retrieve all documents which status value is "C" or "B".
2. 'and' Operator ($and): A compound query can specify conditions for more than one field in the collection’s documents. Implicitly, a logical AND conjunction connects the clauses of a compound query so that the query selects the documents in the collection that match all the conditions. The following example returns the documents with Stream as computer and Age as 21.
Syntax
db.collection_name.find( { $and : [ { field1: value1},{ field2: value2}  , ...   ]}) ; Example: Find document with Computer Stream and Age 21.
Query:
use GeeksforGeeks;
db.createCollection('Student');
db.Student.insertMany( [ { Name:""Ajay",Stream:"Computer",Age:20} },{Name:"Anil",Stream:"Civil",Age:21},{Name:"Ajit",Stream:"Computer",Age:20},{Name:"Amit",Stream:"Computer",Age:21} ] )
// $and operator
db.Student.find({ $and: [{ Stream: "Computer" }, { Age: 21 }] });
Output
Explanation:
$and operator is used to find the document from Student Collection with Stream field with value Computer and Age field with value 21.
3. 'OR' Operator ($or): Using the $or operator, you can specify a compound query that joins each clause with a logical OR conjunction so that the query selects the documents in the collection that match at least one condition. The following example returns the documents which status is "A" or quantity is less than 540.
You can use 'AND' and 'OR' operators at a same time, in the following example the query returns documents which status equals "A" and either qty is less than 540 or item starts with the character "i".
Conclusion
Adding and querying data in MongoDB are fundamental tasks that enable the efficient management of data within the database. By understanding how to create collections, insert documents and apply various query conditions, you can effectively store and retrieve data to meet your application needs. MongoDB's flexibility with BSON and powerful querying capabilities make it a versatile choice for modern data management.
