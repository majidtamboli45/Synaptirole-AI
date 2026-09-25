# React onPointerMove Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onpointermove-event/

The onPointerMove event in React fires whenever the cursor moves inside the tag or element where the event has been applied. Similar to other events, the onPointerMove takes a function which defines the process/task which has to be applied.
Syntax:
onPointerMove={function}
Parameter :
- function: The function which has to be called when the mouse is moving (hovering) over the specified element.
Return type:
- event: An event object containing information about the event like target element and values
Example 1 : In this example, we implemented an area where the user will move their cursor, and that will fire the event, and the function passed to the event will give an alert that the pointer is moving.
/*App.css*/
.App {
    min-width: 30vw;
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
		alert("Pointer is Moving")
		console.log(event)
	}
	return (
		<div className="App">
			<h1>GeeksforGeeks</h1>
			<h2>Move Pointer inside the shaded region</h2>
			<div className="Shaded" onPointerMove={function1}>
			</div>
		</div>
	);
}
export default App;
Output:
Example 2: In this example, we implemented an area where users can move their cursor. When this occurs, an event will fire and "Pointer is moving" will be printed in the console.
// App.js
import "./App.css"
const App = () => {
	const function1 = (event) => {
		console.log("Pointer is Moving")
	}
	return (
		<div className="App">
			<h1>GeeksforGeeks</h1>
			<h2>Move Pointer inside the shaded region</h2>
			<div className="Shaded" onPointerMove={function1}>
			</div>
		</div>
	);
}
export default App;
Output:
