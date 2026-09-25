# How to use Popper Component in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-popper-component-in-reactjs/

A Popper is used to show the part of the content on top of another. It's an alternative feature for react-popper. Material UI for React has this component available for us, and it is simple and very easy to integrate. For perfect positioning, it uses 3rd party library which is Popper.js.
Prerequisites:
Steps to Create the React Application And Installing Module:
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Step 3: Install the material-ui, emotion/react, mui/styled-engine, modules using the following command.
npm install @mui/material
npm install @emotion/react
npm install @mui/styled-engine
Project Structure:
package.json:
  "dependencies": {
"@mui/material": "^5.14.18",
"@emotion/react": "^11.11.1",
"@mui/styled-engine": "^5.14.18",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
Example 1: In this example, we will create a simple Popper component that gets displayed at the click of a button. Please update your App.js file like below:
import { Popper } from '@mui/material';
import React from 'react';
export default function App() {
    const [anchorEl, setAnchorEl] = React.useState(null);
    const open = Boolean(anchorEl);
    return (
        <div style={{ display: 'block', padding: 30 }}>
            <h1 style={{ color: 'green' }}>GeeksforGeeks</h1>
            <h4>How to use Popper Component in ReactJS?</h4>
            <button type="button" onClick={(event) => {
                setAnchorEl(anchorEl ? null : event.currentTarget);
            }}>
                Click Me to Toggle Popper
            </button>
            <Popper
                id={open ? 'simple-popper' : undefined}
                open={open}
                anchorEl={anchorEl}>
                <div style={{
                    padding: 2,
                    border: '1px solid',
                    backgroundColor: 'gray',
                }}>Greetings from GeeksforGeeks</div>
            </Popper>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000
Example 2: In this example, we will create 2 Popper components that get displayed in different directions, one at the top and the other at the bottom in orientation.
import { Popper } from '@mui/material';
import React from 'react';
export default function App() {
    const [anchorElA, setAnchorElA] = React.useState(null);
    const [anchorElB, setAnchorElB] = React.useState(null);
    const openA = Boolean(anchorElA);
    const openB = Boolean(anchorElB);
    return (
        <div style={{ display: 'block', padding: 30 }}>
            <h1 style={{ color: 'green' }}>GeeksforGeeks</h1>
            <h4>How to use Popper Component in ReactJS?</h4>
            <div style=
                {
                    {
                        display: 'flex',
                        gap: '10px'
                    }
                }>
                <button type="button" onClick={(event) => {
                    setAnchorElA(anchorElA ? null : event.currentTarget);
                }}>
                    Popper on top
                </button>
                <button type="button" onClick={(event) => {
                    setAnchorElB(anchorElB ? null : event.currentTarget);
                }}>
                    Popper on bottom
                </button>
            </div>
            <Popper
                id={openA ? 'simple-popper' : undefined}
                placement='top'
                open={openA}
                anchorEl={anchorElA}>
                <div style={{
                    padding: 2,
                    border: '1px solid',
                    backgroundColor: 'gray',
                }}>
                    Greetings from GeeksforGeeks
                </div>
            </Popper>
            <Popper
                id={openB ? 'simple-popper' : undefined}
                placement='bottom'
                open={openB}
                anchorEl={anchorElB}>
                <div style={{
                    padding: 2,
                    border: '1px solid',
                    backgroundColor: 'gray',
                }}>Greetings from GeeksforGeeks</div>
            </Popper>
        </div>
    );
}
Steps to run the application:
npm start
Output:
