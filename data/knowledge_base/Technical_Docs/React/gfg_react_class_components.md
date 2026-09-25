# React Class Components

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-class-components/

Class components are ES6 classes that extend React.Component. They allow state management and lifecycle methods for complex UI logic.
- Used for stateful components before Hooks.
- Support lifecycle methods for mounting, updating, and unmounting.
The render() method in React class components returns JSX elements describing the UI of the Application.
Here is a simple class component in React
// Filename App.js
import React from "react";
class App extends React.Component {
    render() {
        return <h1>GeeksForGeeks</h1>;
    }
}
export default App;
Now your React application has a component called App, which returns a <h1> element.
To use this component in your application, use similar syntax as normal HTML: <App />
Example:
Display the App component in the "root" element:
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);
Structure of React Class Components
A typical React class component consists of the following parts:
- Class Declaration: The component is declared as a class that extends React.Component. This inheritance gives the class access to React’s methods and properties.
class Counter extends React.Component {
  // everything else goes inside this class
}
- Constructor: The constructor() method is used to initialize the component’s state and bind event handlers. It is optional, but if used, it must call super(props) to initialize the parent Component class.
class Counter extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count: 0 }; // initializing state
  }
}
- Render Method: The render() method is the only required method in a class component. It returns JSX, which represents the structure of the UI. Whenever the state or props change, the render() method is re-invoked.
render() {
  return <div>Current count: {this.state.count}</div>;
}
- State: Class components can manage their own internal state using the this.state property. The state is mutable and is used to store values that change over time, such as user input or API responses.
this.state = {
  count: 0
};
- Event Handlers: Event handlers are typically methods in the class. They are used to handle user interactions like clicks, form submissions, etc. These methods often use this.setState() to update the component's state.
increment = () => {
  this.setState({ count: this.state.count + 1 });
};
- Props in Class Components: Props allow data to flow from parent components to child components. They are accessible via this.props. Props cannot be changed by the component itself; they are controlled by the parent component.
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
