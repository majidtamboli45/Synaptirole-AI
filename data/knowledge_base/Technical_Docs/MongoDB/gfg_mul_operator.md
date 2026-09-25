# $mul Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-multiply-operator-mul/

The $mul operator multiplies a numeric field by a specified value directly in MongoDB, enabling efficient in-place arithmetic updates without reading the current value first.
- Direct Arithmetic Updates: Modifies numeric fields during update operations.
- Atomic per Document: Ensures safe, single-step updates within a document.
- Numeric Fields Only: Applies to numeric types (int, long, double); non-numeric values cause errors.
- Auto Field Creation: Creates the field if missing; behavior may vary by MongoDB version, and it is not always initialized to 0.
- Type Coercion: Mixed numeric types may be converted according to BSON numeric rules.
Syntax:
{ $mul: { <field>: <number> } }
- <field>: The field we want to update.
- <number>: The number by which to multiply the field value.
$mul Operator with Mixed Numeric Types
MongoDB supports arithmetic across mixed numeric types (int32, int64, double), applying BSON numeric rules during multiplication.
| Operand 1 | 32-bit Integer | 64-bit Integer | Double | 
|---|---|---|---|
| 32-bit Integer | 32-bit or 64-bit Integer | 64-bit Integer | Double | 
| 64-bit Integer | 64-bit Integer | 64-bit Integer | Double | 
| Double | Double | Double | Double | 
Note: Result may promote from 32-bit to 64-bit if the value exceeds the 32-bit integer range.
Examples of MongoDB $mul Operator
Some examples using the Fruits database with a Details collection. The collection contains fruit-related data, including the name, price, and quantity fields.
- Database: Fruits
- Collection: Details
- Document: Two documents that contain the details of the fruits in the form of field-value pairs.
Example 1: Multiply the Value of a Field
Multiplying the value of the price field by 2.10 in the document which matches the specified condition, i.e., name = mango.
db.Details.updateOne({name: "mango"}, {$mul: {price: NumberDecimal("2.10")}})
Output:
- The query targets the mango document in the Details collection.
- The price field is multiplied by 2.10. The NumberDecimal type ensures that we maintain precision with decimal numbers.
Example 2: Multiplying the value of a field in the embedded/nested document
Multiplying the value of quantity.tQuantity field by 3 in the document that matches the specified condition, i.e., name = mango.
db.Details.updateOne({name: "mango"}, {$mul: {"quantity.tQuantity": 3}})
Output:
- The quantity.tQuantity field is accessed using dot notation and multiplied by 3.
- This showcases how we can use the $mul operator to modify fields within embedded documents.
Example 3: Apply $mul Operator to a Non-existing Field
Applying $mul operator to a non-existing field in the document that matches the specified condition, i.e., name = apple.
db.Details.updateOne({name: "apple"}, {$mul: {"batchNumber":NumberInt(230)}})
Output:
Since the batchNumber field doesn’t exist in the document, MongoDB will create it and set its value to 0 before multiplying it by 230.
Example 4: Multiply Mixed Numeric Types
Multiplying the value(Double type) of the price field in the document that matches the specified condition, i.e., name = apple.
db.Details.updateOne({name: "apple"}, {$mul: {price: NumberDecimal(5)}})
Output:
The price field is a Double. The $mul operator will multiply it by 5, and the result will also be a Double due to type conversion.
Important Points About $mul Operator
Here are some essential points about the $mul operator to keep in mind:
- Numeric-Only Constraint: Operates exclusively on numeric fields, non-numeric values cause errors.
- Default Initialization: Missing fields are initialized to 0 before multiplication.
- Document-Level Atomicity: Ensures consistent updates within a single document.
- Type Promotion Rules: Mixed numeric operands follow BSON type promotion for the result.
