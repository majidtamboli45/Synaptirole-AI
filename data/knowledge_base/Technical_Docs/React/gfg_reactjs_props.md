# ReactJS Props

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-props/

The react props refer to properties in react that are passed down from parent component to child to render the dynamic content.
Till now we have worked with components using static data only. In this article, we will learn about react props and how we can pass information to a Component.
What are Props?
Props in React are the objects used to pass data/information to a Component. It is short for Properties. It is responsible for passing the data to components and render the dynamic content.
Passing and Accessing props
We can pass props to any component as we declare attributes for any HTML tag.
Syntax
// Passing Props
<DemoComponent sampleProp = "HelloProp" />
In the above code snippet, we are passing a prop named sampleProp to the component named DemoComponent. This prop has the value "HelloProp". Let us now see how can we access these props.
We can access any props inside from the component's class to which the props are passed.
Syntax
// Accessing props in class components
this.props.propName;
// Accessing props in functional components
props.propName;
The 'this.props' is a kind of global object which stores all of a component's props. The propName, that is the names of props are keys of this object.
Let us see an example where we will implement passing and accessing props.
In the below example, we will use a class-based component to illustrate the props. But we can also pass props to function-based components and going to pass in the below example.
To access a prop from a function we do not need to use the 'this' keyword anymore. Functional components accept props as parameters and can be accessed directly.
Example 1: This example demonstrates how to pass and access props in a React class component
// index.js
import React from "react";
import ReactDOM from "react-dom/client";
// sample component to illustrate props
class DemoComponent extends React.Component {
	render() {
		return (
			<div>
				{/*accessing information from props */}
				<h2>Hello {this.props.user}</h2>
				<h3>Welcome to GeeksforGeeks</h3>
			</div>
		);
	}
}
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
	<React.StrictMode>
		<DemoComponent />
	</React.StrictMode>
);
Output: This will be the output of the above program
Example 2: This example demonstrates how to pass and access props in a React functional component.
// index.js
import React from "react";
import ReactDOM from "react-dom/client";
// functional component to illustrate props
function DemoComponent(props) {
	return (
		<div>
			{/*accessing information from props */}
			<h2>Hello {props.user}</h2>
			<h3>Welcome to GeeksforGeeks</h3>
		</div>
	);
}
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
	<React.StrictMode>
		<DemoComponent user="Geeks" />
	</React.StrictMode>
);
Output:
Passing information from one component to another
Props are used to pass information from one component to another. We can pass as many props as we want to a component.
This is one of the coolest features of React. We can make components to interact among themselves. We will consider two components Parent and Children to explain this. We will pass some information as props from our Parent component to the Child component.
Look at the below code:
Example 3: This example demonstrates how a parent component can pass multiple props (name and userId) to a child component in a React class-based setup.
// index.js
import React from "react";
import ReactDOM from "react-dom/client";
// Parent Component
class Parent extends React.Component {
	render() {
		return (
			<div>
				<h2>You are inside Parent Component</h2>
				<Child name="User" userId="5555" />
			</div>
		);
	}
}
// Child Component
class Child extends React.Component {
	render() {
		return (
			<div>
				<h2>Hello, {this.props.name}</h2>
				<h3>You are inside Child Component</h3>
				<h3>Your user id is: {this.props.userId}</h3>
			</div>
		);
	}
}
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
	<React.StrictMode>
		<Parent />
	</React.StrictMode>
);
Output: See the output of this program
What is this.props in React?
this.props refers to the props passed to current class object. It is used to access the props inside react class components.
We will console.log "this.props" in the above program inside the child component and will try to observe what is logged into the console. Below is the modified program with console.log() statement:
Example 4: This example illustrates how a parent component passes props to a child component using this.props in a React class-based setup and display on console log.
// index.js
import React from "react";
import ReactDOM from "react-dom/client";
// Parent Component
class Parent extends React.Component {
	render() {
		return (
			<div>
				<h2>You are inside Parent Component</h2>
				<Child name="User" userId="5555" />
			</div>
		);
	}
}
// Child Component
class Child extends React.Component {
	render() {
		console.log(this.props);
		return (
			<div>
				<h2>Hello, {this.props.name}</h2>
				<h3>You are inside Child Component</h3>
				<h3>Your user id is: {this.props.userId}</h3>
			</div>
		);
	}
}
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
	<React.StrictMode>
		<Parent />
	</React.StrictMode>
);
Output:
You can clearly see in the above image that in the console it is shown that the this.props is an object and it contains all of the props passed to the child component. The props name of the child component are keys of this object and their values are values of these keys. So, it is clear now that whatever information is carried to a component using props is stored inside an object.
Note: Props are read-only. We are not allowed to modify the content of a prop. Whatever the type of Component is - functional or class-based, none of them is allowed to modify their props. We will learn about this in detail in the next article Reactjs | props set-2
