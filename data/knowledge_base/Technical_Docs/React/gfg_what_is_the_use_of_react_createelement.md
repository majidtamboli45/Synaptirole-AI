# What is the use of React.createElement

> Source: https://www.geeksforgeeks.org/reactjs/what-is-the-use-of-react-createelement/

React.createElement is a fundamental method of React JS. The main use of React.createElement is the creation of a React element. It is the JavaScript format for creating React elements. Also, the JSX React component, when transpiled, invokes only this method for creating the element.
Syntax:
React.createElement(type,{props},children); 
// JSX code
<type {...props} >{children}</type
Parameters: React.createElement() takes three arguments. They are:
- type: the type of the HTML element (h1,p, button, etc).
- props: properties of the object({style:{size:10px}} or Eventhandlers, classNames,etc).
- children: anything that needs to be enclosed by that component.
React DOM: React DOM contains the arguments that are necessary to render React elements in the browser.
ReactDOM.render(element,containerElement);
Parameters: ReactDOM.render() takes two arguments:
- element: The element that needs to be rendered in the DOM.
- containerElement: Where to render in the dom.
Steps to create React Application
Step 1: Create a react application using the below command:
npx create-react-app foldername
Step 2: Once your folder is created, change your directory to the newly created folder using the below-mentioned command.
cd foldername
Project Structure:
Example: This code in Index.js shows the use of react.createEement method and render that component using ReactDOM.render method.
// Filename - index.js
import React from 'react';
import ReactDOM from 'react-dom';
let demo = React.createElement(
    "h1", { style: { color: "green" } }, "Welcome to GeeksforGeeks"
)
ReactDOM.render(
    demo,
    document.getElementById('root')
);
Step to run the application: Run your application using the following command in the terminal.
npm start
Output: This output will be visible on http://localhost:3000
