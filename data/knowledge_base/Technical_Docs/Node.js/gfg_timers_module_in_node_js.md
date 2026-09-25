# Timers module in Node.js

> Source: https://www.geeksforgeeks.org/node-js/node-js-timers-module/

The Timers module in Node.js allows execution of code after a specified delay or at repeated intervals. It is a global module, so it can be used without importing it.
- Helps control when and how often a function runs in an application.
- Useful for creating delays, scheduling tasks, and handling asynchronous events.
- Works with the Node.js event loop to manage timed callbacks.
- Widely used in server operations, background tasks, and periodic updates.
Types of Timers
In Node.js, timers can be categorized into two types based on their purpose.
A. Scheduling Timers
Scheduling timers allow functions to execute after a delay or at repeated intervals. They help manage timed and asynchronous execution of code.
- Used to schedule tasks and control delayed or repeated execution of functions without blocking the event loop.
- Useful for handling asynchronous operations and timed callbacks in applications.
1. setImmediate() method: schedules a callback to execute immediately after I/O events in the event loop. Callbacks run in the order they are created after each event loop iteration.
setImmediate(function A() {
    setImmediate(function B() {
        console.log(1);
        setImmediate(function D() {
            console.log(2);
        });
    });
    setImmediate(function C() {
        console.log(3);
        setImmediate(function E() {
            console.log(4);
        });
    });
});
console.log('Started...');
Output
Started...
1
3
2
4
- A runs first and schedules B and C using setImmediate().
- B and C execute in the next iterations, printing 1 and 3, and they schedule D and E.
- D and E run later, printing 2 and 4, because nested setImmediate() callbacks execute in subsequent event loop iterations.
2. setInterval() method: repeatedly executes a callback function after every specified time interval (in milliseconds) until it is stopped using clearInterval().
// Executed after every 1000 milliseconds
// from the start of the program
setInterval(function A() {
    return console.log('Hello World!');
}, 1000);
// Executed right away
console.log('Executed before A...');
Output
Executed before A...
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
...
3. setTimeout() method: schedules the execution of a callback function once after a specified delay (in milliseconds).
// Executed after 3000 milliseconds 
// from the start of the program
setTimeout(function A() {
    return console.log('Hello World!');
}, 3000);
// executed right away
console.log('Executed before A...');
Output
Executed before A...
Hello World!
B. Canceling Timers
Canceling timers is used to stop or prevent the execution of previously scheduled timer functions. It helps control timer-based operations in Node.js applications.
- Allows stopping timers that were scheduled for future execution.
- Helps prevent unnecessary or repeated execution of callbacks.
- Useful for managing and controlling asynchronous tasks.
1. clearImmediate() method: cancels an Immediate object created by setImmediate(), preventing the scheduled callback from executing.
let si = setImmediate(function A() {
    console.log(1);
});
// clears setInterval si
clearImmediate(si);
console.log(2);
Output
2
2. clearInterval() method: cancels the timer created by setInterval(), stopping the repeated execution of the callback function.
let si = setInterval(function A() {
    return console.log("Hello World!");
}, 500);
setTimeout(function () {
    clearInterval(si);
}, 2000);
Output
Hello World!
Hello World!
Hello World!
Hello World!
3. clearTimeout() method: cancels the timer created by setTimeout(), preventing the scheduled callback from executing.
// si1 is cleared by clearTimeout()
let si1 = setTimeout(function A() {
    return console.log("Hello World!");
}, 3000);
// only si2 is executed
let si2 = setTimeout(function B() {
    return console.log("Hello Geeks!");
}, 3000);
clearTimeout(si1);
Output
Hello Geeks!
