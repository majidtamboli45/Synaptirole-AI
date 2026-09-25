# Capped Collections in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/capped-collections-in-mongodb/

Creating a capped collection in MongoDB involves using the createCollection() method to define a collection with a fixed size and a maximum number of documents. Capped collections automatically overwrite old documents when they reach their size limit, making them ideal for use cases like logging or caching where the most recent data is most important.
In this article, We will learn about the Capped Collections in MongoDB in detail.
How to Create a Capped Collection?
- We create the capped collections using the createCollection() method in MongoDB. When we create a new capped collection, we must specify the maximum size of the collection in bytes which will MongoDB pre-allocate for the collection. 
- The size of the capped collection contains a small amount of space for the internal overhead and if the value of the size field is less than or equal to 4096, then the capacity of the collection is 4096 bytes. 
- Otherwise, MongoDB will automatically increase the size to make it an integer multiple of 256 and specify a maximum document count using the max field. 
- If the given collection reaches the maximum size limit before it reaches the maximum document count then MongoDB removes older documents to create space for the new document.
Syntax:
db.createCollection(<name>, {capped: <boolean>, autoIndexId: <boolean>, size: <number>, max: <number>, storageEngine: <document>, validator: <document>, validationLevel: <string>, validationAction: <string>, indexOptionDefaults: <document>, viewOn: <string>, pipeline: <pipeline>, collation: <document>, writeConcern: <document>})
Parameters:
- name: It represents the name of the collection and it is of string type.
- options: It is an optional parameter.
Optional parameters:
- capped: It is used to create a capped collection. If the value of this field is true then you must specify the maximum size in the size field. It is of boolean type.
- autoIndexId: If the value of this field is false then it disables the automatic creation of an index on the _id field. It is of boolean type.
- size: It specifies the maximum size of the collection in bytes. It is of number type.
- max: It specifies the maximum number of documents allowed in the capped collection. It is of number type.
- storageEngine: It is available only for the WiredTiger storage engine only. It is of the document type.
- validator: It specifies the validation rules for the collection. It is of the document type.
- validationLevel: It illustrates how strictly MongoDB applies the validation rule on the existing document during updates. It is of string type.
- validationAction: It illustrates whether to error on invalid documents or just warn about the violations but allows invalid documents to be inserted. It is of string type.
- indexOptionDefaults: It allows the user to specify the default configuration for indexes when creating a collection. It is of document type.
- viewOn: Name of the source collection or view from which to create the view. It is of string type.
- pipeline: It is an array that contains the aggregation pipeline stages. Or using this parameter we can apply pipeline to the view or viewOne collection. It is of an array type.
- collation: It specifies the default collation from the given collection. It is of the document type.
- writeConcern: It expresses the write concern for the operation. If you want to use default write concern then avoid this parameter. It is of document type.
Examples of Capped Collections in MongoDB
In the following example, we are working with the "gfg" database in which we are creating a new capped collection of name "student" with maximum document capacity "4" using createCollection() method.
db.createCollection("student", {capped:true, size:10000, max:4})
Output:
Now we insert the documents in the student collection:
After insert documents, we will display all the documents present in the student collection using find() method.
Now, if we try to insert one more document, it will override the existing document. In the example, we are inserting a new document with the name Akash that overrides the existing document with the name Mihir:
After inserting one or more document:
How to check if the collection is capped or not?
We can check whether the collection is capped or not with the isCapped() method in MongoDB. This method returns true is the specified collections capped collection. Otherwise, return, false.
Syntax:
db.Collection_name.isCapped()
Example:
db.student.isCapped()
Output:
After convert student collection to a capped:
How to convert a collection to a capped?
If there is an existing collection that we want to change it to capped, we can do it using the convertToCapped command. It changes the current collection to capped collection:
Syntax:
{
convertToCapped: <collection>,
size: <capped size>,
writeConcern: <document>,
comment: <any>
}
Example:
db.runCommand({"convertToCapped":"student",size:5000})
Before convert to capped:
After convert to capped:
Advantages of Capped Collections
- To return documents in insertion order, queries do not need an index, since it provides greater insertion throughput.
- Capped collections allow changes that match the size of the original document to ensure that the document does not change its position on the disk.
- Holding log files is useful.
Disadvantages of Capped Collections
- The update operation fails if the update of a document exceeds the original size of the collection.
- Deleting documents from a capped collection is not possible. If you want to delete all records from a capped collection, then use the given command:
{ emptycapped: Collection_name }
- Capped collection cant be shard.
Conclusion
Overall, Capped collections offer efficient data management for scenarios requiring fixed-size data storage with automatic overwriting of old entries. While they provide advantages like high insertion throughput and predictable document ordering, they come with limitations such as the inability to delete documents and constraints on collection size adjustments.
How to remove a capped collection in MongoDB?
To remove a capped collection, use the drop() method on the collection. This will delete the collection and all its documents.
What is a capped collection in MongoDB?
A capped collection in MongoDB is a fixed-size collection that automatically overwrites old documents when it reaches its size limit. It maintains insertion order and provides high throughput for insert operations, making it ideal for scenarios like logging or caching.
What is the collection size cap in MongoDB?
The collection size cap in MongoDB is specified in bytes when creating the capped collection. MongoDB will round up the size to an integer multiple of 256 bytes if necessary, with a minimum size of 4096 bytes
