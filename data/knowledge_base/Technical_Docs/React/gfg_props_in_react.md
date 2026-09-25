# Props in React

> Source: https://www.geeksforgeeks.org/reactjs/what-are-props-in-react/

In React, props (short for "properties") are used to pass information from one component to another. The main purpose of props is to allow a parent component to send data to its child components.
- Props cannot be modified by the receiving component.
- They are strictly for reading data and should not be altered.
- Props can be updated when the parent component’s state changes.
import React from 'react';
function Greet(props) {
    return <h1>Hello, {props.name}!</h1>;
}
function App() {
    return <Greet name="John" />;
}
export default App;
Output:
- Greet Component: Accepts props and renders the value of props.name inside an<h1> tag.
- App Component: Renders the Greet component and passes "John" to thename prop.
Syntax
<ComponentName propName="value"/>
Note : Props can be used in both functional and class components. With functional components, props are passed as arguments to the function.
Working of Props in React
Props in React work by allowing data to flow from a parent component to a child component, making components dynamic and reusable.
Steps to use Props:
- Define an attribute and its value (data).
- Pass it to the child component by using props.
- Render the props data.
import React from 'react';
import Parent from './Parent';
function App() {
    return (
        <div>
            <Parent />  {/* Render the Parent component */}
        </div>
    );
}
export default App;
import React from 'react';
import Child from './Child';
function Parent() {
    return (
        <div>
            <h1>Welcome to the Parent Component!</h1>
            <Child name="John" />  {/* Passing the 'name' prop with value "John" */}
        </div>
    );
}
export default Parent;
import React from 'react';
function Child(props) {
    return <h2>Hello, {props.name}!</h2>; 
}
export default Child;
Output:
- App Component (App.js): Renders the Parent component.
- Parent Component (Parent.js): Renders a heading and the Child component and passes the prop name="John" to the Child component.
- Child Component (Child.js): Receives the name prop and displays Hello, John!
Passing Multiple Props
In React, a parent component can pass multiple props to a child component, where each prop may hold a different type of data such as text, numbers, arrays, or functions.
import React from 'react';
import Parent from './Parent';
function App() {
    const appStyle = {
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        height: '100vh',
        margin: 0,
        fontFamily: 'Arial, sans-serif',
    };
    return (
        <div style={appStyle}>
            <Parent />
        </div>
    );
}
export default App;
import React from 'react';
import Child from './Child';  
function Parent() {
    const parentStyle = {
        textAlign: 'center',  
    };
    return (
        <div style={parentStyle}>
            <h1>Welcome to the Parent Component!</h1>
            <Child name="John" age={25} city="New York" />
        </div>
    );
}
export default Parent;
import React from 'react';
function Child(props) {
    const childStyle = {
        marginTop: '20px',
        fontSize: '18px',
        color: '#333',
    };
    return (
        <div style={childStyle}>
            <h2>Hello, {props.name}!</h2>
            <p>You are {props.age} years old.</p>
            <p>You live in {props.city}.</p>
        </div>
    );
}
export default Child;
Output:
Passing Functions as Props
Props can also be used to pass functions from a parent component to a child component, allowing the child to interact with the parent’s logic.
import React from 'react';
import Child from './Child';
function Parent() {
    const handleClick = () => {
        alert('Button clicked in Child!');
    };
    return <Child onClick={handleClick} />;
}
export default Parent;
import React from 'react';
function Child(props) {
    return <button onClick={props.onClick}>Click Me!</button>;
}
export default Child;
import React from 'react';
import Parent from './Parent';
function App() {
    return (
        <div>
            <Parent />
        </div>
    );
}
export default App;
- App.js renders Parent.
- Parent defines handleClick and passes it as onClick to Child.
- Child calls the onClick function when the button is clicked.
How to set a Default Value for Props
In React, defaultProps is a special property that allows us to set default values for props. This is useful when no value is passed for a prop, ensuring the component still works with a fallback value.
import React from 'react';
function Greeting(props) {
    return <h1>Hello, {props.name}!</h1>;
}
Greeting.defaultProps = {
    name: 'Guest',
};
export default Greeting;
import React from 'react';
import Greeting from './Greeting';
function App() {
    return (
        <div>
            <Greeting />
            <Greeting name="Alia" />
        </div>
    );
}
export default App;
Output:
- Greeting Component: It expects a name prop. If no name is passed, it will use the default value "Guest".
- App Component: Renders one Greeting without a name (shows Hello, Guest!) and another with name="Alia" (shows Hello, Alia!).
Destructuring Props in React
Destructuring of Props in React lets you directly extract values from the props object, reducing the need to repeatedly use props. and making the code cleaner and easier to read.
Syntax:
function Greeting(props) {
return <h1>Hello, {props.name}!</h1>;
}
Unidirectional Flow of Props in React
React follows unidirectional data flow, where data is passed only from parent components to child components through props. Child components cannot modify the props they receive, making the application easier to debug and manage.
Related Articles:
