# ReactJS useLocalStorage Custom Hook

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-uselocalstorage-custom-hook/

useLocalStorage hook makes it easy. It creates a stateful value for localStorage and gives us a function to update that value like useState.
In our projects, we frequently use localStorage and state but it's a bit tricky to work localStorage's value with the state.
Syntax:
const [ count, setCount ] = useLocalStorage(key, defaulValue)
Setting up Application: Follow the below steps to set up the application:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: create a hooks folder in src/hooks.
mkdir src/hooks
Project Structure: The project should look like below:
Example 1: Below example will illustrate the use of useLocalStorage:
useLocalStorage.js:
Create
The useLocalStorage.js in the hooks folder.
import { useState } from "react";
const useLocalStorage = (key, defaultValue) => {
    // Create state variable to store 
    // localStorage value in state
    const [localStorageValue, setLocalStorageValue] = useState(() => {
        try {
            const value = localStorage.getItem(key)
            // If value is already present in 
            // localStorage then return it
            
            // Else set default value in 
            // localStorage and then return it
            if (value) {
                return JSON.parse(value)
            } else {
                localStorage.setItem(key, JSON.stringify(defaultValue));
                return defaultValue
            }
        } catch (error) {
            localStorage.setItem(key, JSON.stringify(defaultValue));
            return defaultValue
        }
    })
    // this method update our localStorage and our state
    const setLocalStorageStateValue = (valueOrFn) => {
        let newValue;
        if (typeof valueOrFn === 'function') {
            const fn = valueOrFn;
            newValue = fn(localStorageValue)
        }
        else {
            newValue = valueOrFn;
        }
        localStorage.setItem(key, JSON.stringify(newValue));
        setLocalStorageValue(newValue)
    }
    return [localStorageValue, setLocalStorageStateValue]
}
export default useLocalStorage;
Now your custom hook is ready to use in your component like below.
App.js:
Write the below code in the app.js file.
import useLocalStorage from "./hooks/useLocalStorage";
const App = () => {
    const [count, setCount] = useLocalStorage("count", 0);
    return (
        <div style={{ display: "grid", placeItems: "center" }}>
            <h1 style={{ color: "green" }}>GeekForGeeks</h1>
            <h2>useLocalStorage</h2>
            <h4>Count - {count}</h4>
            <button onClick={() => setCount((prevCount) => prevCount + 1)}>
                Increment
            </button>
        </div>
    );
};
export default App;
Steps to run the application: Write the below code in the terminal to run the application:
npm start
Output:
Example 2: Let's build another example with useLocalStorage custom hook
App.js:
Write the below code in the app.js file.
import useLocalStorage from "./hooks/useLocalStorage";
const App = () => {
    const [show, setShow] = useLocalStorage("show", true);
    return (
        <div style={{ display: "grid", placeItems: "center" }}>
            <h1 style={{ color: "green" }}>GeekForGeeks</h1>
            <h2>useLocalStorage</h2>
            <h4>{show ? "GFG" : null}</h4>
            <button onClick={() => setShow((prev) => !prev)}>
                Toggle</button>
        </div>
    );
};
export default App;
Output:
