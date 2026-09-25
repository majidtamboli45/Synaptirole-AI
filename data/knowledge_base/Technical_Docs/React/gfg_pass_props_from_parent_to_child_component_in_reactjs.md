# Pass Props From Parent to Child Component in ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/how-to-pass-property-from-a-parent-component-props-to-a-child-component/

ReactJS is a powerful library that helps developers build interactive user interfaces by breaking them into reusable components. One of the essential features of React is the ability to pass data between components using props. In React, props allow parent components to send data or functions to child components.
- The article explains how to pass props from parent to child components in ReactJS.
- It covers both functional components and class-based components.
- Props allow data sharing between components, making UI reusable and dynamic.
- Understanding props is essential for component communication in React.
Setup Next.js Project
Step 1: To create a new React app, run the following command in your terminal to start a new React app.
npx create-react-app testapp
Step 2: Step 2: Move to the project folder:
cd testapp
Step 3: Create a components folder inside the src directory, and within that folder, create a new component file called Child.js. This will serve as the child component where we will receive the props.
Project Structure
Approach 1: Passing Props Using Class Components
When users pass the data from parent to child using the class components, they can access inside the child component using 'this.props.property_name'.
Steps:
- Embed the child component to the parent component.
- Pass the data variable (props) with an assigned value to the child component as an argument while embedding it to the parent component.
- If a user wants to pass multiple data variables (props), all variable names should be unique.
- In the child component, access the data variable value using 'this.props.variable_name'.
Example: Passing props from parent to child component in react usign class components App.js and child.js
// FileName - App.js
import React, { Component } from "react";
import Child from "./components/child.js";
// Child component embedded to parent component
// with props value
class App extends Component {
    render() {
        return (
            <div>
                <h1>This is a parent component</h1>
                <ul>
                    <li>
                        <Child
                            gfgcolor="green"
                            usercolor="blue"
                        />
                    </li>
                </ul>
            </div>
        );
    }
}
export default App;
// FileName - components/child.js
import React, { Component } from "react";
// Accessing the props value using this.props
class Child extends Component {
    render() {
        return (
            <div>
                <h1>This is a child component</h1>
                <h1 style={{ color: this.props.gfgcolor }}>
                    GeeksForGeeks
                </h1>
                <h1 style={{ color: this.props.usercolor }}>
                    hello user
                </h1>
            </div>
        );
    }
}
export default Child;
 
Step to run the application: Open the terminal and type the following command.
npm start
Output: This output will be visible on http://localhost:3000/ in the Web browser.
Approach 2: Passing Props Using Functional Components
To access properties from parent to child using a functional component, users don't need to use 'this.props' like class components. Users can access props value by writing variable names only.
Steps:
- Embed the child component to the parent component.
- Pass the props to the child component as an argument while embedding it to the parent component.
- In the child component, access the data variable value by writing the name or variable only.
Example:
// FileName - App.js
import React, { Component } from "react";
import Child from "./components/child.js";
// Parent component
// Embedding child component inside it
function App() {
    return (
        <div>
            <h1>This is a parent component</h1>
            <ul>
                <li>
                    <Child
                        gfgcolor="green"
                        usercolor="blue"
                    />
                </li>
            </ul>
        </div>
    );
}
export default App;
// FileName - components/child.js
import React, { Component } from "react";
// Passing props as a parameter
// inside the child component
export default function Child({ gfgcolor, usercolor }) {
    return (
        <div>
            <h1>This is a child component</h1>
            <h1 style={{ color: gfgcolor }}>
                GeeksForGeeks
            </h1>
            <h1 style={{ color: usercolor }}>
                Welcome to Ggf!
            </h1>
        </div>
    );
}
Step to run the application:
Step 1: Open the terminal and type the following command.
npm start
Output: This output will be visible on http://localhost:3000/ in the Web browser.
