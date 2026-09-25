# React useCallback Hook

> Source: https://www.geeksforgeeks.org/reactjs/react-js-usecallback-hook/

The useCallback Hook memoizes a function so it is not recreated on every render. It improves performance when passing callbacks to child components.
- Returns the same function reference until dependencies change.
- Helps prevent unnecessary re-renders.
- Useful when working with memoized child components.
Syntax:
const memoizedCallback = useCallback(() => {
// Function logic
}, [dependencies]);
- The function to be memoized is passed as a parameter to useCallback.
- An array of dependencies determines when the function should be recreated.
Without the useCallback Hook
This example creates a counter app without using the useCallback Hook.
import React, { useState } from "react";
const funcSet = new Set();
const App = () => {
    const [prev, setPrev] = useState(0);
    const [num, setNum] = useState(0);
    const incPrev = () => setPrev(prev + 1);
    const decPrev = () => setPrev(prev - 1);
    const incNum = () => setNum(num + 1);
    funcSet.add(incPrev);
    funcSet.add(decPrev);
    funcSet.add(incNum);
    alert(funcSet.size);
    return (
        <div>
            <h2>Without useCallback Hook</h2>
            <button onClick={incPrev}>Increase Counter</button>
            <button onClick={decPrev}>Decrease Counter</button>
            <button onClick={incNum}>Increase Number</button>
        </div>
    );
};
export default App;
- useState manages prev and num states.
- Functions update prev and num values.
- Functions are stored in a Set, which only keeps unique values.
- Clicking a button updates the state and displays the function count in an alert.
The issue here is that every time the component re-renders, new function references are created, causing unnecessary re-renders of child components and inefficient memory usage.
Using useCallback Hook
To solve this problem, we can use the useCallback hook. The useCallback hook is essential for optimizing performance in React applications, especially when passing callbacks to child components.
import React, { useState, useCallback } from "react";
const funcSet = new Set();
const App = () => {
    const [prev, setPrev] = useState(0);
    const [num, setNum] = useState(0);
    const incPrev = useCallback(() => setPrev(prev + 1), [prev]);
    const decPrev = useCallback(() => setPrev(prev - 1), [prev]);
    const incNum = useCallback(() => setNum(num + 1), [num]);
    funcSet.add(incPrev);
    funcSet.add(decPrev);
    funcSet.add(incNum);
    alert(funcSet.size);
    return (
        <div>
            <h2>With useCallback Hook</h2>
            <button onClick={incPrev}>Increase Counter</button>
            <button onClick={decPrev}>Decrease Counter</button>
            <button onClick={incNum}>Increase Number</button>
        </div>
    );
};
export default App;
- useState manages prev and num states.
- useCallback memoizes incPrev, decPrev, and incNum to prevent unnecessary function re-creations.
- Functions update prev and num when called.
- The funcSet keeps track of unique function references.
- Clicking a button updates the corresponding state and displays the function count in an alert.
Output
Scenario to Use useCallback
You should use useCallback when
- Passing functions as props to child components to prevent unnecessary re-renders.
- Avoiding unnecessary function re-creations inside useEffect or event handlers.
- Ensuring function references remain stable across renders.
However, avoid overusing useCallback, as it adds an extra layer of complexity and can sometimes lead to premature optimizations.
Example:
Parent Component (using useCallback):
import React, { useState, useCallback } from 'react';
import Child from './Child';
function Parent() {
  const [prev, setPrev] = useState(0);
  // Using useCallback to memoize the function and prevent unnecessary re-renders of the child component
  const increment = useCallback(() => {
    setCount((prevCount) => prevCount + 1);
  }, []); // Only recreate the function if dependencies change (in this case, none)
  return (
    <div>
      <h1>Count: {prev}</h1>
      {/* Pass the memoized function to the child */}
      <Child onIncrement={increment} />
      <button onClick={() => setPrev(prev + 1)}>Update Parent</button>
    </div>
  );
}
export default Parent;
Child Component:
import React, { memo } from 'react';
function Child({ onIncrement }) {
  console.log('Child re-rendered!');
  
  return (
    <div>
      <button onClick={onIncrement}>Increment from Child</button>
    </div>
  );
}
// Memoizing the child component to avoid unnecessary renders when props don't change
export default memo(Child);
- useCallback memoizes the increment function so it isn’t recreated on every parent render.
- React.memo prevents the child from re-rendering unless its props change.
- When the parent re-renders, the child stays the same because the function reference doesn’t change.
Without useCallback:
If we didn't use useCallback, the increment function would be re-created every time the parent re-renders, causing the child component to re-render as well.
useCallback vs useMemo
The useCallback and useMemo Hooks are similar, but they serve different purposes:
- useCallback returns a memoized function, ensuring its reference remains stable across renders.
- useMemo returns a memoized value, optimizing expensive calculations by caching the result.
- Use useCallback for passing stable function references, and useMemo for optimizing computations.
Performance Considerations
Using useCallback correctly can enhance performance, but excessive use may introduce unnecessary complexity. Here are some best practices:
- Use it for expensive function recreations: Especially for passing stable function references.
- Avoid unnecessary usage: If a function is recreated but doesn't cause performance issues, useCallback may not be needed.
- Optimize interactions between parent and child components: Helps prevent unnecessary re-renders.
- Measure before optimizing: Use React DevTools to analyze performance before applying useCallback.
