# How to use Divider Component in ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-divider-component-in-reactjs/

A divider is a thin line that groups content in lists and layouts. To use Diveder Component in React JS we can either create one or we can also import it from other UI libraries like Bootstrap, MaterialUI, etc.
Prerequisites
Steps to create React Application
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Project Structure:
Approach 1: Creating Divider component
We will create a divider component by using the inline css to the div component in React
Example: This example uses a custum divider component added between the other components.
// Filename - App.js
import React from "react";
export default function App() {
    return (
        <div style={{ display: "block", padding: 30 }}>
            <h1 style={{ color: "green" }}>
                GeeksfoeGeeks
            </h1>
            <h4>
                How to use Divider Component in ReactJS?
            </h4>
            <ul style={{ fontSize: "20px" }}>
                <li>1 Divider Below this list item</li>
                <Divider />
                <li>2 Divider Below this list item</li>
                <Divider />
                <Divider />
            </ul>
            <Divider />
        </div>
    );
}
const Divider = () => {
    return (
        <hr
            style={{ borderTop: "1px solid lightgrey" }}
        ></hr>
    );
};
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
Approach 2: Using materialUI Divider
We can also use divider component form UI libraries like MUI to use the Divider component in react
Step to Intall MUI: Install the material-ui modules using the following command.
npm install @material-ui/core
Dependencies list after installing packges
"dependencies": {
"@material-ui/core": "^4.12.4",
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
Example: This example uses material UI divider to add divider component in React JS
// Filename - App.js
import React from "react";
import Divider from "@material-ui/core/Divider";
import ListItem from "@material-ui/core/ListItem";
import ListItemText from "@material-ui/core/ListItemText";
import List from "@material-ui/core/List";
export default function App() {
    return (
        <div style={{ display: "block", padding: 30 }}>
            <h4>
                How to use Divider Component in ReactJS?
            </h4>
            <List component="nav">
                <ListItem button>
                    <ListItemText primary="1 Divider Below this list item" />
                </ListItem>
                <Divider />
                <ListItem button divider>
                    <ListItemText primary="2 Divider Below this list item" />
                </ListItem>
                <Divider /> <br />
                <Divider />
            </List>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
