# $slice Modifier

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-slice-modifier/

The MongoDB $slice modifier enhances query flexibility by enabling precise control over array fields within documents. In this article, We will learn about the MongoDB $slice Modifier by understanding various examples and so on.
MongoDB $slice Modifier
- The MongoDB $slice modifier enhances query flexibility by allowing precise control over how array fields within documents are returned.
- This modifier is used to limit the number of array items during a $push operation.
Syntax:
{
$push: {
<field>: {
$each: [ <value1>, <value2>, ... ],
$slice: <number>
}
}
}
- If the value of number is zero, then this modifier will update the array field to an empty array.
- If the value of number is negative, then this modifier will update the array field to contain only the last number items.
- If the value of number is positive, then this modifier will update the array field to contain only the first number items.
- $slice modifier must appear with $each modifier in the $push operator. You are allowed to pass an empty array in the $each modifier which help $slice modifier to show its effect. If you use the $slice modifier without $each modifier, then you will get an error.
- The order in which the modifiers appear in $push operation is immaterial.
Examples of MongoDB $slice
In the following examples, we are working with:
Database: GeeksforGeeks Collection: contributor Document: two documents that contain the details of the contributor in the form of field-value pairs.
Output:
Example 1: Slicing the array from the end
In this example, we are adding new items in the language field and then use $slice modifier to trim the array to the last four items.
db.contributor.update({name: "Suman"},
{$push: {language: { $each: ["SQL", "JS++"],
$slice: -4}}})
Output:
Example 2: Slice from the Front of the Array
In this example, we are adding new items in the language field and then use $slice modifier to trim the array to the first five items.
db.contributor.update({name: "Rohit"}, 
{$push: {language: { $each: ["R Language", "JS++"],
$slice: 5}}})
Output:
Example 3: Updating an array using $slice modifier
In this example, we are updating the array of the language field by trimming the array to the last three items.
 db.contributor.update({name: "Rohit"},
{$push: {language: { $each: [],
$slice: -3}}})
Output:
Example 4: Use $slice with Other $push Modifiers
In this example, we are using the $slice modifier with other modifiers like $each and $sort with $push operator.
db.contributor.update({name: "Rohit"},
{$push: { language: { $each: ["C++", "Kotlin"],
$sort: 1, $slice: 4}}})
Output:
Here,
- The $each modifier is used to add multiple documents to the language array.
- The $sort modifier is used to sort all the items of the modified language array in ascending.
- The $slice modifier is used to keep only the first four sorted items of the language array.
Conclusion
The MongoDB $slice modifier is a powerful tool for managing array fields within documents, offering precise control over the number and order of elements stored. By leveraging $slice in conjunction with other $push modifiers, developers can optimize data handling and tailor array responses to specific application requirements.
