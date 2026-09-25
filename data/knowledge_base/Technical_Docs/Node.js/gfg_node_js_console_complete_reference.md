# Node.js Console Complete Reference

> Source: https://www.geeksforgeeks.org/node-js/node-js-console-complete-reference/

The console module in Node.js is a built-in utility used for logging, debugging, monitoring, and troubleshooting applications through terminal output. It provides a simple debugging console similar to JavaScript browser consoles and supports displaying different levels of messages.
- Browser Difference: In Node.js, console output is shown in the terminal or command line instead of the browser developer console.
- Global Object: The console object is globally available, so it can be used directly without importing it usingrequire() .
- Message Levels: Supports different types of messages such as normal logs, errors, warnings, and traces.
Node.js Console Methods
The Console Module in Node.js provides a variety of methods that help in outputting information to the console:
Basic Logging:
Used for displaying general messages and errors in the terminal for debugging and monitoring applications.
- console.log()
- console.error()
Formatting and Output:
Provides different message types and formatting options to organize console output more clearly.
- console.info()
- console.warn()
- console.debug()
Advanced Features:
Offers specialized debugging and performance tools for tracing execution, measuring time, and displaying structured data.
- console.table()
- console.trace()
- console.time()
- console.timeEnd()
Customizing Console Output:
Helps inspect objects and validate conditions with more controlled and detailed console behavior.
- console.assert()
- console.dir()
Example:
// Node.js program to demonstrate the
// console.trace() method
// Accessing console module
const console = require('console');
// Calling console.trace() method
console.trace("stack teace sample");
console.trace("stack trace sample with args: %d", 39);
Output:
Trace: stack trace sample
    at Object.<anonymous> (C:\nodejs\g\console\console_trace.js:7:9)
    at Module._compile (internal/modules/cjs/loader.js:776:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:787:10)
    at Module.load (internal/modules/cjs/loader.js:653:32)
    at tryModuleLoad (internal/modules/cjs/loader.js:593:12)
    at Function.Module._load (internal/modules/cjs/loader.js:585:3)
Trace: stack trace sample with args: 39
    at Object.<anonymous> (C:\nodejs\g\console\console_trace.js:9:9)
    at Module._compile (internal/modules/cjs/loader.js:776:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:787:10)
    at Module.load (internal/modules/cjs/loader.js:653:32)
    at tryModuleLoad (internal/modules/cjs/loader.js:593:12)
    at Function.Module._load (internal/modules/cjs/loader.js:585:3)
The complete list of NodeJS Console are listed below:
| Node.js Console Methods | Description | 
|---|---|
| console.assert() | Checks whether value is truthy. If it is falsy or omitted, it writes an assertion failure message to the console; otherwise, it does nothing. | 
| console.clear() | The console.clear() will work differently across different operating systems and terminal types. | 
| console.count() | This is used to count label passed to it as a parameter, by maintaining an internal counter for that specific label. | 
| console.countReset() | This is used to reset the count for the specific label passed to it as a parameter. | 
| console.debug() | This is used to print messages to stdout in a newline. Alias of console.log() . | 
| console.dir() | Prints an object using util.inspect(). | 
| console.error() | This is used to display an error messages on the console. It prints to stderr with newline. | 
| console.info() | This is used to print messages to stdout in a newline. Alias of console.log(). | 
| console.timeLog() | Logs the elapsed time for a timer previously started with console.time(), along with any additional data . | 
| console.time() | It is used to starts a timer that is used to compute the time taken by a piece of code or function. | 
| console.table() | It is used to print the table constructed from it’s parameters into the console. | 
| new Console() Constructor | Creates a new Console with one or two writable streams. | 
| console.profile() | The console.profile() (Added in v8.0.0) method is an inbuilt application programming interface of the ‘console‘ module which doesn’t display anything unless used in the inspector. | 
| console.profileEnd() | The console.profileEnd() (Added in v8.0.0) method is an inbuilt application programming interface of the ‘console’ module which does not display anything unless used in the inspector. | 
| console.timeStamp() | This is an inbuilt application programming interface of the ‘console‘ module which does not display anything unless used in the inspector. | 
| console.timeEnd() | This method stops a timer that was previously started by using console.time() method and display the result using stdout. | 
| console.trace() | Prints a stack trace to stderr, prefixed with 'Trace: '. | 
| console.warn() | This is used to display the warning messages on the console. It prints to stderr with newline |
