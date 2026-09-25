# ReactJS Props Reference

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-props-complete-reference/

In React, props are read-only data passed from one component to another. They are immutable, meaning a child component cannot modify them, only the parent can update the data. React follows a unidirectional data flow, where data moves from parent to child.
- However, props can also include callback functions, allowing child components to communicate with the parent and trigger state or behavior changes.
- Props make components reusable and dynamic by allowing different data to be passed at runtime, enabling components to display content based on the values they receive.
Syntax:
Here, the prop 'fullName' is passed with the value “Ashish Bhardwaj” to the 'App' component.
<App fullName = "Ashish Bhardwaj" />
Now let's see an example to understand how props are passed and displayed.
//index.js
import React from "react";
import ReactDOM from "react-dom";
import App from "./App";
ReactDOM.render(
    <React.StrictMode>
        <App fullName={"Ashish Bhardwaj"} />
    </React.StrictMode>,
    document.getElementById("root")
);
//App.js
import React from "react";
function App(props) {
    return (
        <div style={{
            color: "green",
            textAlign: "center"
        }}>
            <h1 style={{
                color: "red",
            }}>Hello {props.fullName}</h1>
            <h2>App to GeeksforGeeks</h2>
        </div>
    );
}
export default App;
Output:
