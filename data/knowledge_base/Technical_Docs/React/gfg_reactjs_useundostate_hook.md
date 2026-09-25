# ReactJS useUndoState hook

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-useundostate-hook/

The useUndoState hook is a custom hook provided by the Rooks package for React. It is similar to the useState hook in addition to undo functionality.
Arguments:
- initialValue: It is of the type boolean that describes the initial value of the state. Its default value is false.
- Options: It is of the type object which accepts a maxSize that governs the maximum number of previous states it keeps track of. Its default maxSize value is 100.
Return Value: It returns an array that has the following attributes:
- value: It describes the current value of the state.
- setValue: It is of the type function that updates the value of the state.
- undo: It is of the type function that undoes states value.
Modules Required:
- npm
- create-react-application
Creating React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-application demo
Step 2: After creating your project folder i.e. demo, move to it using the following command:
cd demo
Step 3: Install Rooks from npm.
npm i rooks
Open the src folder and delete the following files:
- logo.svg
- setupTests.js
- App.test.js
- index.css
- reportWebVitals.js
Project Structure: The project should look like this:
Example: Let's see an example of a simple counter with undo functionality.
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>
);
import React from "react";
import { useUndoState } from "rooks";
import "./App.css"
function App() {
    const [value, setValue, undo] = useUndoState(0);
    return (
        <>
            <p className="para">{value}</p>
            <div className="btns">
                <button className="btn" 
                    onClick={() => setValue(value + 1)}>
                    Increment</button>
                <button className="btn" 
                    onClick={() => setValue(value - 1)}>
                    Decrement</button>
                <button className="btn" 
                    onClick={() => setValue(value * 10)}>
                    Muiltiply by 10</button>
                <button className="btn" 
                    onClick={() => setValue(value / 2)}>
                    Divide by 2</button>
                <button className="btn" 
                    onClick={undo}>Undo</button>
            </div>
        </>
    );
}
export default App;
/* Write CSS Here */
.para {
    margin: 20px;
    margin-left: 100px;
    color: green;
    font-size: 20px;
}
.btns {
    display: flex;
    flex-direction: column;
}
.btn {
    margin: 20px;
    width: 200px;
    border-radius: 5px;
    background: rgb(206, 245, 206);
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
