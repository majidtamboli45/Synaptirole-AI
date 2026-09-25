# MongoDB deleteMany() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-delete-multiple-documents-using-mongoshell/

The deleteMany() method in MongoDB is used to remove all documents from a collection that match a specified filter. It is ideal for bulk deletions, supports multi-document transactions, and ensures efficient data management.
- Deletes multiple documents that match a specified filter.
- Returns a result containing the number of deleted documents.
- Cannot be used on capped collections.
- Supports write concern and collation options.
Syntax
db.collection.deleteMany(<filter>, {writeConcern: <document>, collation: <document>})
- filter: Selection criteria for deletion, {} deletes all documents.
- writeConcern: Sets the write concern level for the operation.
- collation: Defines language-specific rules for string comparison.
- acknowledged: Indicates whether the operation was acknowledged (true by default unless write concern is set to w: 0).
- deletedCount: The total number of documents deleted.
Return Value of deleteMany()
The deleteMany() method returns a document containing:
- acknowledged: A boolean indicating whether the operation was acknowledged based on the write concern.
- deletedCount: The number of documents deleted (can be zero or more depending on the filter).
Examples of MongoDB deleteMany() Method
In the following examples we are working with:
- Database: GeeksforGeeks
- Collection: contributor
- Document: Four documents that contain the details of the contributors in the form of field-value pairs.
Example 1: Deleting Documents That Match a Filter
Deletes all documents in which language field contains C#.
Query:
db.contributor.deleteMany({ language: "C#" });
Output:
- The query { language: "C#" } matches two documents.
- Both matching documents are deleted.
- The operation returns deletedCount: 2, confirming that two documents were removed successfully.
Example 2: Deleting All Documents in a Collection
Deleting all the documents from the contributor collection by passing empty filter in the db.collection.deleteMany() method.
Query:
db.contributor.deleteMany({})
Output:
- Since the filter is {}, it matches all documents.
- Every document in the contributors collection is deleted.
- The output confirms the number of deleted documents.
Note: Use deleteMany({}) to remove all documents while keeping the collection and indexes, whereas drop() removes the entire collection including its structure and indexes.
Example 3: Using Query Operators with deleteMany()
Delete all contributors whose _id is greater than 2.
Query:
db.contributor.deleteMany({ _id: { $gt: 2 } });
Output:
- The condition { _id: { $gt: 2 } } selects documents where _id is greater than 2.
- Two matching documents are found and deleted.
- The operation confirms deletion with deletedCount: 2.
Best Practices for Using deleteMany() in MongoDB
Here are some best practices discussed:
- Always use a filter: An empty {} deletes all documents.
- Use indexes: Index the filter field to speed up deletion.
- Test before deleting: Run find() first to confirm matched documents.
- Set write concern for critical ops: Ensures reliable and consistent writes.
- Use collation when needed: Enables case-insensitive deletions.
