# NodeJS Architecture and Components

> Source: https://www.geeksforgeeks.org/node-js/node-js-basics/

Node.js is a JavaScript runtime environment built on Chrome’s V8 JavaScript engine that allows developers to execute JavaScript code outside the browser. It can make console-based and web-based Node.js applications.
- It is asynchronous, enabling efficient handling of concurrent requests.
- Developers can create event-driven applications using callbacks and event emitters.
- npm (Node Package Manager) provides access to thousands of reusable packages.
- Node.js runs on a single thread. Despite being asynchronous, it uses an event loop to handle requests.
Node.js Architecture
Node.js follows a single-threaded event loop model that handles all client requests using a single thread. It is based on a non-blocking I/O model, meaning the server can process multiple requests without waiting for one task to complete before starting the next.
- Event Loop: The event loop processes tasks without blocking, allowing Node.js to handle many requests concurrently on a single thread.
- Asynchronous Execution: Non-blocking functions are used for tasks such as reading from the file system or querying databases. This ensures the application remains responsive.
Components of Node.js Architecture
Node.js architecture consists of components that work together to handle asynchronous, non-blocking operations efficiently.
- V8 Engine: Compiles JavaScript to machine code for fast execution.
- Event Loop: Manages asynchronous tasks without blocking the main thread.
- Libuv: Handles I/O operations, thread pool, and timers.
- Non-Blocking I/O: Executes tasks without waiting for previous ones to complete.
Basic Node.js Concepts
1. Modules in Node.js
Node.js is based on modules, which are reusable pieces of code that can be imported into applications. These include built-in modules (like fs and http) and external packages installed using NPM.
2. Event Loop and Asynchronous Programming
Node.js uses an event loop to handle asynchronous tasks without blocking execution, making applications fast and responsive.
- Runs tasks in the background (non-blocking I/O).
- Uses callbacks when tasks complete.
- Handles multiple requests efficiently.
