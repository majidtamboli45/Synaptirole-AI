# Transactions in Mongoose

> Source: https://www.geeksforgeeks.org/mongodb/transactions-in-mongoose/

Transactions in Mongoose let you use MongoDB’s ACID transactions easily within Node.js applications using Mongoose models.
- Built on MongoDB transactions, providing ACID guarantees depending on deployment configuration (e.g., replica set or sharded cluster) and settings like writeConcern and readConcern.
- Uses sessions to manage transactions.
- Supports multi-document/multi-collection operations.
- Ensures all-or-nothing commit or rollback.
Mongoose Transactions Setup
Here are the steps to set up transactions in Mongoose:
Step 1: Setting Up Mongoose in Your Node.js Application
Before implementing transactions, ensure Mongoose is installed and properly connected to your MongoDB instance in your Node.js application.
import mongoose from 'mongoose';
Step 2: Creating a Session for Transactions
Transactions in Mongoose are handled using sessions, which can be created from the default Mongoose connection or a custom connection.
const session = await mongoose.startSession();
Step 3: Performing Operations within a Transaction
Transactions can be executed using withTransaction() or Connection#transaction() with automatic commit and rollback handling.
await session.withTransaction(async () => {
await Customer.create([{ name: 'Test' }], { session });
});
await session.endSession();
Transactions with Mongoose Documents
When a document is retrieved using a session in Mongoose, subsequent save() operations automatically use that session. The associated session for a document can be accessed or assigned using doc.$session().
Now let's understand this with the help of example:
const UserModel = db.model('User', new Schema({ name: String }));
let userSession = null;
return UserModel.createCollection()
  .then(() => db.startSession())
  .then(session => {
    userSession = session;
    userSession.startTransaction();
    return UserModel.create(
      [{ name: 'john' }],
      { session: userSession }
    );
  })
  .then(() => {
    return UserModel.findOne({ name: 'john' }).session(userSession);
  })
  .then(user => {
    assert.ok(user.$session());
    user.name = 'smith';
    return user.save({ session: userSession });
  })
  .then(() => {
    return userSession.commitTransaction();
  })
  .then(() => {
    userSession.endSession();
    return UserModel.findOne({ name: 'smith' });
  })
  .then(result => {
    assert.ok(result);
  })
  .catch(err => {
    if (userSession) {
      return userSession.abortTransaction().finally(() => {
        userSession.endSession();
      });
    }
    throw err;
  });
- Initialize the User model, start a session, and create a user (john) within a transaction.
- Query using the same session, update the name to smith, and save.
- Commit the transaction and terminate the session.
Transactions with the Aggregation Framework
Mongoose allows aggregation pipelines to run inside transactions by binding them to a session using the session() helper, which is useful for complex transactional analytics.
Now let's understand this with the help of example:
const EventModel = db.model('Event',
  new Schema({ createdAt: Date }), 'Event');
let eventSession = null;
let insertManyResult = null;
let aggregationResult = null;
return EventModel.createCollection()
  .then(() => db.startSession())
  .then(session => {
    eventSession = session;
    eventSession.startTransaction();
    const documentsToInsert = [
      { createdAt: new Date('2018-06-01') },
      { createdAt: new Date('2018-06-02') },
      // ... other documents ...
    ];
    return EventModel.insertMany(documentsToInsert, { session: eventSession });
  })
  .then(result => {
    insertManyResult = result;
    return EventModel.aggregate([
      // your aggregation pipeline here
    ]).session(eventSession);
  })
  .then(result => {
    aggregationResult = result;
    return eventSession.commitTransaction();
  })
  .then(() => {
    eventSession.endSession();
    return aggregationResult;
  })
  .catch(err => {
    if (eventSession) {
      return eventSession.abortTransaction()
        .finally(() => eventSession.endSession());
    }
    throw err;
  });
- Initialize the Event model, start a session, and begin a transaction.
- Perform insertMany() within the transaction using the same session.
- Execute Event.aggregate().session(session) as part of the transaction.
- Commit the transaction and end the session.
Manual Control & Rollbacks
Transactions in Mongoose can manage them manually for full control or use helper functions that handle rollbacks automatically.
1. Manual Transaction Control
For advanced users requiring fine-grained control, you can start a transaction manually using session.startTransaction(). This allows you to commit or abort the transaction explicitly.
Now let's understand this with the help of example:
const session = await mongoose.startSession();
session.startTransaction();
try {
  await Customer.create([{ name: 'Test' }], { session });
  
  // Perform additional operations...
  // Commit manually
  await session.commitTransaction(); 
} catch (error) {
    // Rollback on error
  await session.abortTransaction(); 
  console.error('Transaction failed:', error);
} finally {
  session.endSession();
}
- Starts a Mongoose session and begins a manual transaction.
- Creates a Customer document within the transaction.
- Commits the transaction if all operations succeed.
- Rolls back the transaction on error using abortTransaction().
- Ends the session in the finally block.
2. Automatic Rollbacks with withTransaction()
For simpler usage, session.withTransaction() automatically commits if all operations succeed or rolls back on error. When using withTransaction(), manual abortTransaction() is generally unnecessary and not recommended, as the transaction is automatically aborted when an error is thrown.
const session = await mongoose.startSession();
try {
  await session.withTransaction(async () => {
    await Order.create([{ item: 'Book' }], { session });
    
    if (someConditionFails) {
      await session.abortTransaction(); // Manual rollback
      throw new Error('Transaction aborted due to failed condition');
    }
  });
} catch (error) {
  console.error('Transaction failed:', error);
} finally {
  session.endSession();
}
- Starts a Mongoose session and executes a transaction via withTransaction().
- Creates an Order document within the transactional session.
- Automatically rolls back on thrown errors (manual abort is optional/redundant).
- Ensures resource cleanup by ending the session in finally.
