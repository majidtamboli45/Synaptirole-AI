# ReactJS componentDidCatch() Method

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-componentdidcatch-method/

componentDidCatch() is a React lifecycle method used to handle errors in child components and prevent the entire app from crashing. It also allows side-effects like logging errors during the commit phase.
- Catches rendering errors in child components or lifecycle methods.
- Enables creation of Error Boundaries for graceful UI fallback.
- Allows logging errors to external monitoring services.
- Supports side-effects safely since it runs after the render phase.
Syntax:
componentDidCatch(error, info)
Parameters: It accepts two parameters i.e, error, and info as described below:
- error: It is the error that was thrown by the descendant component.
- info: It stores the componentStack trace of which component has thrown this error.
Create React Application
Follow the steps to create React application:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. folder name, move to it using the following command:
cd foldername
Project Structure: It will look like the following.
Example: Program to demonstrate the use of componentDidCatch() method.
Filename: App.js:
import React, { Component } from 'react';
export default class App extends Component {
  // Initializing the state
  state = {
    error: false,
  };
  componentDidCatch(error) {
    // Changing the state to true 
    // if some error occurs
    this.setState({
      error: true
    });
  }
  render() {
    return (
      <React.StrictMode>
        <div>
          {this.state.error ? <div>Some error</div> : <GFGComponent />}
        </div>
      </React.StrictMode>
    );
  }
}
class GFGComponent extends Component {
  // GFGComponent throws error as state of 
  // GFGCompnonent is not defined
  
  render() {
    return <h1>{this.state.heading}</h1>;
  }
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output:
Reference: https://legacy.reactjs.org/docs/react-component.html#componentdidcatch
