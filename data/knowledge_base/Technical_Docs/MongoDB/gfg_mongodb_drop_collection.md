# MongoDB Drop Collection

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-drop-collection/

Dropping a collection in MongoDB permanently removes the collection along with all its documents and indexes, helping maintain a clean and organized database.
- Uses the db.collection.drop() method.
- Deletes the entire collection and its documents.
- Also removes associated indexes.
- Operation is irreversible and must be used with caution.
- Useful for removing outdated data or restructuring databases.
Collection Drop Operation in MongoDB
The drop() method deletes a collection by locking it exclusively and notifying active change streams.
- Generates an invalidate event for open change streams.
- Acquires an exclusive lock on the collection during execution.
- May block operations on the collection during execution, depending on the storage engine and locking mechanism.
Syntax:
db.collection_name.drop({writeConcern: <document>})
- Parameters: Accepts optional parameters such as writeConcern.
- Optional Parameters: Specify write concern for db.collection.drop() instead of using the default.
- Returns: Returns a status document indicating success (e.g., { ok: 1 }), though older versions may return true or false.
Behaviour of MongoDB Drop()
- Dropping a collection is irreversible, meaning all the data in the collection will be permanently deleted.
- drop() takes an exclusive write lock, blocking other operations until complete.
- When a collection is dropped, all indexes associated with that collection are also deleted.
- The method cannot be used to drop system collections (e.g., collections starting with system).
- If the collection does not exist, no action is taken and no error is raised.
- On successful deletion, the method returns true.
Examples of MongoDB Drop Collection
We have collections called student and teacher in gfg database and we will perform all the operation on that collection for better understanding.
Example 1: We will drop the student collection in the gfg database.
db.student.drop()
Output:
true
It drops the student collection and all the indexes associated with the collection.
Example 2: We want to drop the teacher collection from the gfg database.
db.teacher.drop()
Output:
true
This method drops the teacher collection along with its documents.
