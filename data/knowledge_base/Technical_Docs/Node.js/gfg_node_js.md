# Node.js Tutorial

> Source: https://www.geeksforgeeks.org/node-js/nodejs/

Node.js is an open-source, cross-platform JavaScript runtime built on Chrome's V8 engine. It enables developers to run JavaScript outside the browser to build fast, scalable server-side applications.
- JavaScript was initially a frontend-only language, and Node.js (2009) enabled backend development as well.
- Non-blocking, event-driven architecture for high performance.
- Supports the creation of REST APIs, real-time applications, and microservices.
- Comes with a rich library of modules through npm (Node Package Manager).
First code example:
// Import the http module
const http = require("http");
// Create a server
const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader("Content-Type", "text/plain");
    res.end("Welcome to the Node.js Tutorial");
});
// Listen on port 3000
server.listen(3000, () => {
    console.log(
        "Server is running on http://localhost:3000");
});
It will start a server, and when you visit http://localhost:3000, it will display
Welcome to the Node.js Tutorial
- The http module is imported to create a basic HTTP server.
- The createServer() method is used to handle incoming requests and send responses.
- The server listens on port 3000, and a message is displayed in the browser when accessed.
Why learn Node.js
It allows developers to build fast, scalable server-side applications using JavaScript.
- Enables full-stack development with a single language.
- Ideal for real-time apps like chat and gaming servers.
- Handles I/O-intensive tasks efficiently with non-blocking architecture.
- Supported by a large community and vast npm ecosystem.
Getting Started
Provides an overview of its runtime environment, architecture, and how it enables server-side JavaScript development.
Node Package Manager
Manage project dependencies and packages efficiently using NPM.
Modules
Understand how to organize and reuse code using different types of modules.
Asynchronous Programming
Learn how Node.js handles multiple tasks efficiently using non-blocking operations.
Core Concept
Understand essential Node.js concepts that control scope, context, and global behavior.
Building Applications
Create and manage server-side applications using Node.js features and tools.
Express.js
Build web applications efficiently using the Express.js framework.
Debugging and Utilities
Tools and techniques to debug code and improve development workflow.
Node.js Complete References
It covers the core modules and built-in APIs used for server-side development.
System & Core Modules
Handle core functionalities related to system operations and runtime environment.
File & Data Handling
Manage data processing, file operations, and data transformation.
Networking, Security & Performance
Support communication, security features, and performance optimization.
