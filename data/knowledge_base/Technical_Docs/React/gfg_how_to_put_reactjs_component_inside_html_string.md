# How to put ReactJS component inside HTML string ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-put-reactjs-component-inside-html-string/

Putting the React JS component inside the HTML library is not recommended and may lead to conflict in React lifecycle methods. But it can be done by parsing the HTML String into DOM using the html-to-react module.
html-to-react is a lightweight library that is responsible for converting raw HTML to a React DOM structure. This library converts the string to a node tree of DOM elements, then transforms each node to a React element using a set of instructions that you define.
Prerequisites:
Approach:
To put the React JS component inside HTML and render it on UI we will be using html-to-react package. It converts the HTML to the react DOM structure that can be easily rendered on the web page.
Steps to create React Application And Installing Module:
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Step 3: After creating the ReactJS application, Install the html-to-react module using the following command.
npm i html-to-react
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"html-to-react": "^1.7.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
Example: This example uses html-to-react package to parse the html string to react dom structure and render component on the UI.
// Filename - App.js
import {
    Parser,
    ProcessNodeDefinitions,
} from "html-to-react";
import ReactComponent from "./ReactComponent";
import React, { Component } from "react";
const customElements = {
    "my-react-component": ReactComponent,
};
// Boilerplate stuff
const htmlParser = new Parser(React);
const processNodeDefinitions = new ProcessNodeDefinitions(
    React
);
function isValidNode() {
    return true;
}
// Custom instructions for processing nodes
const processingInstructions = [
    // Create instruction for custom elements
    {
        shouldProcessNode: (node) => {
            // Process the node if it matches a custom element
            return node.name && customElements[node.name];
        },
        processNode: (node) => {
            let CustomElement = customElements[node.name];
            return <CustomElement />;
        },
    },
    // Default processing
    {
        shouldProcessNode: () => true,
        processNode:
            processNodeDefinitions.processDefaultNode,
    },
];
export default class MyParentComponent extends Component {
    render() {
        let htmlString =
            "<div>Hi<my-react-component></my-react-component></div>";
        return htmlParser.parseWithInstructions(
            htmlString,
            isValidNode,
            processingInstructions
        );
    }
}
// Filename - ReactComponent.js
export default function ReactComponent() {
    return (
        <div>
            <p>Hello from React Component</p>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
