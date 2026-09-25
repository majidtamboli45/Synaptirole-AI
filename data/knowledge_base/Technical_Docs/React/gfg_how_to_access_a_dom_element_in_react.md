# How to access a DOM element in React ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-access-a-dom-element-in-react/

React manages the rendering of components and updates the DOM automatically. However, there are situations where you may need to access a specific DOM element directly. We will use the Refs to access a DOM element in React. Refs provide a way to access DOM nodes or React elements created in the render method.
Prerequisites
Approaches for how to access dom elements in React
Table of Content
Steps to create React Application
Step 1: Create a React application using the following command
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command
cd foldername
Project Structure:
Method 1: Using Class Components with React.createRef
The createRef is a function that creates a new instance of the ref for every re-render. It doesnot save its value beteen re-renders. When we assign a ref to an element in the render, then we can access the element using the current attribute of the ref.
Example: We will access the input field in react class component using creatRef funtion.
// Filename - App.js
import React from "react";
class App extends React.Component {
    constructor(props) {
        super(props);
        // Create instance
        this.myRef = React.createRef();
    }
    handleClick = () => {
        this.myRef.current.value = "you clicked on button";
    };
    render() {
        return (
            <div
                style={{
                    textAlign: "center",
                    margin: "auto",
                }}
            >
                <h1 style={{ color: "green" }}>
                    GeeksforGeeks
                </h1>
                <h3>Accessing DOM using Class component</h3>
                {/* Assign DOM element to ref*/}
                <input ref={this.myRef} />
                <button onClick={this.handleClick}>
                    click me
                </button>
            </div>
        );
    }
}
export default App;
Step to run the application:
Open the terminal and type the following command.
npm start
Output: Open the browser and our project is shown in the URL http://localhost:3000/
Method 2: Using Functional Components with useRef Hook
React useRef is a hook that allows to directly create a reference to the DOM element in the functional component. Once a ref is created we can directly access and modify the content of that DOM element.
Example: We will access the input field in react functional component using useRef hook.
// Filename - App.js
import React, { useRef } from "react";
export default function App() {
    const myRef = useRef();
    const handleClick = () => {
        myRef.current.value = "you clicked on button";
    };
    return (
        <div
            style={{ textAlign: "center", margin: "auto" }}
        >
            <h1 style={{ color: "green" }}>
                GeeksforGeeks
            </h1>
            <h3>Accessing DOM using funtional component</h3>
            <input ref={myRef} />
            <button onClick={handleClick}>Click me</button>
        </div>
    );
}
Step to run the application:
Open the terminal and type the following command.
npm start
Output: Open the browser and our project is shown in the URL http://localhost:3000/
