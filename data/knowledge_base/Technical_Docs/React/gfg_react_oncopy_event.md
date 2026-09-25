# React onCopy Event

> Source: https://www.geeksforgeeks.org/reactjs/react-oncopy-event/

React onCopy Clipboard event is an event handler which detects the copy process in the browser using JavaScript. When the user starts copying data through the shortcut key (CTRL + C) or the copy button present in the menu, this even automatically fires, and the function passed to it will call itself automatically.
It is similar to the HTML DOM oncopy event but uses the camelCase convention in React.
Syntax:
<p onCopy={copyfunction}></p>
Parameter:
- copyfunction: This function will call once any user starts copy data from the tag where it is applied.
Return type:
- event: It is an event object containing information about the event like target element and values
Example 1: In this example, we hard-coded some text in the paragraph tag, and when the user tries to copy that particular text from there, they will get an alert that the copy was triggered through the Copy function.
// App.js
import './App.css';
function App() {
	const copyfunction = () => {
		alert("Copy Trigger!")
	}
	return (
		<div className="App" style={{ textAlign: "center" }}>
			<h3 style={{ color: "green", fontSize: "28px" }}>
				GeeksforGeeks
			</h3>
			<p onCopy={copyfunction}>
				This is the text when any user starts copy it will fire event
		</p>
		</div>
	);
}
export default App;
Output:
Example 2: In this example, we implemented an input text box where the user can enter their data, and whenever the user is trying to copy that data, they will get an alert message that Copy Triggered.
// App.js
import './App.css';
function App() {
	const copyfunction = () => {
		alert("Copy Trigger!")
	}
	return (
		<div className="App" style={{ textAlign: "center" }}>
			<h3 style={{ color: "green", fontSize: "28px" }}>
				GeeksforGeeks
			</h3>
			<input type="text"
				onCopy={copyfunction} 
				placeholder="Enter text here..."
				style={{padding:"10px"}}/>
		</div>
	);
}
export default App;
Output:
