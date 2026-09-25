# React JS Basic Concepts Reference

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-basics-concepts-complete-reference/

React is a JavaScript library for building user interfaces, focused mainly on the view layer of applications. It was developed by Facebook to efficiently handle dynamic and complex UI updates.
- Uses a component-based architecture for reusable and modular UI.
- Implements a virtual DOM to improve performance.
- Follows a unidirectional data flow for better state management.
Setting Up the Development Environment
Before going into the practical aspects of ReactJS, it is Important to set up the development Environment. This guide will walk you through the process of installing the necessary tools and creating your first React Project.
Prerequisites
To begin, you will need Node.js and npm(Node Package Manager). Node.js is a JavaScript runtime that allows you to run JavaScript outside the browser, while npm is used to manage your project’s dependencies.
1. Install Node.js and npm:
- Visit the Official Node.js website and download (https://nodejs.org/en/download) the version recommended for most users.
- After Installation, verify that everything is working by running the following Commands in your terminal.
$ node --version
2. Code Editor: While you can use any text editor, Visual Studio Code is highly recommended for its syntax highlighting, auto completion, and Git Integration.
Create a New React.JS Project
A React.js project sets up the basic structure and tools needed to build a modern, interactive user interface using React.
1. Install Vite and Create a Project
npm create vite@latest my-react-app -- --template react
Replace my-react-app with your desired project name.
2. Navigate into your project directory
cd my-react-app
3. Install dependencies
npm install
4. Start the development server
npm run dev
This will launch the app in your browser at http://localhost:3000.
Understanding the Project Structure
Your new React project comes with a predefined structure. Here are the key files and folders you'll work with:
- public/index.html: The single HTML file where your React app will be rendered.
- src/index.js: The JavaScript entry point for your React application.
- src/App.js: A basic React component that serves as the starting point for your app.
Example: Here, we have implemented a basic react app with the hello world output.
import React from 'react';
function App() {
    return (
        <div className="App">
            <h1 style={
                { textAlign: 'center' }
            }>
                Hello, World!
            </h1>
        </div>
    );
}
export default App;
Output:
Basic Concepts Reference
| React Basic Concepts | Description | 
|---|---|
| React JS Introduction to JSX | JSX (JavaScript XML) is a syntax extension for React.js that allows developers to write HTML elements. | 
| React JS Rendering Elements | Rendering Elements in React involves efficiently updating the user interface by creating and updating virtual representations of the UI components. | 
| React JS Components | Components in React are modular, reusable building blocks for UI elements. | 
| React JS Components – Set 2 | Components in React are modular, reusable building blocks for UI elements. | 
| React JS Fragments | We may render a single element or multiple elements, though rendering multiple elements will require a ‘div’ tag called Fragment | 
| React JS Props – Set 1 | React allows us to pass information to a Component using something called props. | 
| React JS Props – Set 2 | React allows us to pass information to a Component using something called props. | 
| React JS PropTypes | use the propType for validating any data we are receiving from props. | 
| React JS State in React | React JS State is a way to store and manage the information or data while creating a React Application. | 
| React JS Lifecycle of Components | Every React Component has a lifecycle of its own, lifecycle of a component can be defined as the series of methods that are invoked in different stages of the component’s existence. | 
| React JS Conditional Rendering | Rendering based on the conditions called conditional rendering in React | 
| React JS Lists | React Lists are very useful when it comes to developing the UI of any website | 
| React JS Keys | React JS keys are a way of providing a unique identity to each item while creating the React JS Lists so that React can identify the element to be processed. | 
| React JS Refs | React JS Refs are used to access and modify the DOM elements in the React Application. | 
| React JS forms | In React Forms, All the form data is stored in the React’s component state | 
| React JS Hooks | Hooks are used to give functional components an access to use the states and are used to manage side-effects in React. | 
| React JS Router | In React mostly SPA are developed so Navigation is complex. | 
| React JS ReactDOM | React provides the developers with a package react-dom to access and modify the DOM. | 
| React JS Event Handling | Modern webpages rely on user interactions, triggering events like clicks or keypresses. | 
| React JS Synthetic Events | Synthetic events in React are cross-browser wrappers around the browser’s original event. | 
| React JS ContextAPI | Context API is used to pass global variables anywhere in the code. | 
| React JS Controlled Components | React’s Controlled Components manage form data via component state, receiving values through props and updating through callbacks like onChange. |
