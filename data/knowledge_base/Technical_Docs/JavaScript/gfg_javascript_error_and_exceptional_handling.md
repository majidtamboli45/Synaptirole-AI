# Javascript Error and Exceptional Handling

> Source: https://www.geeksforgeeks.org/javascript/javascript-error-and-exceptional-handling-with-examples/

JavaScript error and exception handling helps developers control what happens when something goes wrong during program execution. It ensures the application continues running smoothly while providing useful feedback for debugging.
- Uses try and catch to detect and handle runtime errors safely.
- throw allows creating custom error messages for better clarity.
- finally runs cleanup code regardless of whether an error occurs.
JavaScript Error
In JavaScript, an error is a problem that prevents the code from running as expected. Errors can occur during development or while the application is running, causing the program to stop executing properly. There are different types of errors in JavaScript.
Types of Errors in JavaScript
- Syntax Errors: This happens when the code doesn't follow the correct syntax (e.g., missing parentheses, brackets, or commas).
console.log("Hello World" 
// Missing closing parenthesis
- Reference Errors: Occurs when we try to access a variable that hasn’t been declared.
console.log(x); // ReferenceError: x is not defined
- Type Errors: This happens when a value is not of the expected type (e.g., trying to call a method on undefined).
let num = 5;
num.toUpperCase(); // TypeError: num.toUpperCase is not a function
- Range Errors: Occurs when a value is out of range, like passing an invalid number to a function.
let arr = Array(-1); // RangeError: Invalid array length
- Custom Errors: A custom error is an error that you create yourself to give more specific messages that make sense for your app. It helps you explain exactly what went wrong in a way that's easy to understand and fix.
throw new Error("Custom error occurred");
Exception Handling in JavaScript
Exception handling in JavaScript refers to the process of dealing with errors (exceptions) that occur during the execution of a program. JavaScript provides some mechanisms to catch, handle, and recover from error instead of letting the error stop the program. The most common approach is using try...catch blocks.
Handling Errors Using try...catch
The try...catch statement
- Try Block: You place code that may potentially throw an error here.
- Catch Block: This block executes if an error occurs in the try block.
- finally Block: The code inside this block will always run, whether an error occurred or not.
Syntax
try {
// Code that may throw an error
} catch (error) {
// Code to handle the error
} finally {
// Optional: Code that runs regardless of success or error
}
try {
    let res = 10 / 0;
    if (!isFinite(res)) {
        throw new Error("Cannot divide by zero");
    }
    console.log(res);
} catch (error) {
    console.error("Error occurred:", error.message);
} finally {
    console.log("Execution completed");
}
- The try block attempts to divide 10 by 0, which results in Infinity. It then checks if the result is not a finite number using isFinite(). Since division by zero gives Infinity, an error is thrown with the message "Cannot divide by zero."
- The catch block catches the thrown error and prints "Error occurred: Cannot divide by zero" to the console.
- The finally block always executes, printing "Execution completed" to the console, regardless of whether an error occurred or not.
Throwing Custom Errors
Sometimes, the standard JavaScript errors are not sufficient for our application needs. In such cases, you can throw custom errors using the throw statement.
function check(age) {
    if (age < 18) {
        throw new Error("Age must be 18 or above");
    }
    console.log("Access granted");
}
try {
    check(16);
} catch (error) {
    console.error(error.message);
    // Age must be 18 or above
}
- The check() function checks if the age is less than 18. If it is, it throws an error with the message "Age must be 18 or above."
- The try block calls the check() function with 16 as the argument. Since 16 is less than 18, an error is thrown.
- The catch block catches the error and displays the error message "Age must be 18 or above" using console.error().
Using Finally for Cleanup
The finally block is executed regardless of whether an error occurred or not.
try {
    console.log("Trying...");
    throw new Error("An error occurred");
} catch (error) {
    console.error(error.message);
} finally {
    console.log("Cleaning up...");
}
- The try block attempts to execute the code inside it, first printing "Trying..." to the console, then throwing a new error with the message "An error occurred."
- The catch block catches the thrown error and prints the error message "An error occurred" to the console using console.error().
- The finally block always runs, no matter what, and prints "Cleaning up..." to the console, ensuring any necessary cleanup happens.
Advanced: try...catch with async/await
async function fetchData() {
    try {
        let res = await fetch("https://api.example.com/data");
        let d = await res.json();
        console.log(d);
    } catch (error) {
        console.error("Error fetching data:", error.message);
    }
}
fetchData();
- The fetchData() function uses async to allow asynchronous operations. It tries to fetch data from the URL "https://api.example.com/data" using the fetch() function.
- If the fetch is successful, it converts the response to JSON format using await res.json() and then logs the data to the console.
- If an error occurs during the fetch operation (like a network issue), the catch block catches the error and logs an error message with the error details.
Benefits of Exception Handling
- Graceful Degradation: If the error occurs, then also the program keeps on running smoothly.
- Error Logging: It helps by recording error details, making it easier to find and fix problems.
- Prevents Crashes: It ensures the app doesn't completely stop working when something goes wrong.
Best Practices for Error Handling
- Catch Specific Errors: Handle specific error types if possible.
- Use finally for Cleanup: Ensure resources are released or closed.
- Avoid Silent Failures: Always log or handle errors appropriately.
- Use Custom Errors: Provide meaningful error messages.
