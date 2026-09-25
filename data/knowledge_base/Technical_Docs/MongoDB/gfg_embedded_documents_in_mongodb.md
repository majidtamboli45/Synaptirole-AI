# Embedded Documents in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-embedded-documents/

MongoDB’s Embedded (Nested) Documents allow you to store documents inside other documents, enabling hierarchical data structures and provides faster access to related data, especially in read-heavy workloads where related data is frequently accessed together within a single query.
- Stores documents within documents (nested structure).
- Represents hierarchical relationships naturally.
- Enables single-query retrieval of related data.
- Reduces the need for cross-collection joins.
Notes - In MongoDB, you can only nest documents up to 100 levels. The overall document size must not exceed 16 MB.
Creating Embedded Documents
Creating embedded documents involves structuring related data as sub-documents within a parent document using nested fields.
- Uses nested curly braces {} to embed documents within documents.
- Stores related data as sub-documents under a parent field.
- Supports multi-level nesting for hierarchical structures.
- Enables single-query access to related data.
Syntax:
db.collection.insertOne({
field1: value1,
field2: value2,
embeddedField: {
subField1: value1,
subField2: value2,
nestedField: {
innerField1: value1
}
}
})
Example 1: In the GeeksforGeeks database, the Courses collection stores a document where the name field is an embedded document containing first, middle, and last fields.
Example 2: In the GeeksforGeeks database, we add another document to the Courses collection where courseDetails is an embedded document containing course info and a nested paymentDetails sub-document.
So, overall the Courses collection contains two documents and these documents contain nested documents.
