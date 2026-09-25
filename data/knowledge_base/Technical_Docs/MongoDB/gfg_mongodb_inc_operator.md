# MongoDB $inc Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-increment-operator-inc/

The $inc operator in MongoDB database atomically increments or decrements numeric fields by a specified value, making it ideal for counters, scores, and inventory updates while ensuring data consistency.
- Atomic Updates: Performs safe, in-place numeric updates within a document.
- Increment & Decrement: Supports both positive and negative values.
- Auto Field Creation: Creates the field if it doesn’t exist and sets it to the increment value.
- Numeric Fields Only: Works with numeric types, using it on null or non-numeric fields causes an error.
- High Concurrency Safe: Prevents race conditions when multiple updates occur.
Syntax
{ $inc: { field1: amount1, field2: amount2, ... } }
MongoDB $inc Operator Example
We'll use a sample database called GeeksforGeeks, which contains a contributor collection.
- Database: GeeksforGeeks
- Collection: contributor
- Document: Three documents that contain the details of the contributors in the form of field-value pairs
Example 1: Incrementing a Field Value
Updating the fields of a contributor's document whose name is Lucas by incrementing the value of the publisharticles field by 10 and decreasing the value of the salary field by 100.
db.contributor.updateOne({ name: "Lucas" }, { $inc: { publisharticles: 10, salary: -100 } })
Output:
Example 2: Incrementing a Field in an Array Element
Update the value of a nested field a in the array points, for a specific document where the name is "Sophia" and the points._id is "g_1"
db.contributor.updateOne({name: "Sophia" , "points._id" : "g_1"}, {$inc: {"points.$.a":10}})
Output:
Example 3: Incrementing a Field in an Embedded Document
Increment the value of the rank field in an embedded document personal for a document where the name is "Oliver".
db.contributor.updateOne({name: "Oliver"}, {$inc: {"personal.rank": 2}})
Output:
Important Points for using $inc Operator
These points highlight how $inc handles field creation, errors, and atomic updates to maintain data consistency.
- Field Creation: Creates the field if it doesn’t exist and sets the increment value.
- Null Fields: Fails on null or non-numeric fields.
- Atomic Update: Applies changes atomically to avoid concurrency issues.
