# ReactJS getSnapshotBeforeUpdate() Method

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-getsnapshotbeforeupdate-method/

The getSnapshotBeforeUpdate() method is invoked just before the DOM is being rendered. It is used to store the previous values of the state after the DOM is updated.
Syntax:
getSnapshotBeforeUpdate(prevProps, prevState)
Parameters:
It accepts two parameters, they are prevProps and prevState which are just the props or state before the component in question is re-rendered.
Return:
The return value can be any object, number, or string. Also, it can be null when no information need to be captured.
Any value returned by getSnapshotBeforeUpdate() method will be used as a parameter for componentDidUpdate() method. This function is always used along with the componentDidUpdate() method but vice-versa isn't true.
Steps to Create React Application
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure:
Example: Program to demonstrate the use of getSnapshotBeforeUpdate() method. Here, we are going to use the previous and current values of the state to display some text.
// Filename: App.js
import React from "react";
class App extends React.Component {
	// Initializing the state
	state = {
		name: "GFG"
	};
	componentDidMount() {
		// Changing the state after 1 sec
		setTimeout(() => {
			this.setState({ name: "GeeksForGeeks" });
		}, 1000);
	}
	getSnapshotBeforeUpdate(prevProps, prevState) {
		// Displaying the previous value of the state
		document.getElementById("prev").innerHTML =
			"Previous Name: " + prevState.name;
	}
	componentDidUpdate() {
		// Displaying the current value of the state
		document.getElementById("new").innerHTML =
			"Current Name: " + this.state.name;
	}
	render() {
		return (
			<div>
				<div id="prev"></div>
				<div id="new"></div>
			</div>
		);
	}
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output:
Reference: https://legacy.reactjs.org/docs/react-component.html#getsnapshotbeforeupdate
