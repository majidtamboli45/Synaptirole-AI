# ReactJS Components Complete Reference

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-components-complete-reference/

In ReactJS, components are the building blocks of the UI that help divide applications into smaller, reusable parts for better structure and maintainability.
- Can be created as functions or classes and return UI using JSX.
- Enable code reusability and modular application structure.
- Manage state and handle user interactions for dynamic content.
Types of React Components
There are two main types of components in React:
1. Functional Components
A Functional Component is a simpler and more concise way of writing components in React using JavaScript functions. These components receive props (properties) as an argument and return JSX (JavaScript XML) to define the UI structure.
import React, {useState} from "react";
const Welcome = () => {
    const [message, setMessage] = useState("Hello, World!");
    return (
        <div>
            <h1>{message}</h1>
            <button onClick={() => setMessage("Hello, React!")}>
                Change Message
            </button>
        </div>
    );
};
export default Welcome;
Output:
- useState is used to manage the message state, initially set to "Hello, World!".
- The button click triggers setMessage, which updates the message state to "Hello, React!".
- The component displays the message in an <h1> element and updates it when the button is clicked.
2. Class Components
Class components in React are ES6 classes that extend React.Component, used to manage state and lifecycle methods. Although largely replaced by functional components with hooks, they provide a traditional approach to handling component logic.
import React, { Component } from 'react';
class Counter extends Component {
    constructor(props) {
        super(props);
        this.state = {
            count: 0
        };
    }
    increment = () => {
        this.setState({ count: this.state.count + 1 });
    };
    decrement = () => {
        this.setState({ count: this.state.count - 1 });
    };
    render() {
        return (
            <div>
                <h1>Counter: {this.state.count}</h1>
                <button onClick={this.increment}>Increment</button>
                <button onClick={this.decrement}>Decrement</button>
            </div>
        );
    }
}
export default Counter;
Output:
- state: The counter (count) is initialized to 0 in the constructor.
- increment and decrement: These methods update the count state by 1 when the respective buttons are clicked.
- render: Displays the current count and two buttons to increment or decrement the counter.
Difference between Class component and Functional component
| Functional Components | Class Components | 
|---|---|
| A function that returns JSX. | A class that extends React.Component and has a render() method. | 
| Can use state via hooks like useState. | Can manage state using this.state and this.setState(). | 
| No lifecycle methods (use useEffect hook). | Uses lifecycle methods like componentDidMount, componentDidUpdate, componentWillUnmount. | 
| Simpler syntax, function-based. | More verbose, class-based syntax. | 
| More lightweight and performant. | Slightly heavier due to the class structure and additional methods. | 
| Can use hooks like useState, useEffect, etc. | Cannot use hooks directly. | 
| Directly returns JSX. | Must define a render() method to return JSX. | 
| Easier to integrate with React hooks like useContext. | Uses Context.Consumer for context integration. |
