# How to use Paper Component in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-paper-component-in-reactjs/

In Material Design, the physical properties of paper are translated to the screen. Material UI for React has this component available for us and it is very easy to integrate. We can use the Paper Component in ReactJS using the following approach.
Prerequisites:
Approach
To use Paper Component in React JS we will install the material UI package. Import and use the paper component to create card like components.
Creating React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui modules using the following command:
npm i @material-ui/core
Project Structure:
The project structure will look like this.
The updated dependencies after installing the required packages
{
"dependencies": {
"@material-ui/core": "^4.12.4",
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
}
Example: This example implements the Paper component of Material UI to create multiple card like components.
// Filename - App.js
import React from "react";
import Paper from "@material-ui/core/Paper";
import { makeStyles } from "@material-ui/core/styles";
export default function App() {
  const useStyles = makeStyles((theme) => ({
    mainClass: {
      flexWrap: "wrap",
      display: "flex",
      "& > *": {
        height: theme.spacing(15),
        margin: theme.spacing(5),
        width: theme.spacing(15),
      },
    },
  }));
  const classes = useStyles();
  return (
    <div className={classes.mainClass}>
      <h4>How to use Paper Component in ReactJS?</h4>
      <Paper />
      <Paper elevation={1} />
      <Paper elevation={2} />
      <Paper elevation={3} />
      <Paper elevation={4} />
    </div>
  );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
