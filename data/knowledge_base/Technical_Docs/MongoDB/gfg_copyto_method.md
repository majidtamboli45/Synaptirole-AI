# copyTo() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-copyto-method/

MongoDB copyTo() method is used to duplicate the contents of one collection into another collection within the same database. It's like making a copy of a file on your computer to another location. In this article, We will learn about MongoDB copyTo() Method with the help of examples and so on.
MongoDB copyTo() Method
- The copyTo() method in MongoDB is used to copy the contents of one collection to another collection. This method is a part of thedb.collection object and is primarily used for duplicating the data within a database.
- However, it is worth noting that copyTo() is deprecated and should be avoided in favor of other methods such asaggregate() ,insertMany() , or using MongoDB data export/import tools for copying collections.
- In other words, the copyTo() method is used to copy all the documents from one collection(Source collection) to another collection(Target collection) using server-side JavaScript, and if that other collection(Target collection) is not present then MongoDB creates a new collection with that name. This method uses the eval command internally.
Note: As CopyTo() uses eval() internally & eval() has been deprecated since version 3.0, so CopyTo() is also deprecated since version 3.0.
Syntax:
db.sourceCollection.copyTo(targetCollection)
Parameter:
It takes only the name of the target collection where you want to copy the documents of the source collection. The type of this parameter is string.
Return:
This method returns the number of documents copied and if that process fails it throws an exception.
Examples of MongoDB copyTo() Method
Example 1: In the following example, we are working with:
Database: gfg
Collections: collectionA and collectionB
Output:
The collectionB contains two documents:
Now we copy the documents of collectionA to collectionB using copyTo() method.
db.collectionA.copyTo("collectionB")
Output:
Example 2: In the following example, we are working with:
Database: gfg
Collection: Collection
Documents: Three documents contains name and age of the students
Output:
Now we going to copy the documents of sCollection to a new collection i.e., tCollection using copyTo() method. Here, the tCollection is not present in gfg database so MongoDB create this collection.
db.sCollection.copyTo("tCollection")
Output:
Conclusion
In summary, while the copyTo() method can duplicate collections in MongoDB, it is now deprecated and should be avoided. Instead, developers should use more modern and efficient methods like aggregate(), insertMany(), or MongoDB's export/import tools for copying collections.
