# React.js static getDerivedStateFromProps()

> Source: https://www.geeksforgeeks.org/reactjs/react-js-static-getderivedstatefromprops/

The getDerivedStateFromProps method is a static lifecycle method used when the state of a component depends on changes of props. It is a static method that is called just before render() method in both mounting and updating phase in React.
Syntax:
getDerivedStateFromProps(props, state) Parameters:
- props: The updated props passed from the parent component
- state: The current state of the component
Return:
Returns an object to update the component state or null.
getderivedFromProps is a replacement of the componentWillRecieveProps method. It was introduced in React 16.3. It doesnot have access to this as it is an static method and hence cant directly manipulate the state.
We have to return an object to update state or null to indicate that nothing has changed.
Creating React Application
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure:
Example: This example demonstrates how getDerivedStateFromProps updates the component's internal state based on changes to the name prop, syncing the state with the new prop value if they differ.
// Filename - App.js
import React from "react";
import ReactDOM from "react-dom";
class App extends React.Component {
	render() {
		return (
			<div>
				<Child name="sachin"></Child>
			</div>
		);
	}
}
class Child extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			name: "kapil"
		};
	}
	static getDerivedStateFromProps(props, state) {
		if (props.name !== state.name) {
			//Change in props
			return {
				name: props.name
			};
		}
		return null; // No change to state
	}
	/* if props changes then after getDerivedStateFromProps
       method, state will look something like 
    {
        name: props.name
    }
    */
	render() {
		return <div> My name is {this.state.name}</div>;
	}
}
export default App;
If props changes, then the state will also change accordingly else, getDerivedStateFromProps will return null that indicates no change in state. In the above example props have a property called name but the state has that property with a different value. so the state will change according to the value of props property.
Output:
Reference:https://legacy.reactjs.org/docs/react-component.html#static-getderivedstatefromprops
