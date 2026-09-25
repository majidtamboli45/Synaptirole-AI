# MongoDB $strcasecmp Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-strcasecmp-operator/

$strcasecmp performs case-insensitive alphabetical comparison between two strings in the aggregation pipeline and returns a numeric value that indicates their relative order or equality.
- Compares two strings without considering letter case.
- Returns 0 when both strings are equal ignoring case.
- Returns 1 when the first string is lexicographically greater.
- Returns -1 when the first string is lexicographically smaller.
- Commonly used in $project, $addFields, and $expr-based filters for flexible string matching.
Syntax
{ $strcasecmp: [ <expression1>, <expression2> ] }
- <expression1>: The first string or expression to compare.
- <expression2>: The second string or expression to compare.
- The $strcasecmp operator resolves both expressions to strings, performs the case-insensitive comparison, and returns the result.
Examples of MongoDB $strcasecmp Operator
Examples of the $strcasecmp operator. In the following examples, we are working with:
- Database: GeeksforGeeks
- Collection: employee
- Document: Three documents that contain the details of the employees in the form of field-value pairs.
Example 1: Using $strcasecmp Operator
Compare the value of the department field of all the documents present in employee collection with the "development" string using $strcasecmp operator.
db.employee.aggregate([
{
$project: {
"name.first": 1,
_id: 0,
result: { $strcasecmp: ["$department", "development"] }
}
}
])
Output:
- Compares each document’s department with "development" in a case-insensitive manner.
- Outputs 0 when both strings are equal (ignoring case).
- Outputs 1 when department is lexicographically greater.
Example 2: Using $strcasecmp Operator in the Embedded Document
Compare the value of the name.first field of all the documents present in employee collection with the "Lucas" string using $strcasecmp operator.
db.employee.aggregate([
{
$project: {
result: { $strcasecmp: ["$name.first", "Lucas"] }
}
}
])
Output:
- Outputs 0 when both strings are equal (ignoring case).
- Outputs 1 when name.first is lexicographically greater.
- Outputs -1 when name.first is lexicographically smaller.
$strcasecmp in Aggregation Pipelines
$strcasecmp enables case-insensitive, lexicographical comparison of strings within MongoDB’s aggregation pipeline.
- Performs case-insensitive comparison of two strings in aggregation stages.
- Returns 1 if the first string is greater, 0 if both strings are equal, and -1 if the first string is smaller.
- Useful when simple string comparison is needed without case sensitivity.
- Comparison behavior depends on MongoDB’s collation settings; for language-specific rules, use collation instead of relying solely on $strcasecmp.
Common Use Cases for $strcasecmp
Here are some common use cases:
- User Input Validation: Match names, emails, or other fields without case sensitivity.
- Case-Insensitive Sorting: Sort strings like names or emails regardless of letter case.
- Filtering Records: Find records by string fields (e.g., department) ignoring case.
- Data Deduplication: Detect duplicates that differ only by letter case.
- Flexible Matching: Normalize comparisons where case variation is irrelevant.
