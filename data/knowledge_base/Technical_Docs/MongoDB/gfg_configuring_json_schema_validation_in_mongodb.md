# Configuring JSON Schema Validation in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/specify-json-schema-validation-in-mongodb/

MongoDB’s JSON Schema Validation enforces structured rules on documents at the collection level, ensuring only valid and consistent data is stored while keeping NoSQL flexibility.
- Defines field types and required fields using $jsonSchema.
- Supports constraints like patterns (regex), ranges, and enums.
- Validates documents on insert and update operations.
- Improves data integrity by introducing structured validation while still maintaining MongoDB’s flexible schema model.
Implementation Steps for JSON Schema Validation
A step-by-step process to define, apply, and test schema rules for ensuring valid data in MongoDB collections.
Step 1: Creating a JSON Schema
Create a $jsonSchema object to define validation rules for the collection. The schema enforces required fields (first_name, last_name, email) and validates data types, with a regex constraint to ensure email follows a valid format.
The JSON that we will use for the Schema Validation:
{
$jsonSchema: {
bsonType: "object",
required: ["first_name", "last_name", "age", "email"],
properties: {
first_name: {
bsonType: "string",
description: "must be a string"
},
last_name: {
bsonType: "string",
description: "must be a string"
},
age: {
bsonType: "int",
description: "must be an integer"
},
email: {
bsonType: "string",
pattern: "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",
description: "must be a valid email address"
}
}
}
}
Step 2: Adding the JSON Schema Validation to the Collection
Pass the $jsonSchema validator to db.createCollection() to create the Users collection with enforced validation rules for first_name, last_name, age, and email.
- Applies $jsonSchema validation to the users collection using the validator option.
- Enforces schema rules on insert and update, rejecting invalid documents.
Step 3: Adding Documents to the Collection
After defining the validator, insert operations are checked against the schema, documents that match the rules are accepted, while invalid documents are rejected with a validation error.
Part A: Adding a Document with Invalid Data
Insert operations are validated against the schema: documents that satisfy all $jsonSchema constraints are accepted, while documents violating rules (e.g., invalid email format) are rejected with a MongoDB validation error.
- The insert operation is rejected due to $jsonSchema validation failure.
- The email field does not match the required regex pattern.
- MongoDB blocks the write to prevent invalid data storage.
Part B: Adding a Document with Valid Data
Insert operations that satisfy all $jsonSchema constraints are accepted, documents meeting required fields and pattern validations (e.g., valid email format) are successfully written to the users collection.
- The document is inserted successfully as it passes all $jsonSchema validation rules.
- Required fields are present and the email format is valid.
Benefits of JSON Schema Validation
Here are the benefits of JSON Schema Validation:
- Data Integrity: Schema validation enforces strict rules on document structure, ensuring only valid data is stored and reducing application-level errors.
- Consistency: By enforcing data types and rules, the MongoDB database ensures consistent document structure for format-dependent applications.
- Prevents Invalid Data: JSON Schema Validation blocks invalid or incomplete data, ensuring strict data accuracy.
