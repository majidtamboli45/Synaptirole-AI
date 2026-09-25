# $max Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-maximum-operator-max/

The $max operator updates a field only when the specified value is greater than the existing value in MongoDB, helping enforce thresholds and keep data accurate during updates.
- Applies conditional updates based on value comparison.
- Works with nested fields using dot notation.
- Adds the field if it doesn’t already exist.
- Uses BSON comparison rules for reliable type-aware updates.
Features of the $max Operator
Here are some features of $max Operator:
- Comparison Logic: Compares the current value of a field with the specified value and updates it only if the specified value is greater.
- BSON Comparison Order: Uses the BSON comparison order to evaluate data types during comparisons.
- Dot Notation Support: Can be used in embedded or nested documents by leveraging dot notation.
- Field Creation: If the specified field does not exist, the $max operator creates the field and sets its value.
- Versatile Usage: Supports various methods like update(), updateOne(), and updateMany().
Syntax
{ $max: { field1: value1, field2: value2 ... } }
This syntax allows you to specify one or more fields and their corresponding values to update.
MongoDB $max Operator Examples
The following examples demonstrate how to use the $max operator in MongoDB to update fields conditionally based on the specified value. In the following examples, we are using:
- Database: GeeksforGeeks
- Collection: contributor
- Document: Three documents that contain the details of the contributors in the form of field-value pairs.
Example 1: Comparing Values (or numbers) Using $max operator
Comparing values(or numbers) of the salary fields with the specified value, i.e., 5000. Here, the specified value is greater than the current value. So, $max operator updates the value of the salary field with the help of update() method to 5000.
db.contributor.updateOne({name: "Ethan"}, {$max: {salary: 5000}})
Output:
Note: The collection.update() method is deprecated. Use updateOne() or updateMany() instead for clearer and safer updates.
If the current value of the salary field is greater than the specified value, then this operator will not update the value of the salary field with the specified value, i.e., 4000.
db.contributor.updateOne({name: "Ethan"}, {$max: {salary: 4000}})
Output:
In this case, if the current value of salary is greater than 4000 (e.g., 5000), the field will not be updated.
Example 2: Comparing values (or numbers) in Nested Documents using $max operator
Comparing values (or numbers) of the rank fields with the specified value, i.e., 30. Here, the specified value is greater than the current value. So, $max operator updates the value of the rank field with the help of update() method to 30.
Query:
db.contributor.updateOne({name: "Olivia"}, {$max: {"personal.rank": 30}})
Output:
If the current value of the rank field is greater than the specified value, then this operator will not update the value of the rank field with the specified value, i.e., 13.
db.contributor.updateOne({name: "Olivia"}, {$max: {"personal.rank": 13}})
Output:
Current value of personal.rank is greater than 13 (e.g., 30), the field will not be updated.
Important Points on $max Operator
- The $max operator in MongoDB database is used in update operations to update the value of a field only if the specified value is greater than the current value.
- It is commonly used to filter documents based on values that are greater than or equal to a specified threshold.
- MongoDB supports limited cross-BSON comparison through Type Bracketing when using the $max operator.
