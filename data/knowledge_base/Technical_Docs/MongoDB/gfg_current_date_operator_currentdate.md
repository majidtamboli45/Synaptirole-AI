# Current Date Operator ($currentDate)

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-current-date-operator-currentdate/

MongoDB provides different types of field update operators to update the values of the fields of the documents and
$currentDate
operator is one of them. This operator is used to set the value of a field to the current date (either as a timestamp or as a Date).
- The default type of $currentDate operator is a Date.
- This operator can also work with embedded/nested documents or arrays.
- You can use this operator in methods like update(), updateOne(), etc., according to your requirements.
- If the specified field is not found then this operator will add that field in the document.
Syntax:
{ $currentDate: { <field1>: <typeSpecification1>, ... } }
Now, here, in this method,
typeSpecification1
is either a boolean true to set the value of a field to the current date as a Date or a document
{ $type: "timestamp" } 
or
{ $type: "date" }
which explicitly specifies the type, here the operator is case-sensitive only accept lowercase "timestamp" or "date". To specify
field
in embedded/nested documents with the help of dot notation. In the following examples, we are working with:
Database: GeeksforGeeks Collection: Employee Document: three documents that contain the details of the employees in the form of field-value pairs.
Update the date field using $currentDate operator: 
In the example, we are updating the value of joiningDate field of an employee’s document whose first name is Om.
db.Employee.updateOne({"name.first": "Om"}, 
                      {$currentDate: {joiningDate: true}})
Update the date field in the embedded document using $currentDate operator: 
In the example, we are updating the value of joiningDate field of an employee’s document whose first name is .
db.Employee.updateOne({"name.first": "Sumit"}, 
                      {$currentDate: {"personalDetails.joiningDate": true}})
Adding date field using $currentDate operator: 
In the example, we are adding a new date field whose value is assigned by the $cuurentDate operator in the employee’s document whose first name is Amu.
db.Employee.updateOne({"name.first": "Amu"},
                      {$currentDate: {joiningDate: {$type: "date"}}})
