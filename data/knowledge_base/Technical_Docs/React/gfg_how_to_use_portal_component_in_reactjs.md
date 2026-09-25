# How to use Portal Component in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-portal-component-in-reactjs/

The portal component renders its children into a new subtree outside the current DOM hierarchy. Material UI for React has this component available for us, and it is very easy to integrate. We can use the Portal Component in ReactJS using the following approach.
Prerequisites:
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
Example: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import React from 'react';
import Portal from '@material-ui/core/Portal';
export default function App() {
    const [isVisible, setVisibility] = React.useState(false);
    const box = React.useRef(null);
    return (
        <div style={{ display: 'block', padding: 30, width: 500 }}>
            <h4>How to use Portal Component in ReactJS?</h4>
            <button type="button" onClick={() => {
                setVisibility(!isVisible)
            }}>
                {!isVisible ?
                    'Mount the Children' :
                    'Unmount the Children'}
            </button>
            <div style={{
                padding: 12,
                margin: 2,
                border: '2px solid',
            }}>
                Greetings from GeeksforGeeks
                {isVisible ? (
                    <Portal container={box.current}>
                        <span>Your Mounted Data is Here!!</span>
                    </Portal>
                ) : null}
            </div>
            <div style={{
                padding: 12,
                margin: 2,
                border: '2px solid',
            }} ref={box} />
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000
