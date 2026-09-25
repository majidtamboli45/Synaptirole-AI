# Promises in NodeJS

> Source: https://www.geeksforgeeks.org/node-js/promises-in-node-js/

Promises are a way to handle asynchronous operations in NodeJS, providing a cleaner and more readable approach compared to callbacks. They represent the eventual completion (or failure) of an asynchronous operation.
It acts as a placeholder for a result that is not immediately available but will be at some point in the future. Promises are used to manage asynchronous operations such as file reading, network requests, or database queries.
A Promise can be in one of three states
- Pending: The initial state; the asynchronous operation is still in progress.
- Fulfilled: The operation was completed successfully, and a result is available.
- Rejected: The operation failed, and an error or reason is provided.
Syntax
new Promise((resolve, reject) => resolve("Success")).then(result => console.log(result));
- The Promise is created with the resolve() function immediately resolving the value "Success".
- The .then() method is used to handle the resolved value, logging it to the console.
How Do Promises Work in Node.js?
In NodeJS, asynchronous tasks such as reading files, making HTTP requests, or querying a database are handled without blocking the execution of other code. Traditionally, callbacks were used to handle these asynchronous tasks.
- Callbacks can quickly lead to callback hell—a situation where callbacks are nested within callbacks, making the code difficult to read and maintain.
- Promises help mitigate this issue by providing a more structured way to handle asynchronous operations. Instead of nesting functions, Promises allow chaining of operations, leading to cleaner and more understandable code.
Creating a Promise
A Promise is created using the new Promise() constructor. The constructor takes a single argument—a function known as the executor function—which is invoked immediately. The executor function takes two arguments:
- resolve: A function to call if the asynchronous operation is successful.
- reject: A function to call if the asynchronous operation fails.
let promise = new Promise(function (resolve, reject) {
    setTimeout(() => {
        let success = true; 
        if (success) {
            resolve("Task completed successfully!");
        } else {
            reject("Task failed.");
        }
    }, 2000);
});
promise
    .then(function (res) {
        console.log(res); 
    })
    .catch(function (err) {
        console.log(err); 
    });
- Creating a Promise: We create a new Promise that simulates a task taking 2 seconds.
- Resolving or Rejecting: After 2 seconds, the task either resolves with a success message or rejects with a failure message, based on the success variable.
- Handling the Promise: We use .then() to handle a successful resolution and .catch() to handle any errors.
Output
Task completed successfully!
Simplified Error Handling
Error handling is important in asynchronous JavaScript. Promises provide a cleaner way to manage errors compared to callbacks. Using .catch() at the end of a promise chain simplifies error management.
const myPromise = new Promise((resolve, reject) => {
    setTimeout(() => {
        const random = Math.random();
        if (random > 0.5) {
            resolve(random);
        }
        else {
            reject("Number too low!");
        }
    }, 500);
});
myPromise
    .then(res => {
        console.log("Success:", res);
        return res * 2;
    })
    .then(doubled => {
        console.log("Doubled:", doubled);
        return doubled + 5;
    })
    .then(finalres => {
        console.log("Final:", finalres);
    })
    .catch(err => {
        console.error("Error occurred:", err);
    });
- The promise randomly resolves or rejects based on a generated number.
- The .then() blocks handle successful resolutions.
- The .catch() block handles any rejections that occur in the promise or any of the .then handlers.
Output (if an error occurs during the first fetch):
Chaining Promises
Promise chaining allows you to execute asynchronous operations sequentially. Each .then() receives the result of the previous one. This creates a readable and maintainable flow for asynchronous code.
function first() {
    return new Promise(resolve => resolve("First"));
}
function second(data) {
    return new Promise(resolve => resolve(data + " Second"));
}
function third(data) {
    return new Promise(resolve => resolve(data + " Third"));
}
first()
    .then(second)
    .then(third)
    .then(res => console.log(res))
    .catch(err => console.error("Error:", err));
- Promises are chained using .then().
- Each .then() receives the result from the previous promise.
- .catch() handles any errors in the chain.
Output (if both requests succeed):
Parallel Execution with Promise.all()
Promise.all() allows you to execute multiple promises concurrently. It resolves when all promises have resolved, or rejects if any promise rejects.
const p1 = new Promise(resolve => setTimeout(() => resolve("One"), 1000));
const p2 = new Promise(resolve => setTimeout(() => resolve("Two"), 500));
const p3 = new Promise((resolve, reject) => setTimeout(() => reject("Error!"), 200));
Promise.all([p1, p2, p3])
    .then(results => {
        console.log("All promises resolved:", results);
    })
    .catch(error => {
        console.error("At least one promise rejected:", error);
    });
- p1, p2, and p3 are promises that resolve after different time intervals.
- Promise.all() takes an array of promises.
- If all promises resolve, the .then() block is executed with an array of the resolved values.
- If any promise rejects, the .catch() block is executed with the rejection reason.
Why Moved from Callbacks to Promises (Callback Hell Issue)
Callbacks were the original way to handle asynchronous operations in JavaScript. However, deeply nested callbacks can lead to "callback hell," making code difficult to read and maintain. Promises offer a cleaner and more structured approach.
function async1(callback) {
    setTimeout(() => { callback(null, "Result from 1"); },
        500);
}
function async2(data1, callback) {
    setTimeout(() => {
        callback(null, data1 + " and Result from 2");
    }, 500);
}
function async3(data2, callback) {
    setTimeout(() => {
        callback(null, data2 + " and Result from 3");
    }, 500);
}
async1((err, res1) => {
    if (err) {
        console.error("Error in operation 1:", err);
    }
    else {
        async2(res1, (err, res2) => {
            if (err) {
                console.error("Error in operation 2:", err);
            }
            else {
                async3(res2, (err, res3) => {
                    if (err) {
                        console.error(
                            "Error in operation 3:", err);
                    }
                    else {
                        console.log("Final result:",
                            res3);
                    }
                });
            }
        });
    }
});
Output
Final result: Result from 1 and Result from 2 and Result from 3
- This code shows how nested callbacks make asynchronous code hard to read. Each step depends on the previous one, creating a "pyramid of doom."
- Error handling is also complex, with repetitive if (err) checks at each level. This can become difficult to manage as the code grows.
- The deep nesting makes it hard to visualize the overall flow of the asynchronous operations.
Same example with Promises
Promises offer a cleaner and more structured way to handle asynchronous operations, avoiding the "callback hell" of nested callbacks. They make asynchronous code easier to read, write, and maintain.
function async1() {
    return new Promise(resolve => setTimeout(() => resolve("Result 1"), 500));
}
function async2(data1) {
    return new Promise(resolve => setTimeout(() => resolve(data1 + " + Result 2"), 500));
}
function async3(data2) {
    return new Promise(resolve => setTimeout(() => resolve(data2 + " + Result 3"), 500));
}
async1()
    .then(res1 => async2(res1))
    .then(res2 => async3(res2))
    .then(res3 => console.log("Final:", res3))
    .catch(err => console.error("Error:", err));
- This code uses .then() chaining to sequence the asynchronous operations. Each .then() receives the result from the previous one.
- The .catch() block at the end handles any errors that might occur in any of the promises, making error management much simpler.
Key Issues with Callbacks (Callback Hell)
Callback hell introduces significant problems for code readability and maintainability.
- Inverted Control Flow: The logic for handling results is scattered within the nested callbacks, making it difficult to follow the overall flow of the program.
- Error Handling Complexity: Error handling becomes cumbersome, with repetitive if (err) checks at each level of nesting. It's easy to miss handling errors in some branches
Nested Promises
In JavaScript, Promises are used to handle asynchronous operations, allowing you to attach callback functions that execute when the operation is completed or fails.
function fetch() {
    return new Promise((res, rej) => {
        setTimeout(() => { res("Data fetched"); },
            1000);
    });
}
function process(data) {
    return new Promise((res, rej) => {
        setTimeout(() => { res(`Processed: ${data}`); },
            1000);
    });
}
fetch()
    .then((data) => { return process(data); })
    .then(
        (processedData) => { console.log(processedData); })
    .catch((error) => { console.error(error); });
- fetchData returns a Promise that resolves after 1 second.
- processData takes the fetched data and returns a Promise that resolves after another second.
- The .then() methods are chained to handle the results sequentially.
- The .catch() method handles any errors that occur during the asynchronous operations.
Output
Best Practices for Using Promises in NodeJS
- Use async/await for cleaner code: Simplifies asynchronous code, making it more readable and maintainable.
- Handle errors with .catch() or try/catch: Ensures that errors in promise chains are caught and handled appropriately.
- Avoid nested promises: Prevents "promise hell" by keeping promise chains flat and readable.
- Use Promise.all() for parallel operations: Executes multiple promises concurrently and waits for all to complete.
