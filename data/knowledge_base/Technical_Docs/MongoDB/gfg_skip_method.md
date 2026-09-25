# skip() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-skip-method/

When working with large datasets in MongoDB, efficient data retrieval becomes crucial. The MongoDB skip() method is an essential tool that allows developers to control which portion of the dataset is returned, improving performance and enabling better data pagination
What is MongoDB skip()?
In MongoDB, the skip() method will skip the first n document from the query result, we just need to pass the number of records/documents to be skipped. It allows us to control the starting point of the returned results, effectively removing the first n documents from the result set.
For example, if our result has 5 records in it and we want to remove the first two records from it then we can use skip(2) at the end of the query. In other words, this method calls on a cursor to control from where MongoDB starts returning the results.
Syntax:
cursor.skip(<offset>)
Or
db.collectionName.find(<query>).skip(<offset>)
- offset : The only parameter for theskip() method is the number of documents to skip in the query result. It must be a non-negative integer representing the number of documents to bypass.
Examples of MongoDB skip()
To better understand how skip() works, let's go through several practical examples. In these examples, we will use the geeksforgeeks database and the gfg collection.
- Database: geeksforgeeks
- Collections: gfg
- Document: Eight documents contains the content
Example 1: Skip the first document
db.gfg.find().skip(1)
Output:
Here, we skip the first document by passing 1 in the skip method.
Example 2: Skip the two documents
db.gfg.find().skip(2)
Output:
Here, we skip first two documents by passing 2 in the skip method.
Example 3: Skip a document that matches the given filter
db.db.gfg.find({"content":/i/i}).skip(1)
Output:
Explanation: Here, we skip the first document which contains 'i' as a character in it will be db.collectionName.find({"key":/i/i}). Here, the first /i meant for the value which contains the character 'i' in it the second /i is for case insensitive like capital I or small i both will be included.
Example 4: Skip the first two documents that match the given filter
db.gfg.find({"content":/i/i}).skip(2)
Output:
Explanation: Here, we skip the first two documents which contains 'i' as a character in it will be db.collectionName.find({"key":/i/i}). Here, the first /i meant for the value which contains the character 'i' in it the second /i is for case insensitive like capital I or small i both will be included.
Behavior of MongoDB skip()
1. Using skip() with sort()
When used in conjunction with sort(), skip() can be used to paginate through a sorted result set. For example, if we have a collection of books and you want to get the second page of results sorted by title, you would first sort the results by title and then use skip() to skip the first n documents to get to the second page.
2. Using skip() with limit()
skip() is often used in combination with limit() to paginate through large result sets. For example if we want to display 10 results per page, we would use limit(10) to limit the number of results per page and skip() to skip the correct number of documents to get to the desired page
Conclusion
The MongoDB skip() method is a powerful tool for controlling the pagination of query results. It allows developers to skip a specified number of documents and retrieve only the necessary data, making it an essential feature for working with large collections. By combining skip() with methods like limit() and sort(), we can efficiently paginate through large datasets, ensuring that the application remains responsive even when dealing with huge amounts of data.
