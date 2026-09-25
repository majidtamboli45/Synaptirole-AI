# Update Single Document Using MongoShell

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-update-single-document-using-mongoshell/

In MongoDB, you can update a single document in the collection using Syntax:  
Examples: 
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: employee
Document: three documents that contain the details of the employees in the form of field-value pairs.
 db.collection.updateOne() method. This method updates a document in the collection according to the filter.
updateOne() is a mongo shell method, which can updates one document at a time. This method update the first document that satisfies the given condition in the collection. Or in other words, if multiple documents satisfy the given condition, then this method will update the very first document that matches the given filter or condition.
- updateOne() method only accepts a document that contains update operator expressions.
- This method can be used in the multi-document transactions.
- When you update your document the value of _id field remain unchanged.
- It also adds new fields in the document.
Syntax:  
db.collection.updateOne(
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
filter: First parameter of this method. It specifies the selection criteria for the update. The type of this parameter is document. If it contains empty document, i.e, {}, then this method will update the first document of the collection with the update document.
update: Second parameter of this method. The type of this parameter is document or pipeline and it contains modification that will apply to the document. It can be a update Document(only contain update operator expressions) or aggregation pipeline(only contain aggregation stages, i.e, $addFields, $project, $replaceRoot ).
Optional Parameters: 
Return: This method will return a document that contains a boolean acknowledged as true (if the write concern is enabled) or false (if the write concern is disabled), matchedCount represents the number of matched documents, modifiedCount represents the number of modified documents, and upsertedId represents the _id of the updated document.
- upsert: The value of this parameter is either true or false. If the value of this parameter is true, then the method will update the document that matches the given condition or if any of the documents in the collection does not match the given filter, then this method will insert a new document(i.e., update Document) in the collection. The type of this parameter is a Boolean and the default value of this parameter is false.
- writeConcern: It is only used when you do not want to use the default write concern. The type of this parameter is document.
- collation: It specifies the use of the collation for operations. It allows users to specify the language-specific rules for string comparison like rules for lettercase and accent marks. The type of this parameter is document.
- arrayFilters: It is an array of filter documents that indicates which array elements to modify for an update operation on an array field. The type of this parameter is an array.
- hint: It is a document or field that specifies the index to use to support the filter. It can take an index specification document or the index name string and if you specify an index that does not exist, then it will give an error.
Database: GeeksforGeeks
Collection: employee
Document: three documents that contain the details of the employees in the form of field-value pairs.
Updating first document:
In this example, we are updating the value of department field in the first document of the employee collection usingdb.collection.updateOne() method. Or in other words, we update the department of Sonu. So, before updating the department of Sonu is "Development" and now, after updating the department of Sonu is "HR".
db.employee.update({}, { $set: {department: "HR"}})
Here, $set is a update operator and it is used to update the value of department field.
 
Updating single document that matches the filter:
In this example, we are updating a single document in the employee collection that match the given filter, i.e., branch: "ECE". Or in other words, update the department to "Development" of the employee whose branch is ECE.
Updating Document:
In this example, we are updating a document in the employee collection. Here multiple documents matches the given filter, so this method will update the first document among these documents like as shown in the below image:
Updating multiple fields in the document:
In this example, we are updating multiple fields in the single document("_id" : ObjectId("5e49813692e6dfa3fc48dd74") ).
