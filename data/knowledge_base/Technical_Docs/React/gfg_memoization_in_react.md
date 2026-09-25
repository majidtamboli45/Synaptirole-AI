# Memoization in React

> Source: https://www.geeksforgeeks.org/reactjs/what-is-memoization-in-react/

Memoization is a powerful optimization technique used in React to improve the performance of applications by caching the results of expensive function calls and returning the cached result when the same inputs occur again. In this article, we will learn more about the concept of memoization and its application within React.
How Memoization Works?
When a function is memoized, its return values are stored in a cache data structure, typically a hashmap or an associative array, where the function inputs serve as keys. Upon receiving new inputs, the function first checks if the result for those inputs is already cached. If a cached result exists, the function returns it directly without executing the computation again. If no cached result is found, the function computes the result, caches it, and then returns it.
How React utilizes memoization to optimize rendering performance?
In React, memoization plays a crucial role in optimizing rendering performance. Functional components can be memoized using the React.memo() higher-order component or the useMemo() hook, while class components can utilize PureComponent or shouldComponentUpdate() for memoization. By memoizing components, React ensures that they only re-render when their props or state change, preventing unnecessary re-renders and improving overall application responsiveness.
Method to demonstrate memoization
React.memo():
- React.memo() is a higher-order component provided by React that memoizes functional components.
- When wrapping a functional component with React.memo(), React memoizes the component's result. It re-renders the component only if its props have changed.
- This prevents unnecessary re-renders of components when their props remain the same, optimizing rendering performance.
Syntax:
const MemoizedComponent = React.memo(MyComponent);
useMemo() Hook:
- The useMemo() hook is used to memoize the result of expensive computations within functional components.
- It takes a function and an array of dependencies as arguments. The function is executed, and its return value is memoized. React re-executes the function only if any of the dependencies change.
- This is particularly useful for optimizing the rendering of components that perform expensive computations or calculations.
Syntax:
const memoizedValue = useMemo(() => computeExpensiveValue(dep1, dep2), [dep1, dep2]);
Benefits of Memoization
- Memoization optimizes performance by caching expensive function results.
- It conserves computational resources, reducing latency and improving efficiency.
- Memoized functions are more scalable, handling larger datasets or higher request volumes effectively.
- Memoization simplifies code by encapsulating caching logic within functions, promoting maintainability.
- In user-facing applications, memoization enhances responsiveness and reduces loading times.
- In React, memoization techniques like React.memo() and useMemo() lead to faster UI updates and smoother interactions.
Is Memorization always beneficial?
There are also some scenarios where Memorization isn't that much beneficial:
- Dynamic Data: Memoization may not be suitable for scenarios with frequently changing input data, leading to stale results.
- Large Cache Size: Maintaining a large cache can consume significant memory resources, potentially outweighing performance benefits.
- Complex Dependencies: Memoization may struggle with accurately defining dependencies in scenarios with complex data structures or functions, leading to incorrect caching.
- Garbage Collection Overhead: Caches used for memoization may accumulate unused entries over time, requiring careful management to avoid memory leaks.
- Performance Trade-offs: The overhead of caching and cache management may outweigh performance benefits in scenarios where computation costs are low.
- Concurrency and Thread Safety: Memoization introduces statefulness, potentially causing issues related to concurrency and thread safety in multi-threaded environments.
Implement React.memo() and useMemo
Step 1: Create a react application using the following command.
npx create-react-app <-foldername->
Step 2: Move to the Project folder
cd <-foldername->
Project Structure:
Dependencies:
 "dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
Step 3: Create the required files as shown in folder structure and add the following codes.
//App.js
import React, { useState } from "react"
import ExpensiveComponent from './components/ExpensiveComponent'
import MemoizedExpensiveComponent from './components/MemoizedExpensiveComponent'
import MemoizedWithHookComponent from "./components/MemoizedWithHookComponent"
function App() {
    const [inputValue, setInputValue] = useState(1);
    const handleInputChange = (e) => {
        setInputValue(parseInt(e.target.value));
    };
    return (
        <div>
            <h1>Memoization Examples</h1>
            <label>
                Input Value:
                <input type="number" value={inputValue} onChange={handleInputChange} />
            </label>
            <h2>Without Memoization:</h2>
            <ExpensiveComponent value={inputValue} />
            <h2>With React.memo():</h2>
            <MemoizedExpensiveComponent value={inputValue} />
            <h2>With useMemo() Hook:</h2>
            <MemoizedWithHookComponent value={inputValue} />
        </div>
    );
};
export default App;
//components/ExpensiveComponent.js
const computeExpensiveResult = (value) => {
    console.log('Computing expensive result...');
    let result = 0;
    for (let i = 0; i < value; i++) {
        result += Math.random();
    }
    return Math.ceil(result);
};
const ExpensiveComponent = ({ value }) => {
    const expensiveResult = computeExpensiveResult(value);
    return (
        <div>
            <p>Expensive Result: {expensiveResult}</p>
        </div>
    );
};
export default ExpensiveComponent;
//component/MemorizedWithHookComponent.js
import React, { useMemo } from 'react';
const computeExpensiveResult = (value) => {
    console.log('Computing expensive result...');
    let result = 0;
    for (let i = 0; i < value; i++) {
        result += Math.random();
    }
    return Math.ceil(result);
};
const MemoizedWithHookComponent = ({ value }) => {
    const expensiveResult = useMemo(() => computeExpensiveResult(value), [value]);
    return (
        <div>
            <p>Expensive Result: {expensiveResult}</p>
        </div>
    );
};
export default MemoizedWithHookComponent;
//components/MemorizeExpensiveComponent.js
import React from 'react';
const computeExpensiveResult = (value) => {
    console.log('Computing expensive result...');
    let result = 0;
    for (let i = 0; i < value; i++) {
        result += Math.random();
    }
    return Math.ceil(result);
};
const MemoizedExpensiveComponent = React.memo(({ value }) => {
    const expensiveResult = computeExpensiveResult(value);
    return (
        <div>
            <p>Expensive Result: {expensiveResult}</p>
        </div>
    );
});
export default MemoizedExpensiveComponent;
To start the application run the following command
npm start
Output:
