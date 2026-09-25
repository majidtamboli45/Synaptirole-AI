# MongoDB Aggregation $first Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-aggregation-first-operator/

The $first operator in MongoDB returns the first document’s field value from each group in an aggregation pipeline, based on the current sort order.
- Used within the $group stage of the aggregation pipeline.
- Returns the value of a specified field from the first document in each group.
- Depends on the input order, so commonly paired with $sort before $group.
- Useful for extracting representative or summary values per group.
Syntax
{
$group: {
_id: <expression>,
firstField: { $first: "$fieldName" }
}
}
- _id: The field or expression used to group documents.
- firstField: The output field that will contain the first document from each group.
- $first: "$fieldName": The $first operator returns the value of the specified field from the first document in each group.
Example of MongoDB Aggregation $first Operator
Consider a collection called students which contains information in various documents are shown below.
([
... { "name": "Alex", "age": 18, "grade": 10 },
... { "name": "Ben", "age": 17, "grade": 10 },
... { "name": "Clevin", "age": 16, "grade": 11 },
... { "name": "David", "age": 18, "grade": 11 },
... { "name": "Eva", "age": 17, "grade": 12 },
... { "name": "Frank", "age": 16, "grade": 12 }
... ])
Example 1: Find the oldest student in each grade after sorting
db.students.aggregate([
{ $sort: { grade: 1, age: -1 } },
{
$group: {
_id: "$grade",
oldestStudent: { $first: "$name" }
}
}
])
Output:
[
{ "_id": 10, "oldestStudent": "Alex" },
{ "_id": 11, "oldestStudent": "Clevin" },
{ "_id": 12, "oldestStudent": "Eva" }
]
- $group groups documents by the grade field.
- $first: "$name" returns the name of the first document in each group after sorting.
- Since documents are sorted by age in descending order within each grade, the first document represents the oldest student.
- The result shows the oldest student in each grade.
Example 2: Handling Multiple Fields
Find the first and last names of the oldest student in each grade.
db.students.aggregate([
{
$group: {
_id: "$grade",
oldestStudentFirst: { $first: "$name" },
oldestStudentLast: { $last: "$name" }
}
}
])
Output:
[
{ "_id": 10, "oldestStudentFirst": "Alex", "oldestStudentLast": "Ben" },
{ "_id": 11, "oldestStudentFirst": "Clevin", "oldestStudentLast": "David" },
{ "_id": 12, "oldestStudentFirst": "Eva", "oldestStudentLast": "Frank" }
]
Used $first to retrieve the first name and $last to retrieve the last name of the oldest student in each grade.
