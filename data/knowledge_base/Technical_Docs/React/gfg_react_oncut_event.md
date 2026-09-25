# React onCut Event

> Source: https://www.geeksforgeeks.org/reactjs/react-oncut-event/

React onCut Clipboard event is an event handler event, which detects the cut process in the browser. When the user starts cutting data through the shortcut key (CTRL + X) or the cut button present in the menu, this even automatically fires, and the function passed to it will call itself automatically.
It is similar to the HTML DOM oncut event but uses the camelCase convention in React.
Syntax:
<p onCut={cutfunction}></p>
Parameter:
- cutfunction: This function will call once any user starts cut data from the tag where it is applied.
Return type:
- event: It is an event object containing information about the event like target element and values
Example 1: In this example, we hard-coded some text in the paragraph tag, and when the user tries to cut that particular text from there, they will get an alert that the cut was triggered through the Cut function.
// App.js
import './App.css';
function App() {
	const cutfunction = () => {
		alert("Cut Trigger!")
	}
	return (
		<div className="App" style={{ textAlign: "center" }}>
			<h3 style={{ color: "green", fontSize: "28px" }}>
				GeeksforGeeks
			</h3>
			<p onCut={cutfunction}>
				This is the text when any user starts cut it will fire event
			</p>
		</div>
	);
}
export default App;
Output:
Example 2: In this example, we implemented an input text box where the user can enter their data, and whenever the user is trying to cut that data, they will get an alert message that Cut Triggered.
// App.js
import './App.css';
function App() {
	const cutfunction = () => {
		alert("Cut Trigger!")
	}
	return (
		<div className="App" style={{ textAlign: "center" }}>
			<h3 style={{ color: "green", fontSize: "28px" }}>
				GeeksforGeeks
			</h3>
			<input type="text"
				onCut={cutfunction}
				placeholder="Enter text here..."
				style={{ padding: "10px" }} />
		</div>
	);
}
export default App;
Output:
