# MongoDB $ln Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-ln-operator/

$in operator in MongoDB is a powerful query tool used to filter documents based on whether a field value matches any value within a specified array. This operator simplifies searching through large datasets by allowing developers to specify multiple values for a single field. 
In this article, we will explore the MongoDB $in operator syntax by providing MongoDB $in examples and explaining how it can be used with MongoDB-embedded document queries.
Introduction to MongoDB $in Operator
The $in operator in MongoDB is a powerful tool for querying collections. It allows us to match documents where the value of a field matches any value in a specified array. 
The $in operator is commonly used in find() and update() methods to filter or modify documents based on one or more values.
Syntax:
{ field: { $in: [<value1>, <value2>, ... <valueN>] } }
- field: The field name you want to query.
- value1, value2, ... valueN: The list of values you want to match in that field.
Benefits of Using the MongoDB $in Operator
- Simplifies Querying: Instead of writing multiple conditions, we can use the $in operator to match multiple values within a single field.
- Efficient Filtering: The $in operator is optimized for performance by making it efficient for large-scale queries.
- Flexible: It works with a wide range of data types, including strings, numbers, and arrays.
Examples of MongoDB $in Operator
Let's go through several examples that explain how to use the $in operator in MongoDB queries. For these examples let's assume we're working with the following student collection in a database.
Sample Documents in the student Collection:
{
"_id": ObjectId("1"),
"name": "Mick",
"Course": "B.Tech",
"batch_year": 2018,
"language": ["C++", "Java", "Python"],
"personal_details": {
"Father_name": "Jonny",
"City": "New York"
}
},
{
"_id": ObjectId("2"),
"name": "Zoya",
"Course": "BCA",
"batch_year": 2020,
"language": ["C#", "JavaScript"],
"personal_details": {
"Father_name": "Henry",
"City": "London"
}
},
{
"_id": ObjectId("3"),
"name": "Mia",
"Course": "B.Tech",
"batch_year": 2020,
"language": ["HTML", "CSS", "PHP"],
"personal_details": {
"Father_name": "Leo",
"City": "Manchester"
}
}
Example 1: Match Values in a Field
In this example, we want to retrieve the details of students whose name is either "Mick" or "Mia". We can achieve this using the $in operator.
Query:
db.student.find({ name: { $in: ["Mick", "Mia"] } }).pretty()
Output:
{
"_id": ObjectId("1"),
"name": "Mick",
"Course": "B.Tech",
"batch_year": 2018,
"language": ["C++", "Java", "Python"],
"personal_details": {
"Father_name": "Jonny",
"City": "New York"
}
},
{
"_id": ObjectId("3"),
"name": "Mia",
"Course": "B.Tech",
"batch_year": 2020,
"language": ["HTML", "CSS", "PHP"],
"personal_details": {
"Father_name": "Leo",
"City": "Manchester"
}
}
Explanation: This query retrieves all students whose name is either "Mick" or "Mia" by matching the "name" field against the values provided in the $in array.
Example 2: Match Values in an Array
We can also use the $in operator to query fields that contain arrays. For example, let's retrieve students who know either "JavaScript" or "CSS".
Query:
db.student.find({ language: { $in: ["JavaScript", "CSS"] } }).pretty()
Output:
{
"_id": ObjectId("2"),
"name": "Zoya",
"Course": "BCA",
"batch_year": 2020,
"language": ["C#", "JavaScript"],
"personal_details": {
"Father_name": "Henry",
"City": "London"
}
},
{
"_id": ObjectId("3"),
"name": "Mia",
"Course": "B.Tech",
"batch_year": 2020,
"language": ["HTML", "CSS", "PHP"],
"personal_details": {
"Father_name": "Leo",
"City": "Manchester"
}
}
Explanation: Here, the query filters students who know either "JavaScript" or "CSS". It checks if the values are present within the "language" array of each document.
Example 3: Querying Embedded Documents
The $in operator is also useful when querying embedded documents. In this example, we'll retrieve students who live in "London".
Query:
db.student.find({ "personal_details.City": { $in: ["London"] } }).pretty()
Output:
{
"_id": ObjectId("2"),
"name": "Zoya",
"Course": "BCA",
"batch_year": 2020,
"language": ["C#", "JavaScript"],
"personal_details": {
"Father_name": "Henry",
"City": "London"
}
}
Explanation: This query retrieves students who live in "London" by targeting the "City" field inside the embedded "personal_details" document.
Example 4: Using $in with the Update Method
The $in operator can also be used with the update() method. For example, let's add a new field, Pending_fees to the documents of students named "Mick" and "Mia".
Query:
db.student.update(
{ name: { $in: ["Mick", "Mia"] } },
{ $set: { Pending_fees: 12000 } },
{ multi: true }
)
Output:
WriteResult({ "nMatched" : 2, "nUpserted" : 0, "nModified" : 2 })
Explanation: This query updates the documents of students named "Mick" and "Mia" by adding a new field "Pending_fees" with a value of 12,000. The multi: true option ensures that all matching documents are updated.
Conclusion
The MongoDB $in operator is a good and efficient way to query and manipulate data. It allows you to filter documents based on multiple values, making it ideal for dynamic and complex searches. Whether you're working with simple field queries or need to learn into MongoDB embedded document queries, the $in operator can simplify your querying process.
