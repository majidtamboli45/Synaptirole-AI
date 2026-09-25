# React onTouchCancel Event

> Source: https://www.geeksforgeeks.org/reactjs/react-ontouchcancel-event/

React onTouchCancel event fires when touch interrupts. Similar to other elements in it, we have to pass a function for process execution.
It is similar to the HTML DOM touchcancel event but uses the camelCase convention in React.
Syntax:
onTouchCancel={function}
Parameter :
- function that will call when touch interrupts.
Return type:
- event: It is an event object containing information about the event like target element and values
Example 1 : In this example, we implemented the TouchCancel area. If the user interrupts their touch inside the area, they will get a message on the console through the function.
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
		console.log("Touch Cancel Fires!")
	}
	return (
		<div className="App">
			<h1>GeeksforGeeks</h1>
			<h2>Touch and cancel your touch to fire event</h2>
			<div className="Shaded" onTouchCancel={function1}>
			</div>
		</div>
	);
}
export default App;
Output :
Example 2 : In this example, we implemented an area where when user interrupts there touch user will get a alert message that TouchCancel Fired.
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
		alert("Touch Cancel Event Fires!")
	}
	return (
		<div className="App">
			<h1>GeeksforGeeks</h1>
			<h2>Interrupt your touch to fire Event</h2>
			<div className="Shaded" onTouchCancel={function1}>
			</div>
		</div>
	);
}
export default App;
Output:
