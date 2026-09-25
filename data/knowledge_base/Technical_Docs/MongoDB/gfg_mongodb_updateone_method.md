# MongoDB updateOne() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-updateone-method-db-collection-updateone/

The updateOne() method in MongoDB updates the first document that matches a specified condition in a collection. It is used to change fields or values in a single matching document without affecting others.
Syntax
db.collection.updateOne(<filter>, <update>, {
upsert: <boolean>,
writeConcern: <document>,
collation: <document>,
arrayFilters: [<filterdocument1>, ...],
hint: <document|string> // Available starting in MongoDB 4.2.1
})
- <filter>: Criteria to select the document to update.
- <update>: Modifications to apply (document or pipeline).
- upsert: false by default; true inserts a new document if none match.
- writeConcern: Overrides the default write concern.
- collation: Language-specific rules for string comparison.
- arrayFilters: Filters specifying which array elements to update.
- hint: Specifies which index to use for the operation.
Return value of updateOne()
This method returns a document that contains the following fields:
- matchedCount: This field contains the number of matched documents.
- modifiedCount: This field contains the number of modified documents.
- upsertedId: This field contains the _id for the upserted document.
- acknowledged: Indicates whether the write operation was acknowledged (true by default unless write concern is set to w: 0).
Examples of MongoDB updateOne() Method
Let’s go over a few examples to understand how updateOne() works in MongoDB. In the following examples, we are working with:
- Database: gfg
- Collection: student
- Document: Three documents contain name and age of the students.
Example 1: Update an Integer Value in the Document
Update the age of the student whose name is Alen.
Query:
db.student.updateOne({Name: "Alen"}, {$set:{age:25}})
Output:
Example 2: Update a String Value in the Document
Update the first matched name from Ron to Ryan (same data type).
Query:
db.student.updateOne({Name:"Ron"},{$set:{Name:"Ryan"}})
Output:
Example 3: Insert a new field in the document
Add a new field named class with the value 3 to the document where the student’s name is Kim.
Query:
db.student.updateOne({Name: "Kim"}, {$set:{class: 3}})
Output:
Example 4: Update using Update Operator Expressions
Update the first document where name is "Kim" to set age to 25:
Query:
db.student.updateOne({ name: "Kim" }, { $set: { age: 25 } })
Output:
Example 5: Update with Aggregation Pipeline
Increment the age of the first matched document where name is "Kim" using the aggregation pipeline.
Query:
db.student.updateOne({ name: "Kim" }, [{ $set: { age: { $add: ["$age", 1] } } }])
Output:
Example 6: Update with Upsert
Updating the document with name "Clevin" if it exists; otherwise, inserting a new document with name "Clevin" and age 28.
Query:
db.student.updateOne({ Name: "Clevin" }, { $set: { age: 28 } }, { upsert: true })
Output:
