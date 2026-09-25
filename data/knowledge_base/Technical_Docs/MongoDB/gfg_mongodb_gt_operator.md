# MongoDB $gt Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-greater-than-operator-gt/

The $gt operator in MongoDB matches documents where a field’s value is greater than a specified value. It is commonly used with find(), update(), and aggregation pipelines for filtering, analysis, and range-based queries.
- Filters documents where a field value is greater than a given value.
- Works with data types such as numbers, strings, and dates; array comparisons use lexicographical ordering and are less commonly used.
- Can be combined with other query operators for complex filtering.
- Useful for range queries, threshold checks, and data analysis.
Syntax
{field: {$gt: value}}
- field: Specifies the name of the field to evaluate.
- $gt: Indicates the greater-than condition.
- value: The threshold value to compare against.
Features of $gt Operator
The $gt operator is flexible and efficient for filtering documents greater than a given value across different query methods.
- Versatile types: Works with numbers, strings, dates, and arrays.
- Operator chaining: Combines with $lt, $gte, $and, and $or for complex filters.
- Nested queries: Supports dot notation for embedded fields.
- Method support: Works with find(), update(), delete(), and aggregation pipelines.
- Performance-friendly: Uses indexes (if available) to speed up queries.
Examples of MongoDB $gt Operator
Consider the following sample data. We will use a database named GeeksforGeeks and a collection called employee, which contains the following documents:
- Database: GeeksforGeeks
- Collection: employee
- Document: Four documents that contain the details of the employees in the form of field-value pairs.
Example 1: Find Employees with a Salary Greater Than 35,000
Retrieving those documents where the value of the salary field is greater than 35000.
Query:
db.employee.find({salary: {$gt: 35000}})
Output:
Example 2: Find Employees with Age Greater Than 23
Retrieving only those documents where the age of the employee is greater than 23.
Query:
db.employee.find({"personalDetails.age": {$gt:23}})
Output:
The query uses dot notation to access the nested age field inside the personalDetails document and applies the $gt operator.
Example 3: Using $gt operator with arrays
Retrieving only those documents where the points array is greater than the specified array.
Query:
db.employee.find({points: {$gt: [4,5]}})
Output:
The query compares the points array with [4, 5] using lexicographical ordering, where elements are compared sequentially from left to right.
Use Cases of $gt Operator
The $gt operator is used to filter documents where a field value is greater than a specified threshold.
- Threshold analysis: Find records exceeding a specific value (e.g., salaries above a limit).
- Date filtering: Retrieve documents after a certain date, often combined with $lt for ranges.
- Ranking and scores: Identify entries with scores or ranks above a given level.
- Data validation: Check whether fields meet minimum required values.
