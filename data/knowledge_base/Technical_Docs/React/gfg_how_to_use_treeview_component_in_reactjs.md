# How to use TreeView Component in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-treeview-component-in-reactjs/

Explore the functionality of ReactJS's TreeView component, a powerful tool for seamlessly navigating and displaying hierarchical structures in web applications. This comprehensive guide delves into the integration process, empowering you to represent complex data relationships in an organized and user-friendly manner with ease.
Prerequisites:
Steps to Create React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. folder name, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui module using the following command:
npm install @material-ui/core
npm install @material-ui/lab
npm install @material-ui/icons
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"@material-ui/core": "^4.12.4",
"@material-ui/icons": "^4.11.3",
"@material-ui/lab": "^4.0.0-alpha.61",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example: Now write down the following code in the App.js file
import React from "react";
import ExpandMoreIcon from "@material-ui/icons/ExpandMore";
import ChevronRightIcon from "@material-ui/icons/ChevronRight";
import TreeItem from "@material-ui/lab/TreeItem";
import TreeView from "@material-ui/lab/TreeView";
export default function App() {
    return (
        <div style={{ display: "block", padding: 30 }}>
            <h4>How to use TreeView Component in ReactJS?</h4>
            <TreeView
                style={{
                    height: 240,
                    maxWidth: 400,
                    flexGrow: 1,
                }}
                defaultExpandIcon={<ChevronRightIcon />}
                defaultCollapseIcon={<ExpandMoreIcon />}
            >
                <TreeItem nodeId="0" label="States">
                    <TreeItem nodeId="1" label="Madhya Pradesh" />
                    <TreeItem nodeId="2" label="Goa" />
                    <TreeItem nodeId="3" label="Delhi" />
                    <TreeItem nodeId="4" label="Mumbai, etc" />
                </TreeItem>
            </TreeView>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000
