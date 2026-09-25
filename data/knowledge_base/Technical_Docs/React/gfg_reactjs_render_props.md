# ReactJS Render Props

> Source: https://www.geeksforgeeks.org/reactjs/react-js-render-props/

Render Props is a React pattern that allows components to share logic by passing a function as a prop. The receiving component calls this function to render content dynamically, enabling code reuse while keeping the UI flexible.
Syntax
const DataProvider = ({ render }) => render("Hello, Render Props!");
};
const App = () => <DataProvider render={(message) => <h1>{message}</h1>} />;
In the above syntax:
- DataProvider: Takes a render function prop and calls it with a message.
- App: Passes a function to DataProvider that renders the message inside an <h1>.
How it works?
- The DataProvider component takes a render prop, which is a function.
- It calls render(data), passing the data to the function.
- The App component passes a function as a prop that renders h1 with the received message.
- This allows the logic of fetching data to be separated from how the UI renders it.
Now let's understand with a simple example
import React from 'react';
const MouseTracker = (props) => {
    const [mousePosition, setMousePosition] = React.useState({ x: 0, y: 0 });
    const handleMouseMove = (event) => {
        setMousePosition({ x: event.clientX, y: event.clientY });
    };
    return (
        <div style={{ height: '100vh' }} onMouseMove={handleMouseMove}>
            {props.render(mousePosition)}
        </div>
    );
};
const App = () => {
    return (
        <MouseTracker render={(position) => (
            <h1>Mouse Position: {position.x}, {position.y}</h1>
        )} />
    );
};
export default App;
Output:
In this example
- MouseTracker maintains the mouse position in its state.
- Passing the mouse position as an argument, it calls the render function prop
- App component provides the function that renders the mouse position.
Why Use Render Props?
Render Props provides several advantages, including:
- Code Reusability: Instead of duplicating logic across components, you can encapsulate it in one place and use a render function to dictate how the UI looks.
- Separation of Concerns: It separates business logic from UI components, making the codebase cleaner and more maintainable.
- Greater Flexibility: Unlike Higher-Order Components (HOCs), Render Props allow you to customize the way components are rendered dynamically.
Note: While Render Props was a popular pattern in React for sharing reusable logic, it is now less common in modern React development. In many cases, Custom Hooks have replaced Render Props due to their simplicity and improved readability.
Passing Functions as Props
This example demonstrates the render props pattern in React where a function is passed to child component. The child component uses the render prop and display additional content.
import React from "react";
class App extends React.Component {
    render() {
        return (
            <div>
                <h1>Render Props Example</h1>
                <SampleRenderProps />
            </div>
        );
    }
}
// Child component getting render props
class RenderPropsComponent extends React.Component {
    render() {
        return (
            <div>
                <h2>I am Child Component</h2>
                {this.props.render()}
            </div>
        );
    }
}
// Parent component sending render props to the child
class SampleRenderProps extends React.Component {
    render() {
        return (
            <RenderPropsComponent
                render={() => {
                    return (
                        <div>
                            <h3>I am coming from render props</h3>
                        </div>
                    );
                }}
            />
        );
    }
}
export default App;
Output
In this example
- SampleRenderProps passes a render function to RenderPropsComponent.
- RenderPropsComponent calls this.props.render() inside JSX.
- Parent controls what gets rendered inside the child dynamically.
- It enables flexible and reusable UI rendering.
Use Cases for Render Props
- Mouse Tracking: Dynamically manages the mouse cooridnates.
- Form Handling: Efficiently manages the form state.
- Authentication: Based on Authentication State, they render UI.
- Data Fetching : For fetching the API, they reuse the logic.
- Animation Control: Dynamically manages the animations.
Render Props vs. Higher-Order Components (HOCs) vs. Custom Hooks
Both Render Props and HOCs aim to share reusable logic among components, but they do so differently. With Hooks, React now offers an even better alternative.
| Render Props | Higher-Order Components (HOC) | Custom Hooks | 
|---|---|---|
| Passes a function as a prop | Wraps a component and injects props | Uses a function that manages state and logic | 
| Can lead to function nesting | Can lead to wrapper hell | Clear and concise | 
| May cause re-renders if function is created inline | Potential for prop conflicts | Optimized for reuse |
