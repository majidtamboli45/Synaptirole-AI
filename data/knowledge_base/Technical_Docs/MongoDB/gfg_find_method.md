# find() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-db-collection-find-method/

The find() method retrieves documents from a MongoDB collection, supporting query filters, field projection, and query options to customize results while leveraging available indexes for efficient performance.
- Query Operators: Supports comparison, logical, and element operators for complex queries.
- Field Selection: Includes or excludes fields to reduce data transfer.
- Index Usage: May use existing indexes (such as the default _id index) depending on the query planner.
Syntax
db.collection_name.find(selection_criteria, projection,options)
- db.collection_name.find(): Specifies the collection to retrieve documents from (the current database is implied by db).
- selection_criteria (document): Filters documents by conditions. {} returns all documents.
- projection (document): Includes or excludes specific fields in the result.
- options (document): Supports additional parameters like sort, limit, and skip.
Examples of find() Method
Consider a collection called student of gfg database which contains the following documents:
- Database: gfg
- Collections: students
- Document: Three documents contain the details of the students.
Example 1: Find All Documents in a Collection
Find all student records from the "students" collection.
db.students.find() Output:
Example 2: Find Documents with a Specific Condition
Find all the students whose age is exactly 18.
db.students.find({age:18})
Output:
Example 3: Using Nested Documents in Queries
Find student records from the "students" collection where the student's math score is 230 and science score is 234.
db.students.find({score:{math: 230, science: 234}})
Output:
Example 4: Using Projection
Retrieve the names of all students while excluding the score field.
db.students.find({}, {score: 0 })
Output:
Example 5: Sorting Results
Retrieve all student records sorted by age in ascending order.
db.students.find().sort({ age: 1 })
Output:
Example 6: Limiting Results
The limit method restricts the number of documents returned to the specified value.
db.students.find().limit(2)
Output:
