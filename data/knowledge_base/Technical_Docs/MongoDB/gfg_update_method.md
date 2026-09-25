# Update() Method

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-update-method/

MongoDB update operations modify one or multiple documents using update operators like $set and $inc, while keeping _id unchanged.
- Can update one or many documents.
- update() is deprecated in newer MongoDB versions.
- Use multi: true to update multiple matching documents.
Note: In MongoDB, the update() method has been deprecated in favor of using updateOne() or updateMany() depending on your specific use case.
Syntax
db.COLLECTION_NAME.update({SELECTION_CRITERIA}, {$set:{UPDATED_DATA}}, {
upsert: <boolean>,
multi: <boolean>,
writeConcern: <document>,
collation: <document>,
arrayFilters: [ <filterdocument1>, ... ],
hint: <document|string>
})
- COLLECTION_NAME: The name of the collection to update.
- SELECTION_CRITERIA: The criteria to select which documents to update.
- UPDATED_DATA: The new data to set for the selected documents.
- upsert(optional): If set to true, creates a new document when no document matches the selection criteria.
- multi (optional): true updates all matching documents; false updates only the first.
- writeConcern (optional): Specifies the level of write concern for the operation.
- collation (optional): Specifies the collation for string comparisons.
- arrayFilters (optional): Filters to determine which elements to modify in an array field.
- hint (optional): Forces MongoDB to use a specific index for the operation.
Examples of MongoDB update
To understand MongoDB update we need a collection called students on which we will perform various operations and queries.
[
{ _id: 1, name: "Alice", age: 25, grades: [
{ grade: "Maths", score: 80 },
{ grade: "Science", score: 85 }
]
},
{ _id: 2, name: "Bob", age: 30, grades: [
{ grade: "Maths", score: 75 },
{ grade: "Science", score: 90 }
]
},
{ _id: 3, name: "Charlie", age: 35, grades: [
{ grade: "Maths", score: 95 },
{ grade: "Science", score: 88 }
]
}
]
Example 1: Update a Single Document
Write a query to update the age of a student named Alice to 26 in the "students" collection.
Query:
db.students.updateOne(
{ name: "Alice" },
{ $set: { age: 26 } }
)
Output:
[
{
_id: 1,
name: 'Alice',
age: 26,
grades: [ { grade: 'Maths', score: 80 }, { grade: 'Science', score: 85 } ]
},
{
_id: 2,
name: 'Bob',
age: 30,
grades: [ { grade: 'Maths', score: 75 }, { grade: 'Science', score: 90 } ]
},
{
_id: 3,
name: 'Charlie',
age: 35,
grades: [ { grade: 'Maths', score: 95 }, { grade: 'Science', score: 88 } ]
}
]
Example 2: Use Update Operator Expressions ($inc and $set)
Write a query to increment the age of a student named Bob by 1 in the "students" collection.
Query:
db.students.updateOne(
{ name: "Bob" },
{ $inc: { age: 1 } }
)
Output:
[
{
_id: 1,
name: 'Alice',
age: 26,
grades: [ { grade: 'Maths', score: 80 }, { grade: 'Science', score: 85 } ]
},
{
_id: 2,
name: 'Bob',
age: 31,
grades: [ { grade: 'Maths', score: 75 }, { grade: 'Science', score: 90 } ]
},
{
_id: 3,
name: 'Charlie',
age: 35,
grades: [ { grade: 'Maths', score: 95 }, { grade: 'Science', score: 88 } ]
}
]
Example 3: Insert a New Document if No Match Exists (Upsert)
Updates Charlie’s age to 30 or inserts the document if not found.
Query:
db.students.updateOne(
{ name: "Charlie" },
{ $set: { age: 30 } },
{ upsert: true }
)
Output:
[
{
_id: 1,
name: 'Alice',
age: 26,
grades: [ { grade: 'Maths', score: 80 }, { grade: 'Science', score: 85 } ]
},
{
_id: 2,
name: 'Bob',
age: 31,
grades: [ { grade: 'Maths', score: 75 }, { grade: 'Science', score: 90 } ]
},
{
_id: 3,
name: 'Charlie',
age: 30,
grades: [ { grade: 'Maths', score: 95 }, { grade: 'Science', score: 88 } ]
}
]
Example 4: Upsert with Existing Document
Updates Alice’s age to 26 or inserts the document only if not found.
Query:
db.students.updateOne(
{ name: "Alice" },
{ $set: { age: 26 } },
{ upsert: true }
)
Output:
[
{
_id: 1,
name: 'Alice',
age: 26,
grades: [ { grade: 'Maths', score: 80 }, { grade: 'Science', score: 85 } ]
},
{
_id: 2,
name: 'Bob',
age: 31,
grades: [ { grade: 'Maths', score: 75 }, { grade: 'Science', score: 90 } ]
},
{
_id: 3,
name: 'Charlie',
age: 30,
grades: [ { grade: 'Maths', score: 95 }, { grade: 'Science', score: 88 } ]
}
]
Example 5: Update with Aggregation Pipeline
Increments Alice’s age by 1 using an update aggregation pipeline.
Query:
db.students.updateOne(
{ name: "Alice" },
[
{ $set: { age: { $add: ["$age", 1] } } }
]
)
Output:
[
{
_id: 1,
name: 'Alice',
age: 27,
grades: [ { grade: 'Maths', score: 80 }, { grade: 'Science', score: 85 } ]
},
{
_id: 2,
name: 'Bob',
age: 31,
grades: [ { grade: 'Maths', score: 75 }, { grade: 'Science', score: 90 } ]
},
{
_id: 3,
name: 'Charlie',
age: 30,
grades: [ { grade: 'Maths', score: 95 }, { grade: 'Science', score: 88 } ]
}
]
Example 6: Update Elements Match arrayFilters Criteria
Updates the score of a student's "Maths" grade to 85 using an array filter in the "students" collection.
Query:
db.students.updateOne(
{ _id: 1 },
{ $set: { "grades.$[elem].score": 85 } },
{ arrayFilters: [ { "elem.grade": { $eq: "Maths" } } ] }
)
Output:
[
{
_id: 1,
name: 'Alice',
age: 27,
grades: [ { grade: 'Maths', score: 85 }, { grade: 'Science', score: 85 } ]
},
{
_id: 2,
name: 'Bob',
age: 31,
grades: [ { grade: 'Maths', score: 75 }, { grade: 'Science', score: 90 } ]
},
{
_id: 3,
name: 'Charlie',
age: 30,
grades: [ { grade: 'Maths', score: 95 }, { grade: 'Science', score: 88 } ]
}
]
Example 7: Update Specific Elements of an Array of Documents
Updates the score of a student's "Science" grade to 90 using an array filter in the "students" collection.
Query:
db.students.updateOne(
{ _id: 1 },
{ $set: { "grades.$[elem].score": 90 } },
{ arrayFilters: [ { "elem.grade": { $eq: "Science" } } ] }
)
Output:
[
{
_id: 1,
name: 'Alice',
age: 27,
grades: [ { grade: 'Maths', score: 85 }, { grade: 'Science', score: 90 } ]
},
{
_id: 2,
name: 'Bob',
age: 31,
grades: [ { grade: 'Maths', score: 75 }, { grade: 'Science', score: 90 } ]
},
{
_id: 3,
name: 'Charlie',
age: 30,
grades: [ { grade: 'Maths', score: 95 }, { grade: 'Science', score: 88 } ]
}
]
