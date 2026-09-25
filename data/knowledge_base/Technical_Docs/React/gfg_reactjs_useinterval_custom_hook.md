# ReactJS useInterval Custom Hook

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-useinterval-custom-hook/

JavaScript setInterval() repeatedly executes a function with a fixed time delay. It can be challenging to use the setInterval method in React. For instance, if we wish to update the delay parameter, we might have to deal with a lot of life cycle methods. To avoid this hassle, we can use a custom useInterval hook.
The useInterval hook implements the setInterval method in a declarative manner. By combining the setInterval and clearInterval methods, the useInterval hook sets up an interval and then clears it upon unmounting. We can simply declare an interval with a delay. The arguments for the useInterval hooks can be dynamic. This enables us to have a dynamically adjusted delay without having to worry about the start or end of an interval.
In terms of usage, useInterval resembles setInterval quite a bit:
Syntax:
useInterval(() => {
// func
}, delay);
React useInterval Hook accepts a function and a delay where,
- func: It is the function that executes repeatedly after a delay.
- delay: The delay is the time between two successive executions of the function.
Note: The arguments are dynamic, unlike those in the setInterval method.
Let's look at an example of how to use the useInterval custom hook in React:
Approach: We will create a counter with a dynamically adjustable delay using the useInterval custom hook.
Implementation and Setup for Creating React Application:
Step 1: Make a project directory, head over to the terminal, and create a react app named counter using the following command:
npx create-react-app counter
After the counter app is created, switch to the new folder counter by typing the command below:
cd counter Step 2: Modify Your project structure. Add a useInterval.js file in the src folder. We will modify the folder and keep the files we need for this example. Now, make sure your file structure looks like this:
Step 3: Include the following code in your index.html file, located in the public folder of your project directory.
File name: index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" 
        content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta name="description" 
        content="Web site created using create-react-app" />
    <title>Counter App</title>
</head>
<body>
    <div id="root"></div>
</body>
</html>
Step 4: Creating the useInterval custom hook. In the useInterval.js file, we will write a function to create a custom useInterval hook which we can use in our counter application.
- The useInterval function takes in a callback function and a delay as arguments.
- This delay is not a hardcoded number and will be a dynamic parameter.
- We will use the useRef() hook to create a ref for the callback function.
- The useEffect hook cleans up the previous effects, but the setInterval method still references the old state since we do not reset the time.
- Therefore, we create a savedCallback as a mutable variable that persists between the renders and keeps track of the previous callbacks.
- We will save the callback as savedCallback.current.
- We can access this value when we set up an interval.
- We will pass in the delay as a dependency of the useEffect since it changes between renders.
- Therefore, the counter resets whenever the delay time is adjusted.
File name: useInterval.js
import React, { useState, useEffect, useRef } from 'react';
// creating the custom useInterval hook 
export function useInterval(callback, delay) {
    // Creating a ref 
    const savedCallback = useRef();
    // To remember the latest callback .
    useEffect(() => {
        savedCallback.current = callback;
    }, [callback]);
    // combining the setInterval and 
    //clearInterval methods based on delay.
    useEffect(() => {
        function func() {
            savedCallback.current();
        }
        if (delay !== null) {
            let id = setInterval(func, delay);
            return () => clearInterval(id);
        }
    }, [delay]);
}
Step 5: Creating the counter component.
- We will use the useState and useInterval custom hooks to implement the counter.
- We will pass in the logic and the delay argument inside our custom useInterval hook.
- We will have a button to toggle play or pause the counter.
- We will enter the delay time as the input field and click on the play button.
- The delay will have a null value to pause the counter.
File name: App.js
import './App.css';
import { useState } from 'react'
//Import the custom hook
import { useInterval } from './useInterval'
export default function App() {
    // The counter
    const [count, setCount] = useState(0)
    // Updating the delay dynamically 
    const [delay, setDelay] = useState()
    // Toggle play pause the counter
    const [isPlaying, setPlaying] = useState(false)
    useInterval(
        () => {
            //counter function
            setCount(count + 1)
        },
        // Passing in the delay parameter. null stops the counter. 
        isPlaying ? delay : null,
    )
    const handleChange = (e) => {
        setDelay(e.target.value)
    }
    return (
        <>
            <div className='counterStyle'>
                <h1>Let's begin counting!</h1>
                <h1>{count}</h1>
                <button className='btn' onClick={() => 
                    setPlaying(!isPlaying)}>
                    {isPlaying ? 
                    'Pause⏸' : 
                    'Play ▶'}
                </button>
                <p>
                    <label htmlFor="delay">Delay: </label>
                    <input
                        type="text"
                        name="delay"
                        onChange={handleChange}
                        value={delay}
                        placeholder='Enter delay time'
                    />
                </p>
            </div>
        </>
    )
}
Step 6: Add the following code to App.css to style the counter application.
File name: App.css
.counterStyle {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    border: 2px solid darkGreen;
    margin: 2rem;
}
.btn {
    background-color: darkgreen;
    color: white;
    border-radius: 10px;
    font-size: 1rem;
    padding: 10px;
}
Step 7: Add the following code in the index.js file. The index.js file serves as the main entry point, and inside it, the App.js file is rendered at the root ID of the DOM.
File name: index.js
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>
);
Step to run the application: Run our application by using the following command:
npm start Output: By default, the React project will run on port 3000. You can access it at localhost:3000 on your browser. You can start the counter by entering the delay time in milliseconds and clicking on the play button.
