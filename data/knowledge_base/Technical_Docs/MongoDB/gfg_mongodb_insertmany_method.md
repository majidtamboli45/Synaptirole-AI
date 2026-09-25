# MongoDB insertMany() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-insertmany-method-db-collection-insertmany/

insertMany() inserts multiple documents in one operation, improving performance and efficiency.
- Adds many documents at once.
- Can be more efficient than single inserts depending on batch size, network conditions, and workload.
- Efficient for large datasets.
Syntax:
db.collection_name.insertMany([<document 1>, <document 2>, ...],{writeConcern: <document>,ordered: <boolean>})
- <document1>, <document2>, … : Array of documents to insert.
- writeConcern (optional): Overrides the default write concern.
- ordered (optional): true inserts in order (default); set false for unordered inserts.
Return Type of insertMany()
The insertMany() method returns an object that includes:
- acknowledged: A boolean that is true if the write concern was enabled, and false if it was disabled.
- insertedIds: An object containing the _id values of the inserted documents.
Examples of Using insertMany() in MongoDB
We’ll assume we’re working with a collection called student, which contains information about students such as their name and age.
Example 1: Insert Multiple Documents in a Single Operation without Specifying an _id field
We insert the array of documents that contains the name and age of the students.
Query:
db.student.insertMany([{name:"Ryan",age:20},  {name:"Ron",age:24}, {name:"Kim",age:26}])
Output:
Three documents are inserted into the student collection in a single operation.
Example 2: Insert Several Documents Specifying an _id Field
The query inserts multiple documents with custom _id values into the student collection, and MongoDB throws a duplicate key error if any _id already exists.
Query:
db.student.insertMany([{ _id: "stu200", name: "Luca", age: 20 }, { _id: "stu201", name: "Tim", age: 24 }])
Output:
The documents are inserted successfully with the given _id, preventing automatic ObjectId generation. If _id is duplicated, MongoDB will reject the insert operation for that document.
Error Handling
During bulk operations like insertMany(), MongoDB may throw a BulkWriteError (e.g., due to duplicate _id values), which can be handled using a try–catch block in application code.
- Duplicate Key Errors: Ensure no duplicates in unique indexed fields, and use { ordered: false } to continue inserting remaining documents despite errors.
- Validation Errors: Ensure all documents meet schema validation rules.
- Network Issues: Implement retry logic to handle transient network errors.
- Error Handling: Examine error details to understand and address specific issues.
var docs = [ /* array of documents */ ]
db.collection.insertMany(docs, { ordered: false })
.then(result => console.log(result))
.catch(error => {
if (error.name === "BulkWriteError") {
error.writeErrors.forEach(writeError => {
console.error("Document index:", writeError.index);
console.error("Error message:", writeError.errmsg);
});
} else {
console.error("Unexpected error:", error);
}
});
This approach helps identify and handle BulkWriteError effectively.
Unordered Inserts
Unordered inserts in MongoDB allow remaining documents to be inserted even if some insert operations fail.
- Continues inserting documents despite individual failures.
- Prevents the entire operation from stopping due to one error.
- Implemented using insertMany() with ordered: false.
- Useful for bulk insert operations.
Query:
db.student.insertMany(
[
{_id:"stu203",name:"Sophia",age:28},
{_id:"stu206", name:"Emma", age:25}
],
{ordered: false}
)
Output:
