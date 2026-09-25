# How to pass multiple props in a single event handler in ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-pass-multiple-props-in-a-single-event-handler-in-reactjs/

To pass multiple props in a single event handler in ReactJS we can create a function to handle the event that accepts multiple props or calls multiple methods. It is a normal task while creating a react project to perform multiple operations for some events.
Prerequisites
To pass/call the multiple props methods in a single event handler in ReactJS there are two ways to make it work.
Method 1: Defining specific methods
We can make a separate method for the event and call all the props methods in that method.
Syntax
const seperateMethod = () => {
props.method1()
props.method2()
}
Method 2: Using anonymous methods
We can create an anonymous function and call all the props methods inside the anonymous method.
Syntax
<Component onClick={() => {
props.method1();
props.method2()
}}>
</Component>
Steps to create React Application
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure:
Example: Passing multiple props in a single event handler with both methods
import React from 'react';
export default class App extends React.Component {
    sayHi = () => {
        alert("Hi from GFG");
    }
    sayHello = () => {
        alert("Hello from GFG");
    }
    render() {
        return (
            <div style={{ marginLeft: 50 }}>
                <Child1 m1={this.sayHi}
                    m2={this.sayHello} >
                </Child1>
                <br></br>
                <Child2 m1={this.sayHi}
                    m2={this.sayHello}>
                </Child2>
            </div>
        )
    }
}
// Method 1
class Child1 extends React.Component {
    seperatemethod = () => {
        this.props.m1();
        this.props.m2();
    }
    render() {
        return (
            <div>
                <button onClick={this.seperatemethod}>
                    Hello Hi from GFG
                </button>
            </div>
        )
    }
}
// Method 2
class Child2 extends React.Component {
    render() {
        return (
            <div>
                <button onClick={() => {
                    this.props.m1();
                    this.props.m2();
                }}
                >Hello hi from GFG</button>
            </div>
        )
    }
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
