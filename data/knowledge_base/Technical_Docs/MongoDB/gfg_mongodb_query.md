# MongoDB Query

> Source: https://www.geeksforgeeks.org/mongodb/what-is-a-mongodb-query/

A MongoDB query is used to retrieve documents from a collection based on specified conditions, using a JavaScript-like syntax.
- Queries request specific data from the database.
- Use JavaScript-like syntax instead of SQL.
- find() is the most commonly used query method.
- Supports simple and advanced query conditions.
- Useful for both basic data retrieval and complex querying.
Working with MongoDB Queries
MongoDB queries are executed using db.collection.find(), where conditions and operators like $eq, $gte, $lte, $in, $or, and $and are used to filter documents.
db.collection_name.find({ field: value })
This query will retrieve all documents from the articles collection where the author field is equal to "Alen".
db.articles.find({ author: "Alen" })
MongoDB Query Return Value
A MongoDB query returns a cursor pointing to matching documents, which can be iterated over and formatted using .pretty(), or empty if no matches are found.
Setting Up the Environment
Before we dive into various MongoDB query examples, let’s set up a collection named articles to practice different query operations. Below is a sample of the documents in the articles collection:
Query:
[
{
"_id": ObjectId("6009585d35cce6b7b8f087f1"),
"title": "Math",
"author": "Alen",
"level": "basic",
"length": 230,
"example": 11
},
{
"_id": ObjectId("60095b8a3fc110f90873ce29"),
"title": "Array",
"author": "Alen",
"level": "basic",
"length": 200,
"example": 5
},
{
"_id": ObjectId("60095b8a3fc110f90873ce2a"),
"title": "Stack",
"author": "Rim",
"level": "easy",
"length": 400,
"example": 10
},
{
"_id": ObjectId("60095b8a3fc110f90873ce2b"),
"title": "Queue",
"author": "Rim",
"level": "medium",
"length": 350,
"example": 2
},
{
"_id": ObjectId("60095b8a3fc110f90873ce2c"),
"title": "Tree",
"author": "devil",
"level": "high",
"length": 1000,
"example": 10
},
{
"_id": ObjectId("60095b8a3fc110f90873ce2d"),
"title": "Graph",
"author": "Alen",
"level": "high",
"length": 1500,
"example": 15
},
{
"_id": ObjectId("60095b8d3fc110f90873ce2e"),
"title": "Segment Tree",
"author": "devil",
"level": "very high",
"length": 500,
"example": 20
},
{
"_id": ObjectId("60095fd4e5a7731b2a55a922"),
"title": "Trie",
"author": "Rim",
"length": 500,
"example": 20,
"time": 50
}
]
Basic Query Operations
Basic query operations in MongoDB allow you to retrieve data from collections using simple conditions. These operations include retrieving all documents, filtering by specific field values, and limiting the number of results returned.
1. Select Single Documents in a Collection
findOne() retrieves the first document that matches the given filter criteria, or returns null if no matching document is found.
Syntax:
db.collection_name.findOne ()
Example:
db.article.findOne()
Output:
test> db.article.findOne()
{
_id: ObjectId('6009585d35cce6b7b8f087f1'),
title: 'Math',
author: 'Alen',
level: 'basic',
length: 230,
example: 11
}
Here, we are going to display the first document of the article collection where the author is "Alen".
2. Select All Documents in a Collection
find() retrieves all documents from a collection and returns a cursor, with optional conditions for filtering and .pretty() for readable output.
Example:
db.article.find().pretty() Output:
[
{
_id: ObjectId('6009585d35cce6b7b8f087f1'),
title: 'Math',
author: 'Alen',
level: 'basic',
length: 230,
example: 11
},
{
_id: ObjectId('60095b8a3fc110f90873ce29'),
title: 'Array',
author: 'Alen',
level: 'basic',
length: 200,
example: 5
},
{
_id: ObjectId('60095b8a3fc110f90873ce2a'),
title: 'Stack',
author: 'Rim',
level: 'easy',
length: 400,
example: 10
},
{
_id: ObjectId('60095b8a3fc110f90873ce2b'),
title: 'Queue',
author: 'Rim',
level: 'medium',
length: 350,
example: 2
},
{
_id: ObjectId('60095b8a3fc110f90873ce2c'),
title: 'Tree',
author: 'devil',
level: 'high',
length: 1000,
example: 10
},
{
_id: ObjectId('60095b8a3fc110f90873ce2d'),
title: 'Graph',
author: 'Alen',
level: 'high',
length: 1500,
example: 15
},
{
_id: ObjectId('60095b8d3fc110f90873ce2e'),
title: 'Segment Tree',
author: 'devil',
level: 'very high',
length: 500,
example: 20
},
{
_id: ObjectId('60095fd4e5a7731b2a55a922'),
title: 'Trie',
author: 'Rim',
length: 500,
example: 20,
time: 50
}
]
In the above Query, We have to display the documents of the article collection in a well-formatted way using pretty() method.
3. Filter Documents with Equality Condition
The equality operator($eq) is used to match the documents where the value of the field is equal to the specified value. In other words, the $eq operator is used to specify the equality condition.
Example:
Retrieve and display all documents from the 'article' collection where the author is "devil".
db.article.find({author:{$eq:"devil"}}).pretty()  Output:
[
{
_id: ObjectId('60095b8a3fc110f90873ce2c'),
title: 'Tree',
author: 'devil',
level: 'high',
length: 1000,
example: 10
},
{
_id: ObjectId('60095b8d3fc110f90873ce2e'),
title: 'Segment Tree',
author: 'devil',
level: 'very high',
length: 500,
example: 20
}
]
We have display the documents that matches the filter query(i.e., {author : {$eq : "devil"}}) from the article collection.
4. Filter Documents with Greater Than or Less Than Condition
Use $gte and $lte in find() to filter documents by numeric ranges (greater/less than or equal).
Syntax:
db.collection_name.find({< key > : {$gte : < value >}}) 
or
db.collection_name.find({< key > : {$lte : < value >}})
Example:
Retrieve and display all documents from the 'article' collection where the length is greater than or equal to 510.
db.article.find({length:{$gte:510}}).pretty()
Output:
[
{
_id: ObjectId('60095b8a3fc110f90873ce2c'),
title: 'Tree',
author: 'devil',
level: 'high',
length: 1000,
example: 10
},
{
_id: ObjectId('60095b8a3fc110f90873ce2d'),
title: 'Graph',
author: 'Alen',
level: 'high',
length: 1500,
example: 15
}
]
We have documented data which has the length attribute value greater than 510. So, we pass a filter query that is {length : {$gte : 510}} in the find() method.
5. Check the Existence of a Field
The $exists operator in MongoDB is used to check whether a specific field exists in the documents of a collection. This operator helps filter documents that either have or do not have a particular field, providing more flexibility in queries.
Example:
db.article.find({ time: { $exists: true } }).pretty()
Output:
[
{
_id: ObjectId('60095fd4e5a7731b2a55a922'),
title: 'Trie',
author: 'Rim,
length: 500,
example: 20,
time: 50
}
]
We have documents which has the attribute named as time by passing a filter query that is {time : {$exists : "true"}} in the find() method.
Advanced MongoDB Query Techniques
1. Specify AND Conditions
The $and operator comes under the type of MongoDB logical operator which perform logical AND operation on the array of one or more expressions and select or retrieve only those documents that match all the given expression in the array.
Example:
db.articles.find({
$and: [
{ author: "Alen" },
{ level: "basic" }
]
}).pretty()
Output:
[
{
"_id": ObjectId("6009585d35cce6b7b8f087f1"),
"title": "Math",
"author": "Alen",
"level": "basic",
"length": 230,
"example": 11
},
{
"_id": ObjectId("60095b8a3fc110f90873ce29"),
"title": "Array",
"author": "Alen",
"level": "basic",
"length": 200,
"example": 5
}
]
- Both documents have author equal to "Alen" and level equal to "basic".
- Other documents are excluded because they don’t satisfy both conditions.
- Notice documents with author: "Alen" but level: "high" (like "Graph") are excluded.
- Documents with level: "basic" but different authors are also excluded.
2. Specify AND as well as OR Conditions
In MongoDB, the $and and $or operators are used to combine multiple conditions in a query, allowing more complex filtering.
- $and: Combines multiple conditions, and documents must satisfy all conditions to be returned.
- $or: Combines multiple conditions, and documents must satisfy at least one condition to be returned.
Example:
db.article.find({
$or: [
{ level: "basic", author: "Alen" },
{ $and: [
{ level: "medium" },
{ author: "Rim" }
]
}
]
}).pretty()
Output:
[
{
_id: ObjectId('6009585d35cce6b7b8f087f1'),
title: 'Math',
author: 'Alen',
level: 'basic',
length: 230,
example: 11
},
{
_id: ObjectId('60095b8a3fc110f90873ce29'),
title: 'Array',
author: 'Alen',
level: 'basic',
length: 200,
example: 5
},
{
_id: ObjectId('60095b8a3fc110f90873ce2b'),
title: 'Queue',
author: 'Rim',
level: 'medium',
length: 350,
example: 2
}
]
Retrieve articles that are either authored by "Alen" and have a level of "basic", or authored by "Rim" with a level of "medium".
3. Use OR Conditions
The $or operator in MongoDB is used to retrieve documents that match any of the specified conditions. It is helpful when you need to match multiple conditions and retrieve documents that meet at least one of them.
Example:
db.articles.find({
$or: [
{ author: "Rim" },
{ level: "high" }
]
}).pretty()
Output
[
{
_id: ObjectId('60095b8a3fc110f90873ce2c'),
title: 'Tree',
author: 'devil',
level: 'high',
length: 1000,
example: 10
},
{
_id: ObjectId('60095b8a3fc110f90873ce2d'),
title: 'Graph',
author: 'Alen',
level: 'high',
length: 1500,
example: 15
}
]
This query retrieves documents where the author is "Rim" or the level is "high".
4. Limit the Number of Results
The limit() method in MongoDB allows you to specify the maximum number of documents that should be returned in a query result. This is useful when you want to restrict the number of documents processed or displayed.
Example:
db. article. find({author : "devil" }). limit(2) . pretty() 
Output:
[
{
_id: ObjectId('60095b8a3fc110f90873ce2c'),
title: 'Tree',
author: 'devil',
level: 'high',
length: 1000,
example: 10
},
{
_id: ObjectId('60095b8d3fc110f90873ce2e'),
title: 'Segment Tree',
author: 'devil',
level: 'very high',
length: 500,
example: 20
}
]
- This query method is simply the extension of the find method only provide a result at a maximum limited number(here is 2)
- Query to find record having given attribute: find({author : "devil" })
- Query to limit result: limit(2).
MongoDB Query Operators
MongoDB provides various operators that can be used to refine your queries:
- $eq: Equal to
- $gt: Greater than
- $gte: Greater than or equal to
- $lt: Less than
- $lte: Less than or equal to
- $ne: Not equal to
- $in: Matches any value in an array
- $nin: Matches none of the values in an array
- $exists: Checks for the existence of a field
- $or: Performs a logical OR operation
