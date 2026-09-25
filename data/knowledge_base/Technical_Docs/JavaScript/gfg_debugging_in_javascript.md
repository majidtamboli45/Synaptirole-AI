# Debugging in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/debugging-in-javascript/

Debugging in JavaScript is the process of identifying and fixing errors in code to make programs run correctly. It helps developers understand unexpected behavior by inspecting variables, checking logic flow, and tracking execution.
Types of Errors in JavaScript
Syntax Errors: Issues with incorrect syntax, preventing execution.
console.log("Hello); // SyntaxError: missing closing quote
Runtime Errors: Errors occurring during execution.
let a = undefined;
console.log(a.length); // TypeError: Cannot read properties of undefined
Logical Errors: Code runs without errors but produces incorrect results.
function add(a, b) {
return a - b; // Logical error: should use + instead of -
}
JavaScript Debuggers
1. Built-in Debugging Tools
Modern browsers provide built-in JavaScript debuggers, accessible via Developer Tools. Debuggers can be turned on and off, forcing errors to be reported. They allow setting breakpoints and examining variables while code executes.
Steps to Activate Debugging:
- Chrome: Open "More tools" → "Developer tools" → Select "Console".
- Firefox: Open "Web Developer" → "Web Console".
- Edge: Open "Developer Tools" → Select "Console".
- Opera: Open "Developer" → "Developer tools" → "Console".
- Safari: Enable "Show Develop menu in menu bar" under Preferences, then select "Show Error Console".
2. Using console.log()
One of the simplest debugging techniques is logging messages to the console.
let x = 10;
console.log("Value of x:", x);
3. Setting Breakpoints
Breakpoints stop execution at specific lines, allowing variable inspection.
- Open DevTools (F12 or Ctrl+Shift+I).
- Navigate to the "Sources" tab.
- Click on line numbers to set breakpoints.
- Resume execution using the play button after analysis.
4. Using the debugger Keyword
The debugger statement stops execution and opens debugging tools.
function test() {
let n = 42;
debugger; // Execution pauses here
console.log(n);
}
test();
If debugging is unavailable, debugger has no effect.
Common Debugging Issues and Fixes
1. Debugging Syntax Errors
Syntax errors occur when code violates JavaScript's syntax rules. These errors are typically caught during parsing before execution.
- Code editors and linters flag syntax errors.
- Fixing syntax mistakes ensures smooth execution.
console.log("Hello);
Fix: Add the missing closing quote.
2. Using console.log() to Track Values
Logging variable values helps debug unexpected outputs.
- Provides real-time feedback on variable states.
- Useful for debugging logical errors.
let x = 5;
console.log("X value:", x);
3. Debugging with Breakpoints in DevTools
Breakpoints allow developers to pause code execution and inspect variable values.
function add(a, b) {
    return a + b;
}
let res = add(5, 10);
console.log(res);
Output
- Breakpoints help developers pause and inspect variables during runtime.
- They allow you to step through code line by line.
- Useful for identifying logical errors in complex functions.
4. Identifying undefined Variables
Undefined variables usually indicate scope issues or missing arguments.
- Passing required arguments prevents undefined values.
- Ensures function behavior aligns with expectations.
function greet(name) {
    console.log("Hello, " + name);
}
greet(); // Undefined issue
Fix: Call greet("Ajay") to pass a valid argument.
5. Catching Errors with try...catch
- Handling runtime errors prevents crashes.
- Useful for handling JSON parsing errors.
try {
let data = JSON.parse("{invalid}");
} catch (error) {
console.error("Parsing error:", error.message);
}
Fix: Ensure valid JSON input.
6. Debugging Asynchronous Code with Promises
- Handling async operations can be tricky.
- .catch() handles rejected promises.
fetch("invalid-url").catch(error => console.error("Request failed", error));
Fix: Handle network errors gracefully.
7. Debugging Event Listeners
- Event listeners may not trigger as expected.
- Ensure the correct event target is selected.
document.getElementById("btn").addEventListener("click", function() {
console.log("Button clicked");
});
Fix: Ensure the element ID exists.
8. Memory Leak Detection
- Memory leaks slow down applications.
- Use Chrome DevTools to detect leaks.
- Avoid excessive memory allocations.
let a = [];
setInterval(() => a.push("data"), 1000); // Potential memory leak
Fix: Clear unused data regularly.
