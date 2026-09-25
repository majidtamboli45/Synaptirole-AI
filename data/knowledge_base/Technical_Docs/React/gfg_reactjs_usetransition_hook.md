# ReactJS useTransition Hook

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-usetransition-hook/

When building interactive user interfaces, performance is a crucial aspect to consider. One way to improve the performance of a React application is by using the useTransition hook. This hook allows you to specify some state updates as not as important, by separating the animation-related state changes from the other state changes in your component.
In this article, we will explore the basics of the useTransition hook and how it can be used to improve the performance of a React application.
useTransition hook enables us to specify which state changes are critical or urgent and which are not.
All state changes are viewed as necessary in React. There may be certain quick UI updates, like selecting a value from a dropdown menu, that should take precedence over other updates, like list filtering, which might slow down their execution. A useTransition hook allows us to specify what state changes should run with a lower priority to increase the performance of our application.
Syntax:
const [isPending, startTransition] = useTransition()
The useTransition hook does not take any parameters, and it returns two values:
- isPending: a boolean indicating whether the transition is currently in progress or not.
- startTransition: a function that can be used to start the transition.
Let's see few examples of how useTransition works in practice.
Creating React Application:
Step 1: Make a project directory, head over to the terminal, and create a react app named usetransition-example using the following command:
npx create-react-app usetransition-example
Step 2: After the usetransition-example app is created, switch to the new folder usetransition-example by typing the command below:
cd usetransition-example
Project Structure: We will modify the folder and keep the files we need for this example. Now, make sure your file structure looks like this:
Example 1: We will use the useTransition hook to change the visibility of a text and to change the text itself.
index.html: Include the following code in your index.html file, located in the public folder of your project directory.
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
    <title>React useTransition hook</title>
</head>
<body>
    <div id="root"></div>
</body>
</html>
App.js:
- In this example, the component contains two buttons, the first one will toggle the isVisible state variable between true and false, and the second one will change the text.
- When the button "Toggle Visibility" is clicked, the isVisible state variable is toggled, and the startTransition function is called to start the transition, and the isPending is used to apply an opacity style to the element, and the style is changing according to the state of the transition, which is either pending or not.
import { useState, useTransition } from 'react';
import './App.css';
const App = () => {
    const [isVisible, setIsVisible] = useState(false);
    const [text, setText] = useState("Hello Geek");
    const [isPending, startTransition] = useTransition();
    const handleClick = () => {
        setIsVisible(!isVisible);
        startTransition();
    };
    return (
        <div className='container'>
            <div className="btn-container">
                <button className='btn' onClick={handleClick}>
                    Toggle Visibility</button>
                <button className='btn' onClick={() =>
                    setText("Welcome to geeksforgeeks")}>
                    Change Text</button>
            </div>
            <div style={isPending ? 
                       { opacity: 0 } : 
                       { opacity: isVisible ? 1 : 0 }}>
                <h1>{text}</h1>
            </div>
        </div>
    );
}
export default App;
App.css: Add the following code to App.css to style the application.
.container {
    margin: 1rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    font-size: 2rem;
}
.btn-container {
    display: flex;
    flex-direction: row;
}
.btn {
    padding: 20px;
    margin: 10px;
    cursor: pointer;
    border-radius: 15px;
    font-weight: bold;
}
h1 {
    border: 4px solid darkGreen;
    border-radius: 20px;
    padding: 20px;
}
index.js: Add the following code to the index.js file.
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
Example 2: Updating list items using useTransition hook.
The startTransition will contain the setList method. This indicates that updating the state of setList is of low priority while updating the input field takes precedence. It ensures that we can still interact with our application even if our code runs slowly.
App.js:
import React, { useState, useTransition } from "react";
const defaultList = [1, 2, 3, 4, 5];
const App=()=> {
    const [name, setName] = useState("");
      const [list, setList] = useState(defaultList);
      const [isPending, startTransition] = useTransition();
      const sizeOfList = 10000;
      const handleChange=(e)=> {
        const { value } = e.target;
        setName(value);
    startTransition(() => {
        const data = [];
        for (let i = 0; i < sizeOfList; i++) {
            data[i] = value;
        }
        setList(data);
       });
}
    return (
        <>
              <input type="text" value={name} onChange={handleChange} />
              {isPending ? (
                <div>Loading...</div>
             ) : (
                   list.map((list) => {
                      return <div>List Item: {list}</div>;
                })
              )}
            </>
    );
}
export default App;
Step to run the application: Run the application by using the following command:
npm start
Output:
The input field updates instantly as we type, while the list is rendered after it finishes loading.
