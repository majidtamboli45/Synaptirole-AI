# How to Check Field Existence in MongoDB?

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-check-the-existence-of-the-fields-in-the-specified-collection/

MongoDB is a NoSQL database that offers a variety of operators to enhance the flexibility and precision of queries. One such operator is $exists, which is used to check the presence of a field in a document. 
In this article will learn about the $exists Operator in MongoDB by covering its syntax and practical applications. We will also learn about how to query data using Atlas Search.
How to Check Field Existence in MongoDB?
To check field existence in MongoDB, we can use the $exists operator. This operator allows us to query documents based on whether a particular field exists or does not exist. We will use the MongoDB $exists Operator with the examples along with the explanation and output defined below:
MongoDB $exists
- The MongoDB $exists operator in MongoDB is used to query documents where a particular field exists or does not exist.
- This operator can take a boolean value (true orfalse ):
  - true : It signifies that Matches documents that contain the field.
  - false : It signifies Matches documents that do not contain the field.
The basic syntax for using the $exists the operator is as follows:
{ field: { $exists: <boolean> } }
Query Data on Atlas by Using Atlas Search
MongoDB Atlas Search provides a powerful way to query our data using a rich set of features. To use MongoDB $exists in an Atlas Search query, we can use the $search stage in our aggregation pipeline. Here’s how we can use it:
Example: Using $exists in Atlas Search
Let's Write a MongoDB query to find all student documents that have the "grade" field using the Atlas Search's $search aggregation stage.
db.students.aggregate([
{
$search: {
"compound": {
"must": [
{ "exists": { "path": "grade" } }
]
}
}
}
])
Expalnation: In the query uses MongoDB's Atlas Search to return student documents where the "grade" field exists, using the $search aggregation stage with a compound operator to ensure the presence of the "grade" field.
Example of How to Check Field Existence in MongoDB
Let's consider a collection named students in the school database. This collection contains documents with information about students, but not all documents have the same fields. Here are some sample documents.
[
{ "_id": 1, "name": "Alice", "age": 18, "grade": "A" },
{ "_id": 2, "name": "Bob", "age": 20 },
{ "_id": 3, "name": "Charlie", "grade": "B" },
{ "_id": 4, "name": "David", "age": 22, "grade": "C" }
]
Example 1: Exists and Not Equal To
To find documents where the age field exists and is not equal to 18, we will use the following query.
db.students.find({ age: { $exists: true, $ne: 18 } })
Output:
[
{ "_id": 2, "name": "Bob", "age": 20 },
{ "_id": 4, "name": "David", "age": 22 }
]
Explanation: The query retrieves documents where the age field exists and is not equal to 18. Bob and David have ages that exist and are not 18.
Example 2: Handling Null Values
To find documents where the grade field exists and is not null, we use the following query.
db.students.find({ grade: { $exists: true, $ne: null } })
Output:
[
{ "_id": 1, "name": "Alice", "age": 18, "grade": "A" },
{ "_id": 3, "name": "Charlie", "grade": "B" },
{ "_id": 4, "name": "David", "age": 22, "grade": "C" }
]
Explanation: The query retrieves documents where the grade field exists and is not null. Alice, Charlie, and David have non-null grades.
Using a Sparse Index to Improve $exists Performance
Sparse indexes only include documents that contain the indexed field, improving query performance for fields that are not present in every document.
Creating a Sparse Index
To create a sparse index on the grade field:
db.students.createIndex({ grade: 1 }, { sparse: true })
Output:
{
"createdCollectionAutomatically": false,
"numIndexesBefore": 1,
"numIndexesAfter": 2,
"ok": 1
}
Query Performance Comparison
| Query | Index Type | Performance | 
|---|---|---|
| { grade: { $exists: true } } | Sparse Index | Faster | 
| { grade: { $exists: true } } | Regular Index | Slower | 
Conclusion
Overall, the $exists operator in MongoDB is a useful tool for checking if fields are present or missing in documents.By understanding and utilizing the $exists operator along with other MongoDB features such as Atlas Search and sparse indexes, you can enhance the flexibility and precision of your queries and ensuring more efficient data retrieval and manipulation.
