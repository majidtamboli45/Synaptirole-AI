# React onMouseUp Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onmouseup-event/

React onMouseUp event is used to detect when a mouse button is released over an element. It triggers when the user releases a mouse button while the cursor is over an element. It is particularly useful where you want to detect the ending of a mouse click or drag operation.
It is similar to the HTML DOM onmouseup event but uses the camelCase convention in React.
Syntax:
<element onMouseUp={function}/>
Parameter:  The parameter for the onMouseUp event handler is a function that represents the action to be taken when the mouse button is released.
Return type: The return type of the function attached to onMouseUp is usually void because it doesn't return anything, but it can perform actions, update state, or trigger other functions as needed within the component based on the mouse-up event.
Example 1: Basic implementation of onMouseUp event.
// App.js
import React from 'react';
class App extends React.Component { 
  handleMouseUp = () => {
    console.log('Mouse button released.');
    // Additional code...
  };
  render() {
    return (
      <div onMouseUp={this.handleMouseUp}>
        <p>Click and hold, then release the mouse button.</p>
      </div>
    );
  }
}
export default App; 
Output:
Example 2: Combining onMouseUp() with other mouse-related events such as onMouseDown() and onMouseMove().
// App.js
import React from 'react';
class App extends React.Component { 
    handleMouseDown = () => {
        console.log('Mouse button pressed.');
        // Additional logic for initiating drag operation
      };
    
      handleMouseUp = () => {
        console.log('Mouse button released.');
        // Additional logic for ending drag operation
      };
  render() {
    return (
        <div
        onMouseDown={this.handleMouseDown}
        onMouseUp={this.handleMouseUp}
      >
        <p>Click and hold to start dragging.</p>
      </div>
    );
  }
}
export default App; 
Output:
