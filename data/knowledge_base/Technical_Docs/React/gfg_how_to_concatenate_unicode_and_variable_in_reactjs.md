# How to concatenate unicode and variable in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-concatenate-unicode-and-variable-in-reactjs/

Unicode is an encoding standard for all characters in the universe. Every language code and symbol in this world is assigned by Unicode. There is no encoding standard that supports all languages, By using the Unicode standard, we can retrieve and combine data with all language combinations.
Example:
In the above example, a right-facing arrow is represented in Unicode by U+2192.
Prerequisites:
Approach:
- To concatenate Unicode and variables in React JS we will pass the unicode value as a prop to the App component. Then, first, convert Unicode into its numerical value, and for that, we will use parseInt.
parseInt(Unicode,base)
- Now, this numerical value needs to be converted into its character and for that, we can use
String.fromCodePoint(numericalValue).
Steps to Create React Application:
Step 1: Create a React application using the following command.
npx create-react-app geeksforgeeks
Step 2: After creating your project folder i.e. geeksforgeeks, move to it using the following command.
cd geeksforgeeks
Project Structure:
Example: This example implement the unicode concatemation with variable using the parseInt and fromCodePoint methods.
// Filename - index.js
import React from "react";
import ReactDOM from "react-dom";
import App from "./App";
ReactDOM.render(
    <React.StrictMode>
        <App unicode="2192" />
    </React.StrictMode>,
    document.getElementById("root")
);
// Filename - App.js
import React from "react";
const App = ({ unicode }) => {
    return (
        <h1>
            This is a Right arrow
            {String.fromCodePoint(parseInt(unicode, 16))}
        </h1>
    );
};
export default App;
Step to Run the Application: run the local server using the following command within the react-app directory
npm start
Output: This output will be visible on the http://localhost:3000 on the browser window.
