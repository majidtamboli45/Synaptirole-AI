# VM Module in Node.js

> Source: https://www.geeksforgeeks.org/node-js/nodejs-vm-module/

The VM module in Node.js allows JavaScript code to run in a separate and isolated environment. It is useful for executing code securely without affecting the main application.
- Enables execution of JavaScript in a sandboxed environment.
- Each virtual machine has its own global objects and variables.
- Helps run untrusted code safely without impacting the main program.
Importing the Module
To use the VM module in your application, simply import it as given below:
const vm = require('vm');
VM Methods
The VM module provides several methods for creating and managing execution contexts.
- vm.createContext(): vm.createContext() creates a new execution context that can be used to run scripts.
- vm.Script(): vm.Script() compiles JavaScript code into a script object that can be executed in a context.
- vm.runInContext(): vm.runInContext() runs code within a specific context.
- vm.runInThisContext(): vm.runInThisContext() runs code within the current global context.
- vm.runInNewContext(): vm.runInNewContext() runs code in a new, isolated context.
Example 1: Simple Script Execution
console.clear();
const vm = require('vm');
const code = 'let x = 2; x += 40; x';
const script = new vm.Script(code);
const result = script.runInThisContext();
console.log(result);
Output
42
Example 2: Executing Script with Custom Context
console.clear();
const vm = require('vm');
const sandbox = {
    x: 1,
    y: 2,
};
const context = vm.createContext(sandbox);
const script = new vm.Script('x += y; let z = x * 2; z');
script.runInContext(context);
console.log(sandbox.x);
console.log(sandbox.z); 
Output
3
undefined
Benefits of VM Module
The VM module provides secure and flexible execution of JavaScript code in isolated environments.
- Provides a controlled, isolated environment for running JavaScript code safely.
- Helps execute untrusted or dynamic code without affecting the main application or global scope.
- Allows custom execution contexts for flexible code evaluation in different scenarios.
- Supports script caching to improve performance when the same code runs multiple times.
- Includes built-in error handling to make debugging and error management easier.
