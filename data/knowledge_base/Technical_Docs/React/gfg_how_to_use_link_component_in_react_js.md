# How to use Link Component in React JS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-link-component-in-reactjs/

Material-UI provides a set of components that can be seamlessly integrated with React to create visually appealing and functional navigation elements. The Link component allows you to easily customize anchor elements with our own theme colors and typography styles. Material UI for React has this component available for us and it is very easy to integrate. We can use Link Component in ReactJS using the following approach:
Prerequisites:
- Understanding of React JS and JSX.
- Basics of Material UI
Steps to create React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui modules using the following command:
npm install @material-ui/core
Project Structure:
Example: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import React from "react";
import Link from "@material-ui/core/Link";
const App = () => {
    const preventDefault = (event) => event.preventDefault();
    return (
        <div
            style={{
                margin: "auto",
                display: "table",
            }}
        >
            <h4>How to use Link Component in ReactJS?</h4>
            <Link
                href="https://www.geeksforgeeks.org/"
                onClick={() => {
                    alert("Redirecting to GeeksforGeeks");
                }}
            >
                Click GeeksforGeeks
            </Link>
        </div>
    );
};
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
