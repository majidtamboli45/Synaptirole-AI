# Destructuring of Props in ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/destructuring-of-props-in-reactjs/

Destructuring is a simple property that is used to make code much clear and readable, mainly when we pass props in React.
What is Destructuring?
- Destructuring is a characteristic of JavaScript, It is used to take out sections of data from an array or objects, We can assign them to new own variables created by the developer.
- In destructuring, It does not change an array or any object, it makes a copy of the desired object or array element by assigning them in its own new variables, later we can use this new variable in React (class or functional) components.
- It makes the code more clear. When we access the props using this keyword, we have to use this/ this.props throughout the program, but by the use of restructuring, we can discard this/ this.props by assigning them in new variables.
- This is very difficult to monitor props in complex applications, so by assigning these props in new own variables we can make a code more readable.
Advantages of Destructuring
- It makes developer's life easy, by assigning their own variables.
- Nested data is more complex, it takes time to access, but by the use of destructuring, we can access faster of nested data.
- It improves the sustainability, readability of code.
- It helps to cut the amount of code used in an application.
- It trims the number of steps taken to access data properties.
- It provides components with the exact data properties.
- It saves time from iterate over an array of objects multiple times.
- In ReactJS We use multiple times ternary operators inside the render function, without destructuring it looks complex and hard to access them, but by the use of destructuring, we can improve the readability of ternary operators.
How to use Destructuring?
Destructuring props can simplify your code and improve readability. We can use the Destructuring in the following method in React:
1. Using this.props method:
In this example, we are going to simply display some words using destructuring and without destructuring.
Project Structure: It will look like the following.
Destructuring gives access to the use of props in a more readable format and discards the need for props for every property.
Example: This example uses Greet component with multiple props to show prop destructuring in React.
// Filename - App.js
import React from "react";
import Greet from "./component/Greet";
class App extends React.component {
	render() {
		return (
			<div className="App">
				<Greet active="KAPIL GARG" activeStatus="CSE" />
			</div>
		);
	}
}
export default App;
Without Destructuring: This example uses props passed by parent components without destructuring.
// Filename - component/Greet.js
import React from "react";
const Greet = (props) => {
	return (
		<div>
			<div className="XYZ">
				<h3> {props.active} </h3>
			</div>
			<div className="PQR">
				<h1>{props.activeStatus}</h1>
			</div>
		</div>
	);
};
export default Greet;
Output: Here props are unnecessarily coming again inside the return, so more concise names of these Destructuring properties are used.
With Destructuring: This example first destructures the props coming from parent components before using them.
// Filename - component/Greet.js
import React from "react";
const Greet = (props) => {
	// Destructuring
	const { active, activeStatus } = props;
	return (
		<div>
			<div className="XYZ">
				<h3> {active} </h3>
			</div>
			<div className="PQR">
				<h1>{activeStatus}</h1>
			</div>
		</div>
	);
};
export default Greet;
Output:
2. Using the Extraction method:
There are many times when the value extracted during Destructuring no more exist, then in this condition we can use of default behavior of Destructuring, in this, apply a default value to the newly declared properties of Destructuring
In the following code, the activeObject will be set true if it is undefined in this.props.
Const {active, activeStatus, activeObject = true } = this.props
3. Using the Re-assigning method:
A variable name that is not a copy of the property being destructured may be used. This is achieved by reassigning as shown below.
In the following code, the properties active, activeStatus have been destructured and reassigned as variables named generating, objectMessage.
const { active : generating, activeStatus : objectMessage} = this.props
Summary
Destructuring in React simplifies code by extracting values from props or state, assigning them to variables for clearer and more readable code. Destructuring can be done using hte props, extraction, and reassinging methods. These approaches improve maintainability, reduces redundancy, and enhances the handling of complex, nested data structures in components.
