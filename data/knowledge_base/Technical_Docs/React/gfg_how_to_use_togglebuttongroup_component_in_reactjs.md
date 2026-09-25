# How to use ToggleButtonGroup Component in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-togglebuttongroup-component-in-reactjs/

Whenever the user wants to group a related option, the ToggleButtonGroup component is used. Material UI for ReactJS has this component available for us, and it is very easy to integrate. We can use the following approach in ReactJS to use ToggleButtonGroup component.
Prerequisites:
Approach:
To use ToggleButtonGroup Component in React JS we will install the material UI packages. Create multiple buttons using button components with toggleButtonGroup to show the toggle animation when clicked.
Steps to create React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui module using the following command:
npm i @mui/material @mui/icons-material
Project Structure:
The updated dependencies in package.json file will look like.
"dependencies": {
"@mui/icons-material": "^5.14.16",
"@mui/material": "^5.14.17",
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
Example 1: This example uses ToogleButtonGroup Component from MUI to implement toggle animation for mutliple buttons.
// Filename - App.js
import {
    FormatAlignCenter,
    FormatAlignJustify,
    FormatAlignLeft,
} from "@mui/icons-material";
import {
    ToggleButton,
    ToggleButtonGroup,
} from "@mui/material";
import React from "react";
export default function App() {
    const [currentAlignment, setCurrentAlignment] =
        React.useState("center");
    return (
        <div style={{ display: "block", padding: 30 }}>
            <h1 style={{ color: "green" }}>
                GeeksforGeeks
            </h1>
            <h4>
                How to use ToggleGroup Component in ReactJS?
            </h4>
            <ToggleButtonGroup
                value={currentAlignment}
                onChange={(event, newAlignment) => {
                    setCurrentAlignment(newAlignment);
                }}
                exclusive
                aria-label="Demo Text Alignment"
            >
                <ToggleButton
                    value="justify"
                    aria-label="justified"
                    disabled
                >
                    <FormatAlignJustify />
                </ToggleButton>
                <ToggleButton
                    value="left"
                    aria-label="left aligned"
                >
                    <FormatAlignLeft />
                </ToggleButton>
                <ToggleButton
                    value="center"
                    aria-label="centered"
                >
                    <FormatAlignCenter />
                </ToggleButton>
            </ToggleButtonGroup>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Example 2: This example uses ToggleButtonGroup component to implement multi selection input.
// Filename - App.js
import {
    ArrowDropDown,
    FormatBold,
    FormatColorFill,
    FormatItalic,
    FormatUnderlined,
} from "@mui/icons-material";
import {
    ToggleButton,
    ToggleButtonGroup,
} from "@mui/material";
import React from "react";
export default function App() {
    const [formats, setFormats] = React.useState(() => [
        "bold",
        "italic",
    ]);
    const handleFormat = (event, newFormats) => {
        setFormats(newFormats);
    };
    return (
        <div style={{ display: "block", padding: 30 }}>
            <h1 style={{ color: "green" }}>
                GeeksforGeeks
            </h1>
            <h4>
                How to use ToggleGroup Component in ReactJS?
            </h4>
            <ToggleButtonGroup
                value={formats}
                onChange={handleFormat}
                aria-label="text formatting"
            >
                <ToggleButton
                    value="bold"
                    aria-label="bold"
                >
                    <FormatBold />
                </ToggleButton>
                <ToggleButton
                    value="italic"
                    aria-label="italic"
                >
                    <FormatItalic />
                </ToggleButton>
                <ToggleButton
                    value="underlined"
                    aria-label="underlined"
                >
                    <FormatUnderlined />
                </ToggleButton>
                <ToggleButton
                    value="color"
                    aria-label="color"
                    disabled
                >
                    <FormatColorFill />
                    <ArrowDropDown />
                </ToggleButton>
            </ToggleButtonGroup>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
