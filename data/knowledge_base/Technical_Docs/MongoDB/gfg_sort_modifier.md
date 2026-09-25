# $sort Modifier

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-sort-modifier/

The $sort modifier in MongoDB is a powerful tool used to order the elements within an array embedded in a document. This functionality is particularly useful when dealing with nested arrays that need to be organized based on specific criteria. By utilizing the $sort modifier, you can efficiently arrange array elements in either ascending or descending order.
In this article, We will learn about the MongoDB $sort Modifier by understanding the various examples and so on.
MongoDB $sort Modifier
- The $sort modifier in MongoDB is used in the aggregation pipeline to order documents based on specified fields.
- It allows us to sort the documents in either ascending or descending order.
Syntax:
{
$push: {
<field>: {
$each: [ <value1>, <value2>, ... ],
$sort: <sort specification>
}
}
}
- If we want to sort the items (that are not documents) of the array or the array items(that are documents) in ascending order, then set the value of the $sort modifier to 1.
- If we want to sort the items (that are not documents) of the array or the array items(that are documents) in descending order, then set the value of the $sort modifier to -1.
- If the array items are documents and you want to sort fields of the documents, then specify a sort document with the field and the order (ascending or descending order), i.e., { <field>: 1 } or { <field>: -1 }. Note: Please do not mention the containing array field in the sort specification, like { "myArray.field": 1} it is wrong.  
- Modifier must appear with $each modifier in the$push operator. We are allowed to pass an empty array[] in the $each modifier which help$sort modifier to show its effect. If we use the $sort modifier without$each modifier, then you will get an error.
- This modifier can sort the items of the array that are not documents.
- If the array items are documents, then this modifier can sort by either the whole document or by a specified field in the documents.
Examples of MongoDB $sort Modifier
In the following examples, we are working with:
Database: GeeksforGeeks Collection: contributor Document: two documents that contain the details of the contributor in the form of field-value pairs.
Output:
Sorting Non-Document Array Items
In this example, we are sorting all the items of the language field in ascending order.
db.contributor.update({name: "Suman"},
{$push: { language: { $each: ["Go", "Scala"],
$sort: 1}}})
Output:
Sorting Array of Documents
In this example, we are sorting all the documents of articles field in ascending order.
db.contributor.update({name: "Suman"}, 
{$push: { articles: { $each: [], $sort: 1}}})
Output:
Sorting Documents by Field
In this example, we are sorting all the documents of articles field by tArticle field(descending order).
 db.contributor.update({name: "Suman"}, 
{$push: { articles: { $each: [{language: "Go", tArticles: 120},
{language: "Perl", tArticles: 24}], $sort:{tArticles: -1}}}})
Output:
Using $sort to Update Arrays
In this example, we are sorting the items of the language field in descending order.
db.contributor.update({}, 
{$push: {language: {$each:[], $sort: -1}}},
{multi: true})
Output:
Combining $sort with $push Modifiers
In this example, we are using the $sort modifier with other modifiers like $each and $slice with $push operator.
db.contributor.update({name: "Rohit"},
{$push: { language: { $each: ["C", "Go"],
$sort: 1, $slice: 4}}})
Output:
Where,
- The $each modifier is used to add multiple documents to the language array.
- The $sort modifier is used to sort all the items of the modified language array in ascending.
- The $slice modifier is used to keep only the first four sorted items of the language array.
Conclusion
The $sort modifier in MongoDB is essential for managing and organizing array elements within documents. Whether you need to sort documents within an array based on specific fields or use it in conjunction with other modifiers, $sort offers flexibility and precision in data handling.
