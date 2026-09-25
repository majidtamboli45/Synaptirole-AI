# MongoDB All Positional Operator ($[])

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-all-positional-operator/

The all positional $[] operator in MongoDB updates every element in an array field for documents that match the query, enabling efficient in-place updates across arrays, including arrays of embedded documents.
- Targets all elements within the specified array field.
- Useful for bulk updates on arrays containing nested/embedded documents.
- Applies updates in-place without replacing the entire array.
- Works with update operations like db.collection.updateOne() and db.collection.findAndModify() .
- Ideal when the exact positions of elements are unknown and all elements must be modified.
Syntax
{ <update operator>: { "<array>.$[]" : <value> } }
- Updates all elements within the specified array field.
- Performs an in-place update on matched documents.
Examples of MongoDB All Positional Operator
In the following examples, we are working with:
Database: GeeksforGeeks 
Collection: contributor 
Document: Two documents that contain the details of the contributor in the form of field-value pairs.
Example 1: Updating all the items in an array using All Positional Operator
Updating by incrementing all the items by 5 of points field.
db.contributor.updateMany(
{},
{ $inc: { "points.$[]": 5 } }
)
Output:
Example 2: Updating all the documents in the array using All Positional Operator
Updating by decrementing the value of the tArticles field by 10 for all the items in the articles array.
db.contributor.updateMany(
{},
{ $inc: { "articles.$[].tArticles": -10 } }
)
Output:
Example 3: Updating an array using a negation query operator
Incrementing all the items in the points array by 20 for all documents except those with the value 100 in the points array.
db.contributor.updateMany(
{ points: { $nin: [100] } },
{ $inc: { "points.$[]": 20 } }
)
Output:
Example 4: Updating the nested array in conjunction with $[< identifier>]
Updating all the values that are less than or equal to 80 in the nested marks.firstsemester array.
db.contributor.updateMany(
{},
{ $inc: { "marks.$[].firstsemester.$[newmarks]": 3 } },
{ arrayFilters: [{ newmarks: { $lte: 80 } }] }
)
Output:
Usage of All Positional Operator ($[])
The $[] positional operator updates all elements in a specified array field for documents that match the query, including nested arrays.
- Update all elements within a specified array field in one operation.
- Apply bulk updates to arrays containing embedded/nested documents.
- Works with multi-level (nested) arrays in update queries.
- With upsert enabled, requires an exact equality match on the array field; otherwise the upsert fails.
- Use with update(), findAndModify() (legacy) and prefer updateOne() / updateMany() for modern updates.
