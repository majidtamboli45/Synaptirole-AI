# MongoDB NOR Operator ( $nor )

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-nor-operator-nor/

The $nor operator returns documents where none of the given conditions match, it's the logical inverse of $or, useful for excluding multiple criteria in one query.
- Logical NOR: Matches documents that fail all given conditions.
- Inverse of $or: Excludes any document that matches any condition.
- Takes an array of expressions: { $nor: [ {cond1}, {cond2}, ... ] }.
- Useful for exclusion filters: Cleanly filter out multiple unwanted cases.
- Works with operators: Can combine $gt, $lt, $in, $regex, etc.
- Missing fields: Documents with missing fields may match if the specified conditions do not evaluate to true for those fields.
- Index usage: Performance depends on the indexed fields in conditions.
Syntax
{ $nor: [ { Expression1 }, { Expression2 }, ...  { ExpressionN } ] }
- Expression1, Expression2, ..., ExpressionN: These are conditions or queries that documents must not match. The operator returns documents where none of these conditions are true.
Examples of using MongoDB Operations
In the following examples, we are working with:
- Database: GeeksforGeeks
- Collection: contributor
- Document: Three documents that contain the details of the contributors in the form of field-value pairs.
Example 1: Matching Values using $nor Operator
Retrieve documents that do not match any of the specified conditions, meaning documents where the salary is not 3000 and the branch is not "ECE".
Query:
db.contributor.find({$nor: [{salary: 3000}, {branch: "ECE"}]})
Output:
Example 2: Matching Values in Nested/Embedded Documents using $nor Operator
Retrieve contributor documents where the age is not 24 and the state is not "California, USA" in the personal subdocument.
Query:
db.contributor.find({$nor: [{ "personal.age": 24 }, { "personal.state": "California, USA" }]})
Output:
Example 3: Matching Values in an Array using $nor Operator
Retrieve documents where the language field does not contain either "Java" or "C++".
Query:
db.contributor.find({$nor: [{language: {$in: ["Java", "C++"]}}]})
Output:
Usage of $nor Operator in MongoDB
The $nor operator in MongoDB helps exclude documents by ensuring none of multiple conditions match. It’s ideal for applying a logical NOT across combined criteria in complex filters.
- Excludes documents matching any given condition.
- Applies logical NOT to combined expressions.
- Filters records that fail all specified criteria.
- Useful for excluding categories or statuses.
- Helps ignore specific flags/values across fields.
- Supports complex exclusion logic in queries.
Advantages of Using $nor in MongoDB
The $nor operator enables flexible exclusion in MongoDB queries by returning documents where none of multiple conditions match.
- Flexible Filtering: $nor enables powerful filtering in MongoDB queries for complex negative conditions, offering more flexibility than simple negation.
- Exclusion Logic: Useful for excluding documents that match any condition in an array of expressions.
- Complex Queries: Combines with $eq, $gt, $lt, $in, etc., to build complex exclusion logic in MongoDB queries.
