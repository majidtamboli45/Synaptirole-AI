# Create Database using Mongo Shell

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-create-database-using-mongoshell/

MongoDB is a popular NoSQL database that uses collections and documents, which are highly flexible and scalable. Unlike relational databases (RDBMS), MongoDB does not use tables and rows but stores data in a more dynamic, JSON-like format.
Here, we'll explore how to create a MongoDB database using the MongoDB Shell (mongosh) and cover related database operations.
MongoDB Database, Collection, and Document
- Database: A MongoDB database is a container for all collections. A database can hold multiple collections, and each database is isolated from others.
- Collection: Collections are analogous to tables in relational databases. However, collections in MongoDB store documents in BSON format and don’t require a fixed schema.
- Document: A document is a set of key-value pairs, similar to a row in relational databases, but it has a flexible schema, allowing the addition of new fields without affecting other documents.
Create a MongoDB Database Using MongoDB Shell (mongosh)
To create a new MongoDB database using MongoDB Shell (mongosh) use the "use Database_Name" command. This command creates a new database if it doesn't exist, otherwise, it will return the existing database.
The newly created database will not be present in the list of databases. To display the database in the database list, insert at least one document into it.
Syntax:
use Database_Name
Create a New Database Using MongoDB Shell (mongosh) Example
The below image shows new database creation using MongoDB Shell (mongosh):
In MongoDB default database is test. If you did not create any Database and started inserting collection then all collections are stored in the Default Database.
View the List of Databases in MongoDB
To view a list of all existing MongoDB databases, use the following command:
show dbs
This will return a list of all databases currently stored in MongoDB. Note that if your new database doesn't contain any collections, it won’t appear in this list until you add a document to it.
Show List of Databases Example
The below example shows how to see list of databases using MongoDB Shell (mongosh).
Check Current Database
To check the current database you're working with, simply use the following command:
db
This will return the name of the database that’s currently active. If you’ve just created a new database, it will return the name of the newly selected database.
Check Current Database Example
The below image shows how to check current database using MongoDB Shell (mongosh).
Switch to Other Database
To switch to a different database, use the use command again followed by the name of the desired database. If the database does not exist, MongoDB will create it:
use AnotherDB
Switch to other Database Example
The below image shows how to switch to another database using MongoDB Shell (mongosh).
In the above Example, First we check current Database name using db command which was UserDB then we use "use test" command to switch to database test.
Insert the First Document to Make the Database Visible
Once you’ve created your database, you can insert a document into a collection to make the database visible in the database list. Here’s an example of inserting a document into a new collection:
db.users.insertOne({ name: "John Doe", age: 30 })
Once we insert a document, the TestDB database will appear in the list of databases when we run the show dbs command.
