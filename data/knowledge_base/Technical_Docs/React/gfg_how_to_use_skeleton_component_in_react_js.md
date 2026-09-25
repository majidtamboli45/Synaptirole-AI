# How to use Skeleton Component in React JS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-skeleton-component-in-reactjs/

When data is not yet loaded, a Skeleton Component serves as a placeholder preview for the user. Material UI for React provides an easily integratable version of this component, and in React JS, the following approach can be employed to utilize the Skeleton Component.
Prerequisites:
Steps to Create React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui module using the following command:
npm install @mui/material
Project Structure:
Example 1: In this example, we will create a Skeleton component for a text, rectangular and circular variants. Please update App.js like below.
import { Skeleton } from "@mui/material";
import React from "react";
export default function App() {
    return (
        <div style={{ 
            display: "block", 
            padding: 30 
        }}>
            <h4>
                How to use Skeleton Component in ReactJS?
            </h4>
            TEXT VARIANT: <Skeleton variant="text" width={200} />
            <br />
            RECTANGULAR VARIANT: <Skeleton
                variant="rect"
                width={110}
                height={220}
            />{" "}
            <br />
            CIRCLE VARIANT:
            <Skeleton variant="circle"
                width={50} height={50} />{" "}
            <br />
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000
Example 2: In this example, we will create Skeleton components having different animations. Please update App.js like the below.
import { Skeleton } from "@mui/material";
import React from "react";
export default function App() {
    return (
        <div style={{ display: "block", padding: 30 }}>
            <h4>
                How to use Skeleton 
                Component in ReactJS?
            </h4>
            Default animantion: <Skeleton />
            Wave animantion: <Skeleton animation="wave" />
            No animantion: <Skeleton animation={false} />
        </div>
    );
}
Steps to Run the application:
npm start
Output:
