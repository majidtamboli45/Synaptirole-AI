# React onPointerUp Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onpointerup-event/

React onPointerUp event fires when the mouse button is clicked and released and it detects the right, left, or middle click of the mouse. Similar to other events, we have to provide a function that will execute their process.
Syntax:
onPointerUp={function}
Parameter :
- function that will call once any button released after clicked is detect from mouse.
Return type:
- event: It is an event object containing information about the event like target element and values
Example 1 : In this example, we implemented an area where the user will click any button, and in the event, the user will get numbers (which can be 0, 1, or 2), and accordingly, we are assuming which button is clicked.
/* App.css */
.App {
	width: 30vw;
	margin: auto;
	text-align: center;
	color: green;
	font-size: 23px;
}
.Shaded {
	background-color: lightgray;
	height: 200px;
	width: 300px;
	margin: auto;
	border-radius: 6px;
}
// App.js
import { useState } from "react";
import "./App.css"
const App = () => {
	const [click, setClick] = useState();
	const function1 = (event) => {
		if (event.button === 0) {
			setClick("Left Click");
		}
		else if (event.button === 1) {
			setClick("Middle Click")
		}
		else if (event.button === 2) {
			setClick("Right Click")
		}
		else {
			setClick("Undefined Click")
		}
	}
	return (
		<div className="App">
			<h1>GeeksforGeeks</h1>
			<h2>Click inside the the shaded area</h2>
			{
				click ? <p>{click}</p> : null
			}
			<div className="Shaded" onPointerUp={function1}>
			</div>
		</div>
	);
}
export default App;
Output:
Example 2: In this example, we implemented an area where users can click and detect the onPointerUp event that is fired through an alert.
/*App.css*/
.App {
    width: 30vw;
    margin: auto;
    text-align: center;
    color: green;
    font-size: 23px;
}
.Shaded {
    background-color: lightgray;
    height: 200px;
    width: 300px;
    margin: auto;
    border-radius: 6px;
}
// App.js
import "./App.css"
const App = () => {
	const function1 = (event) => {
		alert("Pointer Up Event Fired!")
		console.log(event)
	}
	return (
		<div className="App">
			<h1>GeeksforGeeks</h1>
			<h2>Click inside the the shaded area</h2>
			<div className="Shaded" onPointerUp={function1}>
			</div>
		</div>
	);
}
export default App;
Output:
