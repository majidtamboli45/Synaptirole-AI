# MongoDB OR operator ( $or )

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-or-operator-or/

The MongoDB $or operator matches documents that satisfy at least one of multiple conditions, making it ideal for flexible filtering in searches and data retrieval.
- Returns documents that match any one of the specified conditions.
- Accepts multiple conditions as an array.
- Works with find(), update(), and aggregation pipelines.
- Each condition is evaluated independently.
- Can be nested with other logical operators for complex queries.
- May use indexes (if available) depending on the query planner.
Syntax
{ $or: [ { Expression1 }, { Expression2 }, ..., { ExpressionN } ] }
Examples of Using $or in Queries
Let's first set up MongoDB and insert sample data for demonstration. We will be working with:
- Database: GeeksforGeeks
- Collection: contributor
- Document: Three documents that contain the details of the contributors in the form of field-value pairs.
Example: Retrieve all contributor documents where the branch is ECE or the joining year is 2017
db.contributor.find({$or: [{ branch: "ECE" }, { joiningYear: 2017 }]})
Output:
Matching Values in Nested/Embedded Documents
The $or operator can query nested fields, letting you filter documents using multiple conditions within embedded objects.
Example: Retrieve contributor's where either age is 24 or State is Texas
db.contributor.find({$or: [{"personal.age": 24}, {"personal.state": "Texas"}]})
Output:
Matching Values in an Array using $or Operator
The $or operator can match values in arrays, returning documents where at least one array element meets a condition.
Example: Retrieve contributors who know either "Java" or "C"
db.contributor.find({$or: [{ language: { $in: ["Java"] } }, { language: { $in: ["C"] } }]})
Output:
Combining $or with Other Logical Operators
MongoDB lets you combine $or with $and, $nor, and $not to build flexible, complex queries.
Example: Retrieve contributors whose branch is ECE or personal state is Finance Department and are at least 25 years old
db.contributor.find({$and: [{ $or: [{ branch: "ECE" }, { joiningYear: 2017 }] }, { $or: [{ "personal.state": "Texas" }, { "personal.age": 25 }]}]})
Output:
Performance Considerations for $or Queries
Optimizing $or queries with proper indexing helps MongoDB avoid full collection scans and improves query performance.
- Indexing: Use indexes on fields in each $or condition to enable index scans.
- Execution strategy: MongoDB selects the best plan per condition when indexes exist.
- Compound indexes: Create compound indexes when $or queries frequently target the same fields.
Usage of $or in MongoDB
Use the $or operator when documents can match any one of multiple conditions.
- When results may satisfy one of several criteria.
- When querying nested or embedded fields.
- When matching documents with different possible values in an array field.
