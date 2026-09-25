# ReactJs useDebugValue Hook

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-usedebugvalue-hook/

React useDebugValue Hook is introduced for the ReactJs versions above 18. React useDebugValue Hook helps developers debug custom hooks in React Developer Tools by adding additional information and labels to those hooks.
Prerequisite:
Approach:
To better understand React JS useDebugValue Hook we will create a custom hook for number count that increases the count at a set interval. Inside that we will use the useDebugValue hook to update the value in Developers tool when the count is updated.
Syntax for useDebugValue Hook:
useDebugValue(value)
Steps to Create React Application:
Step 1: Create a react project folder, for that open the terminal, and write the following command.
npm create-react-app project
Step 2: After creating your project folder(i.e. project), move to it by using the following command.
cd project
Project Structure:
Example: This example show the implementation of useDebugValue hook and display the change in React Developer tool when the count value is updated.
// Filename  - App.js
import { useDebugValue, useState } from "react";
function useCount() {
    const [count, setCount] = useState(0);
    setInterval(() => {
        setCount(count + 1);
    }, 4000);
    useDebugValue(count);
    return count;
}
function App() {
    const count = useCount();
    return (
        <div className="App">
            <button>{count}</button>
        </div>
    );
}
export default App;
Step to Run the Application: Run the application using the following command from the project's root directory.
npm start
Output:
To use the React Developer tool: On the application, right-click, from the dropdown go to Inspect, or type Ctrl+Shift+I. It opens the Chrome DevTools, now on the top bar click on the double arrows, and a dropdown shall open like this.
Now click on Components and check the Hooks.
