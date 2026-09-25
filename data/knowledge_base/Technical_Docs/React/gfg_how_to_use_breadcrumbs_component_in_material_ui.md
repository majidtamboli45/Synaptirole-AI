# How to use Breadcrumbs Component in Material UI ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-breadcrumbs-component-in-material-ui/

Breadcrumbs are list of links that display the page location within a website or application. They allow users to make selections from a range of values. Material UI for React has this component available for us, and it is very easy to integrate. In this article we will see how we can integrate and implement it.
Prerequisites
- Knowledge of React
- Material UI basics
- Node.js and npm/yarn Installed
Steps to create React Application And Installing Module:
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui modules using the following command.
npm install @mui/material
Project Structure:
Example 1: In this example, we will create a simple breadcrumb application of different links. Please update App.js like below.
//App.js
import { Breadcrumbs, Link, Typography } from "@mui/material";
import React from "react";
const App = () => {
    return (
        <div
            style={{
                margin: "auto",
                display: "table",
            }}
        >
            <h4>How to use Breadcrumbs in ReactJS?</h4>
            <Breadcrumbs aria-label="breadcrumb">
                <Link
                    color="inherit"
                    href="/"
                    onClick={(event) => {
                        event.preventDefault();
                        alert("Home Page Clicked");
                    }}
                >
                    Home Page
                </Link>
                <Link
                    color="inherit"
                    href="/getting-started/installation/"
                    onClick={(event) => {
                        event.preventDefault();
                        alert("Dashboard Clicked");
                    }}
                >
                    Dashboard
                </Link>
                <Typography color="textPrimary">
                    Breadcrumb
                </Typography>
            </Breadcrumbs>
        </div>
    );
};
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
Example 2: In this example, we will create a collapsed breadcrumb application of different links with the help of maxItems props of the Breadcrumbs component. Please update App.js like the below.
//App.js
import { Breadcrumbs, Link, Typography } from "@mui/material";
import React from "react";
const App = () => {
    return (
        <div
            style={{
                margin: "auto",
                display: "table",
            }}
        >
            <h4>How to use Breadcrumbs in ReactJS?</h4>
            <Breadcrumbs aria-label="breadcrumb" maxItems={2}>
                <Link
                    color="inherit"
                >
                    Home Page
                </Link>
                <Link
                    color="inherit"
                >
                    Dashboard
                </Link>
                <Link
                    color="inherit"
                >
                    About
                </Link>
                <Link
                    color="inherit"
                >
                    Careers
                </Link>
                <Link
                    color="inherit"
                >
                    Contact
                </Link>
                <Typography color="textPrimary">
                    Breadcrumb
                </Typography>
            </Breadcrumbs>
        </div>
    );
};
export default App;
Steps to run the application:
npm start
Output:
