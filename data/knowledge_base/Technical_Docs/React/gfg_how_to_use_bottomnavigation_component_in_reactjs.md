# How to use BottomNavigation Component in ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-bottomnavigation-component-in-reactjs/

The Bottom navigation bars allow movement between primary destinations in an app. Material UI for React has this component available for us and it is very easy to integrate. We can use BottomNavigation Component in ReactJS using the following approach.
In this article we will learn to use BottomNavigation Component in ReactJS.
Prerequisites
Steps to create React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui modules using the following command:
npm install @mui/material
npm install @mui/icons-material
Project Structure:
Example 1: In this example, we will add a BottomNavigation component that shows 2 actions and display the position of the action selected. Update the App.js file as shown below
// App.js
import React from "react";
import BottomNavigation from "@material-ui/core/BottomNavigation";
import LocationOnIcon from "@material-ui/icons/LocationOn";
import RestoreIcon from "@material-ui/icons/Restore";
import BottomNavigationAction from "@material-ui/core/BottomNavigationAction";
const App = () => {
    const [value, setValue] = React.useState(0);
    return (
        <div
            style={{
                margin: "auto",
                display: "table",
            }}
        >
            <h4>How to use BottomNavigation in ReactJS?</h4>
            <BottomNavigation
                showLabels
                value={value}
                onChange={(e, newValue) => {
                    setValue(newValue);
                }}
            >
                <BottomNavigationAction
                    label="Recents"
                    icon={<RestoreIcon />}
                />
                <BottomNavigationAction
                    label="Nearby"
                    icon={<LocationOnIcon />}
                />
            </BottomNavigation>
            <h4>
                You have selected {value}
                <sup>th</sup> position button
            </h4>
        </div>
    );
};
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
Example 2: In this example, we will add a BottomNavigation component that shows 2 actions, and only shows label of the action that is selected. Update the App.js file as shown below:
// App.js
import { BottomNavigation, BottomNavigationAction } from "@mui/material";
import RestoreIcon from "@mui/icons-material/Restore";
import LocationOnIcon from "@mui/icons-material/LocationOn";
import React from "react";
const App = () => {
    const [value, setValue] = React.useState(0);
    return (
        <div
            style={{
                margin: "auto",
                display: "table",
            }}
        >
            <h1 style={{ color: "green" }}>GeeksforGeeks</h1>
            <h4>How to use BottomNavigation in ReactJS?</h4>
            <BottomNavigation
                value={value}
                onChange={(e, newValue) => {
                    setValue(newValue);
                }}
            >
                <BottomNavigationAction
                    label="Recents"
                    icon={<RestoreIcon />}
                />
                <BottomNavigationAction
                    label="Nearby"
                    icon={<LocationOnIcon />}
                />
            </BottomNavigation>
        </div>
    );
};
export default App;
Steps to run the application:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
Reference: https://mui.com/material-ui/react-bottom-navigation/#main-content
