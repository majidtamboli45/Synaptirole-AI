# MongoDB $addToSet Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-addtoset-operator/

The $addToSet operator in MongoDB allows us to add elements to an array field if they are not already present and ensure that the array contains unique values.
In this article, We will learn about the MongoDB $addToSet Operator by understanding various examples in detail.
$addToSet Operator in MongoDB
- The $addToSet operator in MongoDB is used to add a value to an array and if the value already exists in the array then this operator will do nothing. 
- The $addToSet operator appends the whole array as a single element if the value is an array. To add each element of the value separately, the $each modifier can be used with the $addToSet operator. 
- It is compatible with various MongoDB environments like MongoDB Atlas, MongoDB Enterprise, and MongoDB Community.
Syntax
The syntax to use the $addToSet Operator in MongoDB is:
{ $addToSet: { <field1>: <value1>, ... } }
Here, <field> can specify with dot notation in embedded/nested documents.
Examples of MongoDB $addToSet Operator
In the following examples, we are working with:
Database: GeeksforGeeks 
Collection: contributor 
Document: two documents that contain the details of the contributor in the form of field-value pairs.
Example 1: Add to Array
In this example, we are adding "JS++" value in the language array of document which satisfy the specified condition, i.e., name: "Rohit".
Query:
db.contributor.update({name: "Rohit"}, {$addToSet: {language: "JS++"}})
Output:
Example 2: Value Already Exists
In this example, we are adding "Perl" value in the language array of document which satisfy the specified condition, i.e., name: "Sumit". But $addToSet operator does not add this value in the language array because it already exists in the language array.
Query:
db.contributor.update({name: "Sumit"}, {$addToSet: {language: "Perl"}})
Output:
Example 3: $each Modifier
In this example, we are adding multiple values, i.e., ["Perl", "Go", "Ruby"] in the language array with the help of $each modifier. Here, "Perl" doesnot add in the array because it already exists.
Query:
contributor.update({name: "Sumit"}, {$addToSet: 
{language:{$each: ["Perl", "Go", "Ruby"]}}})
Output:
KeyTakeAways About $addToSet Operator
- $addToSet Operator inserts a new value to an array field in the document.
- This operator does not insert duplicate items in the array and does not affect already present duplicate items. Here, the order of the values does not matter.
- If the specified field in the $addToSet the operator is not present in the document, then this operator creates an array field in the document with values or items.
- Is the specified value is an array in the $addToSet operator, then this operator will append the whole array as a single item. Or if you want to add items separately in the array, then use $each modifier.
Conclusion
The $addToSet operator is a powerful tool in MongoDB for managing arrays with unique elements. It simplifies the process of adding new elements to arrays, ensuring that duplicates are not created. By understanding how to use this operator effectively, you can maintain clean and efficient data structures in your MongoDB databases.
