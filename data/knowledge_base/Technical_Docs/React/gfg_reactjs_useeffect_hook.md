# ReactJS useEffect Hook

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-useeffect-hook/

The useEffect hook is one of the most commonly used hooks in ReactJS, used to handle side effects in functional components. Before hooks, these kinds of tasks were only possible in class components through lifecycle methods like componentDidMount, componentDidUpdate, and componentWillUnmount.
- Fetching data from an API.
- Setting up event listeners or subscriptions.
- Manipulating the DOM directly (although React generally handles DOM manipulation for you).
- Cleaning up resources when a component unmounts.
Syntax:
useEffect(() => {
    // Code to run on each render
    return () => {
        // Cleanup function (optional)
    };
}, [dependencies]);
- Effect function: This is where your side effect code runs.
- Cleanup function: This optional return function cleans up side effects like subscriptions or timers when the component unmounts.
- Dependencies array: React re-runs the effect if any of the values in this array change.
Working of useEffect
useEffect runs side effects after rendering and manages updates based on dependencies.
- Initial Render Happens: React renders the component and updates the DOM.
- useEffect Executes After Render: It runs after the paint, not during render.
- Dependencies Are Checked: Runs after every render without a dependency array, once on mount with [], and only on dependency change when values are provided.
- Cleanup Function Runs: Before the effect re-runs or the component unmounts, the cleanup function (returned from useEffect) is executed.
- Effect Re-runs: If dependencies changed, the effect runs again, after cleanup.
Now let's see how to implement useEffect Hook in ReactJS
//HookCounterOne.js
// useEffect is defined here
import { useState, useEffect } from "react";
function HookCounterOne() {
    const [count, setCount] = useState(0);
    useEffect(() => {
        document.title = `You clicked ${count} times`;
    }, [count]);
    return (
        <div>
            <button onClick={() => setCount((prevCount) => prevCount + 1)}>
                Click {count} times
            </button>
        </div>
    );
}
export default HookCounterOne;
//App.js 
// Importing and using HookCounterOne
import React from "react";
import "./App.css";
import HookCounterOne from "./components/HookCounterOne";
function App() {
    return (
        <div className="App">
            <HookCounterOne />
        </div>
    );
}
export default App;
- useEffect triggers a function on every component render, using React to execute specified tasks efficiently.
- Positioned within the component, it grants easy access to state and props without additional coding.
- For replicating lifecycle methods in functional components, copy and customize the provided code snippet according to your needs.
Controlling side effects in useEffect
1. To run useEffect on every render do not pass any dependency
import React, { useState, useEffect } from "react";
function App() {
  const [count, setCount] = useState(0);
  useEffect(() => {
    console.log("useEffect ran on every render");
  });
  return (
    <div>
      <h1>Count: {count}</h1>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}
export default App;
Output:
2. To run useEffect only once on the first render pass any empty array in the dependency
import React, { useEffect } from 'react';
function App() {
  useEffect(() => {
    console.log("This runs only once on the first render!");
    // You can put any initialization logic here
    // e.g., API call, event listener, analytics tracking
  }, []); // Empty array ensures it runs only on mount
  return (
    <div>
      <h1>useEffect with Empty Dependency Array</h1>
      <p>Open the console to see the effect log.</p>
    </div>
  );
}
export default App;
Output:
useEffect with Empty Dependency Array
Open the console to see the effect log.
3. To run useEffect on change of a particular value. Pass the state and props in the dependency array
import React, { useEffect, useState } from 'react';
interface AppProps {
  userId: number;
}
function App({ userId }: AppProps) {
  const [count, setCount] = useState(0);
  useEffect(() => {
    console.log(`Effect ran because count or userId changed!`);
    console.log(`Count: ${count}, User ID: ${userId}`);
    // Example: Fetch data when count or userId changes
    // fetchData(count, userId);
  }, [count, userId]); // Runs whenever count or userId changes
  return (
    <div>
      <h1>useEffect on Specific Value Change</h1>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment Count</button>
    </div>
  );
}
export default App;
Output:
Effect ran because count or userId changed!
Count: 0, User ID: <value passed in props>
Ways to mimic lifecycle methods using useEffect hook
The useEffect() hook is not only used for handling side effects, but it also allows functional components to replicate the behavior of class-based lifecycle methods like:
- Mimicking componentDidMount: To run code once when the component mounts, pass an empty dependency array ([]) to useEffect. This ensures the effect runs only once, similar to componentDidMount.
useEffect(() => {
    console.log("Component mounted (Functional)");
}, []);
- Mimicking componentDidUpdate: To run code every time a specific state or prop changes, include those variables in the dependency array. This simulates componentDidUpdate.
useEffect(() => {
    console.log("Component updated (Functional)");
}, [value1, value2]);
- Mimicking componentWillUnmount: To run cleanup logic when the component unmounts, return a cleanup function from useEffect. This simulates componentWillUnmount.
useEffect(() => {
    return () => {
        console.log("Component unmounted (Functional)");
    };
}, []);
Cleaning Up Side Effects
useEffect allows you to clean up after your effects by returning a cleanup function. This is particularly useful for:
- Removing event listeners.
- Canceling network requests.
- Clearing timers or intervals.
Example: When a timer is set, it should be cleared on unmount or dependency change to prevent memory leaks.
import { useEffect, useState } from "react";
function TimerComponent() {
  const [count, setCount] = useState(0);
  useEffect(() => {
    const interval = setInterval(() => {
      setCount((prev) => prev + 1);
    }, 1000);
    //Cleanup function to clear the interval
    return () => {
      clearInterval(interval);
      console.log("Interval cleared");
    };
  }, []); // Runs only once when the component mounts
  return <h1>Timer: {count} seconds</h1>;
}
export default TimerComponent;
