# MongoDB Shell

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-shell/

MongoDB Shell (mongosh) is an interactive, JavaScript-based command-line tool used to directly interact with and manage MongoDB databases.
- Perform CRUD (Create, Read, Update, Delete) operations.
- Execute database queries using rich JavaScript syntax.
- Run aggregation queries for data analysis.
- Work efficiently with large datasets.
- Interact with the database in real time through an interactive CLI.
MongoDB Shell Interface
The MongoDB Shell provides a direct interface between users and their MongoDB databases, making it easier to perform a wide variety of tasks. It simplifies operations like:
- Creating and deleting databases
- Inserting and modifying documents
- Running complex queries
- Managing collections
The interface uses JavaScript syntax, which allows developers to take advantage of its flexibility and execute complex queries. The immediate feedback and command history support make it perfect for both beginners and advanced users.
Features of MongoDB Shell
MongoDB Shell comes packed with essential features that enhance the database management experience. Here are some key highlights:
- Interactive Environment: It provides an interactive interface that executes commands instantly, making it ideal for learning and testing.
- JavaScript-Based: Since the shell uses JavaScript, you can leverage its rich capabilities to manipulate data and execute complex queries.
- Support for CRUD Operations: It performs all Create, Read, Update and Delete (CRUD) operations effortlessly through the shell.
- Aggregation Framework: Access advanced data processing features using the aggregation framework.
- Cross-Platform Compatibility: It uses MongoDB Shell on various operating systems, including Windows, macOS and Linux.
Getting Started with MongoDB Shell
Install MongoDB Shell, launch it from the terminal or command prompt, connect to MongoDB, and start interacting with databases using commands.
1. Install MongoDB Shell:
- Download the MongoDB Shell from the official MongoDB website.
- Follow the installation guide for your operating system (Windows, macOS, or Linux).
2. Launch the Shell:
- Open your terminal or command prompt.
- Type mongosh to start the MongoDB Shell.
3. Access Help:
- Type help within the shell to get a list of available commands and their descriptions.
Connecting to MongoDB using MongoDB Shell
To connect to a MongoDB deployment, you need a connection string. The connection string typically includes your MongoDB instance's address and authentication details.
To connect to a MongoDB Atlas cluster, use the following command:
mongosh "mongodb+srv://mycluster.abcd1.mongodb.net/myFirstDatabase" --apiVersion 1 --username <username>
Once connected, you can start querying your database and performing various tasks.
Basic MongoDB Shell Commands
Some fundamental commands and operations you can perform using MongoDB Shell:
1. Show Databases: To view the list of databases, use the command:
show dbs
2. Switch Database: You can switch to a specific database using the use command.
use mydatabase
3. Show Collections: To list all collections within the current database, use:
show collections
4. Insert Document: To insert a document into a collection, use the insertOne() or insertMany() methods.
db.collection.insertOne({name: "Alice", age: 25})
5. Find Documents: To query documents in a collection.
db.collection.find()
Advanced MongoDB Shell Operations
As you become more proficient with MongoDB Shell, you can perform more advanced operations, such as:
1. Aggregation: MongoDB’s aggregation framework allows you to process data records and return computed results. For example:
db.orders.aggregate([
{ $match: { status: "completed" } },
{ $group: { _id: "$customer_id", total: { $sum: "$amount" } } }
])
2. Indexing: Indexes are used to improve query performance. You can create indexes in MongoDB Shell:
db.collection.createIndex({ name: 1 })
3. Updating Documents: Update one or more documents in a collection using updateOne() or updateMany():
db.collection.updateOne(
{ name: "Alice" },
{ $set: { age: 26 } }
)
4. Deleting Documents: To delete documents from a collection:
db.collection.deleteOne({ name: "Alice" })
