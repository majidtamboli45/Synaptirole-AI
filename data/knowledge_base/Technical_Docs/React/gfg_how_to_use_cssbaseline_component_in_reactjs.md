# How to use CssBaseLine Component in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-cssbaseline-component-in-reactjs/

In React JS, A CssBaseline component is a collection of HTML elements and attribute style-normalizations. At the <head> of our document, it is added as CSS reset. This component is used to add some basic styling to our application like box-sizing, background color, etc like CSS reset for our application on top of the Theme. Material UI for React has this component available for us, and it is very easy to integrate.
Prerequisites:
Approach:
To add basic CSS styling for the React Elements we will be using the CssBaseLine component from the Material UI. We will first install the MUI core package from NPM and enclose the content within the CssBaseLine Component.
Steps to Create React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui modules using the following command:
npm i @material-ui/core
Project Structure:
The updated dependencies in package.json file.
"dependencies": {
"@material-ui/core": "^4.12.4",
"@material-ui/icons": "^4.11.3",
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
},
Example 1: This example uses CssBaseLine Component from MUI to implement basic styling to the specific components.
//  Filename - App.js
import React from "react";
import CssBaseline from "@material-ui/core/CssBaseline";
export default function App() {
    return (
        <div style={{ display: "block", padding: 30 }}>
            <h4>
                How to use CssBaseline Component in ReactJS?
            </h4>
            <CssBaseline>
                <p>Greetings from GeeksforGeeks</p>
                <p>
                    These lines are within CssBaseline
                    Component
                </p>
                <p>Stay Safe and Healthy</p>
            </CssBaseline>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Example 2: This example shows the same content on the web page without using CssBaseLine
//  Filename - App.js
import React from "react";
export default function App() {
    return (
        <div style={{ display: "block", padding: 30 }}>
            <h4>
                How to use CssBaseline Component in ReactJS?
            </h4>
            <p>Greetings from GeeksforGeeks</p>
            <p>
                These lines are without CssBaseline
                Component
            </p>
            <p>Stay Safe and Healthy</p>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
