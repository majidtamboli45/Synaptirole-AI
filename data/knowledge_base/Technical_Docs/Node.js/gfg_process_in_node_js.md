# Process in Node.js

> Source: https://www.geeksforgeeks.org/node-js/node-js-process-complete-reference/

A process in Node.js refers to an instance of a program that is currently running. Node.js provides the process object to access information about and control the running application.
- Represents the currently running Node.js application.
- Provides information like process ID, memory usage, and platform.
- Allows interaction with environment variables and command-line arguments.
Understanding Node.js Processes
Node.js manages application execution using a process-based architecture that enables efficient handling of tasks and system resources.
1. Single-threaded Event Loop
Node.js uses a single-threaded event loop to handle multiple operations asynchronously without creating multiple threads.
- Executes tasks using a single main thread.
- Handles multiple requests through asynchronous operations.
- Improves performance and scalability without traditional multi-threading.
2. Process Object
The process object provides information about and control over the currently running Node.js process.
- process.pid returns the process ID of the running application.
- process.argv stores command-line arguments passed to the process.
- process.env contains environment variables used by the application.
3. Child Processes
Node.js supports child processes to run external commands or scripts in parallel with the main process.
- Enables parallel execution of tasks and allows running external system commands or scripts.
- Improves application performance, especially for CPU-intensive operations.
Events and Event-driven Architecture
Node.js follows an event-driven architecture where actions trigger events that are handled asynchronously by event listeners.
1. EventEmitter Class
The EventEmitter class enables objects to emit and listen for events, supporting asynchronous event-driven programming.
- Allows emitting custom named events.
- Uses event listeners to handle events asynchronously.
2. Core Events
Many Node.js core modules use events to manage asynchronous operations.
- Modules like HTTP, File System, and EventEmitter rely on events.
- Understanding these events helps in building efficient Node.js applications.
- Events allow asynchronous communication between different parts of an application.
Execution Models and Asynchronous Programming
Node.js uses asynchronous programming models to efficiently handle multiple operations without blocking the main thread.
1. Non-blocking I/O
Node.js uses non-blocking I/O operations so multiple requests can be processed concurrently without waiting for previous tasks to complete.
- Allows handling multiple requests simultaneously.
- Improves application performance and scalability.
- Prevents the main thread from blocking during I/O operations.
2. Callbacks
Callbacks are functions passed as arguments that execute after an asynchronous operation finishes.
- Common method for handling asynchronous operations.
- Deep nesting can cause callback hell, making code difficult to maintain.
3. Promises
Promises provide a structured way to handle asynchronous operations and their results.
- Represents success or failure of an asynchronous operation.
- Supports method chaining using .then() and .catch().
4. Async/Await
Async/await simplifies asynchronous programming by allowing asynchronous code to be written in a synchronous-like style.
- Improves code readability and maintainability.
- Reduces complexity compared to callbacks and promise chains.
// Node.js program to demonstrate the process.versions property
// Printing process.versions property value
// and variable count
let no_versions = 0;
// Calling process.versions property
const versions = process.versions;
// Iterating through all returned data
for (let key in versions) {
    // Printing key and its versions
    console.log(key + ":\t\t\t" + versions[key]);
    no_versions++;
}
// Printing count value
console.log("Total no of values available = " + no_versions);
Output
node:			22.21.1
acorn:			8.15.0
ada:			2.9.2
amaro:			1.1.4
ares:			1.34.5
brotli:			1.1.0
cjs_module_lexer:			2.1.0
cldr:			47.0
icu:			77.1
llhttp:			9.3.0
modules:			127
napi:			10
nbytes:			0.1.1
...
Node.js Process Methods
The process object in Node.js provides various methods to interact with and control the current Node.js process.
- process.chdir() Method: process.chdir() method is used to change the current working directory.
- process.cpuUsage() Method: process.cpuUsage() method is used to get the user and system CPU time usage of the current process.
- process.cwd() Method: process.cwd() method is used to get the current working directory of the Node.js process.
- process.getegid() Method: process.getegid() method is used to get the numerical effective group identity of the Node.js process.
- process.geteuid() Method: process.geteuid() method is used to get the numerical effective user identity of the Node.js process.
- process.getgid() Method: process.getgid() method is used to get the numerical group identity of the Node.js process.
- process.getgroups() Method: process.getgroups() method is used to get the supplementary group IDs.
- process.getuid() Method: process.getuid() method is used to get the numerical user identity of the Node.js process.
- process.hasUncaughtExceptionCaptureCallback() Method: process.hasUncaughtExceptionCaptureCallback() method is used to check whether a callback has been set using the process.
- process.setegid() Method: process.setegid() method is used to set the numerical effective group identity of the Node.js process.
- process.seteuid() Method: process.seteuid() method is used to set the effective user identity of the Node.js process.
- process.setgid() Method: process.setgid() method is used to set the group identity of the Node.js process.
- process.setgroups() Method: process.setgroups() method is used to set the supplementary group IDs.
- process.setuid() Method: process.setuid() method is used to set the user identity of the Node.js process.
- process.setUncaughtExceptionCaptureCallback() Method: process.setUncaughtExceptionCaptureCallback() method is used to set a callback function that will be called when an uncaught exception occurs.
- process.uptime() Method: process.uptime() method is used to get the number of seconds the Node.js process has been running.
Node.js Process Properties
The process object in Node.js provides several properties that give information about the current Node.js process and its environment.
- process.arch Property: process.arch is used to get the CPU architecture of the system for which the current Node.js binary was compiled.
- process.argv Property: process.argv is used to get the command-line arguments passed when the Node.js process is executed.
- process.argv0 Property: process.argv0 is used to get the read-only copy of the original value of argv[0] passed to the Node.js process.
- process.config Property: process.config is used to get the JavaScript representation of the configuration options used to compile the current Node.js build.
- process.debugPort Property: process.debugPort is used to get the debugging port number used by the debugger when debugging is enabled.
- process.env Property: process.env is used to access environment variables available to the Node.js process.
- process.execArgv Property: process.execArgv is used to get Node.js-specific command-line options passed when launching the process.
- process.execPath Property: process.execPath is used to get the absolute path of the Node.js executable that started the process.
- process.pid Property: process.pid is used to get the process ID (PID) of the current Node.js process.
- process.platform Property: process.platform is used to get the operating system platform on which Node.js is running.
- process.ppid Property: process.ppid is used to get the parent process ID (PPID) of the current Node.js process.
- process.release Property: process.release is used to get metadata information about the current Node.js release.
- process.title Property: process.title is used to get or set the title of the current process.
- process.version Property: process.version is used to get the version of Node.js currently running.
- process.versions Property: process.versions is used to get the versions of Node.js and its dependencies such as V8, OpenSSL, and other components.
Note: process.mainModule is deprecated. Instead, use require.main to get the main module that started the Node.js application.
