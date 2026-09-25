# Update Multiple Documents Using MongoShell

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-update-multiple-documents-using-mongoshell/

In MongoDB, you can update multiple documents in the collection using Syntax:  
Database: GeeksforGeeks
Collection: employee
Document: three documents that contain the details of the employees in the form of field-value pairs.
db.collection.updateMany() method. This method updates all the documents in the collection that match the given filter.
updateMany() is a mongo shell method, which can update multiple document. This method only accepts the documents that contain update operator expressions.
 
- updateMany() method can be used in the multi-document transactions.
- When you update your documents the value of _id field in not change.
- It also adds new fields in the documents.
Syntax:  
db.collection.updateMany(
    <filter>,
    <update>,
   {
     upsert: <boolean>,
     writeConcern: <document>,
     collation: <document>,
     arrayFilters: [ <filterdocument1>, <filterdocument2>... ],
     hint: <document|string>        
   }
)
Parameters: 
filter: First parameter of this method. It specifies the selection criteria for the update. The type of this parameter is document. If it contains empty document, i.e, {}, then this method will update all the documents of the collection with the update document.
update: Second parameter of this method. The type of this parameter is document or pipeline and it contains modification that will apply to the documents. It can be a update Document(only contain update operator expressions) or aggregation pipeline(only contain aggregation stages, i.e, $addFields, $project, $replaceRoot).
Optional Parameters: 
Return: This method will return a document that contains a boolean acknowledged as true (if the write concern is enabled) or false (if the write concern is disabled), matchedCount represents the number of matched documents, modifiedCount represents the number of modified documents, and upsertedId represents the _id of the upserted document.
- upsert: The value of this parameter is either true or false. If the value of this parameter is true, then the method will update the documents that match the given condition or if any of the documents in the collection does not match the given filter, then this method will insert a new document(i.e., update Document) in the collection. The type of this parameter is a Boolean and the default value of this parameter is false.
- writeConcern: It is only used when you do not want to use the default write concern. The type of this parameter is document.
- collation: It specifies the use of the collation for operations. It allows users to specify the language-specific rules for string comparison like rules for lettercase and accent marks. The type of this parameter is document.
- arrayFilters: It is an array of filter documents that indicates which array elements to modify for an update operation on an array field. The type of this parameter is an array.
- hint: It is a document or field that specifies the index to use to support the filter. It can take an index specification document or the index name string and if you specify an index that does not exist, then it will give an error.
Update All Documents
In MongoDB, you can update all the documents in the collection usingdb.collection.updateMany() method. 
Syntax:  
db.collection.updateMany({}, {update})
Examples: 
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: employee
Document: three documents that contain the details of the employees in the form of field-value pairs.
Updating all documents:
In this example, we are updating all the documents of employee collection. Or in other words, we are updating the salary of all the employees.db.employee.updateMany({}, {$set: {salary: 50000}})
