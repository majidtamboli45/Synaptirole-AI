# How to convert functional component to class component in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-convert-functional-component-to-class-component-in-reactjs/

ReactJS offers two primary ways of creating components: functional components and class components. While functional components are more concise and easier to reason about, there are situations where class components may be necessary with the flexibility to use lifecycle methods and manage the state in a different way.
Prerequisites
Approach to convert functional components to class components in React JS
To convert a function component to a class component we need to make the following major changes.
- Change the function to a class
- Add the render method
- Convert all functions to a method
- Add Constructor
- Replace hooks with lifecycle methods
Creating React Application
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure
It will look like the following.
Example: This is a simple React app using Functional Component.
// Filename - App.js
import React, { useState } from "react";
function App(props) {
    const [counter, setCounter] = useState(0);
    const myFunction = (e) => {
        setCounter(counter + 1);
    };
    return (
        <div
            style={{ textAlign: "center", margin: "auto" }}
        >
            <h1 style={{ color: "green" }}>
                GeeksForGeeks
            </h1>
            <h3>This is example of functional component</h3>
            <p>Hello, {props.name}</p>
            <p>Counter: {counter}</p>
            <button onClick={myFunction}>Add 1!</button>
        </div>
    );
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Example: This example involves the use of Class Component for same application
import React, { useState } from "react";
class App extends React.Component {
    // Add constructor
    constructor(props) {
        super(props);
        this.state = {
            counter: 0,
        };
        this.myFunction = this.myFunction.bind(this);
    }
    // Define methods
    myFunction(e) {
        this.setState({ counter: this.state.counter + 1 });
    }
    // Use render method
    render() {
        return (
            <div
                style={{
                    textAlign: "center",
                    margin: "auto",
                }}
            >
                <h1 style={{ color: "green" }}>
                    GeeksForGeeks
                </h1>
                <h3>This is example of class component</h3>
                <p>Hello From GFG</p>
                <p>Counter: {this.state.counter}</p>
                <button onClick={this.myFunction}>
                    Click me!
                </button>
            </div>
        );
    }
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
