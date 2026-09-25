# MongoDB AND operator ( $and )

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-and-operator-and/

The MongoDB $and operator combines multiple conditions in a single query and returns documents that satisfy all specified criteria, enabling precise and flexible filtering for complex queries.
- Returns documents that match every condition in the query.
- Useful for building complex and precise filters.
- Evaluates multiple conditions together; performance depends on query planning and index usage.
- Can be used explicitly with $and or implicitly by listing conditions.
- Required when applying multiple conditions to the same field or operator.
Syntax:
{ $and: [ { Expression1 }, { Expression2 }, ..., { ExpressionN } ] }
or
{ Expression1, Expression2, ..., ExpressionN }
Usage of $and Operator
Use the $and operator to filter documents that must satisfy multiple conditions at the same time.
- When filtering documents based on multiple criteria.
- When building complex queries where all conditions must be true.
- When combining conditions on the same field or with different operators.
Examples of MongoDB AND Operator
Some practical use cases and MongoDB queries that utilize the $and operator. In the following examples, we are working with:
- Database: GeeksforGeeks
- Collection: contributor
- Document: three documents that contain the details of the contributors in the form of field-value pairs.
Example 1: Matching values using $and operator
Retrieving only those employees' documents whose branch is CSE and joiningYear is 2018.
db.contributor.find({$and: [{branch: "CSE"}, {joiningYear: 2018}]})
Output:
Example 2: With multiple expressions specifying the same field
Retrieving only those employees' documents whose branch is CSE.
db.contributor.find({$and: [{branch: {$eq: "CSE"}},  {branch: {$exists: true}}]})
or
db.contributor.find({branch: {$eq: "CSE", $exists: true}})
Output:
Example 3: With multiple expressions specifying the same operator
Retrieve documents where either the branch is ECE or the joining year is 2017, and either the personal.state is "Texas" or the personal.age is 25.
db.contributor.find({$and: [{ $or: [{ branch: "ECE" }, { joiningYear: 2017 }] }, { $or: [{ "personal.state": "Texas" }, { "personal.age": 25 }] }]})
Output:
Advantages of Using the $and Operator
Some advantages are discussed below:
- Precise filtering: Ensures documents meet all specified conditions.
- Better performance: Combines conditions efficiently to narrow results early.
- Supports complex logic: Works with $or, $gt, $lt, $in, and other operators for advanced queries.
