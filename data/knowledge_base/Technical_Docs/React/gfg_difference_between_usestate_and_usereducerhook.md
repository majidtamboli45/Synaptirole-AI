# Difference Between useState and useReducerHook

> Source: https://www.geeksforgeeks.org/reactjs/difference-between-usestate-and-usereducer/

React offers powerful tools, like useState for simple tasks, making it a friendly companion, and useReducer for complex challenges, functioning like a superhero team. While both manage information, useState is ideal for everyday simplicity, resembling a sticky note, while useReducer shines in intricate scenarios, handling simultaneous complex tasks. The choice between them depends on the nature of your website's needs and the level of complexity involved.
useState Hook
The useState hook is used to manage the state in a functional component. A basic hook allows you to declare a state variable and a function to update it.
Syntax
const [state, setState] = useState(initialState);
- state: The current state value.
- setState: A function that allows you to update the state.
/* Write CSS Here */
.App {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
body {
    background-color: rgb(254, 226, 190);
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
import React, { useState } from "react";
import "./App.css";
const App = () => {
    const [num, setNum] = useState(0);
    const handleClick = () => {
        setNum(num + 1);
    };
    return (
        <div className="App">
            <h2> {num}</h2>
            <button onClick={handleClick}>Add one</button>
        </div>
    );
};
export default App;
Output
useReducer Hook
The useReducer hook is like the superhero of state management. It brings a more advanced toolkit to the table, allowing you to tackle complex state logic with finesse. Its real magic shines through when you're dealing with state transitions that hinge on knowing what happened in the previous state. It's basically your go-to when things start getting a bit tricky.
Syntax
const [state, dispatch] = useReducer(reducer, initialState);
- state: The current state value.
- dispatch: A function that allows you to trigger state transitions by dispatching actions.
- reducer: A function that specifies how the state should change in response to dispatched actions.
.App {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
body {
    background-color: rgb(254, 226, 190);
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
import "./App.css";
import Counter from "./components/Counter";
function App() {
    return (
        <>
            <Counter />
        </>
    );
}
export default App;
import React, { useReducer } from "react";
const initialState = { count: 0 };
function reducer(state, action) {
    switch (action.type) {
        case "increment":
            return {
                count: state.count + 1,
            };
        default:
            return state;
    }
}
function Counter() {
    const [state, dispatch] = useReducer(reducer, initialState);
    return (
        <div className="App">
            <h2>{state.count}</h2>
            <button
                onClick={() =>
                    dispatch({
                        type: "increment",
                    })
                }
            >
                Add One
            </button>
        </div>
    );
}
export default Counter;
Output
When to use useState?
- For simple state management with independent updates.
- When the state transitions are not complex and do not depend on the previous state.
- When dealing with a single piece of state.
When to use useReducer?
- For more complex state logic.
- When state transitions depend on the previous state.
- When managing multiple related pieces of state.
Difference Between useReducer and useState hook
| Feature | useState | useReducer | 
|---|---|---|
| Complexity | Simple and straightforward. | More complex, suitable for intricate state transitions. | 
| Use Case | Ideal for independent state updates. | Suitable for managing complex state logic, especially when transitions depend on the previous state. | 
| Syntax | const [state, setState] = useState(initialState); | const [state, dispatch] = useReducer(reducer, initialState); | 
| State Logic | Limited for simple state scenarios. | Allows for centralized state transition logic using a reducer function. | 
| Dependencies | No dependencies on the previous state. | Can take advantage of the previous state in the reducer function. | 
| Performance | Generally performs well for simple scenarios. | Can be more optimal for complex state logic by preventing unnecessary re-renders. |
