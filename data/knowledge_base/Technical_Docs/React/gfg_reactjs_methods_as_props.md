# ReactJS Methods as Props

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-methods-as-props/

In this article, we will learn about props and passing methods as props. We will also discuss how we can use the child components to pass data to parent components using methods as props.
What are props?
We know that everything in ReactJS is a component and to pass in data to these components, props are used. Whenever we call child components from parents we can pass data as props. This helps the parent component communicate with the child.
Although passing in props like this is great, it surely lacks flexibility in an application. For example, we cannot let the child communicate with the parent in this way. This, nonetheless, can be done by passing methods as props in ReactJS.
Passing methods as props
We will learn passing props as methods with the help of an example. To use a method as a prop all the steps are described below order wise:
Step 1: Create a new react application using the following command.
npx create-react-app
Step 2: We will create components in our file namely App.js. After using this ParentComponent.js and ChildComponent.
Step 3: Write the following code in respective files.
- App.js: This file imports our ParentComponent and renders it on the page.
- ParentComponent.js: This file sends methods as props to child component.
- ChildComponent: This file calls the method passed prom parent as props.
import './App.css';
import React from 'react';
// imports component
import ParentComponent from './components/ParentComponent';
function App() {
    return (
        <div className="App">
            <h1>-----------METHODS AS PROPS-------------</h1>
            <ParentComponent />
        </div>
    );
}
export default App;
import React, { Component } from 'react';
import ChildComponent from './ChildComponent';
class ParentComponent extends Component {
    constructor(props) {
        super(props);
     
        this.state = {
            parentName:'Parent'
        }
 
        this.greetParent = this.greetParent.bind(this)
    }
     
    greetParent() {
        alert(`Hello ${this.state.parentName}`)
    }
 
    render() {
        return (
            <div>
                <ChildComponent greetHandler={this.greetParent}/>
            </div>
        )
    }
}
export default ParentComponent;
import React from 'react';
function ChildComponent(props) {
    return (
        <div>
            <button onClick={() => props.greetHandler()}>
                Greet Parent
            </button>
        </div>
    )
}
export default ChildComponent;
Output
Passing parameters to parents in methods as props
Till now we learned how to pass methods as props but now we will use the same technique to pass parameters in these methods as props.
Note: We will be using the same files made in the previous example. Just some code modification will be there.
Example: Write the following code in the respective files.
- App.js: This file imports our ParentComponent and renders it on the page.
- ParentComponent.js: This file sends methods as props to child component.
- ChildComponent: This file calls the method passed prom parent as props and passes a parameter to the parent.
// App.js 
import './App.css';
import React from 'react';
// imports component
import ParentComponent from './components/ParentComponent';
function App() {
    return (
        <div className="App">
            <h1>-----------METHODS AS PROPS-------------</h1>
            <ParentComponent />
        </div>
    );
}
export default App;
// ParentComponent.js
import React, { Component } from 'react';
import ChildComponent from './ChildComponent';
class ParentComponent extends Component {
    constructor(props) {
        super(props);
 
        this.greetParent = this.greetParent.bind(this)
    }
     
    greetParent(name) {
        alert(`Hello ${name}`)
    }
 
    render() {
        return (
            <div>
                <ChildComponent greetHandler={this.greetParent}/>
            </div>
        )
    }
}
export default ParentComponent;
// ChildComponent.js
import React from 'react';
function ChildComponent(props) {
    return (
        <div>
            <button onClick={() => props.greetHandler("Child")}>
                Greet Parent from child
            </button>
        </div>
    )
}
export default ChildComponent;
Output
