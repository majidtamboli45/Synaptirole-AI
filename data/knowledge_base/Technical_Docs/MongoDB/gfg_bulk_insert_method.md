# Bulk.insert() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-bulk-insert-method/

In MongoDB, the Bulk.insert() method is used to perform insert operations in bulk. Or in other words, the Bulk.insert() method is used to insert multiple documents in one go. To use Bulk.insert() method the collection in which data has to be inserted must already exist.
We will discuss the following two types of insertion:
Syntax:
Bulk.insert(<document>);
Parameter:
document: The document that has to be inserted.
Examples:
In the following examples, we are working with:
Database: myDatabase
Collection: students
Unordered Insertion of documents:
Now, let's use the below commands to make an object of Bulk using initializeUnorderedBulkOp() and use Bulk.insert() to insert multiple documents. Here, the initializeUnorderedBulkOp() method is used to generate an unordered list that MongoDB runs in bulk.
var bulk = db.students.initializeUnorderedBulkOp();
bulk.insert( { first_name: "Sachin", last_name: "Tendulkar" } );
bulk.insert( { first_name: "Virender", last_name: "Sehwag" } );
bulk.insert( { first_name: "Shikhar", last_name: "Dhawan" } );
bulk.insert( { first_name: "Mohammed", last_name: "Shami" } );
bulk.insert( { first_name: "Shreyas", last_name: "Iyer" } );
bulk.execute();
Let's check the inserted documents using the below command:
db.students.find();
Ordered Insertion of documents:
Now, let's use the below commands to make an object of Bulk using initializeOrderedBulkOp() and use Bulk.insert() to insert multiple documents. Here, the initializeOrderedBulkOp() method is used to generate an ordered list that MongoDB runs in bulk.
var bulk = db.students.initializeOrderedBulkOp();
bulk.insert( { first_name: "Robin", last_name: "Marvin" } );
bulk.insert( { first_name: "John", last_name: "Hudson" } );
bulk.insert( { first_name: "Nancy", last_name: "Drew" } );
bulk.insert( { first_name: "Tom", last_name: "Wheeler" } );
bulk.insert( { first_name: "Anna", last_name: "Ryder" } );
bulk.execute();
Let's check the inserted documents. Since we have inserted 5 more items into the collection, run the below command to get the last 5 items from the collection.
db.students.find().sort({'_id':-1}).limit(5).pretty()
