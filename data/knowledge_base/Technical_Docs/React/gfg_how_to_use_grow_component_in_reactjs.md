# How to use Grow Component in ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-grow-component-in-reactjs/

Grow Component in ReactJS adds a Grow animation to a child element or component. Material UI for React has this component available for us, and it is very easy to integrate. We can use the Grow Component in ReactJS using the following approach.
Prerequisites
Approach
To implement the grow component in React we will be using the material UI package and use the Grow component for the element to show the grow animation. When switch input is received the component turns visible in a grow animation and when off it will disappear.
Steps to Create React Application And Installing Module:
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui modules using the following command.
npm i @material-ui/core
Project Structure:
The Updated dependencies in package.json file will look like:
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
Example: This example uses Material UI Grow transition to display the grow component.
// Filename - App.js
import React from "react";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import Paper from "@material-ui/core/Paper";
import Switch from "@material-ui/core/Switch";
import Grow from "@material-ui/core/Grow";
export default function App() {
    const [isChecked, setIsChecked] = React.useState(false);
    return (
        <div style={{ display: "block", padding: 30 }}>
            <h4>How to use Grow Component in ReactJS?</h4>
            <FormControlLabel
                control={
                    <Switch
                        checked={isChecked}
                        onChange={() => {
                            setIsChecked((prev) => !prev);
                        }}
                    />
                }
                label="Toggle me to see Grow Effect"
            />
            <div style={{ display: "flex" }}>
                <Grow in={isChecked}>
                    <Paper
                        elevation={5}
                        style={{ margin: 5 }}
                    >
                        <svg
                            style={{
                                width: 100,
                                height: 100,
                            }}
                        >
                            <polygon
                                points="0,80 45,00, 80,70"
                                style={{
                                    fill: "orange",
                                    stroke: "dimgrey",
                                    strokeWidth: 1,
                                }}
                            />
                        </svg>
                    </Paper>
                </Grow>
            </div>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
