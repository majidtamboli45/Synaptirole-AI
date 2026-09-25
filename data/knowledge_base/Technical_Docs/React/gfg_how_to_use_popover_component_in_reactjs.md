# How to use Popover Component in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-popover-component-in-reactjs/

A Popover is a graphical control which is a container-type element that hovers over the parent window, and it makes sure that all other interaction is blocked until it is selected. Material UI for React has this component available for us, and it is very easy to integrate.
Prerequisites
- A basic understanding of React
- Node.js installed on your machine
- Familiarity with package management using npm or yarn
Steps to create the application:
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui modules using the following command.
npm install @material-ui/core
Project Structure:
Example: Now write down the following code in the App.js file.
import React from "react";
import Button from "@material-ui/core/Button";
import Popover from "@material-ui/core/Popover";
export default function App() {
    const [anchorEl, setAnchorEl] = React.useState(null);
    const open = Boolean(anchorEl);
    return (
        <div style={{ display: "block", padding: 30 }}>
            <h4>How to use Popover Component in ReactJS?</h4>
            <Button
                variant="contained"
                color="primary"
                onClick={(event) => {
                    setAnchorEl(event.currentTarget);
                }}
            >
                Click me to open Popover
            </Button>
            <Popover
                anchorEl={anchorEl}
                open={open}
                id={open ? "simple-popover" : undefined}
                onClose={() => {
                    setAnchorEl(null);
                }}
                transformOrigin={{
                    horizontal: "center",
                    vertical: "top",
                }}
                anchorOrigin={{
                    horizontal: "center",
                    vertical: "bottom",
                }}
            >
                How are you?
            </Popover>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
Conclusion:
Using the Popover component from Material-UI helps in creation of interactive elements in ReactJS, enhancing user interactions by presenting contextual information or actions in a visually appealing manner.
