# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-inequality-operator-ne/

MongoDB $ne or "not equals" operator is one of the comparison operators. The $ne operator selects those documents where the field value is not equal to the given value.
It also includes those documents that do not contain the specified field. You can use this operator in methods like find(), update(), etc. as per your requirement.  
Syntax
{field: {$ne: value}}
MongoDB $ne Operator Examples
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: employee
Document: four documents that contain the details of the employees in the form of field-value pairs.
Example 1
In this example, we are selecting those documents where the value of the experienceYear field is not equal to 2.
Query:
db.employee.find({experienceYear: {$ne: 2}}) .pretty()
Output:
Example 2
In this example, we are selecting only those documents where the last name of the employees is not Goyal.
Query:
db.employee.find({"name.last": {$ne: "Goyal"}}) .pretty()
Output:
Example 3
In this example, we are selecting those documents where the points array is not equal to the specified array.
Query:
db.employee.find ({points: {$ne: [2,4,6]}}).pretty()
Output:
Example 4
In this example, we are updating the salary to 55000 of those employees whose department is not HR. Or in other words, set the value of the salary field to 55000 of those documents whose department field value is not equal to HR.
Query:
db.employee.update({department: {$ne: "HR}}, {$set: {salary: 55000 }})
WriteResult({"nMatched" : 1, "nUpserted" :0, "Modified" :1})
db.employee.find({department: {$ne: "HR"}}). pretty()
Output:
Key Takeaways About $ne Operator
- The
$ne operator is used to specify a non-equality condition in MongoDB- The
$ne operator is a comparison operator that can be used in queries with find(), update(), and other methods.- It matches documents where the value of a field is not equal to the specified value.
- It is commonly used to filter documents based on values that are not equal to a specified threshold.
- MongoDB supports limited cross-BSON comparison through Type Bracketing when using the
$ne operator.
