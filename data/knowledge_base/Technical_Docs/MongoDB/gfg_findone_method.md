# findOne() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-findone-method/

The findOne() method fetches a single matching document from a MongoDB collection, making it ideal when only one specific result is needed.
- Returns one matching document; the order is undefined unless a sort is specified.
- Returns null when no document matches the criteria.
- Supports projection to include or exclude specific fields.
- Reduces overhead when only one document is required.
Syntax
db.collection.findOne(query, projection)
- db.collection: Refers to the collection from which you want to retrieve the document.
- findOne(): The method used to retrieve a single document.
- query: A document that specifies the criteria to match the desired document.
- projection (optional): A document that specifies the fields to include or exclude in the returned document.
Examples of MongoDB findOne()
Here are a few practical examples using the student collection:
[
{ "_id": ObjectId("6011c71f781ba1a1c1ffc5b1"), "name": "Nicol", "language": "C++" },
{ "_id": ObjectId("6011c71f781ba1a1c1ffc5b2"), "name": "Alen", "language": "python" },
{ "_id": ObjectId("6011c71f781ba1a1c1ffc5b3"), "name": "Tim", "language": "python" }
]
Example 1: Empty Query
Retrieve a single document from the student collection.
Query:
db.student.findOne({})
Output:
{ "_id": ObjectId("6011c71f781ba1a1c1ffc5b1"), "name": "Nicol", "language": "C++" }
Example 2: Query Specification
Retrieve a document where the name is "Alen".
Query:
db.student.findOne({ name: "Alen" })
Output:
{ "_id": ObjectId("6011c71f781ba1a1c1ffc5b2"), "name": "Alen", "language": "python" }
Example 3: Include Specific Fields
Retrieve a document where the name is Tim and return only the name and language fields.
Query:
db.student.findOne({ name: "Tim" }, { _id: 0, name: 1, language: 1 })
Output:
{ "name": "Tim", "language": "python" }
Example 4: Exclude a Field
Retrieve a document where the name is "Nicol" and return all fields except the _id field.
Query:
db.student.findOne({ name: "Nicol" }, { _id: 0 })
Output:
{ "name": "Nicol", "language": "C++" }
Example 5: Matching Documents
Retrieve a document where the language is "python". If no document matches the criteria, findOne() returns null.
Query:
var result = db.student.findOne({ language: "python" });
print(result);
Output:
{ "_id": ObjectId("6011c71f781ba1a1c1ffc5b2"), "name": "Alen", "language": "python" }
