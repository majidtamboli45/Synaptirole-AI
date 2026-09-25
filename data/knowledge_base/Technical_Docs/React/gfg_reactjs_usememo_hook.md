# ReactJS useMemo Hook

> Source: https://www.geeksforgeeks.org/reactjs/react-js-usememo-hook/

useMemo optimizes performance by memoizing computed values and recomputing them only when dependencies change.
- Memoizes Results: Stores the result of expensive computations.
- Dependency-Based Execution: Recomputes only when specified dependencies change.
- Improves Performance: Prevents unnecessary recalculations during re-renders.
Syntax:
const memoizedValue = useMemo(() => computeExpensiveValue(a, b), [a, b]);
- The first argument is a function that returns the computed value.
- The second argument is an array of dependencies. When any of these dependencies change, the function gets re-evaluated.
Applications of useMemo
Applications of useMemo involve improving rendering efficiency by preserving computed values across renders when their dependent data remains unchanged.
1. Optimizing Expensive Calculations
useMemo helps avoid repeated execution of heavy computations by caching calculated results until their dependencies change.
import React, { useState, useMemo } from "react";
function App() {
    const [number, setNumber] = useState(0);
    const squaredNum = useMemo(() => squareNum(number), [number]);
    const [counter, setCounter] = useState(0);
    const onChangeHandler = (e) => {
        setNumber(e.target.value);
    };
    const counterHander = () => {
        setCounter(counter + 1);
    };
    return (
        <div className="App">
            <h1>Welcome to Geeksforgeeks</h1>
            <input
                type="number"
                placeholder="Enter a number"
                value={number}
                onChange={onChangeHandler}
            ></input>
            <div>OUTPUT: {squaredNum}</div>
            <button onClick={counterHander}>Counter ++</button>
            <div>Counter : {counter}</div>
        </div>
    );
}
function squareNum(number) {
    console.log("Squaring will be done!");
    return Math.pow(number, 2);
}
export default App;
Output:
- useState manages number (user input) and counter (button clicks).
- useMemo caches squareNum(number), recalculating only when number changes.
- The input field updates the number state when changed.
- Clicking "Counter ++" increases the counter state.
- The component displays the input, memoized squared value, and counter.
2. Preventing Unnecessary Re-renders
useMemo stabilizes derived values like objects or arrays so that child components do not re-render unnecessarily due to reference changes.
import React, { useState, useMemo } from "react";
function Child({ userInfo }) {
    console.log("Child component rendered");
    return <p>User: {userInfo.name}</p>;
}
function Parent() {
    const [count, setCount] = useState(0);
    const userInfo = useMemo(() => ({ name: "GeeksforGeeks" }), []);
    return (
        <div>
            <p>Count: {count}</p>
            <Child userInfo={userInfo} />
            <button onClick={() => setCount(count + 1)}>Increment Count</button>
        </div>
    );
}
export default Parent;
Output:
- React, useState, and useMemo are imported for state management and optimization.
- ChildComponent displays userInfo.name and logs renders.
- ParentComponent memoizes userInfo to prevent re-creation.
- Clicking the button updates count, re-rendering ParentComponent.
- ParentComponent displays count, ChildComponent, and the button.
Dependency Array in useMemo
In React, the dependency array of the useMemo hook plays a critical role in determining when the memoized value should be recomputed.
1. Empty Dependency Array ([])
If the dependency array is empty, like this:
const memoizedValue = useMemo(() => computeExpensiveValue(a, b), []);
- The memoized value will only be computed once, when the component is first rendered.
- After the initial render, React will not recompute the value, even if the component re-renders, because the dependency array is empty and doesn't change.
Use case: Ideal when you need a value that doesn’t depend on any changing state or props and should only be calculated once during the component lifecycle.
2. Non-Empty Dependency Array ([a, b])
When the dependency array includes specific values, such as [a, b], like this:
const memoizedValue = useMemo(() => computeExpensiveValue(a, b), [a, b]);
- The memoized value will be recomputed only when one or more dependencies (in this case, a orb ) change.
- If neither a norb changes, the memoized value will remain the same, even if the component re-renders.
Use case: Useful when you want to recompute a value only when certain dependencies change, preventing unnecessary recalculations.
Important Considerations
- Empty dependency array ([] ): While this ensures the calculation happens only once, it can sometimes lead to stale or outdated results if the component state or props change over time but are not captured in the dependency array.
- Non-empty dependency array: When dependencies are included, be careful to correctly list all variables that affect the computation. Missing a dependency may result in incorrect behavior where the memoized value does not update as expected.
Usage of useMemo
use useMemo to optimize performance by memoizing values when needed.
- Expensive Calculations: When computations should not run unless dependencies change.
- Large Data Sets: When working with heavy data processing.
- Stable References: To prevent unnecessary re-renders of child components.
- Avoid Overuse: Use only when needed to prevent added complexity and memory overhead.
Performance Optimization Using useMemo
Using useMemo correctly can significantly enhance the performance of React applications. However, improper usage may lead to unnecessary memory usage and increased complexity. Here are some key considerations:
- Avoid using useMemo for trivial calculations: If the computation is lightweight, memoization may introduce unnecessary complexity.
- Use it for expensive calculations: Tasks such as filtering large datasets or performing intensive calculations can benefit from useMemo.
- Stabilize object and array references: When passing objects or arrays to child components, useMemo helps maintain the same reference and prevents unnecessary re-renders.
- Measure before optimizing: Always analyze your app’s performance using React DevTools or profiling tools before introducing useMemo.
