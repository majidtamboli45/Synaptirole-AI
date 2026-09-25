# How to use ScopedCssBaseline Component in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-scopedcssbaseline-component-in-reactjs/

ScopedCssBaseline component helps in applying baseline only to the children. Material UI for React has this component available for us, and it is very easy to integrate. We can use the ScopedCssBaseline Component in ReactJS using the following approach.
Prerequisites:
Approach:
- Include Necessary Components:
  - Start by bringing in the essential elements from the Material-UI library, such as the ScopedCssBaseline component.
- Construct the App Component:
  - Construct a functional component, like 'App,' to function as the core element of your React application.
- Enclose Targeted Content:
  - Envelop the JSX content requiring isolation by enclosing it within the ScopedCssBaseline component. This guarantees that any styles applied remain confined to this specific section, avoiding interference with global styles.
- Apply Styles:
  - Take advantage of the encapsulated area to apply distinct styles without the concern of impacting the broader application. This method proves especially valuable for preserving style uniformity within a designated part of your React application.
Steps to Create React Application And Installing Module:
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
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
Example 1: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import React from "react";
import ScopedCssBaseline 
    from "@material-ui/core/ScopedCssBaseline";
export default function App() {
    return (
        <div style={{ display: "block", padding: 30 }}>
            <h4>How to use ScopedCssBaseline Component in ReactJS?</h4>
            <ScopedCssBaseline>
                <p>Greetings from GeeksforGeeks</p>
                <p>
                    These lines are within
                    ScopedCssBaseline Component
                </p>
                <p>Stay Safe and Healthy</p>
            </ScopedCssBaseline>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Now if we write the same example but without using the ScopedCssBaseline Component, the following will be the result.
Example 2: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import React from "react";
export default function App() {
  return (
    <div style={{ display: "block", padding: 30 }}>
      <h4>How to use ScopedCssBaseline Component in ReactJS?</h4>
      
      <p>Greetings from GeeksforGeeks</p>
      <p>
         These lines are without 
         ScopedCssBaseline Component
      </p>      
      <p>Stay Safe and Healthy</p>
    </div>
  );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
