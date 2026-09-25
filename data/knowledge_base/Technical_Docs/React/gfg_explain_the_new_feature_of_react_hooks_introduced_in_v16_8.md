# Explain the new feature of React hooks introduced in React v16.8

> Source: https://www.geeksforgeeks.org/reactjs/explain-the-new-feature-of-react-hooks-introduced-in-react-v16-8/

React v16.8 is no less than a miracle for all the React developers because this version of React introduced hooks to all of us. Before its release, the developer community was tired of using class components but they still had to use them because the functional component does not provide many features that the class component provides. But after hooks, we can use those features in the functional component that was only accessible with the class component. So we can say after this version i.e. React v16.8, the popularity of the class component was reduced.
They are like the functions that help you hook into the state and lifecycle of React from the functional component. Hooks can not be used with the class component and it only works inside the functional component.
Hooks can only be called at the top of any functional component. Never ever try to call hooks inside any condition, loop, or nested functions. Hooks can be easily identified inside any functional component because they start with the "use" keyword.
There are two types of Hooks:
- built-in hooks: These are the hooks that are built-in and we have to only use those to utilize their features. Some examples of built-in hooks are "useEffect", "useMemo", "useRef" etc...
- Custom hooks: It is simply a javascript function whose name starts with the "use" keyword and it can call other hooks. In other words, custom hooks are those hooks that we have to make to get the required features.
Now for using hooks, we have to import hooks in those files where we want to use hooks.
Syntax:
- importing built-in hooks:
import { hook1,hook2,hook3.... } from 'react';
Here "hook1,hook2,hook3........." represents different hooks separated by commas that you want to import in your react component.
- importing custom hooks:
import HookName from 'filepath';
Here "HookName" is the name of the custom hook and "filepath" is the location of the file in which that hook is located
Steps to Create React Application:
Step 1: Create a React application using this command:
npx create-react-app reacthook
Step 2: After creating your project folder i.e. reacthook, move to it using this command:
cd reacthook
Project Structure:
New features of hooks in React v16.8:
1. Hooks allow us to use State inside functional Component:
We all are aware of React State. It has a very big advantage over any variable because if the variable got changed then the component will not re-render but if somehow the state got changed then the whole component will re-render.
Before React v16.8 we can only use state with class component because there "state" is a built-in object. But after this version of react, a functional component can also use state via the "useState" hook.
Syntax:
let [current state, function] = useState(Initial value of that state);
Example: In the below example we have created a state "work" whose initial value was "learning" and on button click we have changed that value. Since it is state and its value got changed that's why it re-rendered the whole component and we can see the updated value.
// Filename - App.js
import "./App.css";
import { useState } from "react";
function App() {
    let [work, setWork] = useState("Learning");
    function updateWork() {
        setWork("Learning from GFG");
    }
    return (
        <div className="App">
            <header className="App-header">
                <h1 className="gfg">GeeksforGeeks</h1>
                <h3 className="gfghook">
                    State in Functional Component
                </h3>
                <h3>{work}</h3>
                <button onClick={updateWork}>Click Here</button>
            </header>
        </div>
    );
}
export default App;
Steps to Run the Application: Run your application using the following command:
npm start
Output:
2. Hooks help us to use the life cycle features of React in functional component:
There is a hook called "useEffect" that helps us to get React life cycle feature which was only available with the class components. "useEffect" hook is like the combination of "componentDidMount", "componentDidUpdate", "componentWillUnmount". It means this hook will be called on mounting, updating the component, and before unmounting the component.
Syntax:
useEffect(function,array of dependencies)
Note: Here array of dependencies is optional
Example: In the example given below, the useEffect hook is called on the mounting of the component and after that, it will be called as many times as we update that component.
import "./App.css";
import { useState, useEffect } from "react";
function App() {
    let [count, setCount] = useState(0);
    function updateCount() {
        setCount((count = count + 1));
    }
    useEffect(() => {
        console.log("Component is mounted,updated or unmounted");
    });
    return (
        <div className="App">
            <header className="App-header">
                <h1 className="gfg">GeeksforGeeks</h1>
                <h3 className="gfghook">
                    LifeCycle features in Functional Component</h3>
                <h3>Count is {count}</h3>
                <button onClick={updateCount}>Click Here</button>
            </header>
        </div>
    );
}
export default App;
Steps to Run the Application: Run your application using the following command:
npm start
Output:
Note: After React 18 "useEffect" is called two times on mounting when we are using "StrictMode" in our "index.js" file. So since we are using "StrictMode" in our "index.js" file that's why we are getting output accordingly
3. Hooks help us to use pure component features in functional component:
Suppose there is a state which contains any value, let us say 0. Now there is a function that updates the value of the state but the new value and previous value of the state remain the same. This means that the function replaced 0 with 0. In that case, the component will re-render because states get updated.
But in reality, the updated value is the same as the previous value. So there is no such benefit of re-rendering. Therefore, React has a component called pure component which compares the previous value of state and props with the updated value. And if the updated value is the same as the previous value then it will not re-render itself and if an updated value is different from the previous value then it will re-render itself.
But before React v16.8 this feature of pure component is only accessible with class components but now we can access this feature in functional components via the "useMemo" hook.
Syntax:
useMemo(function,array of dependencies)
useMemo hook is called for the first time on mounting and after that, it is called when any of its dependencies really update means its previous value is different from the updated value.
Now we will return the code of the component from useMemo that we want to re-render only on the actual updation of any dependency. After returning we will store that in any variable and place that in the return statement of the functional component
Example:
// Filename - App.js
import { useState, useMemo } from "react";
function App() {
    let [count, setCount] = useState(0);
    function updateCount() {
        setCount((count = count + 1));
    }
    let a = useMemo(() => {
        console.log("State really got updated");
        return (
            <>
                <h1 className="gfg">GeeksforGeeks</h1>
                <h3 className="gfghook">
                    Pure Component features in Functional Component
                </h3>
                <h3>Count is {count}</h3>
                <button onClick={updateCount}>Click Here</button>
            </>
        );
    }, [count]);
    return (
        <div className="App">
            <header className="App-header">{a}</header>
        </div>
    );
}
export default App;
Steps to Run the Application: Run your application using the following command:
npm start
Output:
4. Hooks help us to manipulate DOM
Earlier DOM Manipulation was possible with createRef() method of React. But this can be done in class component only. Now, after React v16.8 we can manipulate DOM via the "useRef" hook.
Syntax:
useRef(initial value)
For DOM Manipulation we should initialize useRef with null and store that in any variable. After that where ever we have to use that useRef we will simply write:
ref={variable name in which useRef is stored}
So in the below example, we will manipulate DOM by input field so added ref={myref} in the input field.
After that, we added functionality in a function using "useRef" to show "1000" in that input field and to make the background color yellow of that input field. Then we called that function on a button click.
Example:
// Filename - App.js
import "./App.css";
import { useRef } from "react";
function App() {
    let myref = useRef(null);
    function handleDOM() {
        myref.current.value = 1000;
        myref.current.style.backgroundColor = "yellow";
    }
    return (
        <div className="App">
            <header className="App-header">
                <h1 className="gfg">GeeksforGeeks</h1>
                <h3 className="gfghook">
                    DOM Manipulation in Functional Component</h3>
                <input type="text" ref={myref}></input>
                <button onClick={handleDOM}>Click Here</button>
            </header>
        </div>
    );
}
export default App;
Steps to Run the Application: Run your application using the following command:
npm start
Output:
