# How to Prevent Default Behavior in an Event Callback in React JS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-prevent-default-behavior-in-an-event-callback-in-reactjs/

React JS provides events to create interactive and responsive user interfaces. One characteristic of event handling is to prevent the default behavior of events in certain cases. This article covers the process of preventing default behavior in event callbacks within React JS.
Prerequisites:
- Basic JavaScript and ES6 concepts
- Knowledge of React JS
- Event Handling
Approach
To prevent default behaviour in event callback in react we will be using the preventDefault method. It is used to prevent the browser from executing any default action.
Steps to Create React Application
Step 1: Initialize the react app using this command in the terminal.
npx create-react-app myapp
Step 2: After creating your project folder, i.e. myapp, move to it using the following command:
cd myapp
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
Step 3: Create a basic input form to take the name input without using preventDefault funtion.
// Filename - App.js
import React, { useState } from "react";
function App() {
    const [name, setName] = useState("");
    const handleSubmit = () => {
        alert("There will be a browser reload once the alert box is closed.");
    };
    return (
        <form onSubmit={handleSubmit}>
            <input
                type="text"
                value={name}
                placeholder="Name"
                onChange={(e) => setName(e.target.value)}
            />
            <button type="submit">Click</button>
        </form>
    );
}
export default App;
We have a form element with a submit event, wrapping a button. When the button is clicked, the handleSubmit function is triggered.
Step to run the application: Use the following command to run the app and open http://localhost:3000
npm start
Output:
Preventing default behaviour
We can prevent this default behavior by making a small modification to the definition of the handleSubmit function. We call a preventDefault on the event when submitting the form, and this will cancel the default event behavior (browser refresh) while allowing us to execute any code we write inside handleSubmit.
Example: This example uses preventDefault method to prevent browsers default actions on the input field and input form.
// Filename - App.js
import React, { useState } from "react";
function App() {
    const [name, setName] = useState("");
    const handleSubmit = (event) => {
        event.preventDefault();
        alert("The browser will not reload when the alert box is closed.");
    };
    return (
        <form onSubmit={handleSubmit}>
            <input
                type="text"
                value={name}
                placeholder="Name"
                onChange={(e) => setName(e.target.value)}
            />
            <button type="submit">Click</button>
        </form>
    );
}
export default App;
Output: This is the new behavior
Conclusion
The preventDefault method is used to prevent the default browser actions hence we can use it to prevern the default action in event callbacks.
