# Distinct() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-distinct-method/

The distinct() method in MongoDB is a powerful tool used to find unique values for a specified field across a single collection. By retrieving all distinct values associated with a specific key, this method helps eliminate duplicates and enables better analysis and reporting on the dataset.
In this article, We will learn about the MongoDB Distinct() method by understanding various examples in detail and so on.
MongoDB Distinct()
- The distinct() method in MongoDB is used to find the unique values for a specified field across a single collection.
- This method helps in retrieving all the distinct values associated with a specific key, thus eliminating duplicates and allowing for better analysis and reporting on the dataset.
- If we are using this method in the sharded cluster, then it may return orphaned documents.
- In this method, if the value of the given field is an array, then this method will consider each array value as a separate value. 
- For example, if the value of the specified field is [2, [23], 45], then this method considered '2', '[23]', and '45' separately.
- In this method, we can also use indexes to enhance performance.
Syntax:
db.Collection_name.distinct(
field : <string>,
query : <document>,
collation : <document>
)
Parameters:
- The first parameter is the field for which to return distinct values.
- Others are optional.
Optional Parameters:
- query: A query that specifies the documents from which to retrieve the distinct values.
- collation: It specifies the use of the collation for operations. It allows users to specify the language-specific rules for string comparison like rules for lettercase and accent marks. The type of this parameter is a document.
Return Value:
It returns an array of all the distinct values for specified fields that match to the given query.
Examples:
In the following examples, we are working with:
Database: gfg
Collections: student
Document: Three documents contains the details of the students
Output:
Example 1: Return Distinct Values for a Field
Let's Retrieve all unique names from the "student" collection in MongoDB.
db.student.distinct("name")
Output:
Here, the distinct() method returns the value of the name field.
Example 2: Return Distinct Values for an Embedded Field
Let's Retrieve all unique values of the "age" field nested within the "detail" sub-document of documents in the "student" collection in MongoDB.
db.student.distinct("detail.age")
Output:
Here, the distinct() method returns the value of the age field.
Example 3: Return Distinct Values for an Array Field
Let's Retrieve all unique values of the "marks" field from documents in the "student" collection in MongoDB.
db.student.distinct("marks")
Output:
Here, the distinct() method returns the value of the marks field.
Conclusion
Overall, the distinct() method in MongoDB can significantly enhance data analysis and reporting by identifying unique values within your collections. Whether dealing with simple fields, embedded documents, or array fields, the distinct() method provides a flexible and efficient way to manage and analyze data.
