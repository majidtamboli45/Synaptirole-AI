# Introduction to JavaScript

> Source: https://www.geeksforgeeks.org/javascript/introduction-to-javascript/

JavaScript is a versatile, dynamically typed programming language that brings life to web pages by making them interactive. It is used for building interactive web applications and supports both client-side and server-side development.
- Dynamically typed: Variable types are determined at runtime.
- Single-threaded: Executes one task at a time (but supports asynchronous operations).
- Compiled and interpreted: Modern JavaScript engines combine compilation and interpretation for better performance.
"Hello, World!" Program in Browser Console
A "Hello, World!" program is the simplest way to get started with any programming language. Here’s how you can write one using JavaScript.
<html>
<head></head>
<body>
    <h1>Check the console for the message!</h1>
    <script>
        // This is our first JavaScript program
        console.log("Hello, World!");
    </script>
</body>
</html>
- The<script> tag is used to include JavaScript code inside an HTML document.
- console.log() prints messages to the browser's developer console. Open the browser console to see the "Hello, World!" message.
"Hello World" Program in Server Console
We can also print the "Hello World" program directly into the console terminal without embedding it into HTML. Create an index.js file and add the code to it.
// This is a comment
console.log("Hello, World!");
Run it in your terminal with:
node index.js
Features of JavaScript
Here are some key features of JavaScript that make it a powerful language for web development:
- Client-Side Scripting: JavaScript runs on the user's browser, so it has a faster response time without needing to communicate with the server .
- Versatile: Can be used for a wide range of tasks, from simple calculations to complex server-side applications.
- Event-Driven: Responds to user actions (clicks, keystrokes) in real-time.
- Asynchronous: It can handle tasks like fetching data from servers without freezing the user interface.
- Rich Ecosystem: There are numerous libraries and frameworks built on JavaScript, such as React , Angular , and Vue.js, which make development faster and more efficient.
Client Side and Server Side nature of JavaScript
JavaScript's flexibility extends to both the client-side and server-side, allowing developers to create complete web applications. Here’s how it functions in each environment:
- Client-Side: Involves controlling the browser and its DOM (Document Object Model). Handles user events like clicks and form inputs. Common libraries include AngularJS, ReactJS, and VueJS.
- Server-Side: Involves interacting with databases, manipulating files, and generating responses. Node.js and frameworks like Express.js are widely used for server-side JavaScript, enabling full-stack development.
Programming Paradigms in JavaScript
JavaScript supports both imperative and declarative programming styles:
- Imperative Programming : Focuses on how to perform tasks by controlling the flow of computation. This includes approaches like procedural and object-oriented programming, often using constructs like async/await to handle asynchronous actions.
- Declarative Programming : Focuses on what should be done rather than how it’s done. It emphasizes describing the desired result, such as with arrow functions, without detailing the steps to achieve it.
Also Check
