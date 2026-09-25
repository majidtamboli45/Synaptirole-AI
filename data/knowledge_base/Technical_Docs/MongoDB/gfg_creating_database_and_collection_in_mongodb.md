# Creating Database and Collection in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/how-to-create-database-collection-in-mongodb/

MongoDB is a NoSQL database that stores data in flexible, JSON-like documents, enabling scalable, high-performance data management for modern applications.
- Designed for flexibility, scalability, and performance.
- Stores data as documents instead of tables and rows.
- Uses databases, collections, and documents.
- Schema-flexible structure supports dynamic data models.
- Enables horizontal scaling and high availability.
- Suitable for both small applications and large-scale data systems.
MongoDB Database and Collection Setup
Follow these steps to create databases and collections in MongoDB.
Step 1: Create a Database In MongoDB
In MongoDB, a database is created only when data is inserted. The use command switches to a database and creates it automatically when data is added if it does not already exist.
Syntax:
use database_name
Example: To create or switch to a database called gfgDB, you would use the following command:
- If the gfgDB database doesn’t exist, MongoDB will create it automatically once you insert data into it.
- If the database already exists, the use command simply switches the context to that database.
- Note that MongoDB doesn’t actually create the database until you store some data.
Check Existing Databases:
To see all the databases that already exist in your MongoDB instance, use the show dbs command:
show dbs
Output:
This command lists all the databases in your MongoDB instance (except empty database), including their respective sizes. To check the current database in use, we can use the db command:
db
This will return the name of the currently selected database, e.g., gfgDB
Step 2: Create a Collection in MongoDB
A collection in MongoDB is a group of schema-flexible documents, similar to a table in a relational databases, created explicitly or automatically on insertion.
Syntax:
db.createCollection(' collection_name' );
Example: To create a collection called Student, you would use the following command:
db.createCollection('Student');
- createCollection() explicitly creates an empty collection in MongoDB.
- Inserting a document automatically creates the collection if it doesn’t exist.
For example, running the following command will automatically create the Student collection if it doesn't exist:
db.Student.insertOne({Name: "Noah", age: 23})
Output:
Note:
- Collections are created automatically when the first document is inserted, so using createCollection() is optional.
- MongoDB allows for collections to contain documents with different fields and data types, which provides flexibility when structuring your data.
Step 3: Insert Documents into a Collection in MongoDB
Once a collection exists, add JSON-like documents using insert methods.
1. insertOne() Method
The insertOne() method in MongoDB is used to insert a single document into a collection.
Syntax:
db.collection_name.insertOne({ field1: value1, field2: value2, ... });
Example: Inserts a single document into a new collection.
db.myNewCollection1.insertOne( { name:"geeksforgeeks" } )
Output:
- insertOne() inserts a single document into a collection.
- If the collection does not exist, MongoDB automatically creates it.
- A collection named myNewCollection1 is created with one document containing the field name .
2. insertMany() method
insertMany() method inserts multiple documents in one operation, improving performance over single inserts.
Syntax:
db.collection_name.insertMany([{ field1: value1, field2: value2, ... }, { field1: value1, field2: value2, ... }, ... ])
Example: To create myNewCollection2, insert two documents.
db.myNewCollection2.insertMany([{name:"gfg", country:"India"}, {name:"Lucas", age:20}])
Output:
- The insertMany() method accepts an array of documents.
- Two documents are inserted, one for a student named "gfg" and another for a student named "Lucas".
Step 4: View Existing Collections
After inserting data, list all collections using the show collections command.
Syntax:
show collections
Example: If you're working in the gfgDB database and you want to see all the collections, simply run:
show collections
Output:
This shows that the Student collection exists within the gfgDB database.
Best Practices for Managing Databases and Collections
Here are some best practices:
- Naming Conventions: Always use meaningful, lowercase names for databases and collections, separating words with underscores (e.g., student_data).
- Indexes: MongoDB automatically indexes the _id field, and adding indexes on frequently queried fields improves performance.
- Schema Design: MongoDB is schema-flexible, but it is still recommended to design your collections in a way that ensures data consistency.
- Data Validation: Although MongoDB is schema-flexible, schema validation can be applied to enforce data integrity.
