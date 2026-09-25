# How to use events in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-events-in-reactjs/

Modern webpages rely on user interactions, triggering events like clicks or keypresses. React facilitates event handling with built-in methods, allowing developers to create listeners for dynamic interfaces and responses. JavaScript events, inherent to the DOM, use bubbling propagation by default, moving upwards from children to parent elements, and can be bound either inline or in external scripts.
Prerequisites:
Approach to use Events:
Handling events with React elements is very similar to handling events on DOM elements. They only have some syntax differences.
- React events are named using camelCase, rather than lowercase.
- With JSX you pass a function as the event handler, rather than a string.
In DOM:
<button onclick="printValues()">  Print</button>
In React:
<button onClick={printValues}>  Print</button>
On submitting the form you can return false as in we do in HTML. In React JS You must call preventDefault() explicitly.
- In your, Default App.js Do the following code changes.
- Here we created an arrow function name as handleOnSubmit
- In function on we do console.warn("You clicked on submit function")
- Make a button and add event onclick={handleOnSubmit}
Steps to Create the React Application And Installing Module:
Step 1: Create a react application using the following command
npx create-react-app app-name
Step 2: Once it is done change your directory to the newly created application using the following command
cd foldername
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example: Write done the following below code in the App.js
import "./App.css";
function App() {
    const handleOnSubmit = (e) => {
        e.preventDefault();
        console.warn("You clicked on submit function")
    };
    return (
        <>
            <h1>This is React WebApp </h1>
            <form action="">
                <button type="submit" onClick={handleOnSubmit}>
                    submit
                </button>
            </form>
        </>
    );
}
export default App;
Step to run the application: Enter the following command to run the application.
npm start
Output:
