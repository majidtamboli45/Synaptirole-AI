# ReactJS useReducer Hook

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-usereducer-hook/

The useReducer hook is an alternative to the useState hook that is preferred when you have complex state logic. It is useful when the state transitions depend on previous state values or when you need to handle actions that can update the state differently.
Syntax:
const [state, dispatch] = useReducer(reducer, initialState);
- reducer: A function that defines how the state should be updated based on the action. It takes two parameters: the current state and the action.
- initialState: The initial value of the state.
- State The current state returned from the useReducer hook.
- dispatch: A function used to send an action to the reducer to update the state.
Implementing the useReducer hook
1. Basic Counter using useReducer
A common example of using useReducer is managing the state of a counter with actions to increment and decrement the value.
import React, { useReducer } from 'react';
const counterReducer = (state, action) => {
    switch (action.type) {
        case 'INCREMENT':
            return { count: state.count + 1 };
        case 'DECREMENT':
            return { count: state.count - 1 };
        default:
            return state;
    }
};
function Counter() {
    const [state, dispatch] = useReducer(counterReducer, { count: 0 });
    return (
        <div>
            <p>Count: {state.count}</p>
            <button onClick={() => dispatch({ type: 'INCREMENT' })}>Increment</button>
            <button onClick={() => dispatch({ type: 'DECREMENT' })}>Decrement</button>
        </div>
    );
}
export default Counter;
Output
In this example
- counterReducer: A reducer function that handles two actions, INCREMENT and DECREMENT, updating the count value accordingly.
- dispatch: This function triggers the reducer with the action type (INCREMENT or DECREMENT), which updates the state.
2. Managing Complex State with Multiple Actions
For more complex state management, you can use useReducer to handle actions that affect different parts of the state, such as managing a form or multiple values at once.
import React, { useReducer } from 'react';
const initialState = { name: '', age: 0, submitted: false };
const formReducer = (state, action) => {
    switch (action.type) {
        case 'SET_NAME':
            return { ...state, name: action.payload };
        case 'SET_AGE':
            return { ...state, age: action.payload };
        case 'SUBMIT':
            return { ...state, submitted: true };
        default:
            return state;
    }
};
function Form() {
    const [state, dispatch] = useReducer(formReducer, initialState);
    const handleSubmit = () => {
        dispatch({ type: 'SUBMIT' });
    };
    return (
        <div>
            <input
                type="text"
                value={state.name}
                onChange={(e) => dispatch({ type: 'SET_NAME', payload: e.target.value })}
                placeholder="Enter your name"
            />
            <input
                type="number"
                value={state.age}
                onChange={(e) => dispatch({ type: 'SET_AGE', payload: e.target.value })}
                placeholder="Enter your age"
            />
            <button onClick={handleSubmit}>Submit</button>
            {state.submitted && <p>Form Submitted!</p>}
        </div>
    );
}
export default Form;
Output
In this example
- formReducer: The reducer function handles three actions: SET_NAME, SET_AGE, and SUBMIT. Each action updates the corresponding part of the state.
- dispatch: Dispatches actions to modify the state (e.g., setting the name or age, or marking the form as submitted).
When to Use useReducer
The state logic is complex and involves multiple sub-values or requires sophisticated updates.
- You need to manage state transitions in a predictable manner (such as when working with forms or handling multiple actions).
- You have multiple state variables that depend on each other and need to be updated together.
- The logic for updating the state is not just a simple assignment but involves computations, conditions, or complex updates.
