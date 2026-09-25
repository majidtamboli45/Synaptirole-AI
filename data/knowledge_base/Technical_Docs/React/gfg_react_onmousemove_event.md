# React onMouseMove Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onmousemove-event/

React onMouseMove event detects a mouse movement over an element. The event triggers when the mouse pointer moves while positioned over an element. It is particularly useful where you want to track and respond to the movement of the user's cursor.
It is similar to the HTML DOM onmousemove event but uses the camelCase convention in React.
Syntax:
<element onMouseMove={function}/>
Parameter: The parameter for the onMouseEnter event handler is a function that contains the action to be taken when the mouse moves within the element. 
Return type: The return type of the function attached to onMouseEnter is usually void because it doesn't explicitly return anything, but it can perform actions, update state, or trigger other functions as needed within the component.
Example 1 : This example demonstrates the use of the onMouseMove event handler.
//App.js
import React from 'react';
class App extends React.Component { 
    handleMouseMove = (event) => {
        console.log('Mouse position:', event.clientX, event.clientY);
        // Additional logic
      };
  render() {
    return (
        <div onMouseMove={this.handleMouseMove}>
        <p>Move your mouse and click over this area.</p>
      </div>
    );
  }
}
export default App; 
Output:
Example 2 : This example demonstrates the canvas drawing with the help of onMouseMove event handler.
// App.js
import React, { useState } from "react";
const App = () => {
    const [isDrawing, setIsDrawing] = useState(false);
    const [prevX, setPrevX] = useState(0);
    const [prevY, setPrevY] = useState(0);
    const handleMouseDown = (event) => {
        setIsDrawing(true);
        setPrevX(event.nativeEvent.offsetX);
        setPrevY(event.nativeEvent.offsetY);
    };
    const handleMouseUp = () => {
        setIsDrawing(false);
    };
    const handleMouseMove = (event) => {
        if (isDrawing) {
            const canvas = event.target;
            const context = canvas.getContext("2d");
            const x = event.nativeEvent.offsetX;
            const y = event.nativeEvent.offsetY;
            context.strokeStyle = "black";
            context.lineWidth = 2;
            context.beginPath();
            context.moveTo(prevX, prevY);
            context.lineTo(x, y);
            context.stroke();
            setPrevX(x);
            setPrevY(y);
        }
    };
    return (
        <div>
            <h2>Simple Drawing App</h2>
            <canvas
                width="400"
                height="300"
                style={{ border: "1px solid black" }}
                onMouseDown={handleMouseDown}
                onMouseUp={handleMouseUp}
                onMouseMove={handleMouseMove}
            >
                Your browser does not support the canvas element.
            </canvas>
        </div>
    );
};
export default App;
Output:
