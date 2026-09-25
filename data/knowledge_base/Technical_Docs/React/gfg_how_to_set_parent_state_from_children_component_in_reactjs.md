# How to set Parent State from Children Component in ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-set-parent-state-from-children-component-in-reactjs/

To set the parent state from a child component, we use React’s unidirectional data flow. Instead of directly passing data, we pass a function that enables the child to send data back to set the parent state.
Prerequisites:
Approach
To set parent state from child component in React, we will define a callback function in the parent component to update its state. Pass the callback function to the child as a prop. The child calls the callback function via props, sending data to the parent and sets the parent state.
Steps to Create React Application
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure:
Example: This example demonstrates setting parent state from child component by passing a callback function as a prop to the child component.
// Filename - App.js
import React, { useState } from "react";
import Child from "./child";
const App = () => {
	const [title, setTitle] = useState("");
	return (
		<React.Fragment>
			<h1>{title}</h1>
			<Child setParentState={setTitle} />
		</React.Fragment>
	);
};
export default App;
// Filename - child.js
import React from "react";
const Child = ({ setParentState }) => {
	const handleClick = () => {
		setParentState("Geeks For Geeks");
	};
	return <button onClick={handleClick}>Reveal Title</button>;
};
export default Child;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
