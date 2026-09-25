# React onTouchMove Event

> Source: https://www.geeksforgeeks.org/reactjs/react-ontouchmove-event/

React onTouchMove event fires when the user touches and moves the cursor. Similar to other elements in it, we have to pass a function for process execution.
It is similar to the HTML DOM ontouchmove event but uses the camelCase convention in React.
Syntax:
onTouchMove={function}
Parameter :
- function that will call once the user touch and moves any part of an element or tag.
Return type:
- event: It is an event object containing information about the event like target element and values
Example 1: In this example, we implemented a TouchMove area in it where when user touch and move it will gives an alert through function.
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
		alert("Touch and Move Start")
	}
	return (
		<div className="App">
			<h1>GeeksforGeeks</h1>
			<h2>Touch and move inside Shaded Region</h2>
			<div className="Shaded" onTouchMove={function1}>
			</div>
		</div>
	);
}
export default App;
Output :
Example 2 : In this example, we implemented an area where the user, when touch and move, will get an message in console that a touch event is fired.
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
		console.log("Touch and Move Start")
	}
	return (
		<div className="App">
			<h1>GeeksforGeeks</h1>
			<h2>Touch and Move inside Shaded Region</h2>
			<div className="Shaded" onTouchStart={function1}>
			</div>
		</div>
	);
}
export default App;
Output:
