# What is Stateful/Class Based Component in ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/what-is-stateful-class-based-component-in-reactjs/

A stateful/class-based component in React is a component that manages its internal state and re-renders when the state changes. These components are implemented using ES6 classes and extend the React.Component class. Stateful components hold and update data that affects their rendering.
- It has a state object that stores data specific to the component.
- Uses lifecycle methods for tasks like fetching data or cleaning up resources.
- They are more powerful than stateless components, as they can manage dynamic data and handle user interactions.
import React, { Component } from "react";
class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            count: 0,
        };
    }
    increment = () => {
        this.setState({ count: this.state.count + 1 });
    };
    render() {
        return (
            <div>
                <h1>Count: {this.state.count}</h1>
                <button onClick={this.increment}>Increment</button>
            </div>
        );
    }
}
export default App;
Output
In this example
- constructor(props):
  - Initializes the component’s state with a count value of 0.
  - Ensures the parent class’s constructor is called using super(props).
- state Object: Holds dynamic data for the component. In this case, it holds the count value.
- setState(): Updates the state and triggers a re-render of the component. In the example, setState is used to increment the count.
- render(): Returns the JSX (React’s syntax for UI) that will be displayed in the browser.
- Event Handling: The increment method is triggered when the button is clicked, updating the count value.
Lifecycle Methods in Class Components
Stateful components provide lifecycle methods to hook into different phases of a component's lifecycle:
- Mounting: Methods like componentDidMount() run after the component is added to the DOM.
- Updating: Methods like componentDidUpdate() are triggered when the component updates.
- Unmounting: The componentWillUnmount() method runs before the component is removed from the DOM.
Advantages of Stateful Components
- Dynamic Rendering: They allow the UI to update dynamically based on user interactions or external data changes.
- Lifecycle Management: Provide built-in lifecycle methods for handling tasks at specific stages of a component’s existence.
- Powerful Features: Can manage local state and handle complex logic.
Stateful Components vs. Functional Components
With the introduction of React Hooks in version 16.8, functional components gained the ability to manage state and lifecycle, reducing the need for class-based components. Here’s a comparison:
| Feature | Stateful/Class Components | Functional Components with Hooks | 
|---|---|---|
| Syntax | ES6 Classes | Functions with useState, useEffect | 
| State Management | this.state and setState | useState hook | 
| Lifecycle Management | Lifecycle methods | useEffect hook | 
| Boilerplate Code | More | Less | 
When to Use Class-Based Components
Class-based components are useful when you need advanced features like lifecycle methods or state management.
- When handling complex state and lifecycle logic.
- If your React version doesn’t support hooks (older versions).
- For maintaining legacy codebases already using class components.
