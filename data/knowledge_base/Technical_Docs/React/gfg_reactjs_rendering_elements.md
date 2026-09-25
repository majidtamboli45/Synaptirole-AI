# ReactJS Rendering Elements

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-rendering-elements/

React elements are the smallest building blocks of a React application. They are different from DOM elements and they represent a description of what you want to see on the screen. For example, a DOM node like a <div> or a user-defined component.
- They are plain JavaScript objects describing the UI structure.
- Unlike browser DOM elements, React elements are lightweight and immutable.
- React uses these elements to build a virtual DOM and then efficiently update the real DOM.
- React elements tell React what to render, not how to render it.
Rendering an Element in React
To render a React element to the browser’s DOM, you need a container or root DOM element, typically a <div> with an id like root or app. For example, your index.html file might include:
<div id="root"></div>
To render a simple React element using a functional component, add the following code to the App.js file.
// App.js
import React from 'react';
function App() {
    return (
        <div>
            <h1>Welcome to GeeksforGeeks!</h1>
        </div>
    );
}
export default App;
To mount this component into the root element:
// index.js
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);
Output:
- A React element has been created and rendered on the screen.
- React is intended for building dynamic and interactive user interfaces.
- Updating elements allows adding logic and interactivity to the page.
Updating an Element in React
React elements are designed to be immutable building blocks of the UI.
- Their children and attributes cannot be changed after creation.
- The UI is updated by re-rendering elements with new values using state and hooks.
Example: Updating Time with Functional Component
Below is an example of a functional component that updates the current time every second using the useEffect and useState hooks for dynamic rendering.
Write the following code in App.js file of your project directory.
import React, { useEffect, useState } from 'react';
import ReactDOM from 'react-dom/client';
function App() {
  const [currentTime, setCurrentTime] = useState(new Date().toLocaleTimeString());
  
  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentTime(new Date().toLocaleTimeString());
    }, 1000);
    return () => clearInterval(interval); // Cleanup on unmount
  }, []);
  return (
    <div>
      <h1>Welcome to GeeksforGeeks!</h1>
      <h2>{currentTime}</h2>
    </div>
  );
}
// Render the component
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);
export default App;
Output:
The time updates every second, while the heading remains static.
How It Works?
- State Management: The useState hook manages the currentTime state.
- Side Effects: The useEffect hook sets up an interval to update the time every second and cleans up on component unmount to prevent memory leaks.
- Efficient Updates: Only the time in the <h2> element is re-rendered, leaving the static <h1> unchanged.
React Render Efficiency
React’s efficiency comes from its Virtual DOM and diffing algorithm, which minimize actual DOM updates. The rendering process involves:
- Updating the Virtual DOM with new element data.
- Comparing the updated Virtual DOM with the previous version.
- Applying only the necessary changes to the browser’s DOM.
Best Practices for Efficient Rendering
These best practices help improve performance and ensure smoother and more efficient rendering in React applications.
- Use Functional Components: They are lightweight and optimized for modern React.
- Leverage Hooks: useState and useEffect simplify state and side effect management.
- Prevent Unnecessary Renders: Use React.memo to avoid re-rendering unchanged components.
- Key Prop: Assign unique key attributes to lists for optimized updates.
- Stateful Components: Use stateful functional components for dynamic updates instead of manual render calls.
