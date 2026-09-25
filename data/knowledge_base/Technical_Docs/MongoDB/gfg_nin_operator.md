# $nin Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-nin-operator/

MongoDB $nin or " not in" is one of the comparison query operators. The $nin operator selects those documents where the field value is not equal to any of the given values in the array and the field that does not exist.
You can use this operator in methods like find(), update(), etc. according to your requirements.  
Syntax
{field: {$nin: [value1, value2, value3, ...]}}
MongoDB $nin Operator Example
In the following examples, we are working with:
Database: GeeksforGeeks
Collection: contributor
Document: three documents that contain the details of the contributors in the form of field-value pairs.
Example 1: Matching values using $nin operator
In this example, we are retrieving only those employee’s documents whose name is not Amit or Suman.
 db.contributor.find({name: {$nin: ["Amit", "Suman"]}}).pretty()
Output:
Example 2: Matching values in an array using $nin operator
In this example, we are retrieving only those employee’s documents who is not working with either C#, Python, or both languages.
Query:
db.contributor.find({language: {$nin: ["C#", "Python"]}}).pretty()
Output:
Example 3: Matching values in embedded/nested documents using $nin operator
In this example, we are retrieving only those employee’s documents whose age is not 25 or 22.
Query:
db.contributor.find({"personal.age": { $nin: [25, 22]}}).pretty()
Output:
Example 4: Updating data using $nin operator
In this example, we are adding a new field-value pair(i.e, salary: 10000) in the documents of those employee's whose name is not Amit or Priya by using update() method with $in and $set operators.  
Query:
db.contributor.update({name: {$nin: ["Amit", "Priya"]}}, {$set: {salary: 1000}})
Note:
The update() method by default update only one document at a time. If you want to update multiple documents, then set the value of its multi parameter to true. So, in this example, the update() method updated the first document that matches the given condition as shown in the below image. 
Key Takeaways About $nin Operator
- The
$nin operator is used to select documents where the value of a field is not equal to any of the given values in an array.- The operator can be used to filter documents based on the non-existence of a field or the non-matching of a field value with any of the specified array values.
- The
$nin operator supports different BSON types and can be used in various methods like find(), update(), etc.- The
$nin operator supports Type Bracketing for limited cross-BSON comparison.
