# React useState Hook

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-usestate-hook/

The useState hook allows functional components in React to store and manage data that can change over time. It is simple to use and ideal for handling basic state updates within a component.
- It lets you add state variables to functional components.
- It is best suited for simple and straightforward state updates.
- The hook must be imported from React before using it.
Syntax
const [state, setState] = useState(initialState)
- state: It is the value of the current state.
- setState: It is the function that is used to update the state.
- initialState: It is the initial value of the state.
Working of useState()
The useState() hook allows you to add state to functional components in React. It works by:
1. Initialize State: When you call useState(initialValue), it creates a state variable and an updater function.
const [count, setCount] = useState(0);
2. State is Preserved Across Renders: React remembers the state value between re-renders of the component. Each time the component renders, React keeps the latest value of count.
3. State Updates with the Updater Function: When you call setCount(newValue) React updates the state and it re-renders the component to reflect the new state value.
<button onClick={() => setCount(count + 1)}>Increment</button>
4. Triggers Re-render: React will re-render only the component where useState was used, ensuring your UI updates automatically when the state changes.
Implementing the useState hook
Here is the implementation of the useState hook:
1. Counter using useState
A common example of using useState is managing the state of a counter with actions to increment and decrement the value.
import { useState } from 'react';
export default function Counter() {
    const [count, setCount] = useState(0);
    function handleClick() {
        setCount(count + 1);
    }
    return (
        <button onClick={handleClick}>
            Click {count} me
        </button>
    );
}
Output
- useState(0): Initializes count with 0.
- setCount(count + 1): Updates the state by adding 1 to the current value.
- setCount(count - 1): Decreases the state by 1.
2. Managing Form Input State
useState is also useful for handling form input fields dynamically.
import React, { useState } from 'react';
function Form() {
    const [name, setName] = useState('');
    const [age, setAge] = useState('');
    const [submitted, setSubmitted] = useState(false);
    const handleSubmit = () => {
        setSubmitted(true);
    };
    return (
        <div>
            <input
                type="text"
                value={name}
                onChange={(e) => setName(e.target.value)}
                placeholder="Enter your name"
            />
            <input
                type="number"
                value={age}
                onChange={(e) => setAge(e.target.value)}
                placeholder="Enter your age"
            />
            <button onClick={handleSubmit}>Submit</button>
            {submitted && <p>Form Submitted!</p>}
        </div>
    );
}
export default Form;
Output
- useState(''): Initializes name and age with an empty string.
- onChange={(e): setName(e.target.value)}: Updates name state as the user types.
- onChange={(e): setAge(e.target.value)}: Updates age state as the user types.
- setSubmitted(true): Marks the form as submitted.
Interesting Things About the useState Hook
- Manages Simple State Easily: useState is ideal for managing simple state updates, such as toggling values, counters, and form inputs.
const [count, setCount] = useState(0);
- Functional Updates for Previous State: When updating state based on the previous state, always use a function to ensure the correct value:
setCount(prevCount => prevCount + 1);
- Asynchronously updates the State: State updates in React are asynchronous, meaning that setState does not immediately reflect changes. Instead, updates are batched for performance.
- State Does Not Merge Automatically: Unlike this.setState in class components, useState does not merge objects automatically. You must spread the previous state manually
- Can Hold Any Data Type: useState is not limited to primitive values; it can store objects, arrays, or even functions.
- Lazy Initialization for Performance: If initializing state is expensive, you can use a function to compute it only once.
const [count, setCount] = useState(() => computeInitialValue());
- State Updates Can Be Bypassed If the Same Value is Provided: React skips re-renders if you update the state with the same value.
const [value, setValue] = useState(10);
setValue(10); 
// No re-render happens
When to Use useState
We should use the useState Hook when:
- We need a simple state management solution.
- We component has state that changes over time.
- The state does not require complex updates or dependencies.
Performance Considerations
- Avoid Re-Rendering Issues: useState updates the state asynchronously, which may cause unnecessary re-renders. To optimize this we can use functional updates for dependent state changes.
- Optimize Large Component States: For complex states, use useReducer instead of useState to prevent unnecessary re-renders and improve performance.
Also Read: useState vs useReducer
