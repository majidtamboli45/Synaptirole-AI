# $gte Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-greater-than-equals-to-operator-gte/

MongoDB $gte or "greater than equals to" operator is one of the comparison operators. $gte operator selects those documents where the field value is greater than equals to(>=) the given value.
This operator can be used in methods (like, find(), update(), etc.) according to your requirements.
Syntax
{field: {$gte: value}}
MongoDB $gte Operator Examples
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: employee
Document: four documents that contain the details of the employees in the form of field-value pairs.
Example 1:
In this example, we are selecting those documents where the value of the salary field is greater than equals to 35000.
Query:
db.employee.find({salary: {$gte: 35000}}).pretty()
Output:
Example 2
In this example, we are selecting only those documents where the age of the employee is greater than equals to 24. Or in other words, in this example, we are specifying conditions on the field in the embedded document using dot notation.
Query:
db.employee.find({"personalDetails.age": {$gte: 24}}).pretty()
Output:
Example 3
In this example, we are selecting only those documents where the points array is greater than equals to the specified array.
Query:
db.employee.find({points: {$gte: [6, 7]}}).pretty()
Output:
Example 4
In this example, we are updating the salary of those employees whose experience year is greater than equals to 2 years. Or in other words, set the value of the salary field to 60000 of those documents whose experienceYear field value is greater than equals to 2.
Query:
db.employee.update({experienceYear: {$gte: 2}}, {$set: {salary: 60000}})
Note:
The update() method by default update only one document at a time. If you want to update multiple documents, then set the value of its multi parameter to true. So, in this example, the update() method updated the first document that matches the given condition as shown in the below image.
Output:
Key Takeaways About $gte Operator
- It is a comparison operator that can be used in queries with find() ,update() , and other methods.
- The $gte operator is used to select documents where the value of a field is greater than or equal to the specified value.
- MongoDB supports limited cross-BSON comparison through Type Bracketing when using the $gte operator.
- It is commonly used to filter documents based on values that are greater than or equal to a specified threshold.
