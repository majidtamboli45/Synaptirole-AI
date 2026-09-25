# How to add a function in JSX ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-add-a-function-in-jsx/

JSX is a syntax extension for JavaScript that allows us to write HTML-like code within our JavaScript files. It is commonly used in React applications to define the structure and layout of components. While JSX primarily focuses on rendering components and displaying data, it also provides the flexibility to include functions within the JSX code.
Prerequisites:
- NodeJS: JavaScript runtime environment.
- NPM: Package manager for JavaScript.
- ReactJS: JavaScript library for building user interfaces.
- JSX: Syntax extension for JavaScript.
Steps to Create React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After setting up react environment on your system, we can start by creating an App.js file and create a directory by the name of components in which we will write our desired function.
Project Structure:
The updated dependencies in package.json file will look like.
  "dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example 1: In this example, we will demonstrate how to add a function in our application.
import "./styles.css";
// Importing the function
import Display from "./components/display";
export default function App() {
    return (
        <div className="App">
            {/* Creating custom JSX tag to return the function */}
            <Display></Display>
        </div>
    );
}
import React from "react";
// This is the function that will be added to the application
function Display() {
    return <h1>GeeksForGeeks</h1>;
}
export default Display;
Output: Thus, we can see that it is really simple to add functions to our JSX code.
Example 2: Now in this example, we will create display.js file with a change. This time we will be able to change the contents of the header from App.js file.
import "./styles.css";
// Importing the function
import Display from "./components/display.js";
export default function App() {
    return (
        <div className="App">
            {/*Customised JSX tag with different inputs*/}
            <Display name="Geeks"></Display>
            <Display name="For"></Display>
            <Display name="Geeks"></Display>
        </div>
    );
}
import React from "react";
// The contents of the header can 
// be modified in this function
function Display(props) {
    return <h1>{props.name}</h1>;
}
export default Display;
From the code, we can predict the output now. Note that you can render your customized output by just changing the name property in the tag.
Output:
