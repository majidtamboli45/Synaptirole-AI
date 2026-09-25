# Import data to MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/import-data-to-mongodb/

MongoDB’s powerful mongoimport tool allows you to easily import data from external files like JSON, CSV, and TSV into your MongoDB collections, making data migration, backup, and integration easier. This utility makes it easy to load data from external sources into MongoDB collections and makes it a necessity for database administrators. In this article, We will explain how to Import data to MongoDB with multiple formats in detail.
How to import data in MongoDB
mongoimport is a command-line utility bundled with MongoDB Database Tools. It enables you to import data files (JSON, CSV, TSV) directly into MongoDB databases and collections. This tool is critical when you want to migrate data from other sources or load bulk data efficiently. 
Importing data into MongoDB is critical when migrating or backing up data. If you're looking to manage data imports and other database operations in full-stack applications, the Full Stack Development with Node JS course offers step-by-step guidance on handling MongoDB data imports.
Setting Up mongoimport
Below are the steps to follow for Import data to MongoDB as defined below:
Step 1: To use mongoimport tool we have to first download the MongoDB database tools .zip file from here. Here, we are going to download it for Windows.
Step 2: After downloading the zip file and unzip the downloaded folder.
Step 3: Goto MongoDB bin folder and copy-paste the bin folders all .exe files into the MongoDB bin folder[C:\Program Files\MongoDB\Server\4.4\bin].
How to Import Data into MongoDB
Importing data varies depending on the file format. Below are step-by-step examples for importing JSON, CSV, and TSV files.
1. Import JSON Files into MongoDB
JSON files are a common format for MongoDB since documents are stored as BSON, a JSON-like format.
Syntax:
mongoimport --jsonArray --db database_name --collection collection_name --file file_location
To import JSON file you need to follow the following steps:
Step 1: Open a command prompt and give command mongod to connect with MongoDB server and don't close this cmd to stay connected to the server.
Step 2: Open another command prompt and run the mongo shell. Using the mongo command.
Step 3: Open one more command prompt window and direct it to bin folder[C:\Program Files\MongoDB\Server\4.4\bin] and now you are ready to import files in mongoDB database.
Example:
Suppose you want to import students.json into the student collection of the gfg database:
Before import data:
After creating mongod server open another command prompt and direct it to bin folder[C:\Program Files\MongoDB\Server\4.4\bin] and now you can import files in the MongoDB. Here, in this example, we are going to import the JSON file in the student collection of gfg database:
mongoimport --jsonArray --db gfg --collection student --file H:\students.json
Output:
Note: If the collection name is not specified then the collection name is created based on the first name of the file. Using these steps you can also import TSV files, simply using --type tsv.
2. Import CSV file in MongoDB
In MongoDB, we can also import csv file into two ways:
1. With header row: We can import data with header row with the help of --header that shows the name of the fields will use the first line of the CSV file.
Syntax:
mongoimport --db database_name --collection collection_name --type csv --file file_location --header
Example: Import students.csv with a header row into the student collection:
mongoimport --db gfg --collection student --type csv --file H:\students.csv --header
Output:
2. Without header row: We can import data without header row by excluding --header. But in the place of the header, we have to put --fields that show the name of the field that we want to give. Field names are separated by a comma.
Syntax:
mongoimport --db database_name --collection collection_name --type csv --fields field_names --file file_location
Example: Import students.csv without header row specifying fields name and age:
mongoimport --db gfg --collection student --type csv --fields name,age --file H:\students.csv
Output:
3. Import TSV Files into MongoDB
Importing TSV (Tab-Separated Values) files is similar to CSV but requires the --type tsv option. Replace --headerline with --fields if your TSV file lacks a header.
Syntax:
mongoimport --db <database_name> --collection <collection_name> --type tsv --file <file_path> --headerline
Verify Your Imported Data
After importing, open the Mongo shell and verify your data:
use gfg
db.student.find().pretty()
Additional Tips for mongoimport
- Default Collection Name:
 If you don’t specify a collection name using--collection , mongoimport automatically creates one based on the input file name.
- Overwrite or Append:
 By default, mongoimport appends documents to the collection. To drop the collection before importing, use the--drop flag.
- Specify Write Concern:
 Use the--writeConcern option to control the durability and acknowledgment level of the import operation.
Conclusion
The mongoimport command is a fast, powerful method of importing JSON, CSV, and TSV data into MongoDB collections. Through the steps outlined here, you can migrate external data into your MongoDB database with ease, supporting strong data management and scalability in applications. Proficiency with mongoimport speeds up your database operations, whether it's moving data, restoring a backup, or merging new data sources.
