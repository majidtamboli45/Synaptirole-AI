# Uncontrolled Vs Controlled Inputs in React

> Source: https://www.geeksforgeeks.org/reactjs/react-js-uncontrolled-vs-controlled-inputs/

Controlled inputs are tied with the state in react and their values are stored controlled by the components using state variables, while the uncontrolled inputs manage their own state and work internally with the DOM.
In HTML, form elements such as <input>, <textarea>, <select>, etc typically maintain their own state and update it based on user input. In React, a mutable (changeable) state is usually kept in the state property of components.
Uncontrolled Input
In uncontrolled inputs the input value is not managed by the component's state. It maintains its own internal state with the help of DOM. It remembers what you typed in the field. That value can be exploited by pulling it using the ref keyword whenever it needs to be used. In uncontrolled inputs, the value you submit is the value you get.
Example: This example demonstrates uncontrolled input and accessing the values using ref.
// src/NameForm.js
import React, { Component } from "react";
class NameForm extends React.Component {
	handleClick = () => {
		const name = this._name.value;
		alert("Hello ", name);
	};
	render() {
		return (
			<div>
				<input
					type="text"
					ref={(inputValue) => (this._name = inputValue)}
					placeholder="Enter your name"
				/>
				<button onClick={this.handleClick}>Done</button>
			</div>
		);
	}
}
export default NameForm;
import React,{Component} from 'react'; 
class NameForm extends  React.Component {
    handleClick = () => {
      const name = this._name.value;
      alert('Hello ', name);
    }
  
    render() {
      return (
        <div>
          <input type="text" ref=
                {inputValue => this._name = inputValue}
            
            placeholder="Enter your name" />
            <button onClick={this.handleClick}>
                Done
            </button>
        </div>
     );
    }
  }
export default NameForm; 
// src/index.js
import React from "react";
import ReactDOM from "react-dom";
import NameForm from "./NameForm";
ReactDOM.render(
	<React.StrictMode>
		<NameForm />
	</React.StrictMode>,
	document.getElementById("root")
);
Input: Tanisha 
Output: Hello Tanisha (Display on the alert box) 
 
Controlled input
In controlled inputs the value is fully controlled by the component state. Any update or change in the input value is done by the event handler like onChange and onInput that first update the value in state and then it is reflected in the input. The component state is the single source of truth in case of controlled components.
Example: This example demonstrates the controlled input managed by the component state.
// src/NameForm.js
import React, { Component } from "react";
class NameForm extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			name: ""
		};
	}
	handleNameChange = (event) => {
		this.setState({ name: event.target.value });
	};
	render() {
		return (
			<div>
				<input
					type="text"
					onChange={this.handleNameChange}
					placeholder="Enter your name"
				/>
				<h1>{this.state.name}</h1>
			</div>
		);
	}
}
export default NameForm;
Input: Tanisha 
Output: Tanisha (Displaying on the screen letter by letter as the user types) 
 
Difference between Controlled and Uncontrolled Input
| Aspect | Controlled Inputs | Uncontrolled Inputs | 
|---|---|---|
| State Management | Input value is controlled by React state. | DOM manages the input's state internally. | 
| Data Access | Data is accessed via the component’s state. | Data is accessed via refs ( ref ). | 
| Event Handling | Requires an onChange handler to update state. | No need for explicit event handling for state. | 
| Initial Value | Set via React state. | Set via defaultValue attribute. | 
| Use Case | Better for dynamic or complex form management. | Simpler forms where occasional state access is needed. | 
| Performance | May incur more re-renders with frequent updates. | Minimal re-renders as React isn't managing the state. | 
Which one is better?
It's evident that controlled and uncontrolled form fields each have their individual benefits. You might need to use both or either depending on what the situation calls for. If you are making a simple form with little to no UI feedback and no need for instant validation (which means you only would validate and/or need the values when you submit), using uncontrolled inputs with refs is what you should go for. It would keep the source of truth in the DOM making it quicker and requiring lesser code. If you need more UI feedback and take into account every little change in the particular input field go for controlled input.
