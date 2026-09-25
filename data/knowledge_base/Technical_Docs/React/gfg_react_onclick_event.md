# React onClick Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onclick-event/

The onClick event in React is used for handling a function when an element, such as a button, div, or any clickable element, is clicked.
Syntax
onClick={handleClick}
Parameter
- The callback function handleClick which is invoked when onClick event is triggered
Return Type
- It is an event object containing information about the methods and is triggered when the mouse is clicked.
Example 1: In this React code, the button text and heading message toggle on click using state changes.
/* Write CSS Here */
.App {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
body {
    background-color: antiquewhite;
}
.App>h2 {
    text-align: center;
}
.App>button {
    width: 8rem;
    font-size: larger;
    padding: 2vmax auto;
    height: 1.8rem;
    color: white;
    background-color: rgb(34, 34, 33);
    border-radius: 10px;
}
button:hover {
    background-color: rgb(80, 80, 78);
}
// App.js
import "./App.css"
import React, {useState} from "react";
const App = () => {
    const [num, setNum] = useState(false);
    const [btn, setBtn] = useState(false);
    const handleClick = () => {
        setNum(!num);
        setBtn(!btn);
    };
    return (
        <div className="App">
            <h2> {
                num ?
                    "onClick event performed" :
                    "onClick event not performed"
            }
            </h2>
            <button onClick={handleClick}>
                {btn ? "clicked" : "onClick"}
            </button>
        </div>
    );
};
export default App;
Output:
Example 2: In this React code, each time the button is clicked, it increments a number by 1 and displays the updated value on the screen.
/* Write CSS Here */
.App {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
body {
    background-color: antiquewhite;
}
.App>h2 {
    text-align: center;
}
.App>button {
    width: 8rem;
    font-size: larger;
    padding: 2vmax auto;
    height: 1.8rem;
    color: white;
    background-color: rgb(34, 34, 33);
    border-radius: 10px;
}
button:hover {
    background-color: rgb(80, 80, 78);
}
// App.js
import "./App.css"
import React, {useState} from "react";
const App = () => {
    const [num, setNum] = useState(0);
    const handleClick = () => {
        setNum(num + 1);
    };
    return (
        <div className="App">
            <h2> {num}</h2>
            <button onClick={handleClick}>
                Add one
            </button>
        </div>
    );
};
export default App;
Output:
