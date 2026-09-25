# React onMouseEnter Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onmouseenter-event/

React onMouseEnter() is an event handler that triggers when the mouse cursor enters the boundaries of an element. It is particularly useful where you want to initiate actions or display information when the user's cursor hovers over an element.
It is similar to the HTML DOM onmouseenter event but uses the camelCase convention in React.
Syntax:
<element onMouseEnter={function}/>
Parameter: The parameter for the onMouseEnter event handler is a function that contains the action to be taken when the mouse enters the element. 
Return type: The return type of the function attached to onMouseEnter is usually void because it doesn't explicitly return anything, but it can perform actions, update state, or trigger other functions as needed within the component.
Example 1 : This example demonstrates the use of the onMouseEnter event handler.
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
Example 2 : This example demonstrates the change of color of the element with onMouseEnter event handler.
import React, { useState } from 'react';
const App = () => {
  const [isHovered, setIsHovered] = useState(false);
  const handleMouseEnter = () => {
    setIsHovered(true);
  };
  const handleMouseLeave = () => {
    setIsHovered(false);
  };
  const textColor = isHovered ? 'red' : 'black';
  return (
    <h1
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
      style={{ color: textColor }}
    >
      Hover over me to change text color
    </h1>
  );
};
export default App;
Output:
