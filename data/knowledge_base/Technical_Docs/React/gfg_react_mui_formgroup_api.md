# React MUI FormGroup API

> Source: https://www.geeksforgeeks.org/reactjs/react-mui-formgroup-api/

Material-UI is a user interface framework that provides pre-defined and customizable React components for faster and easy web development. The Material-UI components are based on top Material Design by Google. In this article let’s discuss the FormGroup API in the Material-UI library.
FormGroup API offered by MUI: FormGroup API is used to wrap control elements, such as Checkbox and Switch, and give them a compact layout based on the props passed.
FormGroup props:
- children: It denotes the <option> elements that represent the items in the select list.
- classes: It denotes the styles to override the default ones.
- row: It determines whether to display the group of elements in a single row.
- sx: It denotes a system prop that allows defining system overrides and additional CSS styles.
Creating React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the required module using the following command:
npm install @mui/material
Project Structure: It will look like the following.
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Example 1: In this example, we will try to create a simple application that uses FormGroup component to represent a group of Checkbox components. Now write down the following code in the App.js file. Here, App is our default component where we have written our code:
import * as React from 'react';
import FormGroup from '@mui/material/FormGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';
export default function BasicButtonGroup() {
    return (
        <div>
            <div
                className="head"
                style={{
                    width: "fit-content",
                    margin: "auto",
                }}
            >
                <h1
                    style={{
                        color: "green",
                    }}
                >
                    GeeksforGeeks
                </h1>
                <strong>React MUI FormGroup API</strong>
                <br />
                <br />
            </div>
            <div
                style={{
                    width: "fit-content",
                    margin: "auto",
                }}
            >
                <FormGroup>
                    <FormControlLabel control={<Checkbox
                        defaultChecked />}
                        label="Label" />
                    <FormControlLabel disabled
                        control={<Checkbox />}
                        label="Disabled" />
                </FormGroup>
            </div>
        </div>
    );
}
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Example 2: In this example, let's create a simple application that uses FormGroup component to represent a group of Switch components. Change your App.js like the one below.
import * as React from 'react';
import FormGroup from '@mui/material/FormGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import Switch from '@mui/material/Switch';
export default function BasicButtonGroup() {
    return (
        <div>
            <div
                className="head"
                style={{
                    width: "fit-content",
                    margin: "auto",
                }}
            >
                <h1
                    style={{
                        color: "green",
                    }}
                >
                    GeeksforGeeks
                </h1>
                <strong>React MUI FormGroup API</strong>
                <br />
                <br />
            </div>
            <div
                style={{
                    width: "fit-content",
                    margin: "auto",
                }}
            >
                <FormGroup>
                    <FormControlLabel 
                        control={<Switch defaultChecked />}
                        label="Label" />
                    <FormControlLabel disabled control={<Switch />}
                        label="Disabled" />
                </FormGroup>
            </div>
        </div>
    );
}
Output:
Reference: https://mui.com/material-ui/api/form-group/
