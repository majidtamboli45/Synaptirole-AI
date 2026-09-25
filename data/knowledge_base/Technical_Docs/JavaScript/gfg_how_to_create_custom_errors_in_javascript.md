# How to create custom errors in JavaScript ?

> Source: https://www.geeksforgeeks.org/javascript/how-to-create-custom-errors-in-javascript/

In this article, we will learn to create custom errors with some examples.
Errors represent the state of being wrong in condition. Javascript handles a predefined set of errors by itself but if you want to create your own error handling mechanism you can do that with custom errors functionality available in javascript.
We make use of the OOPS concept called an inheritance to implement custom errors. All the types of standard errors like RangeError, TypeError, etc inherit a main class called Error, which looks as follows:
Syntax of Error Class Instance:
new Error(msg , filename , lineno);
where:
- msg: The error message.
- filename: The file where the error occurs.
- lineno: line number of the error.
The Error class consists of properties like name, message, filename, and methods like captureStackTrace, and toString. But again it is different in different browsers.
You can use this error class to construct your own error object prototype which is called as custom error.
Custom errors can be constructed in two ways, which are:
- Class constructor extending error class.
- Function constructor inheriting error class.
Class constructor extending error class: Here we define a class that extends the error class,
Syntax:
class  CustomErrorName extends Error{
    constructor ( ){
        super( )
    }
    ...
}
Example 1: We will create an error for a condition 10 != 20 in the below code.
class CheckCondition extends Error {
    constructor(msg) {
        super(msg);
    }
}
try {
    if (10 != 20) 
        throw new CheckCondition("10 is not equal to 20");
}
catch (err) {
    console.error(err);
}
Output:
Function constructor inheriting error class:
Here the function inherits the prototype of the error class. we can then create other custom properties and methods to handle the application-specific error.
Syntax:
function CustomErrorName(msg = "") {
    this.message = msg;
    this.name = "CustomErrorName";
}
CustomErrorName.prototype = Error.prototype;
Example 2: In this example, we will create a custom error that throws for the condition 10 != 20.
function CheckCondition(msg = "") {
    this.msg = msg;
    this.name = "CheckCondition";
}
CheckCondition.prototype = Error.prototype;
try {
    if (10 != 20) 
        throw new CheckCondition("10 is not equal to 20");
}
catch (err) {
    console.error(err);
}
Output:
In this way, we can create errors specific to our applications in javascript and by making some conditions we can throw the custom errors whenever the users of the applications make a mistake in using the applications.
