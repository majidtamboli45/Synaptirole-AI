# Query for Null or Missing Fields In MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/query-for-null-or-missing-fields-in-mongodb/

Querying null and missing fields in MongoDB (including MongoDB Atlas) helps handle incomplete data accurately using operators like $eq, $exists, $ne, and $or.
- Null field: exists but has a null value.
- Missing field: does not exist in the document.
- Use $exists to check presence and $eq/$ne to match values.
- Example collection (e.g., students with name, email, phone) demonstrate these queries.
{ "_id": 1, "name": "Alen", "email": "alen@example.com", "phone": "123-456-7890" }
{ "_id": 2, "name": "Ben", "email": null, "phone": "458-654-3210" }
{ "_id": 3, "name": "Clevin", "email": "clevin@example.com", "phone": null }
{ "_id": 4, "name": "Denial", "email": null, "phone": null }
Null Values in MongoDB
To query for documents where a specific field is null, MongoDB provides the $eq operator. This operator matches documents where the specified field is equal to the specified value, including null.
Example: Find Students with a null Email
We have a collection named students with documents representing user profiles. We want to find users who have not provided their email addresses.
Query:
db.students.find({ email: { $eq: null } })
Output:
{ _id: 2, name: 'Ben', email: null, phone: 545 }
{ _id: 4, name: 'Denial', email: null, phone: null }
This query returns documents where the email field is null or missing.
Missing Fields in MongoDB
Use the $exists operator with false to return documents where a field is missing.
Example: Find Students Where description Field is Missing
To find students that do not have a description field.
Query:
db.students.find({ description: { $exists: false } })
Output:
{ _id: 1, name: 'Alen', email: "alen@example.com", phone: "123-456-7890" } 
{ _id: 2, name: 'Ben', email: null, phone: 458-654-3210 }
{ _id: 3, name: 'Clevin', email: "clevin@example.com", phone: null }
{ _id: 4, name: 'Denial', email: null, phone: null }
- The description field is missing in all documents.
- $exists: false matches documents where the field is missing.
- So the query returns all documents.
Null or Missing Fields in MongoDB
In some cases, we may need to combine conditions to query for documents with null or missing fields based on multiple criteria. MongoDB allows us to use logical operators like $and, $or, and $not for this purpose.
Example: Find Students Without Email or Phone
We want to find students who have not provided their email addresses or phone numbers:
Query:
db.students.find({
$or: [
{ email: { $exists: false } },
{ email: null },
{ phone: { $exists: false } },
{ phone: null }
]
})
Output:
{ _id: 2, name: 'Ben',  email: null, phone: '458-654-3210'}
{_id: 3, name: 'Clevin', email: 'c@gmail.com', phone: null}
{_id: 4, name: 'Denial ', email: null, phone: null }
This query uses $or to match documents where email or phone is missing or explicitly null.
