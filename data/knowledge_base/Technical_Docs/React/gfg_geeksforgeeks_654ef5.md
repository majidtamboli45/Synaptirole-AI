# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-refs/

ReactJS Refs are used to access and modify the DOM elements in the React Application. It creates a reference to the elements and uses it to modify them.
Table of Content
What is Refs in React?
Refs are a function provided by React to access the DOM element and the React elements created in components. They are used in cases where we want to change the value of a child component, without making use of props and state.
They allow us to interact with these elements outside the typical rendering workflow of React.
They have wide functionality as we can use callbacks with them.
Creating refs in React
ReactJS Refs can be created using React.createRef() function and attached to a React element via the ref attribute.
When a class component is constructed, the Refs are commonly assigned to an instance property so that they can be referenced in the component.
Example
class MyComponent extends React.Component {
constructor(props) {
super(props);
this.myCallRef = React.createRef();
}
render() {
return <div ref={this.myCallRef} />;
}
}
Detailed guide on How to create refs in React JS?
Accessing Refs in React
In React, when a ref is passed to an element in render using the ref attribute, the underlying DOM element or React component becomes accessible at the current property of the ref.
const node = this.myCallRef.current;
Now, we are going to see how we can use refs in our code which will help you to understand the use case of refs better.
Example
In this example, we use the target value of event e, for getting the value.
// Filename - App.js
// without refs
class App extends React.Component {
    constructor() {
        super();
        this.state = { sayings: "" };
    }
    update(e) {
        this.setState({ sayings: e.target.value });
    }
    render() {
        return (
            <div>
                Mukul Says{" "}
                <input
                    type="text"
                    onChange={this.update.bind(this)}
                />
                <br />
                <em>{this.state.sayings}</em>
            </div>
        );
    }
}
ReactDOM.render(<App />, document.getElementById("root"));
Output:
Refs Current Properties
The current property value of refs depends on the ref target. Look at the table below, to understand the difference.
| Target Type | current Property Value | 
|---|---|
| HTML element | DOM element object | 
| Custom React component (class component) | React component instance | 
More Examples of Refs in React
Let's look at some of the React code examples of refs. The examples will provide a better learning experience for master ReactJS refs.
Example 1: In this example, we use refs to add a callback function indirectly with the help of the update function and onChange event handler.
// using refs
class App extends React.Component {
    constructor() {
        super();
        this.state = { sayings: "" };
    }
    update(e) {
        this.setState({ sayings: this.refs.anything.value });
    }
    render() {
        return (
            <div>
                Mukul Says <input type="text" ref="anything"
                    onChange={this.update.bind(this)} />
                <br />
                <em>{this.state.sayings}</em>
            </div>
        );
    }
}
ReactDOM.render(< App />, document.getElementById('root'));
Output:
Example 2: In this example, we directly define callback function within ref.
// Filename - App.js
// callback used inside ref
class App extends React.Component {
    constructor() {
        super();
        this.state = { sayings: "" };
    }
    update(e) {
        this.setState({ sayings: this.a.value });
    }
    render() {
        return (
            <div>
                Mukul Says{" "}
                <input
                    type="text"
                    ref={(call_back) => {
                        this.a = call_back;
                    }}
                    onChange={this.update.bind(this)}
                />
                <br />
                <em>{this.state.sayings}</em>
            </div>
        );
    }
}
ReactDOM.render(<App />, document.getElementById("root"));
Output:
Why useRef over createRef in Function Components?
For overcome the disadvantages of createref, prefer useRef. It is a type of hook used to create a reference that hold a value. when updated this value by using function component then does not re-render so that avoid unnecessary re-renders and optimize performance. It store mutable value that persists across renders unlike ref.
import { useRef } from 'react';
const Refs = ()=>{
	let demoRef = useRef(null);
	function change(){
		console.log(demoRef.current);
		demoRef.current.style.backgroundColor="yellow";
	}
	return (
 	   <div>
  	    <h1 ref={demoRef} > Change Color <h1/>
  	    <button onClick={change}>Change</button>
   	 </div>
 	 );
};
Basically createRef is designed for class components. In every render, create a new reference by createRef which is not suitable for function component. 
When to use refs
Using refs provides a lot of benefits, and improves your web development experience. It is helpful in:
- Helpful when using third-party libraries.
- Helpful in animations.
- Helpful in managing focus, media playback, and text selection.
When not to use refs
- Should not be used with functional components because they don't have instances.
- Not to be used on things that can be done declaratively.
- When using a library or framework that provides its methods for managing such as Redux or MobX.
Conclusion
React refs are useful to interact with the DOM structure of components. They can directly access and manipulate the DOM elements. This guide teaches the purpose of refs in React, how to create refs, and how to use refs in React with examples.
