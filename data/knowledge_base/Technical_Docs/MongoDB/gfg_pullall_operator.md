# $pullAll Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-pullall-operator/

The $pullAll operator in MongoDB removes all occurrences of specified values from an array field during updates, offering a direct way to clean array data without using query conditions.
- Removes all occurrences of specified values from an array.
- Matches values directly (not condition-based like $pull).
- Works on array fields during update operations.
- Can be used with methods like updateOne(), updateMany(), and findAndModify().
Syntax
{ $pullAll: { <field1>: [ <value1>, <value2> ... ], ... } }
- <field1> specifies the array field from which values should be removed.
- The value must be an array of elements to remove (e.g., [<value1>, <value2>, ...]).
Note: The $pullAll operator removes all matching values from the array; the order of removal is not relevant as it is value-based.
Examples of MongoDB $pullAll
We will use the contributor collection for the following examples:
Example 1: Removing items from an array
Remove the items ["Java", "C#", "Python"] from the language field for the contributor "Liam" using the $pullAll operator.
db.contributor.updateOne(
{ name: "Liam" },
{ $pullAll: { language: ["Java", "C#", "Python"] } }
)
Output:
Example 2: Removing items from an array in the embedded document
Remove the items [71, 72] from the personal.semesterMarks field for the contributor "Noah" using the $pullAll operator.
db.contributor.updateOne(
{ name: "Noah" },
{ $pullAll: { "personal.semesterMarks": [71, 72] } }
)
Output:
