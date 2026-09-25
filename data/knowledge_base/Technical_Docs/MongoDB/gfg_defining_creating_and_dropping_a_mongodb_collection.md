# Defining, Creating and Dropping a MongoDB collection

> Source: https://www.geeksforgeeks.org/mongodb/defining-creating-and-dropping-a-mongodb-collection/

MongoDB, the most popular NoSQL database, is an open-source document-oriented database. The term ‘NoSQL’ means ‘non-relational’. It means that MongoDB isn’t based on the table-like relational database structure but provides an altogether different mechanism for storage and retrieval of data.
Document
It is the basic unit of MongoDB and a single record inside a collection is known as a document. It is a JSON object which has the data in the form of key-value pairs.
Collection
It is the grouping of documents. A collection belongs to a single database inside MongoDB. The collection the contains the data in the form of document just like the table of RDBMS which contains the data in the form of rows and columns.
Creating a MongoDB a collection
As a collection belongs to a single database so first we will have to create a database for creating a collection
STEP 1: First run the following command into your mongo shell or command promptmongo
STEP 2: Check all the existing databases by using the following commandshow dbs
STEP 3: Creating a database Here we are creating a database named as- geeksforgeeks
use geeksforgeeksIf the database geeksforgeeks is present it will switch to it, else it will create a new database name as geeksforgeeks and then switch to it as shown below.  
STEP 4: Create a Collection
Collection is created using createCollection() method.Collection name is passed as argument in the method.
Syntax:
db.createCollection('Collection_name');
Example : Create Student Collection
Query:
db.createCollection('Student');
Inserting Documents in the Collection
Inserting only one document at a time
db.collection.insertOne(document)
Inserting more than one document at a time
db.collection.insertMany([,document_1, document_2.....,]),
Editing a collection
db.collection.update(query, update)
query: An object for finding the document
Example: {"name":"shilpi"}
update: An object for updating the document with set command
Example: {$set:{"age":"23"}}
To edit a mongodb collection update function is used
Apply the query for finding the document which you want to update. In our collection we want to update collection having name as shilpi so query is:
{"name":"shilpi"}
Using the set command to modify the Field Name
Choose which Field Name you want to modify and then enter the new value accordingly into the query. In our collection we want to edit age value to 23 for name shilpi:
{$set:{"age":"23"}}
Dropping the collection
db.collection.drop()
It will return true if collection is deleted successfully.
