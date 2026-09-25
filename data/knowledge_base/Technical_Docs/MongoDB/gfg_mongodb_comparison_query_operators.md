# MongoDB Comparison Query Operators

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-comparison-query-operators/

MongoDB comparison query operators filter documents by matching exact values or selecting value ranges across numeric, string, and date fields, helping retrieve relevant results efficiently.
- Exact match: Use $eq, $ne to match or exclude values.
- Multiple values: Use $in, $nin to match or exclude from a list of values.
- Range queries: Use $gt, $gte, $lt, $lte to filter ranges.
- Type support: Works with numbers, strings, and dates.
- Better filtering: Narrows results for faster, accurate queries.
MongoDB Comparison Operators
Examples using a sample "Students" collection in a database named "GeeksforGeeks".
- Database: GeeksforGeeks
- Collection: Students
- Document: Three documents that contain the details of the Students in the form of field-value pairs.
1. $nin operator
$nin matches none of the values specified in an array.
Example: Retrieving only those Student's documents whose name is not "Alen" or "Clevin".
db.Students.find({name: {$nin: ["Alen", "Clevin"]}})
Output:
2. $in operator
$in matches any of the values specified in an array.
Example: Retrieving only those students documents whose name is either "Alen" or "Clevin".
db.Students.find({name: {$in: ["Alen", "Clevin"]}})
Output:
3. $lt operator
$lt matches values of the fields that are less than a specified value.
Example: Retrieving those documents where the value of the salary field is less than 55000.
db.Students.find({salary: {$lt: 55000}})
Output:
4. $eq operator
$eq matches the values of the fields that are equal to a specified value.
Example: Retrieving those documents where the value of the branch field is equal to "CSE".
db.Students.find({branch: {$eq: "CSE"}})
Output:
5. $ne operator
$ne matches all values of the field that are not equal to a specified value.
Example: Retrieving those documents where the value of the branch field is not equal to CSE.
 db.Students.find({branch: {$ne: "CSE"}})
Output:
6. $gt operator
$gt matches values of the fields that are greater than a specified value.
Example: Retrieving those documents where the value of the salary field is greater than 5000.
db.Students.find({salary: {$gt: 5000}})
Output:
7. $gte operator
$gte matches values of the fields that are greater than or equal to the specified value.
Example: Retrieving those documents where the value of the joiningYear field is greater than equals to 2023.
db.Students.find({joiningYear: {$gte: 2023}})
Output:
8. $lte operator
$lte matches values of the fields that are less than or equal to the specified value.
Example: Retrieving those documents where the value of the joiningYear field is less than or equal to 2023.
db.Students.find({joiningYear: {$lte: 2023}})
Output:
