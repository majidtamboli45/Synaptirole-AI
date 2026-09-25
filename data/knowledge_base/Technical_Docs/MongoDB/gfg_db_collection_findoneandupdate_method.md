# db.collection.findOneAndUpdate() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-db-collection-findoneandupdate-method/

The MongoDB findOneAndUpdate() method is used to update the first matched document in a collection based on the selection criteria. It offers various options such as sorting, upserting, and returning the updated document. This method is a part of MongoDB's CRUD operations and provides an easy-to-use interface for handling document updates efficiently.
What is FindOneAndUpdate() in MongoDB?
The MongoDB findOneAndUpdate() method updates the first matched document in the collection that matches the selection criteria. If more than one document matches the selection criteria then it updates only the first matched document. When we update the document, the value of the _id field remains unchanged.
This method will return the original document but if we want to return the updated document then we have to set the value of the returnNewDocument parameter to true. It takes three parameters, the first one is the selection criteria, the second one is the new data to be updated and the remaining are optional. Using this method we can also replace embedded documents. We can also use this method in multi-document transactions.
Syntax:
db.collection.findOneAndUpdate(
selection_criteria: <document>,
update_data: <document>,
{
projection: <document>,
sort: <document>,
maxTimeMS: <number>,
upsert: <boolean>,
returnNewDocument: <boolean>,
collation: <document>,
arrayFilters: [ <filterdocument1>, ... ]
})
Parameters:
- selection_criteria: (Required) A document containing the conditions used to find the document to be updated.
- update_data: (Required) A document that specifies the modifications to be made to the selected document.
- Optional Parameters:
  - projection: Specifies which fields should be included or excluded in the returned document.
  - sort: Determines the document to update when multiple documents match the selection criteria.
  - maxTimeMS: Sets the maximum time (in milliseconds) for the operation to complete.
  - upsert: If true, creates a new document if no document matches the selection criteria.
  - returnNewDocument: If true, returns the updated document instead of the original document.
  - collation: Defines language-specific rules for string comparison.
  - arrayFilters: Allows modification of specific elements in an array field.
- projection: Specifies which fields should be included or excluded in the returned document.
Return:
- Default: Returns the original document.
- If returnNewDocument is true: Returns the updated document.
Examples of findOneAndUpdate() in MongoDB
In the following examples, we are working with:
- Database: gfg
- Collections: student
- Document: Three documents contains the details of the students
Example 1: Update A Document
In this example, we update the first matched document according to the selection criteria(i.e., name:"Nikhil") by a new document(i.e., {$inc:{score:4}} - the value of the score field is increase by 4) and return the original document:
Query:
db.student.findOneAndUpdate({name:"Nikhil"},{$inc:{score:4}})
Output
Explanation: The document where name: "Nikhil" will have the score field incremented by 4. The method will return the original document unless returnNewDocument is specified.
Example 2: Update Embedded Document
Here, we update the math field inside the score embedded document for the student "Ashok" by increasing it by 50.
Query:
db.student.findOneAndUpdate({name:"Ashok"},{$inc:{"score.math":50}})
Output
Explanation: The score.math field inside the document for "Ashok" will be incremented by 50.
Example 3: Update Document and return the Updated Document
Here, we update the first matched document according to the selection criteria(i.e., name:"Vishal") by a new document(i.e., {$inc:{score:4}} - the value of the score field is increase by 4) and return the new updated document because we set the value of the returnNewDocument to true.
Query:
 db.student.findOneAndUpdate(
{ name: "Vishal" },
{ $inc: { score: 4 } },
{ returnNewDocument: true }
)
Output:
Explanation: The updated document for "Vishal" will be returned, with the score field incremented by 4.
Example 4: Update Document with Upsert
This example demonstrates the upsert option. Let's Update the document for "John" to set the language to "Java" and score to 300, or insert a new document if "John" does not exist.
Query:
db.student.updateOne(
{ name: "John" },
{ $set: { language: "Java", score: 300 } },
{ upsert: true }
);
Output:
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1, "upsertedId" : { "_id" : ObjectId("60226a70f19652db63812e8a") } }
Explanation: This query updates the document where the name is "John" to set the language to "Java" and score to 300. If no document matches, it inserts a new document with these values (upsert).
Example 5: Sort And Update A Document
In this example, we find the student with the highest score and update their language to "JavaScript"
Query:
db.student.find().sort({ "score": -1 }).limit(1).forEach(function(doc) {
db.student.updateOne({ "_id": doc._id }, { $set: { language: "JavaScript" } });
});
Output:
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
Explanation: This query sorts the documents by score in descending order and updates the first document found by setting the language to "JavaScript".
Best Practices for Using findOneAndUpdate()
- Use Sorting Carefully: When using the sort parameter, ensure that it is needed for your use case. Overusing sorting can introduce performance overhead, especially on large datasets.
- Avoid Complex Queries in Loops: If performing findOneAndUpdate() in loops, try to minimize the number of queries by optimizing the selection criteria.
- Use returnNewDocument Wisely: By default, MongoDB returns the original document. Only setreturnNewDocument totrue if you need the updated document immediately.
Conclusion
The findOneAndUpdate() method in MongoDB is an invaluable tool for performing atomic updates on a single document. It offers a range of options to fine-tune the behavior of the operation, such as sorting, upserting, and returning the updated document. By understanding its various parameters and options, developers can efficiently update documents based on specific criteria and manage their MongoDB collections effectively.
