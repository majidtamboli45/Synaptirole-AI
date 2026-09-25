# State in React Functional Component

> Source: https://www.geeksforgeeks.org/reactjs/what-is-state-in-react/

State in React functional components refers to a way of managing data that influences the rendering and behavior of components. Unlike class components, where state is managed using a this.state object, functional components use the React Hook useState to manage state efficiently.
- State is Local to the Component: Each component has its own state, which is independent of other components.
- Reactivity: When the state changes, React re-renders the component to reflect the updated state in the UI.
- State is Immutable: You should never directly modify the state. Instead, you use functions to update it.
- State is Managed with Hooks: In functional components, the useState hook is used to manage state.
import React, { useState } from 'react';
function App() {
    const [count, setCount] = useState(1);
    return (
        <div>
            <h1>Count: {count}</h1>
            <button onClick={() => 
            	setCount(count + 1)}>Increment</button>
        </div>
    );
}
export default App;
Output
In this example
- count contains the value of the current state.
- setCount can be defined as the function which is used to update the state.
- useState(1) initializes the value of the count state with 1. It can be any default value.
- setCount(count + 1) is used to update the state, and React will automatically re-render the component to show the new count.
Understanding useState Hook
The useState Hook is used to add state to functional components. To use it first import it in the application. It returns two values:
- State Variable: Holds the current state value.
- State Updater Function: Updates the state and triggers a re-render.
Syntax
const [count, setCount] = useState(initialValue);
- count: In the count, the current state is stored.
- setCount: setCount is used to update the state.
- initialValue: initialValue is the starting value or the default value of the state.
Why Use State in Functional Components?
Using state in functional components allows us to manage data and perform the other actions which are mentioned below:
- Dynamic Data: We can save and change values which get updated when the user performs some actions like number in the counter or the user types in the field.
- Automatic Updates: React automatically updates the user interface when there is change in the state of the component.
- Simpler Code: In the functional component it is easier to write the code, without the help of the lifecycle methods which is used in the class components.
Common Use Cases of State in Functional Components
- Form Handling: Managing form input values dynamically.
const [name, setName] = useState("");
const handleInputChange = (e) => setName(e.target.value);
- Conditional Rendering: Display different UI elements based on state.
const [isLoggedIn, setIsLoggedIn] = useState(false);
- API Data Management: Store and display fetched data.
const [data, setData] = useState([]);
