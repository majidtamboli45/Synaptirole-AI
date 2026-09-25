# How to use TextField Component in Material UI ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-textfield-component-in-material-ui/

TextField component is a complete form control including a label, input, and help text. Material UI for React has this component available for us and it is very easy to integrate.
Prerequisites
- Knowledge of ReactJS
- JavaScript (ES6+)
- MUI Basics
Steps to create React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui modules using the following command:
npm install @mui/material
Project Structure:
Example 1: In this example, we will create a text field application where the text that the user inputs is visible at the bottom of the TextField component. Please update App.js file as shown below
// App.js
import { TextField } from "@mui/material";
import React, { useState } from "react";
const App = () => {
    const [name, setName] = useState("");
    return (
        <div
            style={{
                marginLeft: "40%",
            }}
        >
            <h2>
                How to use TextField 
                Component in ReactJS?
            </h2>
            <TextField
                value={name}
                label="Enter your name"
                onChange={(e) => {
                    setName(e.target.value);
                }}
            />
            <h3>Your Enter Value is: {name} </h3>
        </div>
    );
};
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
Example 2: In this example, we will create a text field application with a validation message that would show when the TextField is empty. Please update App.js file shown below
// App.js
import { TextField } from "@mui/material";
import React, { useState } from "react";
const App = () => {
    const [name, setName] = useState("");
    return (
        <div
            style={{
                marginLeft: "40%",
            }}
        >
            <h2>How to use TextField Component in ReactJS?</h2>
            <TextField
                error={name.length === 0}
                helperText={!name.length ? 'name is required' : ''}
                value={name}
                label="Enter your name"
                onChange={(e) => {
                    setName(e.target.value);
                }}
            />
            <h3>Your Enter Value is: {name} </h3>
        </div>
    );
};
export default App;
Steps to run the application:
npm start
Output:
Reference: https://mui.com/material-ui/api/text-field/#main-content
