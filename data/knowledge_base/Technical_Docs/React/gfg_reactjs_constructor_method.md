# ReactJS constructor() Method

> Source: https://www.geeksforgeeks.org/reactjs/react-js-constructor-method/

In React, lifecycle methods control what happens at different stages of a component’s life. The constructor() method is one of the first methods called in a class component, before it is mounted. It is mainly used to initialize state and bind event handlers before the component appears on the screen.
- It is executed before the component is rendered.
- It is used to initialize the component’s state.
- It can be used to bind event handlers to ensure the correct context.
- It is part of the Mounting Phase in React’s component lifecycle.
Syntax
class MyComponent extends React.Component {
constructor(props) {
super(props);
// Initialization code here
}
render() {
return <div>Hello, Geeks!</div>;
}
}
- The class component MyComponent extendsReact.Component , making it a class component.
- The constructor(props) runs first, andsuper(props) allows access to React.Component properties.
- The render() method returns JSX that displays<div>Hello, Geeks!</div> .
- Since no state or event binding is used, the constructor is present but does no extra work.
NOTE: When implementing the constructor for a React.Component subclass, you should call super(props) before any other statement. Otherwise, this.props will be undefined in the constructor, which can lead to bugs.
In React constructor() method is used for two purposes:
- For initializing the local state by assigning an object to this. state.
- Binding event handler methods to an instance.
Implementing the constructor() Method
Counter app
In this example we will implement the counter app using the constructor() method in react.
import React from "react";
class Counter extends React.Component {
    constructor(props) {
        super(props);  // Always call super(props) first
        // Initializing state inside the constructor
        this.state = {
            count: 0,
        };
        // Binding event handler to 'this'
        this.incrementCount = this.incrementCount.bind(this);
    }
    incrementCount() {
        this.setState({ count: this.state.count + 1 });
    }
    render() {
        return (
            <div>
                <h1>Count: {this.state.count}</h1>
                <button onClick={this.incrementCount}>Increase Count</button>
            </div>
        );
    }
}
export default Counter;
Output
In this example
- constructor(props) is used to initialize the component.
- Ensures this is properly defined before using it.
- this.state = { count: 0 } initializes the count variable.
- render() method displays the count inside an <h1> tag.
When to Use constructor() in React
The constructor() method should only be used when:
- You need to initialize state before the component mounts.
- You need to bind event handlers to the component instance.
- You have complex initial setup logic that should be executed once.
If the component does not require state initialization or event handler binding, you can skip defining a constructor.
Best Practices for Using constructor()
- Always Call super(props): You must call super(props) before using this inside the constructor to avoid errors.
- Initialize State Inside constructor(): Use this.state = {} directly inside the constructor.
- Avoid Unnecessary Logic: Avoid performing operations like API calls or setting state inside the constructor.
- Use Arrow Functions for Event Handlers: Instead of binding methods in the constructor, use arrow functions.
class MyComponent extends React.Component {
constructor(props) {
super(props);
this.handleClick = this.handleClick.bind(this);
}
handleClick() {
console.log("Button clicked!");
}
render() {
return <button onClick={this.handleClick}>Click Me</button>;
}
}
Alternatively, you can avoid binding by using arrow functions:
class MyComponent extends React.Component {
state = { count: 0 };
handleClick = () => {
this.setState({ count: this.state.count + 1 });
};
render() {
return (
<div>
<p>Count: {this.state.count}</p>
<button onClick={this.handleClick}>Increase</button>
</div>
);
}
}
Alternatives to constructor() in Modern React
With the introduction of React Hooks, functional components can now manage state and lifecycle behavior without using class components and constructors.
Using the useState Hook
function MyComponent() {
const [count, setCount] = useState(0);
return (
<div>
<p>Count: {count}</p>
<button onClick={() => setCount(count + 1)}>Increase</button>
</div>
);
}
Why Prefer Hooks Over constructor()
- Simpler Syntax: No need for constructor(), super(), or this binding.
- Less Boilerplate: Reduces the amount of code needed to manage the state.
- Better Readability: Functional components are more concise and easier to understand.
