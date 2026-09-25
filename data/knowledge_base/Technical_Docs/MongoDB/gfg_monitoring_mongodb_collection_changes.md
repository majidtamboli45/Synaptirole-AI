# Monitoring MongoDB Collection Changes

> Source: https://www.geeksforgeeks.org/mongodb/how-to-listen-for-changes-to-a-mongodb-collection/

Tracking changes in MongoDB enables real-time updates and data synchronization without inefficient polling, using built-in mechanisms designed for streaming database changes.
- Enables real-time change tracking for responsive applications.
- Avoids inefficient polling by using event-driven mechanisms.
- Supports Change Streams for monitoring database changes.
- Uses oplog tailing for low-level change tracking and synchronization.
Track Changes in MongoDB
Real-time updates in MongoDB can be achieved by listening to database changes using built-in streaming mechanisms, avoiding inefficient polling and reducing load on the database server.
- Eliminates inefficient polling by reacting to real-time change events.
- Supports Change Streams for streaming inserts, updates, and deletes.
- Uses the watch() method to subscribe to collection or database changes.
- Provides oplog tailing for low-level change tracking and synchronization.
1. Change Streams
Change Streams were introduced in MongoDB 3.6 to provide a streamlined way to track changes in a MongoDB collection. They allow applications to subscribe to a continuous stream of data change events, providing a real-time data feed of changes happening in the database.
Use Change Streams:
- Create a Change Stream: Use the watch() method to create a change stream on a collection.
- Subscribe to Events: Listen for events such as 'insert', 'update', 'replace', 'delete', and 'invalidate'.
- React to Changes: Handle change events and update the application state or trigger appropriate actions.
Example: Opens a change stream on the collection and handles insert/update/delete events in real time.
const collection = db.collection("myCollection");
const changeStream = collection.watch();
changeStream.on("change", (change) => {
console.log("Change event:", change);
// Handle insert, update, delete, etc.
});
- Creates a real-time change stream on myCollection using watch().
- Listens for change events (insert, update, delete).
- Triggers a callback on each change event.
- Enables real-time reactions within the application.
2. The 'watch()' Method
The 'watch()' method in MongoDB allows applications to open a change stream against a collection, providing real-time notifications of data changes.
This method is particularly useful for applications that need to trigger actions or notifications in response to database updates.
Syntax:
const changeStream = collection.watch([pipeline], [options]);
- collection: The MongoDB collection to watch.
- pipeline: An optional array of aggregation pipeline stages to filter or transform the change events.
- options: Optional settings for the change stream.
Example: Consider a messages collection in a chat application. To listen for new messages, you can use the watch() method as follows:
const { MongoClient } = require("mongodb");
const uri = "your_mongodb_uri";
const client = new MongoClient(uri);
async function run() {
await client.connect();
const collection = client.db("chat").collection("messages");
const changeStream = collection.watch();
changeStream.on("change", (next) => {
console.log("New change:", next);
});
}
run();
Output:
When a new message is added to 'messages' collection, the change stream triggers the "change" event, logging something like:
New change: {
"_id": "...",
"operationType": "insert",
"fullDocument": {
"_id": "...",
"text": "Hello, World!",
"sender": "John Doe",
"timestamp": "2021-01-01T00:00:00Z"
},
"ns": {
"db": "chat",
"coll": "messages"
},
"documentKey": {
"_id": "..."
}
}
3. Oplog Tailing
MongoDB's oplog (operations log) is a capped collection that records all write operations that modify data in a MongoDB database.
Oplog tailing involves continuously querying the oplog to identify changes and react accordingly.
Use Oplog Tailing:
- Connect to the Oplog: Access the oplog collection from the local database.
- Query for Changes: Continuously monitor the oplog for new entries and process them.
- React to Changes: Handle oplog entries and apply appropriate actions based on the type of operation.
Example: Tailing oplog.rs streams low-level write events for real-time synchronization and change processing.
// Get a reference to the oplog collection in the local database
const oplog = db.collection('oplog.rs').find({}).sort({ $natural: -1 }).limit(1);
// Set up a change event listener on the oplog collection
oplog.on('change', (change) => {
// Log the oplog entry to the console
console.log('Oplog entry:', change);
// React to oplog changes here
})
- Gets a reference to the oplog.rs collection in the local database.
- Retrieves the latest oplog entry using $natural: -1 and limit(1).
- Listens for new oplog entries in real time.
- Logs each oplog change and triggers application reactions.
