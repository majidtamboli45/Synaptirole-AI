# ReactJS findDOMNode() Method

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-finddomnode-method/

findDOMNode in React is used to directly access a component's underlying DOM node. It is mainly used in class components for DOM manipulation, animations, or integration with third-party libraries. It's considered unsafe in modern React development.
Syntax:
ReactDOM.findDOMNode(component)
Parameters:
- component: The component can be either a React component instance or a DOM element. When passed, it retrieves the corresponding DOM node associated with the component.
Return Value:
The findDOMNode() method returns the DOM node associated with the specified React component or null if the component is not mounted.
Steps to Create React App
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Project Structure:
It will look like the following.
Example: A React component that changes the style of a specified DOM element when a button is clicked using findDOMNode().
// Filename - App.js
import React from "react";
import ReactDOM from "react-dom";
// Defining our App Component
const App = () => {
    // Function to get element from findDOMNode()
    function find() {
        const node = document.getElementById("node");
        const a = ReactDOM.findDOMNode(node);
        console.log(a);
        if (a) {
            a.style.color = "green";
            a.style.fontSize = "x-large";
        }
    }
    // Returning our JSX code
    return (
        <>
            <div>
                <h1>GeeksforGeeks</h1>
                <div id="node">DOM Node</div>
                <button onClick={find}>Click to find</button>
            </div>
        </>
    );
};
// Exporting your Default App Component
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Reference:
https://legacy.reactjs.org/docs/react-dom.html#finddomnode
