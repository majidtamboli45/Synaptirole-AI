# MongoDB deleteOne() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-db-collection-deleteone/

The deleteOne() method in MongoDB removes a single document from a collection that matches a specified filter. It is useful for deleting a specific document based on given criteria, helping maintain the integrity and relevance of the data in the collection.
- Deletes one document based on the filter criteria.
- Removes only the first matching document; impact depends on the accuracy of the filter criteria.
- Helps maintain data integrity by selectively removing irrelevant or outdated documents.
- Can be used with various query operators to match documents based on complex conditions.
Syntax
db.Collection_name.deleteOne(selection_criteria:<document>, {writeConcern: <document>, collation: <document>, hint: <document|string>})
- selection criteria: Document specifying which documents to delete.
- writeConcern: Overrides the default write concern.
- collation: Defines language-specific rules for string comparison.
- hint: Specifies which index to use; must exist.
Return value of deleteOne()
This method returns a document that contains the following fields:
- acknowledged: Boolean field indicating whether the operation used write concern.
- deletedCount: This field contains the total number of deleted documents.
Examples of MongoDB deleteOne() Method
Some examples of the deleteOne method in MongoDB. In the following examples, we are working with:
- Database: gfg
- Collections: student
- Document: Four documents contain name and age of the students.
Example 1: Deleting the First Document in a Collection
Deleting first document from the student collection using an empty filter {}:
Query:
db.student.deleteOne({})
Output:
This will remove the first document in the student collection, irrespective of its content.
Example 2: Delete One Document that Match Selection Criteria
Delete the first matched document whose age is 22 from the student collection using the deleteOne() method.
Query:
db.student.deleteOne({age:22})
Output:
- The document with age: 22 is removed from the collection.
- If no document matches, no document is deleted.
Example 3: Deleting One Document When Multiple Documents Match the Filter
Deleting a document from the student collection. Here, two documents match the filter (i.e., branch: "CSE"), so this method deletes the first document among them.
Query:
db.student.deleteOne({ branch: "CSE" })
Output:
In this case, there are two documents with branch: "CSE", so only the first one is deleted.
Example 4: Deleting a Document from the 'student' Collection Based on Age
Delete the first matched document whose age is less than 19 from the student collection using the deleteOne() method.
Query:
db.student.deleteOne({age:{$lt:19}})
Output:
- The $lt operator is used to specify that we want to delete the first document where age is less than 19.
- This query ensures that only one document is deleted, even if multiple documents meet the condition.
Example 5: Using Collation for String Comparison
To delete a document with case-insensitive matching, you can specify collation:
Query:
db.student.deleteOne({ name: "clevin" }, { collation: { locale: "en", strength: 2 } })
Output:
- Collation ensures that "Clevin" and "clevin" are treated as equal for the purposes of the query.
- The strength: 2 parameter makes the comparison case-insensitive
Example 6: Specifying a Hint for Index Optimization
For collections with large datasets, specifying a hint can improve performance:
Query:
db.contributor.deleteOne(
{ name: "Lee" },
{ hint: "name_index" }
)
Output:
This command ensures that MongoDB uses the name_index index to optimize the query for deleting the document.
Common Errors and their Solutions
Understanding these common issues and their solutions can help you avoid unnecessary complications and ensure smooth operations.
1. Using deleteOne on a Capped Collection
Capped collections are fixed-size collections that do not allow deletions. Attempting to delete a document from a capped collection will result in an error.
- Error: "cannot remove from a capped collection"
- Solution: Check with db.collection.stats() and use an uncapped collection
2. Deleting Unintended Documents
If the filter criteria are too general or incorrect, deleteOne might delete a document you did not intend to remove.
- Issue: Broad filters delete wrong documents
- Solution Verify with findOne() or find() first
3. Performance Issues with Large Collections
Without an index, MongoDB will examine every document in the collection to find matches, resulting in slower performance.
- Issue: No index causes full collection scan.
- Solution: Create an index on the filter field.
Important Points for Using deleteOne()
Here are some important points to be remembered:
- Always Use Specific Filters: Avoid using empty filters ({}) unless intentionally deleting the first document in the collection.
- Test with Find First: Use findOne with the same filter to ensure that the document you intend to delete matches the criteria.
- Index Your Collections: Create indexes on fields commonly used in filters to enhance performance.
- Enable Write Concern: Use custom write concerns for critical operations to ensure proper acknowledgment of the operation.
