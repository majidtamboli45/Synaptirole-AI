# React onPointerCancel Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onpointercancel-event/

React onPointerCancel fires when a pointer event cancels, like when someone is zoomed into an image and the user suddenly leaves it, which is a part of the onPointerCancel event.
Syntax:
onPointerCancel={function}
Parameter :
- function that will call once any pointer event cancels.
Return type:
- event: It is an event object containing information about the event like target element and values
Example 1 : In this example, we implemented an area where the user will move their cursor and cancel their pointer inside the area, which will fire a pointer cancellation event that will show an alert.
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
        alert("Pointer event gets cancelled");
    }
    return (
        <div className="App">
            <h1>GeeksforGeeks</h1>
            <h2>Move Pointer and then cancel the pointer</h2>
            <div className="Shaded" onPointerCancel={function1}>
            </div>
        </div>
    );
}
export default App;
Output:
Example 2: In this example, we implemented an area where the user will cancel their pointer events, and the message will print on the console..
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
