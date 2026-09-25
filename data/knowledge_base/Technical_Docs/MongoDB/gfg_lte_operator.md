# $lte Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-less-than-equals-to-operator-lte/

MongoDB $lte Operator is one of the comparison operators. $lte operator selects those documents where the field value is less than equal to (<=) the given value.
This operator can be used in methods like find(), update(), etc. according to your requirements..
Syntax
{field: {$lte: value}}
MongoDB $lte Operator Example
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: employee
Document: four documents that contain the details of the employees in the form of field-value pairs.
Example 1:
In this example, we are selecting those documents where the value of the salary field is less than equals to 35000.
Query
db.employee.find({salary: {$lte: 35000}}) .pretty()
Output
Example 2
In this example, we are selecting only those documents where the age of the employee is less than equals to 24. Or in other words, in this example, we are specifying conditions on the field in the embedded document using dot notation.
Query:
db.employee.find({"personalDetaisl.age": {$lte:24}})
Output:
Example 3
In this example, we are selecting only those documents where the points array is less than equals to the specified array.
Query:
db.employee.find({points: {$lte:[4,5]}}).pretty()
Output
Example 4
In this example, we are updating the salary of those employees whose experience year is less than equals to 2 years.
Note: The update() method by default update only one document at a time. If you want to update multiple documents, then set the value of its multi parameter to true. So, in this example, the update() method updated the first document that matches the given condition as shown in the below image.
Query:
db.employee.update({experienceYear: {$lte: 2}}, {$set: {salary: 32000}})
WriteResult({"nMatched" : 1, "nUpserted" : 0, "Modified" : 1 })
db.employee.find({experienceYear: {$lte: 2}}).pretty()
Output:
Key Takeaways About $lte Operator
- It is a comparison operator that can be used in queries with
find(), update(), and other methods.- The
$lte operator is used to select documents where the value of a field is less than or equal to the specified value.- It performs comparisons on fields where the BSON type matches the query value's type.
- The
$lte operator can be used to update documents based on embedded document fields.- It can also be used in the aggregation pipeline with the
$lte operator to compare two expressions and return a boolean value.
