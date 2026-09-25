# MongoDB Database Deletion Using MongoShell

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-delete-database-using-mongoshell/

MongoDB organizes data into databases, collections, and documents with a flexible, schema-flexible model.
- NoSQL database with dynamic schema support.
- Databases group related collections.
- Documents are the basic data units.
- Adapts easily to changing data structures.
Database in MongoDB
A MongoDB database groups collections that store documents and can host multiple databases on one server.
- Database acts as a container for collections.
- Collections are like tables in relational databases.
- Stores data as documents.
- Supports multiple databases per server.
- Scales for diverse application needs.
Collection in MongoDB
A collection groups related documents in MongoDB without enforcing a fixed schema.
- Similar to tables in relational databases.
- Does not enforce a fixed schema.
- Stores multiple related documents.
- Documents can have different fields.
[
{
"Name": "Alen",
"Age": 24,
"Gender": "Male"
},
{
"Name": "Kim",
"Age": 32,
"Gender": "Male"
},
{
"Name": "Lee",
"Age": 21,
"Gender": "Female"
}
]
Document in MongoDB
A document is MongoDB’s basic data unit, stored as field–value pairs with flexible structure.
- Smallest unit of data in MongoDB.
- Stored as field–value pairs.
- Structure can vary within a collection.
- Enabled by dynamic schema design.
{
"Name": "Adam",
"Age": 24,
"Gender": "Male"
}
MongoDB Shell (mongosh)
MongoDB Shell (mongosh) is a command-line JavaScript interface for managing and querying MongoDB.
- Interactive CLI for MongoDB operations.
- Supports querying and updating data.
- Used for database and collection management.
- Helpful for development and administration.
Deleting a Database in MongoDB
Deleting a database in MongoDB is a straightforward process using the db.dropDatabase() command. This command permanently removes the currently selected database along with all its collections and documents.
Syntax
 db.dropDatabase()
- Drops the currently selected database.
- Permanently deletes all its collections and data.
- Deletes the currently selected database (the default context is ‘test’ if no database is explicitly selected).
- Operation cannot be undone.
Example 1: To delete the userDB database, first select it using the use userDB command.
Query:
// Step 1: Select the database to delete
use userDB
// Step 2: Drop the selected database
db.dropDatabase()
Output:
This confirms that the database userDB has been deleted.
Example 2: Delete a Database that is not currently selected (by switching to it first).
Follow these steps:
1. Check the Current Database:
db
This command returns the name of the currently selected database.
2. List All Databases:
show dbs
This command lists all the available databases on the MongoDB server.
3. Select the Database to Delete:
use adminDB
Replace adminDB with the name of the database you want to delete.
4. Delete the Selected Database:
db.dropDatabase() This confirms that the adminDB database has been deleted successfully.
Important Points to Remember
Here are some important points to be remembered:
- Deleting the Default Database: If no database is selected, the db.dropDatabase() command deletes the default test database.
- Irreversible Operation: Deleting a database is a permanent operation. Ensure you have backups if required.
- Admin Privileges: Ensure you have the necessary permissions to delete databases.
- No Impact on Other Databases: Deleting a database does not affect other databases on the same server.
