# How to use Collapse Component in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-collapse-component-in-reactjs/

ReactJS, a popular JavaScript library for building user interfaces, provides developers with a rich set of components to create interactive and dynamic web applications. One such component is the Collapse component, which allows you to hide and reveal content based on user interaction. In this article, we will explore how to effectively use the Collapse component in ReactJS to create collapsible sections within your applications.
Prerequisites
- Knowledge of React JS
- Node and NPM installed in the system
Steps to create React Application And Installing Module:
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui modules using the following command.
npm install @material-ui/core
Project Structure:
Example: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import React from 'react';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Paper from '@material-ui/core/Paper';
import Switch from '@material-ui/core/Switch';
import Collapse from '@material-ui/core/Collapse';
export default function App() {
    const [isChecked, setIsChecked] = React.useState(false);
    return (
        <div style={{ display: 'block', padding: 30 }}>
            <h4>How to use Collapse Component in ReactJS?</h4>
            <FormControlLabel
                control={<Switch checked={isChecked} onChange={() => {
                    setIsChecked((prev) => !prev);
                }} />}
                label="Toggle me to see Collapse Effect"
            />
            <div style={{ display: 'flex' }}>
                <Collapse in={isChecked}>
                    <Paper
                        elevation={5}
                        style={{ margin: 5 }} >
                        <svg style={{ width: 100, height: 100 }}>
                            <polygon points="0,80 45,00, 80,70"
                                style={{
                                    fill: 'orange',
                                    stroke: 'dimgrey',
                                    strokeWidth: 1,
                                }} />
                        </svg>
                    </Paper>
                </Collapse>
            </div>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
Reference: https://mui.com/material-ui/transitions/#collapse
