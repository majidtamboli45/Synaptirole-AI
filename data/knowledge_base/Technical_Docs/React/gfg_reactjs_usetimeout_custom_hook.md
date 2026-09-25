# ReactJS useTimeout Custom Hook

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-usetimeout-custom-hook/

We often run into timeouts when building applications in React. setTimeout() executes code after a specified period only once. Usually, we don't need to worry about clearing out our timeouts when using setTimeout. However, it can be challenging to use the setTimeout method in React because we might wish to manipulate data after a certain amount of time.
Even though the component might have been removed by then, the timeout is still attempting to start. This might even cause memory leaks. To resolve this, we must keep track of the timeouts we create in our code and clean them. This will function, but it can be a hassle to remember to clean it up when you unmount, etc. Therefore, we will use a custom setTimeout hook.
The useTimeout hook implements the setTimeout method in a declarative manner. This follows similar principles to that of the custom useInterval hook.
In terms of usage, useTimeout resembles the setTimeout method quite a bit:
Syntax:
useTimeout(() => {
    // func 
}, delay);
useTimeout Hook accepts a function and a delay where,
- func: It is the function that executes repeatedly after a delay.
- delay: It indicates how long to wait before executing a function.
Let's look at an example of how to use the useTimeout custom hook in React:
Approach: We will display a message after a specified time using the custom useTimeout hook.
Start by following the steps below:
Step 1: Make a project directory, head over to the terminal, and create a react app named message using the following command:
npx create-react-app message
After the message app is created, switch to the new folder message by typing the command below:
cd message
Step 2: Modify Your project structure. Add a useTimeout.js file in the src folder. We will modify the folder and keep the files we need for this example. Now, make sure your file structure looks like this:
Step 3: Include the following code in your index.html file, located in the public folder of your project directory.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" 
          content="width=device-width, initial-scale=1" />
    <meta name="theme-color" 
          content="#000000" />
    <meta name="description" 
          content="Web site created using create-react-app" />
    <title>Message App</title>
</head>
<body>
    <div id="root"></div>
</body>
</html>
Step 4: Creating the useTimeout custom hook.
In the useTimeout.js file, we will write a function to create a custom useTimeout hook which we can use in our message application.
- The useTimeout function takes in a callback function and a delay as arguments.
- We will use the useRef() hook to create a ref for the callback function.
- We will use the useEffect hook to keep track of the most recent callbacks and to clear up the timeouts.
- The useEffect hook cleans up the previous effects, but the setTimeout method still references the old state if we do not reset the time. Therefore, we create a savedCallback as a mutable variable to track the previous callbacks.
- We will save the callback as savedCallback.current.
useTimeout.js:
import React, { useState, useEffect, useRef } from 'react';
// creating the custom useTimeout hook 
const useTimeout = (callback, delay) => {
    // Creating a ref 
    const savedCallback = useRef();
    // To remember the latest callback .
    useEffect(() => {
        savedCallback.current = callback;
    }, [callback]);
    // Setting and clearing up a timeout
    useEffect(() => {
        const func = () => {
            savedCallback.current();
        }
        if (delay !== null) {
            let id = setTimeout(func, delay);
            return () => clearTimeout(id);
        }
    }, [delay]);
};
export default useTimeout; 
Step 5: Creating the message component.
- We will use the useState and useTimeout custom hooks.
- We will display the message after 5 seconds.
- We will pass in the logic and the delay argument inside our custom useTimeout hook.
App.js:
import { React, useState } from 'react';
import './App.css';
import useTimeout from './useTimeout';
const App = () => {
    const [text, setText] = useState(false);
    
    //using the custom useTimeout hook
    useTimeout(() => {
        setText(true);
    }, 5000);
    return (
        <div className='msg'>
            <h1>
                {text
                    ? 'Hey Geek, welcome back to geeksforgeeks.'
                    : 'Your message is loading......'}
            </h1>
        </div>
    )
}
export default App; 
Step 6: Add the following code to App.css to style the message application.
App.css:
.msg {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    border: 4px solid darkGreen;
    margin: 2rem;
}
Step 7: Add the following code in index.js file. The index.js file serves as the main entry point, and inside it, the App.js file is rendered at the root ID of the DOM.
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
Step to run the application: Run the application by using the following command:
npm start
Output: By default, the React project will run on port 3000. You can access it at localhost:3000 on your browser.
In five seconds, the message will appear.
