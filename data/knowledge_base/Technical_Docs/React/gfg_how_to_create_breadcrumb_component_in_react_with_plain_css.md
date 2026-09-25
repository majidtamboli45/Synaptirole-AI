# How to Create Breadcrumb Component in React with Plain CSS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-breadcrumb-component-in-react-with-plain-css/

In ReactJS, we can create a Breadcrumb Component easily with Plain CSS. We have to make a new component with JSX code to get a basic HTML code for the Breadcrumb, and then we have to apply CSS effects to make some changes and make its appearance the best.
Prerequisites:
Approach:
Step 1: Make an inline list of items that are to be included in the breadcrumb of the Navbar. The code for it is given below:
li {
display:inline;
padding: 10px 16px;
text-decoration:underline;
}
Step 2: Styling the breadcrumb by adding some characters to separate the list items such as slash or comma etc. To do that we have to use the (::before) in CSS as given below:
li,li:before {
padding: 8px;
color: black;
content:"/";
}
Steps to Create the React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app GFGHosting
Step 2: After creating your project folder i.e. GFGHosting, move to it using the following command:
cd GFGHosting
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example: Now write down the following code in the App.js file
import React from 'react'
function App() {
    return (
        <div className="App">
            <nav>
                <ol>
                    <li> Home </li>
                    <li> About </li>
                    <li> Services</li>
                </ol>
            </nav>
        </div>
    );
}
export default App;
ol {
    text-align: center;
    border: solid;
}
li {
    display: inline;
    padding: 10px 16px;
    text-decoration: underline;
}
li+li:before {
    padding: 8px;
    color: black;
    content: "/";
}
nav {
    background-color: lime;
    height: 20px;
    width: 100%;
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000
