# Node.js with WebAssembly

> Source: https://www.geeksforgeeks.org/node-js/node-js-with-webassembly/

WebAssembly, often abbreviated as Wasm, is a cutting-edge technology that offers a high-performance assembly-like language capable of being compiled from various programming languages such as C/C++, Rust, and AssemblyScript. This technology is widely supported by major browsers including Chrome, Firefox, Safari, Edge, and notably, Node.js.
Key Concepts of WebAssembly
WebAssembly introduces several fundamental concepts:
- Module: This refers to a compiled WebAssembly binary represented by a .wasm file.
- Memory: A resizable ArrayBuffer used by WebAssembly.
- Table: A resizable typed array of references not stored in Memory.
- Instance: An instantiation of a Module with its associated Memory, Table, and variables.
These concepts form the backbone of the WebAssembly execution model and are essential for understanding its usage within Node.js.
Generating WebAssembly Modules
There are multiple approaches to generate WebAssembly binary files:
- Writing WebAssembly (.wat) code manually and converting it into a binary format using tools like wabt.
- Employing emscripten for compiling C/C++ applications.
- Utilizing wasm-pack for compiling Rust applications.
- Leveraging AssemblyScript for a TypeScript-like development experience.
These tools not only generate the .wasm binary but also produce necessary JavaScript integration code and HTML files for running the WebAssembly module in web browsers.
Steps to Setup a NodeJS App
Step 1: Create a new application using the below command:
npm init -y
Step 2: Navigate to the root directory of your application using the below command:
cd foldername
Using WebAssembly with Node.js
To utilize WebAssembly in Node.js, the platform provides a set of APIs through the global WebAssembly object. This snippet demonstrates loading a .wasm file, instantiating the module, and invoking an exported function (add) from the WebAssembly instance.
Example: Below is an example of instantiating a WebAssembly module within a Node.js environment.
const fs = require('node:fs');
const wasmBuffer = fs.readFileSync('/path/to/add.wasm');
WebAssembly.instantiate(wasmBuffer).then(wasmModule => {
  const { add } = wasmModule.instance.exports;
  const sum = add(5, 6);
  console.log(sum); // Outputs: 11
});
Output
11
Interacting with the OS using WebAssembly
WebAssembly modules operate within a sandboxed environment and cannot directly access operating system functionalities. However, tools like Wasmtime enable interaction with the OS using the WebAssembly System Interface (WASI) API. This approach facilitates tasks that require OS-level capabilities, extending the usability of WebAssembly beyond typical browser environments.
