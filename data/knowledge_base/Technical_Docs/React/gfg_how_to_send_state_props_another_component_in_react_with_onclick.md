# How to Send state/props to Another Component in React with onClick?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-send-state-props-to-another-component-in-react-with-onclick/

The props and state are the main concepts of React. Actually, only changes in props and/ or state trigger React to re-render your components and potentially update the DOM in the browser
- Props are used to pass data from a parent to a child component.
- State is used to manage dynamic data within a component and trigger UI re-renders when updated.
Approach: Sending Data with onClick
To send data between components in React, we will be either updating the state in one component and passing it down as props to another component, or directly passing props from a parent to a child component.
- Define state in the parent component.
- Pass the state as props to the child component.
- Create a changeState function that updates the state on onClick.
- Updating the state in the parent automatically updates the props received in the child
Sending data in Class-based component
To send props from a class-based parent component to a child component using an onClick event, follow these steps:
- Define state as empty string
- Import and use the child component and pass this.state in the data prop for that component.
- Define a method changeState to update the data with the help of this.setState
- Use a button and for onClick event call the chagneState function.
// Filename - App.js
import React, { Component } from 'react';
import './App.css';
import Component2 from './Component2';
class App extends Component {
	constructor(props) {
		super(props);
		this.state = {
			data: ""
		};
	}
	changeState = () => {
		this.setState({
			data: `state/props of parent component 
      is send by onClick event to another component`
		});
	};
	render() {
		return (
			<div className="App">
				<Component2 data={this.state.data} />
				<div className="main-cointainer">
					<h2>Component1</h2>
					<button onClick={this.changeState} type="button">
						Send state
					</button>
				</div>
			</div>
		);
	}
}
export default App;
// Filename - Component2.js
import React, { Component } from "react";
import "./Component2.css";
class Component2 extends Component {
    render() {
        return (
            <div className="main-cointainer">
                <h2>Component2</h2>
                <p>{this.props.data}</p>
            </div>
        );
    }
}
export default Component2;
Output
Sending data in Functional Component
To send data from a functional parent component to a child component using an onClick event, follow these steps:
- Define a object having data property with value as empty string with the help of useState hook
- Import and use the child component and pass the data as prop.
- define changeState function that updates the value of data.
- Call the changeState function when the onClick event triggers.
// Filename - App.js
import React, { useState } from 'react';
import './App.css';
import Component2 from './Component2';
function App() {
    const [state, setState] = useState({ data: "" });
    const changeState = () => {
        setState({
            data: `state/props of parent component 
      is sent by onClick event to another component`
        });
    };
    return (
        <div className="App">
            <Component2 data={state.data} />
            <div className="main-cointainer">
                <h2>Component1</h2>
                <button onClick={changeState} type="button">
                    Send state
                </button>
            </div>
        </div>
    );
}
export default App;
// Filename - Component2.js
import React from "react";
import "./Component2.css";
export default function Component2(props) {
    return (
        <div className="main-cointainer">
            <h2>Component2</h2>
            <p>{props.data}</p>
        </div>
    );
}
Output
Conclusion
Passing state or props from one component to another in React is very simple, especially with the help of event handlers like onClick. Whether you're using class-based components or functional components with hooks, the idea remains the same: state lives in the parent, and data is passed to children via props. Updating state on an event automatically reflects the changes throughout your component tree.
