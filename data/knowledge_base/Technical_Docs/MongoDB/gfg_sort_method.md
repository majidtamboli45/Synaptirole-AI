# sort() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-sort-method/

The sort() method specifies the order of documents returned from a query. It sorts query results using field-value pairs, with 1 for ascending and -1 for descending. MongoDB generally performs:
- Stable Sort: A sort is stable if it returns the same results on the same dataset every time.
- Unstable Sort: A sort is unstable if results differ on repeated queries of the same dataset.
Syntax:
db.Collection_Name.sort({field_name:1 or -1})
- field_name: The field you want to sort by (e.g., age, name, date).
- 1 for ascending order or -1 for descending order.
Sort() method in MongoDB
In MongoDB, the sort() method arranges the results of a query based on one or more fields. Each field is specified as a key in an object, with a value of 1 for ascending order or -1 for descending order.
Syntax:
db.collection.find().sort({ field1: 1, field2: -1 })
- The find() method retrieves documents from the collection.
- The sort() method sorts the results by field1 in ascending order and by field2 in descending order.
- If sort() is not used, MongoDB returns documents in the order they are stored (usually insertion order).
Example:
db.students.find().sort({ age: 1 })
Output:
{ "_id": 1, "name": "Alice", "age": 18 }
{ "_id": 2, "name": "Bob", "age": 19 }
{ "_id": 3, "name": "Charlie", "age": 20 }
- sort({ age: 1 }): Arranges students from the youngest to the oldest.
- All documents are returned since no limit is applied.
Examples of MongoDB sort()
To understand sort method in MongoDB we need a collection called students on which we will perform various operations and queries.
[
{
_id: ObjectId('600f1abb923681e7681ebdce'),
name: 'Akshay',
age: 19
},
{ _id: ObjectId('600f1abb923681e7681ebdcf'), name: 'Bablu', age: 18 },
{
_id: ObjectId('600f1abb923681e7681ebdd0'),
name: 'Rakesh',
age: 21
},
{
_id: ObjectId('600f1abb923681e7681ebdd1'),
name: 'Gourav',
age: 20
}
]
[Example 1]: Sorting by Age in Ascending Order
Query:
db.student.find().sort({age:1})
Output:
[
{ _id: ObjectId('600f1abb923681e7681ebdcf'), name: 'Bablu', age: 18 },
{
_id: ObjectId('600f1abb923681e7681ebdce'),
name: 'Akshay',
age: 19
},
{
_id: ObjectId('600f1abb923681e7681ebdd1'),
name: 'Gourav',
age: 20
},
{
_id: ObjectId('600f1abb923681e7681ebdd0'),
name: 'Rakesh',
age: 21
}
]
- This query sorts the documents by the age field in ascending order.
- As a result, the youngest student ("Bablu", age 18) comes first, followed by others in increasing order of age.
[Example 2]: Sorting by Age in Descending Order
Query:
db.student.find().sort({age:-1})
Output:
[
{
_id: ObjectId('600f1abb923681e7681ebdd0'),
name: 'Rakesh',
age: 21
},
{
_id: ObjectId('600f1abb923681e7681ebdd1'),
name: 'Gourav',
age: 20
},
{
_id: ObjectId('600f1abb923681e7681ebdce'),
name: 'Akshay',
age: 19
},
{ _id: ObjectId('600f1abb923681e7681ebdcf'), name: 'Bablu', age: 18 }
]
- Here, the documents are sorted by age in descending order.
- The oldest student ("Rakesh", age 21) comes first, followed by the others in decreasing order of age.
[Example 3]: Sorting by Name in Ascending Order.
Query:
db.student.find().sort({name:1})
Output:
[
{
_id: ObjectId('600f1abb923681e7681ebdce'),
name: 'Akshay',
age: 19
},
{ _id: ObjectId('600f1abb923681e7681ebdcf'), name: 'Bablu', age: 18 },
{
_id: ObjectId('600f1abb923681e7681ebdd1'),
name: 'Gourav',
age: 20
},
{
_id: ObjectId('600f1abb923681e7681ebdd0'),
name: 'Rakesh',
age: 21
}
]
- The documents are sorted alphabetically by name in ascending order.
- The sorting is case-sensitive, so it follows the lexicographical order, with "Akshay" first, followed by "Bablu", "Gourav", and "Rakesh".
[Example 4]: Descending order of student name:
Query:
db.student.find().sort({name:-1})
Output:
[
{
_id: ObjectId('600f1abb923681e7681ebdd0'),
name: 'Rakesh',
age: 21
},
{
_id: ObjectId('600f1abb923681e7681ebdd1'),
name: 'Gourav',
age: 20
},
{ _id: ObjectId('600f1abb923681e7681ebdcf'), name: 'Bablu', age: 18 },
{
_id: ObjectId('600f1abb923681e7681ebdce'),
name: 'Akshay',
age: 19
}
]
- The documents are now sorted in descending order of name.
- "Rakesh" appears first, followed by "Gourav", "Bablu", and "Akshay".
Sorting Using Multiple Fields
MongoDB allows sorting query results by more than one field using the sort() method. When multiple fields are specified, the sort order is applied from left to right, meaning the first field is sorted first, and for documents with the same value in the first field, the second field determines the order, and so on.
Example: Suppose we have a vehicles collection:
[
{ "make": "Audi", "price": 50000 },
{ "make": "BMW", "price": 60000 },
{ "make": "Audi", "price": 45000 },
{ "make": "BMW", "price": 55000 }
]
Query to sort by make ascending and price descending:
db.vehicles.find().sort({ make: 1, price: -1 })
Output:
{ "make": "Audi", "price": 50000 }
{ "make": "Audi", "price": 45000 }
{ "make": "BMW", "price": 60000 }
{ "make": "BMW", "price": 55000 }
- Documents are first grouped by make in ascending order.
- Within each make, documents are sorted by price in descending order.
- This allows multi-level sorting, which is useful for organizing complex datasets.
Sorting with limit() in MongoDB
The limit() method restricts the number of documents returned by a query. When combined with sort(), it allows returning the top N documents according to the sorted order.
Syntax:
db.collection.find().sort({ field: 1 }).limit(n)
- db.collection.find(): Retrieves documents from the collection.
- .sort({ field: 1 }): Sorts the documents by the specified field (1 for ascending, -1 for descending).
- .limit(n): Restricts the output to n documents.
Example:
db.students.find().sort({ age: 1 }).limit(2)
Output:
{ "_id": 1, "name": "Alice", "age": 18 }
{ "_id": 2, "name": "Bob", "age": 19 }
- sort({ age: 1 }): Orders students from youngest to oldest.
- limit(2): Returns only the first 2 students after sorting.
Performance Considerations
Sorting operations can be slow on large datasets so it’s important to optimize them for better performance:
- Indexes: Create indexes on the fields that we frequently sort by. MongoDB can use indexes to improve the sorting performance.
- allowDiskUse: When sorting large result sets, enable allowDiskUse to perform the sort operation on disk rather than in memory.
- Limit Results: Use the limit() method in combination with sort() to reduce the number of documents processed.
