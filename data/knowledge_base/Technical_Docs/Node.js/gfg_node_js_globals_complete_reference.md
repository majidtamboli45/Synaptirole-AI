# Node.js Globals Complete Reference

> Source: https://www.geeksforgeeks.org/node-js/node-js-globals-complete-reference/

Node.js Global Objects are the objects that are available in all modules. Global Objects are built-in objects that are part of the JavaScript and can be used directly in the application without importing any particular module.
Example: It repeats the execution of the callback after every t time in milliseconds passed as a parameter.
// Executed after every 1000 milliseconds
// from the start of the program
setInterval(function A() {
    return console.log('Hello World!');
}, 1000);
// Executed right away
console.log('Executed before A...');
Output:
Executed before A...
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
...
The Complete list of NodeJS Global objects are listed below:
| Node.js Globals | Description | 
|---|---|
| Class: Buffer | Buffers are designed to handle binary raw data. Buffers allocate raw memory outside the V8 heap. | 
| Node.js Timers module | The Timers module in Node.js contains various functions that allow us to execute a block of code | 
| NodeJS console | Node.js console module is a global object that provides a simple debugging console | 
| NodeJS imports and exports | Node.js also allows importing and exporting functions and modules. | 
| NodeJS global | Node.js Global Objects are the objects that are available in all modules. | 
| NodeJS module | The module.exports in Node.js is used to export any literal, function or object as a module. | 
| NodeJS URL | The ‘url’ module provides utilities for URL resolution and parsing. | 
| NodeJS URLSearchParams | The URLSearchParams API in Node.js allows read and write operations on the URL query. |
