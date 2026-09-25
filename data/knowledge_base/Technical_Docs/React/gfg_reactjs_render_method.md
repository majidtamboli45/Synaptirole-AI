# ReactJS render() Method

> Source: https://www.geeksforgeeks.org/reactjs/react-js-render-method/

In React, lifecycle methods control a component’s behavior at different stages, and the render() method defines what appears on the UI and keeps it updated whenever state, props, or context change.
- It is the lifecycle method that gets called automatically.
- It must return JSX or null.
- It cannot mutate the state.
- The logic and the calculation should be written and performed outside the render() method.
Syntax
class MyComponent extends React.Component {
render() {
return <h1>Hello, World!</h1>;
}
}
How do render() Work
The render() method is called every time React determines that a component’s state or props have changed. When this happens, React re-renders the component, calling the render() method to generate a new version of the UI.
Here’s a basic example of how the render() method works
import React, { Component } from 'react';
class Welcome extends Component {
    render() {
        return <h1>Hello, {this.props.name}!</h1>;
    }
}
export default Welcome;
Output
In the example above
- Welcome is a class-based component.
- The render() method returns a simple JSX element, which displays the name prop passed to the component.
- Every time the name prop changes, the render() method will be triggered again to reflect the updated name in the UI.
Implementing render() Method
This React class component, Greeting, uses state to conditionally render a welcome message or login prompt based on the user's login status.
import React, { Component } from 'react';
class Greeting extends Component {
    constructor(props) {
        super(props);
        this.state = {
            name: 'Anjali',  // Initial state
            isLoggedIn: true,
        };
    }
    render() {
        // Conditional rendering based on state
        if (this.state.isLoggedIn) {
            return (
                <div>
                    <h1>Welcome back, {this.state.name}!</h1>
                    <button onClick={() => this.setState({ isLoggedIn: false })}>Log out</button>
                </div>
            );
        } else {
            return (
                <div>
                    <h1>Please log in.</h1>
                    <button onClick={() => this.setState({ isLoggedIn: true })}>Log in</button>
                </div>
            );
        }
    }
}
export default Greeting;
Output:
In this example
- The constructor() method initializes the component’s state with name and isLoggedIn properties.
- The render() method is responsible for returning JSX based on the component’s state.
- If isLoggedIn is true, it shows a welcome message and a "Log out" button.
- If isLoggedIn is false, it shows a "Please log in." message and a "Log in" button.
- The onClick event handlers on the buttons call this.setState() to toggle the isLoggedIn state, which triggers the re-render of the component.
In React 18, ReactDOM.render() is replaced by createRoot(). Using it triggers a warning and runs your app in React 17 compatibility mode, so you should use createRoot() to access new features.
render() in Functional Component
In functional components, the render() method does not exist explicitly. Instead, the component itself is a function that returns JSX. When state or props change, React automatically re-renders the component, and the function is called again to return the updated JSX.
import React, { useState } from 'react';
const Greeting = () => {
    const [isLoggedIn, setIsLoggedIn] = useState(true);
    const [name, setName] = useState('Anjali');
    return (
        <div>
            {isLoggedIn ? (
                <>
                    <h1>Welcome back, {name}!</h1>
                    <button onClick={() => setIsLoggedIn(false)}>Log out</button>
                </>
            ) : (
                <>
                    <h1>Please log in.</h1>
                    <button onClick={() => setIsLoggedIn(true)}>Log in</button>
                </>
            )}
        </div>
    );
};
export default Greeting;
Output:
In this example the render() method is not used, it has returned the JSX directly.
In a functional component, there is no separate "render" method because the function itself acts as the render method and they directly returns the JSX but in the class components we define a render method within the class,
Interesting Fact about the ReactJS render() Method
- Returns Virtual DOM, Not Real DOM: The render() method does not modify the real DOM directly. It updates the Virtual DOM, and React efficiently updates only the necessary changes.
class MyComponent extends React.Component {
render() {
return <h1>Hello, Virtual DOM!</h1>;
}
}
- Triggers Reconciliation Process: React compares the old Virtual DOM with the new one and updates only the changed parts, improving performance.
- Must Return a Single Parent Element: The render() method must return a single parent element. Use <div> or <React.Fragment> if needed.
class MyComponent extends React.Component {
render() {
return (
<>
<h1>Title</h1>
<p>Description</p>
</>
);
}
}
- Should Be a Pure Function: render() should be a pure function, meaning it should not modify state directly to avoid infinite loops.
render() {
this.setState({ count: this.state.count + 1 }); // Wrong!
return <h1>Count: {this.state.count}</h1>;
}
Correct Approach: Use Event Handlers or Lifecycle Methods
componentDidMount() {
this.setState({ count: this.state.count + 1 });
}
- Triggers Automatically on State or Prop Changes:
When setState() or new props are received, render() is called again automatically.
class Message extends React.Component {
render() {
return <h1>{this.props.text}</h1>;
}
}
<Message text="Hello, React!" /> // Changing props will trigger re-render
- Cannot Be Asynchronous: The render() method cannot be async. Use componentDidMount() or useEffect() for async operations.
Incorrect: Async render() (Will Cause an Error)
async render() {
const data = await fetchData(); // Wrong
return <h1>{data}</h1>;
}
Correct Approach: Use componentDidMount()
componentDidMount() {
fetch("https://api.example.com/data")
.then(response => response.json())
.then(data => this.setState({ data }));
}
