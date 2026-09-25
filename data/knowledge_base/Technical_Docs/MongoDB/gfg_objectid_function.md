# ObjectID() Function

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-objectid-function/

ObjectID() Function: MongoDB uses ObjectID to create unique identifiers for all the documents in the database. It is different than the traditional autoincrementing integer ID, but it comes with its own set of advantages. 
An ObjectID is a GUID (Globally Unique Identifier). GUIDs are generated randomly via an algorithm to ensure uniqueness. These IDs can be generated on the server, but as seen in the snippet above, they can be generated on the client as well. That means a client can generate the ID for a document it’s about to insert into the database.
Installation of mongodb module:
            javascript 
     
 Steps to run the program:
- You can visit the link to Install mongodb module. You can install this package by using this command.
npm install mongodb
- After installing mongodb module, you can check your mongodb version in command prompt using the command.
npm version mongodb
- After that, you can just create a folder and add a file for example, index.js. To run this file you need to run the following command.
node index.js
const { MongoClient, ObjectID } = require('mongodb');
const id = new ObjectID();
// Print new id to the console
console.log(id); 
- The project structure will look like this:
- Make sure you have installed mongodb module using following command:
npm install mongodb
- Run index.js file using below command:
node index.js
