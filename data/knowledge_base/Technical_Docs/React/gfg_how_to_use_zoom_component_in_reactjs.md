# How to use Zoom Component in ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-zoom-component-in-reactjs/

Zoom Component adds a Zoom animation to a child element or component. Material UI for React has this component available for us, and it is very easy to integrate. We can use the Zoom Component in ReactJS using the following approach.
Prerequisites:
Approach:
The React component utilizes the Material-UI library to create a toggleable Zoom effect. It incorporates a Switch component for toggling, and a Paper component with Zoom effect controlled by the Switch state. The Zoom effect is triggered by changing the "in" prop based on the state of the Switch.
Steps to Create the React Application And Installing Module:
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui modules using the following command.
npm install @material-ui/core
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"@material-ui/core": "^4.12.4",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example: Now write down the following code in the App.js file.
import React from 'react';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Paper from '@material-ui/core/Paper';
import Switch from '@material-ui/core/Switch';
import Zoom from '@material-ui/core/Zoom';
export default function App() {
    const [isChecked, setIsChecked] = React.useState(false);
    return (
        <div style={{ display: 'block', padding: 30 }}>
            <h4>How to use Zoom Component in ReactJS?</h4>
            <FormControlLabel
                control={<Switch checked={isChecked} onChange={() => {
                    setIsChecked((prev) => !prev);
                }} />}
                label="Toggle me to see Zoom Effect"
            />
            <div style={{ display: 'flex' }}>
                <Zoom in={isChecked}
                    style={{ transitionDelay: '100ms' }}>
                    <Paper
                        elevation={5}
                        style={{ margin: 5 }} >
                        <svg style={{ width: 100, height: 100 }}>
                            <polygon points="0,50 40,0,50,90"
                                style={{
                                    fill: 'red',
                                    stroke: 'dimgrey',
                                    strokeWidth: 1,
                                }} />
                        </svg>
                    </Paper>
                </Zoom>
            </div>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000
