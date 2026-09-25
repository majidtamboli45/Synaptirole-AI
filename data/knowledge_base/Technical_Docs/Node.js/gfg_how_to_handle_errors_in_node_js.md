# How to Handle Errors in Node.js ?

> Source: https://www.geeksforgeeks.org/node-js/how-to-handle-errors-in-node-js/

Node.js is a JavaScript extension used for server-side scripting. Error handling is a mandatory step in application development. A Node.js developer may work with both synchronous and asynchronous functions simultaneously. Handling errors in asynchronous functions is important because their behavior may vary, unlike synchronous functions.
How to Handle Errors in Node?
We have many approaches to handle errors in Node js like try-catch, callback functions, promises, and async-await.
While try-catch blocks are effective for synchronous functions, asynchronous functions can be dealt with callbacks, promises, and async-await. Try-catch is synchronous means that if an asynchronous function throws an error in a synchronous try/catch block, no error throws.
Errors thrown in Node.js applications can be handled in the following ways:
Using a try-catch block
The try-catch block can be used to handle errors thrown by a block of code.
function dosomething() {
    throw new Error(
        'a error is thrown from dosomething');
}
function init() {
    try {
        dosomething();
    }
    catch (e) {
        console.log(e);
    }
    console.log(
        "After successful error handling");
}
init();
Output:
Error: a error is thrown from dosomething
    at dosomething (/home/cg/root/6422736/main.js:4:11)
    at init (/home/cg/root/6422736/main.js:9:9)
    at Object. (/home/cg/root/6422736/main.js:17:1)
    at Module._compile (module.js:570:32)
    at Object.Module._extensions..js (module.js:579:10)
    at Module.load (module.js:487:32)
    at tryModuleLoad (module.js:446:12)
    at Function.Module._load (module.js:438:3)
    at Module.runMain (module.js:604:10)
    at run (bootstrap_node.js:389:7)
After successful error handling
Explanation:
The init() function is called which in turn calls dosomething() function which throws an error object. This error object is caught by the catch block of the init() method. If there is no proper handling of the error the program will terminate. The catch block prints the call stack to show the point where the error occurred.
Using callbacks
A callback is a function called at the completion of a certain task. Callbacks are widely used in Node.js as it prevents any blocking and allows other code to be run in the meantime. The program does not wait for the file reading to complete and proceeds to print "Program Ended" while continuing to read the file. If any error occurs like the file does not exist in the system then the error is printed after "Program Ended", else the content of the file is outputted.
const fs = require("fs");
fs.readFile('foo.txt', function (err, data) {
    if (err) {
        console.error(err);
    }
    else {
        console.log(data.toString());
    }
});
console.log("Program Ended");
Output:
Program Ended
[Error: ENOENT: no such file or directory, 
  open 'C:\Users\User\Desktop\foo.txt'] {
  errno: -4058,
  code: 'ENOENT',
  syscall: 'open',
  path: 'C:\\Users\\User\\Desktop\\foo.txt'
}
Explanation:
In this case, the file does not exist in the system hence the error is thrown.
Using promises and promise callbacks
Promises are an enhancement to Node.js callbacks. When defining the callback, the value which is returned is called a "promise". The key difference between a promise and a callback is the return value. There is no concept of a return value in callbacks. The return value provides more control for defining the callback function. In order to use promises, the promise module must be installed and imported into the application. The .then clause handles the output of the promise. If an error occurs in any .then clause or if any of the promises above are rejects, it is passed to the immediate .catch clause. In case of a promise is rejected, and there is no error handler then the program terminates.
const Promise = require('promise');
const MongoClient = require('mongodb').MongoClient;
const url = 'mongodb://localhost/TestDB';
MongoClient.connect(url)
    .then(function (err, db) {
        db.collection('Test').updateOne({
            "Name": "Joe"
        },
            {
                $set: {
                    "Name": "Beck"
                }
            });
    })
    .catch(error => alert(error.message))
Output:
// In this case we assume the url is wrong
MongoError: failed to connect to server [localhost:27017]
// error message may vary
Using async-await
Async-await is a special syntax to work with promises in a simpler way that is easy to understand. When we use async/await, .then is replaced by await which handles the waiting in the function. The error handling is done by the .catch clause. Async-await can also be wrapped in a try-catch block for error handling. In case no error handler exists the program terminates due to an uncaught error.
async function f() {
    let response = await fetch('http://xyzurl');
}
// f() becomes a rejected promise
f().catch(alert);
Output:
// the url is wrong //
TypeError: failed to fetch
