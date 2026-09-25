# ReactJS Portals

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-portals/

React portals come up with a way to render children into a DOM node that occurs outside the DOM hierarchy of the parent component. The portals were introduced in React 16.0 version.
So far we were having one DOM element in the HTML into which we were mounting our react application, i.e., the root element of our index.html in the public folder. Basically, we mount our App component onto our root element. It is almost a convention to have a div element with the id of root to be used as the root DOM element. If you take a look at the browser in the DOM tree every single React component in our application falls under the root element, i.e., inside this statement.
<div id="root"></div>
But React Portals provide us the ability to break out of this dom tree and render a component onto a dom node that is not under this root element. Doing so breaks the convention where a component needs to be rendered as a new element and follow a parent-child hierarchy. They are commonly used in modal dialog boxes, hovercards, loaders, and popup messages.
Syntax:
ReactDOM.createPortal(child, container)
Parameters: Here the first parameter is a child which can be a React element, string, or a fragment and the second parameter is a container which is the DOM node (or location) lying outside the DOM hierarchy of the parent component at which our portal is to be inserted.
Importing: To create and use portals you need to import ReactDOM as shown below.
import ReactDOM from 'react-dom';
Creating React Application:
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Project Structure: It will look like the following.
Example: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import ReactDOM from 'react-dom'
function App() {
  // Creating a portal
  return ReactDOM.createPortal(
    <h1>Portal demo</h1>,
    document.getElementById('portal')
 )
}
export default App;
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Web site created using create-react-app"
    />
    <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>React App</title>
  </head>
  <body>
    <noscript>
      You need to enable JavaScript to run this app.
    </noscript>
    <div id="root"></div>
    
    <!-- new div added to access the child component -->
    <div id="portal"></div>
  </body>
</html>
Output:
Explanation: Here, we can see that our <h1> tag Portal Demo is under the newly created portal DOM node, not the traditional root DOM node. It clearly tells us how React Portal provides the ability to break out of the root DOM tree and renders a component/element outside the parent DOM element.
Event Bubbling inside a portal: Although we don't render a portal inside the parent DOM element, its behavior is still similar to a regular React component inside the application. It can access the props and state as it resides inside the DOM tree hierarchy. For example, if we fire an event from inside a portal it will propagate to the Parent component in the containing React tree, i.e., event bubbling works the same way as it does in normal circumstances. Let us understand this with another example:
Example: Program to demonstrate how event bubbling works with portals. Here, we are going to update the previous value of the state by triggering an event listener from outside of the parent DOM node.
import React, { Component } from 'react'
import ReactDOM from 'react-dom'
class Portal extends Component {
  render() {
    // Creating portal
    return ReactDOM.createPortal(
      <button style={{marginLeft: '10px'}}>
        Click
      </button>,
      document.getElementById('portal')
    );
  }
}
class App extends Component {
  constructor(props) {
    super(props);
    
    // Set initial state
    this.state = {click: 0};
    
    // Binding this keyword
    this.handleClick = this.handleClick.bind(this);
  }
  handleClick() {
    // This will trigger when the button inside Portal 
    // is clicked, It updates Parent's state, even though it
    // is not rendered inside the parent DOM element
    this.setState(prevState => ({
      click: prevState.click + 1
    }));
  }
  render() {
    return (
      <div onClick={this.handleClick}
        style={{marginLeft: '10px'}}>
       <p>
        You have clicked me {this.state.click} times
       </p>
       <Portal />
      </div>
    );
  }
}
export default App;
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Web site created using create-react-app"
    />
    <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>React App</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
    
    <!-- new div added to access the child component -->
    <div id="portal"></div>
  </body>
</html>
Output:
Explanation: We create a state count with an initial value of 0 and a function handleClick which increments the previous value of state by 1. The latter gets triggered as an onClick event when we click on the button which has been rendered outside the root DOM node. Even then, it is able to propagate the event to the parent component and access the state value as if it is a regular React component.
Reference Link: https://legacy.reactjs.org/docs/portals.html
