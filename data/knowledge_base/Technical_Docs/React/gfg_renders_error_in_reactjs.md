# renders Error in ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-solve-too-many-re-renders-error-in-reactjs/

"Too many re-renderers" is a React error that happens after you have reached an infinite render loop, typically caused by code that, in a useEffect hook or the main body of the component itself, unconditionally calls state setters.
Prerequisites
Understanding too many re-renders Error
The "Too Many Re-renders" error occurs when
- The state or props in a component are updated continuously in a way that triggers repeated re-renders, creating an infinite loop.
- This can happen if state updates are triggered inside the render method or in useEffect() hooks without proper dependencies, which leads to continuous state updates and re-renders.
How React Re-renders Components
- Initially, when a component is mounted (or the component lifecycle starts), it is rendered once.
- React listens for changes to state or props. When state or props change, React will re-render the component and any child components that depend on the updated data.
- If state updates are not handled properly, React keeps re-rendering components, leading to the "Too Many Re-renders" error.
Common Causes of "Too Many Re-renders" Error
1. State Update Inside Render
Directly calling setState or useState inside the render method or component body can cause an infinite loop of re-renders, as the state updates trigger a re-render, and the update itself triggers another render.
2. State Update in useEffect Without Dependency Array
If you use setState inside a useEffect hook without providing a proper dependency array, it will trigger a re-render after each render, causing an infinite loop.
3. Conditional State Updates
If a state update is being triggered under certain conditions in a way that causes it to always meet those conditions, it can cause repeated state changes and re-renders.
4. Event Handlers Causing State Updates on Every Render
If event handlers like onClick or onChange are directly updating the state in such a way that the component is constantly re-rendering, this can also lead to the "Too Many Re-renders" error.
5. Using Functions Inside useEffect that Modify State Continuously
If a function inside useEffect continuously updates state based on a condition that keeps triggering the effect, it can lead to an infinite re-render loop. For example, using state values directly inside useEffect that causes frequent updates.
Tips to avoid too many re-renders errors in React
Encountering a "too many re-renders" error can be frustrating.
Remember the below tips to avoid the error in React
- Don't change the state in the main body of the component.
- Use the useEffect hook very cautiously. The second parameter of useEffect is an array of states based on the useEffect will call. So don't update those states in useEffect otherwise, it will rerender the component again and again.
- Use React shouldComponentUpdate: React shouldComponentUpdate is a method for optimizing performance, which tells React to stop re-rendering a component, even though it might have changed the state or prop values. Using this approach only if a part stays unchanged or pure while it is used. You are expected to return a Boolean value with the React shouldComponentUpdate method. Return true if it needs to re-render or false to avoid being re-render.
Preventing Too Many re-renders Error in ReactJS
Example 1: Below is an example of how to use React shouldComponentUpdate. I've built 2 components of React in this code. One is a part of the greeting, and the other is the app component. During the render lifecycle, each React component is a console logging a message.
// Filename- App.js
import React from "react";
class Greeting extends React.Component {
    render() {
        console.log("Greeting - Render lifecycle");
        return <h1>Geeksforgeeks</h1>;
    }
}
class App extends React.Component {
    render() {
        console.log("App - Render lifecycle");
        return <Greeting />;
    }
}
export default App;
Output
Example 2: Next, in the componentDidMount React lifecycle, I will add the React state, and update the state value.
// Filename- App.js
import React from "react";
class Greeting extends React.Component {
    render() {
        console.log("Greeting - Render lifecycle");
        return <h1>Geeksforgeeks</h1>;
    }
}
class App extends React.Component {
    state = {
        greeted: false,
    };
    componentDidMount() {
        this.setState({ greeted: true });
    }
    render() {
        console.log("App - Render lifecycle");
        return <Greeting />;
    }
}
export default App;
Step to run the application: Open the terminal and type the following command.
npm start
Output
Example 3: Use the shouldComponentUpdate hook when it is clear that at all times a component we are creating will be static.
// Filename - App.js
import React from "react";
class Greeting extends React.Component {
    shouldComponentUpdate() {
        console.log("Greeting - shouldComponentUpdate lifecycle");
        return false;
    }
    render() {
        console.log("Greeting - Render lifecycle");
        return <h1>Geeksforgeeks</h1>;
    }
}
class App extends React.Component {
    state = {
        greeted: false,
    };
    componentDidMount() {
        this.setState({ greeted: true });
    }
    render() {
        console.log("App - Render lifecycle");
        return <Greeting />;
    }
}
export default App;
Output
Conclusion
The "Too many re-renders" error in React occurs due to infinite re-render loops, usually due to improper state update and incorrect hook usage. To avoid and resolve this error ensure state updates are correct and hooks are used properly.
