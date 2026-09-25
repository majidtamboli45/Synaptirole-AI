# ReactJS Functional Components

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-functional-components/

Functional components are the basic building blocks in React used to create and manage user interface elements.
- They are simple JavaScript functions that return JSX.
- They accept props to pass data and customize components.
- They help create reusable and easy-to-maintain UI components.
import React, { useState } from 'react';
function App() {
  const [message, setMessage] = useState("Hello World!");
  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      <h1>{message}</h1>
      <button onClick={() => setMessage("Welcome to React!")}>
        Click Me!
      </button>
    </div>
  );
}
export default App;
Output:
When a functional component receives input and is rendered, React uses props and updates the virtual DOM to ensure the UI reflects the current state.
- Props: Functional components receive input data through props, which are objects containing key-value pairs.
- Processing Props: After receiving props, the component processes them and returns a JSX element that defines the component's structure and content.
- Virtual DOM: When the component is rendered, React creates a virtual DOM tree that represents the current state of the application.
- Re-rendering: If the component's props or state change, React updates the virtual DOM tree accordingly and triggers the component to re-render.
Functional Component with Props
Props in React allow functional components to receive data and behave dynamically.
- Props are passed from parent components to child components.
- They help make components reusable and customizable.
- Data in a component changes based on the props it receives.
import React from 'react';
import ReactDOM from 'react-dom';
// Functional component with props
function Greet(props) {
  return <h2>Hello, {props.name}!</h2>;
}
// Rendering the component and passing a prop
ReactDOM.render(
  <Greet name="Alice" />,
  document.getElementById('root')
);
Output:
Hello, Alice!
When to Use ReactJS Functional Components
Functional components should be used whenever possible because they are simpler, easier to read, test, and maintain. With the introduction of React Hooks, functional components can now handle state and lifecycle features that were previously only available in class components.
- State management: Functional components can use the useState Hook to manage state, so class components are no longer required for stateful logic.
- Lifecycle methods: Hooks like useEffect can replace lifecycle methods such ascomponentDidMount ,componentDidUpdate , andcomponentWillUnmount .
- Modern best practice: Functional components with Hooks are now the recommended and standard approach in React development.
Passing Props to a ReactJS Functional Component
Props are used to pass data from a parent component to a child component. Props are read-only and allow you to make a component dynamic by passing different values into it.
1. Passing a Single Prop to a React Functional Component:
import React from 'react';
import Greeting from './components/Greeting';  
function App() {
  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      <Greeting message="Hello, World!" />  {/* Passing 'message' prop */}
    </div>
  );
}
export default App;
import React from 'react';
function Greeting(props) {
  return <h2>{props.message}</h2>;  
}
export default Greeting;
Output
Hello World!
- In the App.js component, the message prop is passed to the Greeting component.
- In the Greeting.js component, props.message is used to access the passed prop and dynamically render it.
2. Destructuring Props
Instead of using props.name, you can destructure the props object directly in the function’s argument to make the code cleaner.
 React from 'react';
// Functional Component with destructuring
const Welcome = ({ name }) => {
  return <h1>Hello, {name}!</h1>;
};
// Parent Component
const App = () => {
  return <Welcome name="Jiya" />;
};
export default App;
- The Welcome component receives the name prop using destructuring in the function argument, making it easier to access the name value.
- Instead of writing props.name, we now directly use { name } within the component.
React Functional Components Vs Class Components
| Functional Components | Class Components | 
|---|---|
| Simple function with Hooks | ES6 classes extending React Component. | 
| Requires Hooks like useState | Managed via this.state and this.setState. | 
| Managed via useEffect | Dedicated lifecycle methods like componentDidMount. | 
| Slightly faster due to fewer abstractions | Slightly slower due to more internal logic. |
