# countDocuments() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-countdocuments-method/

MongoDB provides powerful methods to manage and retrieve data efficiently. One such method is countDocuments(), which allows us to count the number of documents in a collection that match a specified query filter. This method is particularly useful when dealing with large datasets, ensuring accurate and efficient counting operations.
In this article, we will explore the countDocuments() method in MongoDB, its syntax, parameters, examples, and best practices to enhance performance.
What is countDocuments() in MongoDB?
The countDocuments() method in MongoDB is used to count the number of documents in a collection that match a specified query filter. It performs a precise count by scanning documents in the collection or utilizing indexes for optimized counting. It takes two arguments first one is the selection criteria and the other is optional. 
Key Features of countDocuments()
- Provides accurate counts based on a query filter.
- Supports multi-document transactions.
- Returns 0 if the collection is empty or does not exist.
- Does not rely on metadata; instead, it performs aggregation for precision.
- Cannot be used with operators like $where ,$near , and$nearSphere .
- Can use indexes for better performance on large datasets.
Syntax
db.collection.countDocuments(query, options)
Parameters:
- query : A document that specifies the selection criteria using query operators.
- options (Optional): An object that specifies additional options for the count operation.
- Some of the options include:
  - limit : The maximum number of documents to count.
  - skip : The number of documents to skip before counting.
  - hint : An index hint to use for the query.
  - maxTimeMS : The maximum amount of time to allow the query to run.
Examples of countDocuments() in MongoDB
To understand MongoDB countDocuments() we need a collection called student. This collection contains student records with fields such as name, age, and grade, allowing us to perform various counting queries based on different conditions.
Below, we will execute queries on this dataset to count documents efficiently.
Example 1: Count all Documents in a Collection
The countDocuments({}) method is used to count all documents in a collection. Since we pass an empty query ({}), MongoDB does not apply any filters and returns the total number of documents available in the student collection.
Query:
db.student.countDocuments({})
Output:
Explanation:
- The empty {} query matches all documents in the collection.
- MongoDB counts and returns the total number of documents stored in the student collection.
- If the collection is empty, the result will be 0
Example 2: Count Documents Matching a Query
The countDocuments() method can be used with a query filter to count documents that match specific conditions. In this example, we count the number of students whose age is greater than 18 ($gt: 18)
Query:
db.student.countDocuments({age:{$gt:18}})
Output:
Explanation:
- The { age: { $gt: 18 } } filter selects only students whereage is greater than 18.
- MongoDB scans the student collection and counts only the matching documents.
- If no students match the criteria, the result will be 0
Example 3: Count Documents with a Specific Condition
In this example, we use countDocuments() to count the number of students who have received grade "A" in the student collection.
Query:
db.student.countDocuments({ grade: "A" });
Output:
2
Explanation:
- The filter { grade: "A" } matches only those students whosegrade field is exactly "A".
- MongoDB scans the student collection and counts only the documents that meet this condition.
- If no students have grade "A", the result will be 0
Example 4: Count with Limit and Skip
In this example, we use countDocuments() with the skip and limit options to control which documents are counted. This allows us to skip the first document and count only the next two in the student collection.
Query:
db.student.countDocuments({}, { skip: 1, limit: 2 });
Output:
2
Explanation:
- skip: 1 → Skips the first document in the collection.
- limit: 2 → Counts only the next two documents after skipping.
- This query ensures that the first document is ignored, and counting starts from the second document.
Performance Considerations for countDocuments()
To optimize counting queries, follow these best practices:
✅ Use Indexes: If counting based on a query, ensure the field is indexed for faster execution.
✅ Avoid Large Skips: Using .skip() on large collections can be slow; instead, use range queries ($gte, $lte). 
✅ Apply Filters Efficiently: Use specific field filters to reduce the dataset scanned.
✅ Set maxTimeMS: To prevent long-running queries, set a timeout using maxTimeMS
Conclusion
The countDocuments() method in MongoDB is a powerful tool for counting documents accurately within a collection. By using indexes and query optimizations, it can handle large-scale datasets efficiently. Whether you’re working on analytics, reporting, or database monitoring, mastering countDocuments() will enhance performance and scalability in your MongoDB applications. Understanding how to combine countDocuments() with filters, indexing, and pagination will further optimize query execution and improve overall database efficiency
