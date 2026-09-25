# MongoDB Positional Operator ($)

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-positional-operator/

The positional $ operator in MongoDB updates the first matched element in an array without specifying its exact index, enabling efficient in-place updates, including within embedded documents.
- Targets the first array element that matches the query condition.
- Eliminates manual index calculation in update queries.
- Works with arrays of nested/embedded documents.
- Enables precise, atomic in-place updates to array elements.
Syntax
{ "<array>.$" : value }
- Syntax pattern: { "<array>.$": <value> } for targeting a matched array element by index.
- The array field must be referenced in the query filter to bind the $ placeholder.
- Resolves to only the first matched element in the array.
- Incompatible with upsert operations (may be treated as a literal field on insert).
- With db.collection.update() and db.collection.findAndModify(), $ targets the first matched array element when the array field is included in the query filter.
Examples of MongoDB Positional Operator
In the following examples, we are working with contributor which contains various information in terms of documents as shown below:
Database: GeeksforGeeks
Collection: contributor
Document: Two documents that contain the details of the contributor in the form of field-value pairs
Example 1: Update First matching elements in an Array
Updating the first item whose value is "Java" to "Python" in the language field with the help of $ operator, because we don't know the position of the item in the array.
db.contributor.updateOne(
{ name: "Mateo", language: "Java" },
{ $set: { "language.$": "Python" } }
)
Output:
Example 2: Update First Matching Element in an Array
Updating an array that contains embedded documents with the help of $ operator and to access embedded document fields we use dot notation. Or in other words, we are updating the value of tArticle field from 60 to 100.
db.contributor.updateOne(
{ name: "Mateo", "articles.language": "C#" },
{ $set: { "articles.$.tArticles": 120 } }
)
Output:
Example 3: Update Nested Arrays
Updating the value of the tArticles field in the first embedded document that has a pArticles field with a value greater than 30.
db.contributor.updateOne(
{
name: "Luca",
articles: { $elemMatch: { pArticles: { $gt: 30 } } }
},
{
$set: { "articles.$.tArticles": 250 }
}
)
Output:
