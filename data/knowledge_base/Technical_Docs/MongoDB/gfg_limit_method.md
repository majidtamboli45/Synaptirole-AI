# limit() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-limit-method/

The MongoDB limit() method restricts the number of documents returned by a query, similar to the SQL LIMIT clause. It accepts a single numeric argument to specify how many documents should be displayed, helping improve query efficiency and manage result size.
Syntax:
db.collectionName.find(<query>).limit(<number>)
In the above syntax:
- db.collectionName.find(<query>): Searches the collectionName collection using the criteria in <query>.
- .limit(<number>): Restricts the result to only <number> documents.
Examples of MongoDB limit()
To better understand how the limit() method works, let's look at some practical examples. We will use a collection named gfg from a MongoDB database geeksforgeeks, which contains documents with a content field. 
- Database: geeksforgeeks
- Collections: gfg
- Document: Eight documents contains the content
Example 1: Limit the Number of Documents Required
db.gfg.find().limit(2)
Output:
Explanation:
- This query retrieves only the first two documents from the gfg collection.
- The result will be a subset of the matching documents, limiting the output to just two.
Example 2: Limit Documents that Match a specific condition
db.gfg.find({"content":/c/i}).limit(2)
Output:
Explanation:
- We want 2 documents that match the condition {"content": /c/i}.
- content is the field being checked.
- /c/ looks for strings containing the character "c".
- /i makes the search case-insensitive.
- Only documents satisfying this condition will be returned.
Example 3: Limit Documents That Match a Specific Condition with a Larger Set
db.gfg.find({"content":/c/i}).limit(3)
Output:
Explanation:
- We want 3 documents that match the condition {"content": /c/i}.
- content is the field/key to check in each document.
- /c/ searches for strings that contain the character "c".
- /i makes the search case-insensitive (matches both "c" and "C").
- Only documents satisfying this condition will be returned by the find() method.
cursor.limit() Method
The cursor.limit() method in MongoDB is used to restrict the number of documents returned by a query. It is applied to a cursor object, which is the result of a find() query.
Syntax:
cursor.limit(<number>);
In the above syntax:
- cursor: result of find()
- limit(n): returns only the first n documents from the cursor
Example: Suppose we have a students collection:
db.students.insertMany([
{ name: "Alice", age: 20 },
{ name: "Bob", age: 22 },
{ name: "Charlie", age: 21 },
{ name: "David", age: 23 },
{ name: "Eve", age: 20 }
]);
Using cursor.limit():
const cursor = db.students.find({ age: { $gt: 20 } });
cursor.limit(2);
cursor.forEach(doc => printjson(doc));
Output:
{ "_id": ObjectId("..."), "name": "Bob", "age": 22 }
{ "_id": ObjectId("..."), "name": "Charlie", "age": 21 }
In this example:
- find({ age: { $gt: 20 } }) selects students older than 20.
- cursor.limit(2) restricts the result to only 2 documents.
- forEach() prints the selected documents.
- Only the first 2 matching students (Bob and Charlie) are returned.
$limit (Aggregation)
In MongoDB, the $limit stage in an aggregation pipeline restricts how many documents are passed on to the next stage. It accepts a single positive integer that represents the maximum number of documents to return.
Syntax:
{ $limit: <positive integer> }
In the above syntax:
- <positive integer>: the maximum number of documents allowed to proceed to the next stage.
- Place $limit early in the pipeline (often after $match) to reduce the amount of data subsequent stages must handle and improve performance.
Example: Suppose we have a students collection:
db.students.insertMany([
{ name: "Alice", age: 20, score: 85 },
{ name: "Bob", age: 22, score: 90 },
{ name: "Charlie", age: 21, score: 88 },
{ name: "David", age: 23, score: 92 },
{ name: "Eve", age: 20, score: 87 }
]);
Using $limit in an aggregation pipeline:
db.students.aggregate([
{ $sort: { score: -1 } }, // Sort by score descending
{ $limit: 3 } // Limit to top 3 documents
]);
Output:
{ "_id": ObjectId("..."), "name": "David", "age": 23, "score": 92 }
{ "_id": ObjectId("..."), "name": "Bob", "age": 22, "score": 90 }
{ "_id": ObjectId("..."), "name": "Charlie", "age": 21, "score": 88 }
Explanation:
- $sort: { score: -1 }: sorts all students by score in descending order.
- $limit: 3: restricts the results to only the first 3 documents from the sorted list.
- This ensures only the top 3 scoring students are returned, improving performance if the collection is large.
Performance Considerations
While the limit() method is a great tool for improving query performance, there are some best practices to consider: 
1. Use Indexes: Index fields used in find(), sort(), and limit() to fetch results quickly without scanning the full collection.
2. Handle Large Result Sets: For big datasets, use allowDiskUse(true) to let MongoDB spill results to disk:
db.gfg.find().limit(1000).allowDiskUse(true)
3. Limit Meaningfully: Ensure limited results are relevant and not truncating important data.
4. Pagination: Combine limit() with skip() to fetch pages of data:
db.gfg.find().skip(10).limit(10)
Usage Of limit() Method  
The limit() method in MongoDB allows developers to:   
- Faster Queries: limit() reduces execution time by returning fewer documents.
- Lower Client Load: Transfers less data, improving user experience.
- Efficient Large Collection Handling: Retrieves only a relevant subset from big datasets.
- Better Index Usage: Helps MongoDB utilize indexes effectively for improved performance.
