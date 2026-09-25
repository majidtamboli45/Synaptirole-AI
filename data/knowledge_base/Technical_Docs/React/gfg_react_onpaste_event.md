# React onPaste Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onpaste-event/

React onPaste event is an event handler which triggers when a user pastes any text or data in any tag inside the browser. It is mostly used on <input> tags. Paste can be done through shortcut keys (CTRL + V) or the Paste button present inside the menu.
It is similar to the HTML DOM onpaste event but uses the camelCase convention in React.
Syntax:
<input onPaste={pastefunction}/>
Parameter:
- pastefunction: This function will call once any user starts pasting content in the tag where it is applied.
Return type:
- event: It is an event object containing information about the event like target element and values
Example 1: In this example, we implemented an input textbox where the user can paste their content. When the user pastes their content, the paste function will give an alert that the paste event has been triggered.
// App.js
import './App.css';
function App() {
	const pastefunction = () => {
		alert("Paste Event Triggered!");
	}
	return (
		<div className="App" style={{ textAlign: "center", 
									color: "green", 
									fontSize: "20px" }}>
			<h2>GeeksforGeeks</h2>
			<input placeholder={"Paste content here..."} 
				onPaste={pastefunction} 
				style={{ padding: '10px', fontSize: "20px" }} />
		</div>
	);
}
export default App;
Output:
Example 2: In this example, we have implemented a textarea, and when the user is pasting content into it, it will give an alert through the paste function.
// App.js
import './App.css';
function App() {
	const pastefunction = () => {
		alert("Paste Event Triggered!");
	}
	return (
		<div className="App" style={{ textAlign: "center",
									color: "green",
									fontSize: "20px"}}>
			<h2>GeeksforGeeks</h2>
			<textarea placeholder={"Paste content here..."}
					onPaste={pastefunction}
					style={{ padding: '10px', 
							fontSize: "20px", 
							resize: "none" }}>
			</textarea>
		</div>
	);
}
export default App;
Output:
