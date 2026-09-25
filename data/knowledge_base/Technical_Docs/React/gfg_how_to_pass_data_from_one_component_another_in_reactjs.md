# How to Pass Data from One Component to Another Component in ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-pass-data-from-one-component-to-other-component-in-reactjs/

In ReactJS, components are the building blocks of your user interface. Components allow you to create modular, reusable UI elements, but sometimes these components need to communicate with each other.
In this article, we will explore the different methods to pass data between components in ReactJS.
1. Passing data from Parent to Child in React
The most common way to pass data between components is through props (short for properties). Props are read-only and allow you to pass information from a parent component to its child components. When you define a child component, you can pass it data by setting its props.
First, you need to create a React App - Create a New React App
Folder Structure
/* Filename - App.css*/
.App {
    text-align: center;
}
.geeks {
    color: green;
}
// Filename - App.js
import React from "react";
import "./index.css";
import Parent from "./Parent";
import "./App.css";
const App = () => {
    return (
        <div className="App">
            <h1 className="geeks">Geeksforgeeks</h1>
            <h3>This is App.js Component</h3>
            <Parent />
        </div>
    );
};
export default App;
// Filename - Parent.js
import React from "react";
import Child from "./Child";
const Parent = () => {
    const data = "Data from Parent to Child";
    return (
        <div>
            <h4>This is Parent component</h4>
            <Child data={data} />
        </div>
    );
};
export default Parent;
// Filename - Child.js
import React from "react";
const Child = (props) => {
    return <h3> {props.data} </h3>;
};
export default Child;
Step to Run Application: Run the application using the following command from the root directory of the project
npm start
Output
In this code
- The App component renders the Parent component.
- The Parent component passes a string ("Data from Parent to Child") as a prop (data) to the Child component.
- The Child component displays this data passed down from the Parent.
2. Passing data from Child to Parent Component
In React, data usually flows from parent to child through props. But what if you need to pass data from a child component back to the parent? To achieve this, you can pass a callback function from the parent to the child. When the child component needs to send data to the parent, it calls this function with the data.
/* Filename - App.css */
.App {
    text-align: center;
}
.container {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
}
.item {
    min-width: 33rem;
    text-align: left;
}
.geeks {
    color: green;
}
// Filename - App.js
import React from "react";
import "./index.css";
import Parent from "./Parent";
import "./App.css";
const App = () => {
    return (
        <div className="App">
            <h1 className="geeks">GeeksforGeeks</h1>
            <Parent />
        </div>
    );
};
export default App;
// Filename - Parent.js
import React from "react";
import Child from "./Child";
class Parent extends React.Component {
    state = {
        msg: "",
    };
    handleCallback = (childData) => {
        this.setState({ msg: childData });
    };
    render() {
        const { msg } = this.state;
        return (
            <div>
                <Child
                    parentCallback={this.handleCallback}
                />
                <h1> {msg}</h1>
            </div>
        );
    }
}
export default Parent;
// Filename - Child.js
import React from "react";
class Child extends React.Component {
    onTrigger = () => {
        this.props.parentCallback("Welcome to GFG");
    };
    render() {
        return (
            <div>
                <br></br> <br></br>
                <button onClick={this.onTrigger}>
                    Click me
                </button>
            </div>
        );
    }
}
export default Child;
Output
In this code
- App.js renders the Parent component.
- Parent.js defines a state (msg) and a handleCallback method to update the state when the child sends data.
- Child.js has a button, and when clicked, it calls the parentCallback function (passed from the parent) to send the message "Welcome to GFG" back to the parent.
- The parent updates its state with the data and displays it in an <h1> tag.
3. Passing Data Between Sibling Components
When you need to pass data between sibling components (components that share the same parent), the best way is to use their common parent component as a mediator. The parent component can manage the shared state and pass it down to both child components.
For passing data among siblings, there are multiple methods we can choose from as shown below
- Combination of the above two methods (callback and use of props).
- Using Redux.
- ContextAPI
Folder Structure
/* Filename - App.css */
.App {
    text-align: center;
}
.geeks {
    color: green;
}
// Filename - App.js
import { React, useState, createContext } from "react";
import "./index.css";
import Child1 from "./Child1";
import "./App.css";
import Child2 from "./Child2";
// Create a new context and export
export const NameContext = createContext();
// Create a Context Provider
const NameContextProvider = ({ children }) => {
    const [name, setName] = useState(undefined);
    return (
        <NameContext.Provider value={{ name, setName }}>
            {children}
        </NameContext.Provider>
    );
};
const App = () => {
    return (
        <div className="App">
            <h1 className="geeks">GeeksforGeeks</h1>
            <NameContextProvider>
                <Child1 />
                <Child2 />
            </NameContextProvider>
        </div>
    );
};
export default App;
// Filename - Child1.js
import React, { useContext } from "react";
import { NameContext } from "./App";
const Child1 = () => {
    const { setName } = useContext(NameContext);
    function handle() {
        setName("Geeks");
    }
    return (
        <div>
            <h3>This is Child1 Component</h3>
            <button onClick={() => handle()}>Click </button>
        </div>
    );
};
export default Child1;
// Filename - Child2.js
import React, { useContext } from "react";
import { NameContext } from "./App";
const Child2 = () => {
    const { name } = useContext(NameContext);
    return (
        <div>
            <br />
            <h4>This is Child2 Component</h4>
            <h4>hello: {name}</h4>
        </div>
    );
};
export default Child2;
Output
In this code
- App.js provides a shared name state via NameContext.
- Child1.js updates the name state to "Geeks" when a button is clicked.
- Child2.js reads and displays the name state.
Conclusion
By following these methods you can easily pass data from parent to child, child to parent and also able to pass data between the siblings.
