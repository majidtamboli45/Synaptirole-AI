# React onKeyUp Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onkeyup-event/

React onKeyUp is an event listener that is used to detect the key release event in a browser using JavaScript. This event occurs once after the key is pressed and released.
It is similar to the HTML DOM onkeyup event but uses the camelCase convention in React.
Syntax:
<input onKeyUp={keyUpFunction}/>
Parameter :
- KeyUpFunction is a function that will call once any key is released from Keyboard.
Return type:
- event: It is an event object containing information about the event like target element and values
Example: In this example, we implemented an input field in which we press and release any key from the keyboard, and on each key, we will check the onKeyUp Event listener using JSX. We will print the key in the user interface so that the user can understand which key is released.
/* App.css */
.App {
  text-align: center;
  padding: 20px;
  font-family: Arial, sans-serif;
}
h1 {
  color: #4CAF50;
  font-size: 2em;
  margin-bottom: 20px;
}
h2 {
  color: #FF5722;
  font-size: 1.5em;
  margin: 20px 0;
}
input[type='text'] {
  width: 300px;
  padding: 10px;
  font-size: 1em;
  border: 2px solid #ddd;
  border-radius: 4px;
  transition: border-color 0.3s ease;
}
input[type='text']:focus {
  border-color: #4CAF50;
  outline: none;
}
.placeholder {
  color: #888;
}
// App.js
import React, { useState } from 'react';
import './App.css';
function App() {
    const [key, setKey] = useState('');
    const keyUp = (event) => {
        setKey(event.key);
    };
    return (
        <div className="App">
            <h1>GeeksforGeeks</h1>
            {key && <h2>Key UP: {key}</h2>}
            <input
                type="text"
                onKeyUp={keyUp}
                placeholder="Press & Release Key here..."
            />
        </div>
    );
}
export default App;
Output:
