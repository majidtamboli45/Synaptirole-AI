# React Cheat Sheet

> Source: https://www.geeksforgeeks.org/reactjs/react-cheat-sheet/

React is an open-source JavaScript library used to build fast and reusable user interfaces for web applications.
- Uses a declarative approach to design interactive UIs efficiently.
- Component-based architecture promotes reusable UI components.
- Handles only the view layer in MVC architecture.
- Helps build modular interfaces that display dynamic data.
Basic Setup
Follow the below steps to create a boilerplate
Step 1: Create the application using the command
npx create-react-app <<Project_Name>>
Step 2: Navigate to the folder using the command
cd <<Project_Name>>
Step 3: Open the App.js file and write the below code
// App.js
import React from 'react';
import './App.css';
export default function App() {
    return (
        <div >
            Hello Geeks
            Lets start learning React
        </div>
    )
}
JSX
JSX s a syntax extension that allows writing HTML-like code inside JavaScript, making React development simpler and more readable.
- Allows writing HTML structure directly within JavaScript code.
- Forms the foundation of UI creation in React applications.
- Improves code readability and makes development easier.
- Optional to use, but highly recommended in React projects.
Sample JSX code:
const ele = <h1>This is sample JSX</h1>;
React Elements
React elements are different from DOM elements as React elements are simple JavaScript objects and are efficient to create. React elements are the building blocks of any React app and should not be confused with React components.
1. Class Element Attributes
Used to pass CSS classes to an element, where class is written as className in React.
Syntax:
<div className="exampleclass"></div>
2. Style Element Attributes
Used to apply inline styling by passing styles as a JavaScript object inside double curly braces.
Syntax:
<div style={{styleName: value}}></div>
3. Fragments
Used to wrap multiple elements inside a single parent without adding extra nodes to the DOM.
Syntax:
<> // Other Components </>
ReactJS Import and Export
In ReactJS we use importing and exporting to import already created modules and export our own components and modules respectively.
1. Importing Default Exports
Imports the default export from a module.
Syntax:
import MOD_NAME from "PATH"
2. Importing Named Values
Imports specific named exports from a module.
Syntax:
import {NAME} from "PATH"
3. Multiple Imports
Imports both default and named exports from a module.
Syntax:
import MOD_NAME, {NAME} from "PATH"
4. Default Exports
Allows a module to have a single default export.
Syntax:
export default MOD_NAME
5. Named Exports
Used to export specific components or values from a module.
Syntax:
export {NAME}
6. Multiple Named Exports
Exports multiple components or values from a module.
Syntax:
export {NAME1, NAME2}
React Components
A Component is one of the core building blocks of React. Components in React basically return a piece of JSX code that tells what should be rendered on the screen.
1 Functional Components
Functional components are simple JavaScript functions that are stateless and return JSX.
Syntax:
function DemoComponent() {
return (
<>
// CODE
</>
);
}
2. Class-based Components
Class-based components use JavaScript classes to create stateful components with lifecycle methods.
Syntax:
class DemoComponent extends React.Component {
render() {
return <>// CODE</>;
}
}
3. Nested Components
Nested components are components created inside or used within another component.
Syntax:
function DemoComponent() {    return (        <>            <AnotherComponent />        </>    );}
// Functional Component
export default function App() {
    return (
        <div >
            Hello Geeks
            Lets start learning React
        </div>
    )
}
// Class Component with nesting
class Example extends React.Component {
  render() {
    return (
          <div >
              <App/>
            Hello Geeks
            Lets start learning React
        </div>
     )
  }
}
Managing Data Inside and Outside Components
In React, state manages mutable data within a component, while props pass read-only data between components, enabling dynamic and reusable UIs.
Props
Props are read-only properties used to pass data between components, mainly in functional components.
Syntax:
// Passing props<Comp prop_name="VAL"/>// Accessing props<Comp>{this.props.prop_name}</Comp>
State
State manages mutable data inside a component and is mainly used in class-based components.
Syntax:
constructor(props) {    super(props);    this.state = {        var: value,    };}
setState
setState is an asynchronous function used to update the component’s state based on previous state or logic.
Syntax:
this.setState((prevState) => ({
// CODE LOGIC
const App = () => {
  const message = "Hello from functional component!";
  return (
    <div>
      <ClassComponent message={message} />
    </div>
  );
};
class ClassComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      message: this.props.message
    };
  }
  render() {
    return (
      <div>
        <h2>Class Component</h2>
        <p>State from prop: {this.state.message}</p>
      </div>
    );
  }
}
Lifecycle of Components
The lifecycle methods in ReactJS are used to control the components at different stages from initialization till unmounting.
Mounting Phase methods
During React’s mounting phase, methods like constructor, render, and componentDidMount are called in order to initialize the component, render its UI, and perform actions after it appears in the DOM.
1. constructor:
The constructor runs before the component is rendered to initialize state or bind methods.
Syntax:
constructor(props) {}
2. render:
The render method is used to render the component’s UI to the DOM.
Syntax:
render() {}
3. componentDidMount:
The componentDidMount method runs after the component is rendered and is often used for API calls or subscriptions.
Syntax:
componentDidMount() {}
4. componentWillUnmount:
The componentWillUnmount method runs before a component is removed from the DOM to perform cleanup tasks.
Syntax:
componentWillUnmount() {}
5. componentDidCatch:
The componentDidCatch method is used to catch errors in the component tree and handle them gracefully.
Syntax:
componentDidCatch(error, info) {}
Updating Phase Methods
During React’s updating phase, methods like shouldComponentUpdate, render, and componentDidUpdate are called in sequence to control re-rendering, update the UI, and handle post-update actions.
1. componentDidUpdate:
The componentDidUpdate method is invoked after a component is updated to handle side effects or respond to prop/state changes.
Syntax:
componentDidUpdate(prevProps, prevState, snapshot) {}
2. shouldComponentUpdate:
The shouldComponentUpdate method is used to optimize performance by preventing unnecessary re-renders when props or state haven’t changed.
Syntax:
shouldComponentUpdate(newProps, newState) {}
3. render:
The render method updates and renders the component’s UI after an update occurs.
Syntax:
render() {}
import React from 'react';
import ReactDOM from 'react-dom';
class Test extends React.Component {
    constructor(props) {
        super(props);
        this.state = { hello: "World!" };
    }
    componentWillMount() {
        console.log("componentWillMount()");
    }
    componentDidMount() {
        console.log("componentDidMount()");
    }
    changeState() {
        this.setState({ hello: "Geek!" });
    }
    render() {
        return (
            <div>
                <h1>GeeksForGeeks.org, Hello{this.state.hello}</h1>
                <h2>
                    <a onClick={this.changeState.bind(this)}>Press Here!</a>
                </h2>
            </div>);
    }
    shouldComponentUpdate(nextProps, nextState) {
        console.log("shouldComponentUpdate()");
        return true;
    }
    componentWillUpdate() {
        console.log("componentWillUpdate()");
    }
    componentDidUpdate() {
        console.log("componentDidUpdate()");
    }
}
ReactDOM.render(
    <Test />,
    document.getElementById('root'));
Conditional Rendering
In React, conditional rendering allows components to be rendered only when specific conditions are met, showing users only the relevant UI.
- Enables rendering of components based on dynamic conditions.
- Helps in encapsulation by displaying only the desired content to the user.
1. if-else
The if-else method renders a component based on a condition, executing one block if true and another if false.
Syntax:
if (condition) {    return <COMP1 />;} else {    return <COMP2 />;}
2. Logical && Operator
The logical && operator renders a component only if the condition is true, commonly used for showing or hiding a single component.
Syntax:
{condition && <Component />}
3. Ternary Operator
The ternary operator provides an inline if-else to render one component if a condition is true and another if false.
Syntax:
{condition ? <COMP1 /> : <COMP2 />}
// Conditional Rendering Using if-else
import React from 'react';
import ReactDOM from 'react-dom';
// Example Component
function Example(props)
{
    if(!props.toDisplay)
        return null;
    else
        return <h1>Component is rendered</h1>;
}
ReactDOM.render(
    <div>
        <Example toDisplay = {true} />
        <Example toDisplay = {false} />
    </div>,
    document.getElementById('root')
);
// Conditional rendering using ternary operator
import React from 'react';
class Example extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoggedIn: true,
    };
  }
  render() {
    const { isLoggedIn } = this.state;
    return (
      <div>
        <h1>Small Conditional Rendering Example</h1>
        {isLoggedIn ? (
          <p>Welcome, you are logged in!</p>
        ) : (
          <p>Please log in to access the content.</p>
        )}
      </div>
    );
  }
}
export default Example;
// Conditional Rendering using && operator
import React from 'react';
import ReactDOM from 'react-dom';
// Example Component
function Example()
{
    const counter = 5;
    return(<div>
            {
                (counter==5) &&
                <h1>Hello World!</h1>
            }
        </div>
        );
}
ReactDOM.render(
    <Example />,
    document.getElementById('root')
);
React Lists
In React, lists in React are created using arrays like in JavaScript and traversed with the map() function, while keys uniquely identify elements for efficient updates.
- Use map() functions to render each item in a list dynamically.
- Assign keys to list items to track changes, updates, or deletions efficiently.
Code Snippet:
const arr = [];
const listItems = numbers.map((number) =>
<li key={number.toString()}>
{number}
</li>
);
import React from 'react';
import ReactDOM from 'react-dom';
const numbers = [1,2,3,4,5];
const updatedNums = numbers.map((number)=>{
    return <li>{number}</li>;
});
ReactDOM.render(
    <ul>
        {updatedNums}
    </ul>,
    document.getElementById('root')
);
React DOM Events
Similar to HTML events, React DOM events are used to perform events based on user inputs such as click, onChange, mouseOver etc
1. Click
The click event method triggers an action when an element is clicked.
Syntax:
<button onClick={func}>CONTENT</button>
2. Change
The change event method triggers when a change is detected in a component, such as in input fields.
Syntax:
<input onChange={handleChange} />
3. Submit
The submit event method triggers when a form is submitted.
Syntax:
<form onSubmit={(e) => { /* LOGIC */ }}></form>
import React, { useState } from "react";
const App = () => {
// Counter is a state initialized to 0
const [counter, setCounter] = useState(0)
// Function is called everytime increment button is clicked
const handleClick1 = () => {
    // Counter state is incremented
    setCounter(counter + 1)
}
// Function is called everytime decrement button is clicked
const handleClick2 = () => {
    // Counter state is decremented
    setCounter(counter - 1)
}
return (
    <div>
    Counter App
        <div style={{
            fontSize: '120%',
            position: 'relative',
            top: '10vh',
        }}>
            {counter}
        </div>
        <div className="buttons">
            <button onClick={handleClick1}>Increment</button>
            <button onClick={handleClick2}>Decrement</button>
        </div>
    </div>
)
}
export default App
React Hooks
Hooks provide functional components access to state and side-effects, allowing developers to use React features without writing class-based components; introduced in React 16.8.
- Enable functional components to manage state and perform side-effects.
- Cannot be used inside class-based components; strictly for functional components.
1. useState
The useState hook declares a state variable inside a functional component.
Syntax:
const [var, setVar] = useState(Val);
2. useEffect
The useEffect hook is used to handle side-effects in React, such as API calls or subscriptions.
Syntax:
useEffect(<FUNCTION>, <DEPENDENCY>);
3. useRef
The useRef hook creates a reference to a DOM element directly.
Syntax:
const refContainer = useRef(initialValue);
4. useMemo
The useMemo hook returns a memoized value to optimize performance by avoiding expensive calculations on every render.
Syntax:
const memVal = useMemo(function, arrayDependencies);
import React, { useState } from 'react';
import ReactDOM from 'react-dom/client';
function App() {
    const [click, setClick] = useState(0);
    // using array destructuring here
    // to assign initial value 0
    // to click and a reference to the function
    // that updates click to setClick
    return (
        <div>
            <p>You clicked {click} times</p>
            <button onClick={() => setClick(click + 1)}>
                Click me
            </button>
        </div>
    );
}
export default App;
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
<React.StrictMode>
    <App />
</React.StrictMode>
);
PropTypes
PropTypes in React are used to check the value of a prop which is passed into the component. These help in error handling and are very useful in large scale applications.
Primitive Data Types
| Type | Class/Syntax | Example | 
|---|---|---|
| String | PropTypes.string | "Geeks" | 
| Object | PropType.object | {course: "DSA"} | 
| Number | PropType.number | 15, | 
| Boolean | PropType.bool | true | 
| Function | PropType.func | const GFG ={return "Hello"} | 
| Symbol | PropType.symbol | Symbol("symbole_here" | 
Array Types
| Type | Class/Syntax | Example | 
|---|---|---|
| Array | PropTypes.array | [] | 
| Array of strings | PropTypes.arrayOf([type]) | [15,16,17] | 
| Array of numbers | PropTypes.oneOf([arr]) | ["Geeks", "For", "Geeks" | 
| Array of objects | PropTypes.oneOfType([types]) | PropTypes.instanceOf() | 
Object Types
| Type | Class/Syntax | Example | 
|---|---|---|
| Object | PropTypes.object() | {course: "DSA"} | 
| Number Object | PropTypes.objectOf() | {id: 25} | 
| Object Shape | PropTypes.shape() | {course: PropTypes.string, price: PropTypes.number} | 
| Instance | PropTypes.objectOf() | new obj() | 
import PropTypes from 'prop-types';
import React from 'react';
import ReactDOM from 'react-dom/client';
// Component
class ComponentExample extends React.Component{
    render(){
        return(
                <div>
                
                    {/* printing all props */}
                    <h1>
                        {this.props.arrayProp}
                        <br />
                        {this.props.stringProp}
                        <br />
                        {this.props.numberProp}
                        <br />
                        {this.props.boolProp}
                        <br />
                    </h1>
                </div>
            );
    }
}
// Validating prop types
ComponentExample.propTypes = {
    arrayProp: PropTypes.array,
    stringProp: PropTypes.string,
    numberProp: PropTypes.number,
    boolProp: PropTypes.bool,
}
// Creating default props
ComponentExample.defaultProps = {
    arrayProp: ['Ram', 'Shyam', 'Raghav'],
    stringProp: "GeeksforGeeks",
    numberProp: "10",
    boolProp: true,
}
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
<React.StrictMode>
    <ComponentExample />
</React.StrictMode>
);
Error Boundaries
Error boundaries are React components that catch JavaScript errors in their child component tree, log them, and display a fallback UI instead of crashing the whole app.
- Catch errors in rendering, lifecycle methods, and constructors of child components.
- Prevent the entire React component tree from crashing due to errors.
- Log errors for debugging and monitoring purposes.
- Display a fallback UI to inform users gracefully about errors.
import React, { Component } from 'react';
class ErrorBoundary extends Component {
    constructor(props) {
        super(props);
        this.state = { hasError: false };
    }
    componentDidCatch(error, info) {
        // Log the error to an error reporting service
        console.error('Error:', error);
        console.error('Info:', info);
        this.setState({ hasError: true });
    }
    render() {
        if (this.state.hasError) {
            // Fallback UI when an error occurs
            return <div>Something went wrong!</div>;
        }
        return this.props.children;
    }
}
export default ErrorBoundary;
//Apply Error Boundary
import React from 'react';
import ErrorBoundary from './ErrorBoundary';
function App() {
    return (
        <ErrorBoundary>
            <div>
                {/* Your components here */}
            </div>
        </ErrorBoundary>
    );
}
export default App;
- Provides quick access to commonly used React concepts and methods.
- Covers everything from project setup to state management and event handling for building dynamic UIs.
