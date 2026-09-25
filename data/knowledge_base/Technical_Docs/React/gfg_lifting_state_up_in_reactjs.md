# Lifting State Up in ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/lifting-state-up-in-reactjs/

Lifting state up in ReactJS is the process of moving shared state to a common parent so multiple child components can access, update, and stay synchronized with the same data efficiently.
- Move shared state to the nearest common parent component.
- Parent holds the state instead of duplicating it in child components.
- Pass state and update functions to child components via props.
- Ensures consistency, synchronization, and easier state management in React.
Purpose of Lifting State Up in React
Lifting state up in React is used to keep shared state centralized in a parent component, ensuring consistency, enabling communication between siblings, and making state management easier as the app grows.
- Synchronization: Keeps multiple components in sync with shared state.
- Sibling Communication: Allows siblings to share and update data via the parent.
- Centralized State: Simplifies debugging, maintenance, and updates.
- Consistency: Prevents state duplication and ensures a single source of truth.
Implementing Lifting State Up in React
Lifting state up involves a few simple steps:
- Identify the shared state: Determine which state values need to be accessed or modified by multiple components.
- Move the state to the common ancestor: Find the nearest parent component that can hold the state.
- Pass the state as props: The parent component will pass the shared state and any relevant handler functions (e.g., for updating the state) to its child components via props.
- Handle state updates: The child components will use the passed-down functions to update the parent component’s state.
Example 1: If we have 2 components in our App.
- A -> B where, A is parent of B.
- keeping the same data in both Component A and B might cause inconsistency of data.
Example 2: If we have 3 components in our App.
        A
/ \
B C
- Component B has some data that component C also needs.
- Since components can only communicate with their parent or child, C cannot access B’s data directly.
Example: To create the React Application you can refer to Create a New React App.
Folder Structure:
Approach: To solve this, we will Lift the state of component B and component C to component A. Make A.js as our Main Parent by changing the path of App in the index.js file
Before:
import App from './App';
After:
import App from './A';
Filename- A.js:
import React, { Component } from 'react';
import B from './B'
import C from './C'
class A extends Component {
    constructor(props) {
        super(props);
        this.handleTextChange = this.handleTextChange.bind(this);
        this.state = { text: '' };
    }
    handleTextChange(newText) {
        this.setState({ text: newText });
    }
    render() {
        return (
            <React.Fragment>
                <B text={this.state.text}
                    handleTextChange={this.handleTextChange} />
                <C text={this.state.text} />
            </React.Fragment>
        );
    }
}
export default A;
Filename- B.js:
import React, { Component } from 'react';
class B extends Component {
    constructor(props) {
        super(props);
        this.handleTextChange = this.handleTextChange.bind(this);
    }
    handleTextChange(e) {
        this.props.handleTextChange(e.target.value);
    }
    render() {
        return (
            <input value={this.props.text}
                onChange={this.handleTextChange} />
        );
    }
}
export default B;
Filename- C.js:
import React,{ Component } from 'react';
class C extends Component {
render() {
    return (
        <h3>Output: {this.props.text}</h3>
    );
}
}
    
export default C;
Output: Now, component C can Access text in component B through component A.
