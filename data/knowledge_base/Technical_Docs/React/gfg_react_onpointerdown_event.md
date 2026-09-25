# React onPointerDown Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onpointerdown-event/

The onPointerDown event in React fires whenever the pointer (mouse) is down i.e. clicked over the tag or element over which the event has been applied. Similar to other events, we have to provide a function which executes the task or process when the event occurs.
Syntax:
onPointerMove={function}
Parameter :
- function: The function to call whenever mouse click event occurs over the element.
Return type:
- event: An event object containing information about the event like target element and values
Example 1 : In this example, we implemented an area where the user can click using the mouse and then accordingly displayed whether he/she has performed a left click, right click or middle button click using the "event.button" property of the onPointerDown event.
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
		if(event.button===0)
		{
			setClick("Left Click");
		}
		else if(event.button===1)
		{
			setClick("Middle Click")
		}
		else if(event.button===2)
		{
			setClick("Right Click")
		}
		else{
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
			<div className="Shaded" onPointerDown={function1}>
			</div>
		</div>
	);
}
export default App;
Output:
Example 2: In this example, we implemented an area where users can click using the mouse. Whenever the mouse click event occures the onPointerDown event gets fired and shows an alert for the same.
// App.js
import "./App.css"
const App = () => {
	const function1 = (event) => {
		alert("Pointer Down Event Fired!")
		console.log(event)
	}
	return (
		<div className="App">
			<h1>GeeksforGeeks</h1>
			<h2>Click inside the the shaded area</h2>
			<div className="Shaded" onPointerDown={function1}>
			</div>
		</div>
	);
}
export default App;
Output:
