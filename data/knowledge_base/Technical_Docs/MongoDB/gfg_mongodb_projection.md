# MongoDB Projection

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-projection/

MongoDB projection is the process of selecting only the specific fields we want to retrieve from a document rather than fetching the entire document.
How MongoDB Projection Works
MongoDB projection works by controlling what fields are returned from a query while still filtering the documents.
- Filters Documents: The first parameter of find() selects which documents to retrieve.
- Specifies Fields: The second parameter (projection object) tells MongoDB which fields to include (1/true) or exclude (0/false).
- Controls _id: By default, _id is always returned unless explicitly excluded (_id: 0).
- Reduces Data Transfer: Only the specified fields are sent back, improving query speed and reducing resource usage.
- Supports Operators: Special operators like $, $elemMatch, $slice, and $meta allow advanced projections on arrays and metadata.
Consider the following example of an employee document in MongoDB:
{
name: "Roma",
age: 30,
branch: EEE,
department: "HR",
salary: 20000
}
Query with Projection:
db.employee.find(
  { department: "HR" },
  { name: 1, age: 1, _id: 0 }
)
Output:
{ name: "Roma", age: 30 }
In this example:
- Projection allows fetching only specific fields from a document.
- Retrieve only name and age of an employee.
- Helps avoid retrieving the entire document, saving resources.
- Especially useful when documents contain many unnecessary fields.
Examples of Using MongoDB Projection
In the following examples, we are working with:
Database: GeeksforGeeks 
Collection: employee
Document: five documents that contain the details of the employees in the form of field-value pairs. 
We will now explore several MongoDB projection examples that demonstrate how to selectively retrieve specific fields from these documents
1. Displaying Only Specific Fields
Suppose we have an employee collection, and we want to display only the name and age fields of the employees. We can do this with projection as shown below:
Query:
db.employee.find({}, {name: 1, age: 1})
Output:
Explanation:
- The empty curly braces {} represent the query condition, meaning you are not filtering any documents (i.e., you want all the documents).
- {name: 1, age: 1} is the projection object, where1 means that you want to include thename andage fields in the result
2. Display Employee Names Without ID
If we want to display all fields except the _id field, we can do so by explicitly setting _id to 0:
Query:
db.employee.find({}, {name: 1, age: 1, _id: 0})
Output:
Explanation: {_id: 0} ensures the _id field is excluded from the result.
3. Displaying Employee Name & Department Without ID
To display the name and department of the employees without the _id field, we can use the following MongoDB qu ery with projection:
Query:
db.employee.find({}, {name: 1, department: 1, _id: 0})
Output:
Explanation:
- The empty {} in the first parameter represents the query condition, meaning you are selecting all the documents from the collection
- This will return documents with only the name anddepartment fields for each employee, without the_id field.
4. Displaying Employees (2018) Name & Department
We can combine projection with a query filter to fetch specific documents. For example, if we want to fetch employees who joined in 2018 and display only their name and department, we would write:
Query:
db.employee.find({joiningYear: 2018}, {name: 1, department: 1, _id: 0})
Output:
Explanation:
- {joiningYear: 2018} is the filter that selects employees who joined in 2018.
- {name: 1, department: 1, _id: 0} specifies the fields we want to include, excluding_id .
MongoDB Projection Operators
MongoDB also provides certain projection operators that we can use to modify how fields are returned. These operators allow for more advanced selection and reshaping of data. However, it's important to note that the find() method does not support all projection operators. Some of the projection operators that are not supported include $, $elemMatch, $slice, and $meta. 
1. $slice Operator
The $slice operator is useful when dealing with array fields. It allows us to return a subset of an array, such as the first few elements, a specific range, or even the last few elements. While $slice is supported in aggregation pipelines, it is not allowed in the find() projection.
Example: If we have a document like this:
{
  name: "John",
  skills: ["JavaScript", "MongoDB", "Node.js", "CSS"]
}
We can use $slice in the aggregation pipeline to return only the first 2 skills:
db.employee.aggregate([
  { $project: { skills: { $slice: [0, 2] } } }
])
Output:
{
  name: "John",
  skills: ["JavaScript", "MongoDB"]
}
2. $elemMatch Operator
The $elemMatch operator is used to retrieve specific elements from an array field that match certain conditions. This is especially useful when you have an array of embedded documents or objects, and you only want to return the elements that meet specific criteria. Like $slice, $elemMatch is supported in the aggregation pipeline but not in the find() method's projection.
Example: Suppose you have a document with a skills array of embedded documents, and you want to return only the skills that have a level greater than 3.
{
  name: "John",
  skills: [
    { name: "JavaScript", level: 5 },
    { name: "MongoDB", level: 3 },
    { name: "Node.js", level: 4 }
  ]
}
We can use $elemMatch in the aggregation pipeline to select only the skills where the level is greater than 3:
db.employee.aggregate([
  { $project: { skills: { $elemMatch: { level: { $gt: 3 } } } } }
])
Output:
{
  name: "John",
  skills: [
    { name: "JavaScript", level: 5 },
    { name: "Node.js", level: 4 }
  ]
}
3. $meta Projection Operator
The $meta operator is used to include metadata in your projection. Two common metadata keywords are:
- "textScore": returns the text search score.
- "indexKey": returns the index key used by MongoDB (for debugging only).
Example: Suppose you have a food collection with a food_desc field:
{
  name: "Veggie Pizza",
  food_desc: "Delicious pizza with fresh vegetables"
}
Create a text index on food_desc:
db.food.createIndex({ food_desc: "text" })
Search for “pizza” and return the text score with $meta:
db.food.find(
  { $text: { $search: "pizza" } },
  { name: 1, score: { $meta: "textScore" }, _id: 0 }
)
Output:
{ name: "Veggie Pizza", score: 1.7 }
Using MongoDB Projection in Aggregation Pipeline
In MongoDB, the aggregation pipeline provides more advanced ways to project fields and reshape documents. The $project stage in the aggregation pipeline allows us to include or exclude fields, create new fields, or even apply transformations to existing fields. 
Here is an example of using $project in the aggregation pipeline:
db.employee.aggregate([
  { $match: { joiningYear: 2018 } },
  { $project: { name: 1, department: 1, _id: 0 } }
])
Explanation:
- The $match stage filters the documents to only include employees who joined in 2018.
- The $project stage reshapes the document to include only thename anddepartment fields, and excludes the_id field (by setting_id: 0 )
Common Mistakes in Projection
Here are two common mistakes to avoid when using MongoDB projection:
1. Mixing Include and Exclude Fields
We cannot mix fields that are included (using 1) and excluded (using 0) in the same projection object. Doing so will result in an error. In this example, you are trying to include name but exclude both _id and salary, which MongoDB does not allow in the same projection.
Incorrect Example:
db.employee.find({}, {name: 1, _id: 0, salary: 0})  // Invalid
Correct Example:
db.employee.find({}, {name: 1, _id: 0})
2. Not Excluding the _id Field
By default, MongoDB includes the _id field in all query results. If we want to exclude it, we must explicitly set _id: 0 in the projection.
Incorrect Example (still returns _id):
db.employee.find({}, {name: 1, department: 1})  // Includes _id by default
Correct Example (excludes _id):
db.employee.find({}, {name: 1, department: 1, _id: 0})
