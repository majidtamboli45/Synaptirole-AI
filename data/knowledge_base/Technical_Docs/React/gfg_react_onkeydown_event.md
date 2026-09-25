# React onKeyDown Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onkeydown-event/

React onKeyDown event occurs on a key press event in a browser. onKeyDown is an updated event in place of onKeyPress.
onKeyPress is now deprecated because it does not work for all keys (like CTRL, SHIFT, and ALT) in all browsers, so onKeyDown is a new event listener that is used to detect the key press event.
It is similar to the HTML DOM onkeydown event but uses the camelCase convention in React.
Syntax:
onKeyDown={keyDownFunction}
Parameter:
- KeyDownFunction: It is a function that will call once any key is pressed from the Keyboard.
Return type:
- KeyboardEvent object that provides information about the keyboard key that was pressed.
Examples of onKeyDown Event in React
Below are some of the examples of the onKeyDown event in React. These example demonstrates the working of the onKeyDown event and provides a better learning experience.
Example 1: In this example, we implemented an input field in which we press any key from the keyboard, and on each key, we will check the KeyDown Event listener using JSX. We will print the key in the user interface so that the user can understand which key is pressed.
// App.js
import React, { useState } from "react";
import "./App.css";
function App() {
    const [key, setKey] = useState("");
    const handleKeyDown = (event) => {
        setKey(event.key);
    };
    return (
        <div className="App">
            <h1>GeeksforGeeks</h1>
            {key && <h2>Pressed Key: {key}</h2>}
            <input
                type="text"
                onKeyDown={handleKeyDown}
                placeholder="Press here..."
            />
        </div>
    );
}
export default App;
Output:
Example 2: In this example, we implemented onKeyDown functionality in the input field. When the user presses any key, they can see which key was pressed in the console of the browser.
// App.js
import React from "react";
import "./App.css";
function App() {
    const keyDown = (event) => {
        console.log(event.key);
    };
    return (
        <div className="App" onKeyDown={keyDown}>
            <h1>GeeksforGeeks</h1>
            <input
                type="text"
                onKeyDown={keyDown}
                placeholder="Press here..."
            />
        </div>
    );
}
export default App;
Output:
Other Keyboard Events
Other keyboard events in React are:
| Event | Occurs When | Description | 
|---|---|---|
| onkeydown | The user presses a key | Used to detect initial keypress | 
| onkeypress | The user presses a key | It is now deprecated and it represented only character input. | 
| onkeyup | the user releases a key | Used to detect when a key is released |
