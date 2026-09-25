# React onInput Event

> Source: https://www.geeksforgeeks.org/reactjs/react-oninput-event/

React onInput is an event handler that triggers then there is any change in the input field. It is fired immediately when the user is changing input. It is one of the form events that updates when the input field is modified.
It is similar to the HTML DOM oninput event but uses the camelCase convention in React.
Syntax:
<input onInput={handleChange} >
Parameter:
- handleChange: It is a function call that includes the code to be executed when an event triggers
Return type:
- event: It is an event object containing information about the event like target element and values
Example 1: This example demonstrates the use of the onInput event handler to update the states in React.
// Filename - App.js
import React, { useState } from "react";
function App() {
    const [value, setValue] = useState("");
    function handleChange(e) {
        setValue(e.target.value);
    }
    return (
        <div
            style={{ textAlign: "center", margin: "auto" }}
        >
            <h1 style={{ color: "Green" }}>
                GeeksforGeeks
            </h1>
            <h3>Exemple for React onInput Event Handler</h3>
            <input value={value} onInput={handleChange} />
            <br />
            <div>User Input:- {value}</div>
        </div>
    );
}
export default App;
Output:
Example 2: This example demonstrate the use of the onInput event handler in select input.
Javascript// Filename - App.js
import React, { useState } from "react";
function App() {
    const [value, setValue] = useState("HTML");
    function handleChange(e) {
        setValue(e.target.value);
    }
    return (
        <div
            style={{ textAlign: "center", margin: "auto" }}
        >
            <h1 style={{ color: "Green" }}>
                GeeksforGeeks
            </h1>
            <h3>
                Exemple for React onChange Event Handler
            </h3>
            <select value={value} onInput={handleChange}>
                <option value={"HTML"}>HTML</option>
                <option value={"CSS"}>CSS</option>
                <option value={"JavaScript"}>
                    JavaScript
                </option>
            </select>
            {/* <input value={value} onChange={handleChange} /> */}
            <br />
            <br />
            <br />
            <div>User Input:- {value}</div>
        </div>
    );
}
export default App;
Output:
