# ReactJS Component Composition

> Source: https://www.geeksforgeeks.org/reactjs/react-js-component-composition/

In React, it becomes difficult to manage the complex UI components and maintain the code. With the help of Component Compositions, we can solve this problem by combining the components into a single component.
Now let's understand this with the help of example
import React from "react";
const Header = () => <header><h1>Welcome to My Website</h1></header>;
const Content = () => <main><p>This is the main content section.</p></main>;
const Footer = () => <footer><p>© 2024 My Website</p></footer>;
const App = () => {
    return (
        <div>
            <Header />
            <Content />
            <Footer />
        </div>
    );
};
export default App;
Output
In this example
- The app component consists of three smaller components.
- The header, Content, and Footer are independent components resides under the app component
Techniques for Component Composition
Below are the techniques for component composition
Containment (Children Props)
This is mainly used when we are building reusable wrapper components.
// App.js
import React, { } from 'react'
function App() {
    const Box1 = {
        backgroundColor: "blue",
        color: "white",
        padding: "10px 20px",
        width: "20px",
        height: "50px",
    };
    const Box2 = {
        backgroundColor: "red",
        color: "white",
        padding: "12px 25px",
        width: "30px",
        height: "50px",
    };
    return (
        <div >
            <Box text="Box1" style={Box1} />
            <Box text="Box2" style={Box2} />
        </div>
    );
}
export default App;
// Box.js
import React from 'react'
function Box(props) {
    return (
        <div style={props.style}>
            {props.text}
        </div>
    )
}
export default Box
Output
In this example
- The App component renders two <Box /> components and passes the text and style props to them.
- The Box component receives props.style and props.text and applies the style dynamically while displaying the text inside a <div>.
- The Box component is generic, meaning it can be used multiple times with different styles and text, improving reusability and maintainability.
Specialization (Props-based Composition)
A specialized version of a component is created by passing props, allowing flexibility in UI design.
import React from "react";
function ChildComponent({ data }) {
    return (
        <div>
            {data}
            <div>I'm a Child Component</div>
        </div>
    );
}
function ParentComponent() {
    const data = "I'm a parent component";
    return (
        <ChildComponent data={data} />
    );
}
function App() {
    return (
        <ParentComponent />
    );
}
export default App;
Output
In this example
- The ParentComponent defines a data variable ("I'm a parent component") and passes it as a prop to ChildComponent.
- The ChildComponent receives the data prop and displays it inside a <div>, followed by another <div> with the text "I'm a Child Component".
- The execution starts from App, which calls ParentComponent, and ParentComponent then calls ChildComponent, passing down the data prop to be displayed.
Higher-Order Components (HOCs)
HOCs are functions that take a component as input and return an enhanced component. This technique is used for reusing component logic.
// App.js
import React from 'react';
import HigherOrder from './HigherOrder';
function App(props) {
    return <h1>{props.newprop}</h1>
}
export default HigherOrder(App)
// HigherOrder.js
function HigherOrder(OldComponent) {
    return function NewComponent(props) {
        return <OldComponent
            {...props} newprop="I'm the newly added prop" />;
    };
}
export default HigherOrder;
Output
In this example
- The HigherOrder function take App as an argument, modify its props (e.g., adding newprop), and return an enhanced version of App.
- Inside App, the modified prop (newprop) is accessed and displayed inside an <h1> tag.
- Instead of exporting App directly, it is exported as HigherOrder(App).
- It gets processed by the HOC before being used in the application.
Render Props
They give the more control over rendering by allowing components to pass a function as a prop.
// App.js
import React from 'react';
import JsxReceiver from './JsxReceiver.js'
function App() {
    return (
        // JsxReceiver is a Wrapper Component
        <JsxReceiver render={data => (
            <h1>{data}</h1>
        )} />
    );
}
export default App;
import React from 'react'
function JsxReceiver({ render }) {
    let data = "Welcome to GeeksforGeeks";
    return render(data);
}
export default JsxReceiver
Output
In this example
- The JsxReceiver component is used as a wrapper that takes a render prop, which is a function returning JSX.
- The render prop allows App to pass a function to JsxReceiver, which receives data and returns an <h1> element displaying that data.
- JsxReceiver will call the function provided in the render prop and pass a value (data), allowing the rendering logic to be controlled dynamically.
- JsxReceiver follows the Render Prop Pattern, it can be reused with different render functions to handle various UI needs flexibly.
Use Cases of Component Composition
- Building Layout Components: It is useful in creating reusable layout structures like headers, footers, etc.
- State Management: Composition helps in managing a state efficiently by keeping it at the right level and passing it down via props.
- Form Handling: Forms with dynamic fields and validation rules can be composed of child components.
- Modularizing Large Applications: Component Composition enables breaking down large applications into smaller, maintainable components.
