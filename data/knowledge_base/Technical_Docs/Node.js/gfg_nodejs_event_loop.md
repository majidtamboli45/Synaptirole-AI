# NodeJS Event Loop

> Source: https://www.geeksforgeeks.org/node-js/node-js-event-loop/

The event loop in Node.js is a mechanism that allows asynchronous tasks to be handled efficiently without blocking the execution of other operations.
- Executes JavaScript synchronously first and then processes asynchronous operations.
- Delegates heavy tasks like I/O operations, timers, and network requests to the libuv library.
- Ensures smooth execution of multiple operations by queuing and scheduling callbacks efficiently.
Importance of Event Loop
The Event Loop is essential in Node.js because it allows non-blocking, asynchronous operations to be handled efficiently, even though Node.js operates on a single thread.
- It allows non-blocking execution despite Node.js being single-threaded.
- It helps handle I/O-bound tasks efficiently.
- It makes Node.js suitable for scalable applications like web servers.
console.log("This is the first statement");
setTimeout(function() {
    console.log("This is the second statement");
}, 1000);
console.log("This is the third statement");
- The first statement is logged immediately.
- setTimeout schedules the second statement to log after 1000 milliseconds.
- The third statement is logged immediately after.
- After 1000 milliseconds, the callback from setTimeout is executed, logging Second statement.
Output:
Working of Event Loop
When a Node.js application runs, the event loop starts, processes the synchronous code first, and then moves to handle asynchronous tasks. The execution follows these steps:
1. Initialization
When Node.js starts, it loads the script, executes synchronous code, and registers any asynchronous tasks (e.g., timers, I/O requests, network operations).
2. Execution of Input Script
- The call stack executes synchronous code first.
- Any asynchronous operations (setTimeout, fs.readFile, network requests) are delegated to libuv.
3. Handles Asynchronous Operations with libuv
Node.js uses the libuv C library to manage asynchronous operations. It maintains a thread pool to handle heavy tasks like file I/O and network requests without blocking the event loop.
- File system I/O (fs.readFile)
- Network requests (HTTP, TCP, DNS)
- Timers (setTimeout, setInterval)
- Compression and cryptographic tasks
4. Callback Execution
Once the thread pool completes its tasks, it sends callbacks to the event queue. The event loop processes these callbacks, but only when the call stack is empty (i.e., when no synchronous code is currently executing).
5. Event Loop Phases
The event loop goes through multiple phases, each designed to handle a different set of operations. It checks for events, handles asynchronous callbacks, and executes tasks in the correct order.
6. Callback Execution from Event Queue
After the call stack is empty, the event loop picks tasks from the event queue and sends them to the call stack for execution. These tasks could include:
- Completing network requests
- Processing I/O events
- Handling timers like setTimeout or setInterval
Phases of the Event loop
The event loop in Node.js consists of several phases, each of which performs a specific task. These phases include:
1. Timers Phase
This phase processes timers that have been set using setTimeout() and setInterval().
- setTimeout() schedules a callback to run after 2000 milliseconds.
- The event loop processes this callback in the timers phase after the synchronous code has executed.
console.log('Start');
setTimeout(() => {
    console.log('Timeout callback');
}, 2000);
console.log('End');
Output:
2. Pending Callbacks
This phase executes I/O-related callbacks that were deferred from the previous loop cycle.
- setImmediate() schedules a callback to run immediately after the current event loop cycle.
- The event loop processes this callback in the pending callbacks phase.
console.log('Start');
setImmediate(() => {
    console.log('Immediate callback');
});
console.log('End');
Output:
3. Idle, Prepare (Internal use only)
This phase is used internally by Node.js for background tasks.
4. Poll Phase (Main Phase)
The Poll phase executes most of the tasks like- I/O, file reading, HTTP requests and much more.
Output:
Start
End
File read complete
5. Check Phase
This phase processes any setImmediate() callbacks that have been added to the message queue.
- setImmediate() schedules a callback to run immediately after the poll phase.
- The event loop processes this callback in the check phase.
console.log('Start');
setImmediate(() => {
    console.log('Immediate callback');
});
console.log('End');
Output:
6. Close Callbacks Phase
This phase executes callbacks for closed connections like sockets, streams, and event emitters.
- The server listens for incoming connections.
- When a socket is closed, the 'close' event is emitted, and the corresponding callback is executed in the close callbacks phase.
const net = require('net');
// Create a TCP server
const server = net.createServer((socket) => {
    socket.on('close', () => {
        console.log('Socket closed');
    });
});
// Start the server and display message when it begins listening
server.listen(8000, () => {
    console.log('Server listening on port 8000');
});
Output:
Server listening on port 8000
process.nextTick() and Promises in the Event Loop
Apart from these phases there is also process.nextTick() and promise callback which has the highest priority in the event loop. It executes after every phase before moving to the next phase.
- process.nextTick() callbacks are always executed before the event loop moves to the next phase.
- Resolved Promise callbacks are processed immediately after process.nextTick().
setImmediate(() => {
   console.log("setImmediate is called");
});
Promise.resolve("Promise is resolved").then(console.log);
setTimeout(() => {
   console.log("Time function is called");
}, 0);
process.nextTick(() => {
   console.log("Process.nextTick");
});
Output:
- process.nextTick() executes before moving to the next phase.
- Resolved Promises execute right after process.nextTick().
- setTimeout() executes in the timers phase.
- setImmediate() executes in the check phase.
