# Asynchronous JavaScript

> Source: https://www.geeksforgeeks.org/javascript/asynchronous-javascript/

Asynchronous JavaScript is a programming approach that enables the non-blocking execution of tasks, allowing concurrent operations, improved responsiveness, and efficient handling of time-consuming operations in web applications, JavaScript is a single-threaded and synchronous language. The code is executed in order one at a time, But Javascript may appear to be asynchronous in some situations.
There are several methods that can be used to perform asynchronous javascript tasks, which are listed below:
Approach 1: Using callback
Callbacks are functions passed as arguments to be executed after an asynchronous operation completes. They are used in asynchronous JavaScript to handle responses and ensure non-blocking execution,
Syntax:
function myFunction(param1, param2, callback) {
// Do some work...
// Call the callback function
callback(result);
}
Example: In this example, the myFunction simulates an async task with a 3s delay. It passes fetched data to the callback, which logs it. Output after 3s:
function myFunction(callback) {
    setTimeout(() => {
        const data = { name: "Aman", age: 21 };
        callback(data);
    }, 3000);
}
myFunction((data) => {
    console.log("Data:", data);
});
Output:
Data: { name: 'Aman', age: 21 }
Approach 2: Using Promises
Promises are objects representing the eventual completion (or failure) of an asynchronous operation, providing better handling of asynchronous code with .then() and .catch().
Syntax:
let promise = new Promise(function(resolve, reject){
//do something
});
Example: In this example, The function mydata() returns a Promise that resolves with data after a delay. The data is logged, or an error is caught if rejected, after 2 seconds.
function mydata() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            const data = { name: "Rohit", age: 23 };
            resolve(data);
        }, 2000);
    });
}
mydata()
    .then((data) => {
        console.log("Data:", data);
    })
    .catch((error) => {
        console.error("Error:", error);
    });
Output:
Data: { name: 'Rohit', age: 23 }
