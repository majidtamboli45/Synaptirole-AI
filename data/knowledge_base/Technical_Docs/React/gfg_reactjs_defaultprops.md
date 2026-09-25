# ReactJS defaultProps

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-defaultprops/

The defaultProps is a feature in React that allows you to specify default values for props. If a parent component does not pass a value for a particular prop, the default value set in defaultProps will be used instead..
What is defaultProps?
In React, defaultProps is a static property that can be assigned to a component to specify default values for props. These default values are used when the parent component does not pass a value for a particular prop. This helps ensure that your components have sensible defaults, preventing issues when a prop is missing.
Syntax
const Button = (props) => {
return <button>{props.label}</button>;
};
- Functional Component: This is a functional component, which receives props as an argument.
- Rendering: The props.label is accessed inside the component, and its value is rendered inside the <button> element.
Prerequisites:
Steps to Create React Application:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure:
Example of Using defaultProps in Class Components
// Filename - App.js
import React, { Component } from "react";
class App extends Component {
    render() {
        return (
            <div>
                <Person
                    name="kapil"
                    eyeColor="blue"
                    age="23"
                ></Person>
                <Person
                    name="Sachin"
                    eyeColor="blue"
                ></Person>
                <Person name="Nikhil" age="23"></Person>
                <Person eyeColor="green" age="23"></Person>
            </div>
        );
    }
}
class Person extends Component {
    render() {
        return (
            <div>
                <p> Name: {this.props.name} </p>
                <p>EyeColor: {this.props.eyeColor}</p>
                <p>Age : {this.props.age} </p>
            </div>
        );
    }
}
Person.defaultProps = {
    name: "Rahul",
    eyeColor: "deepblue",
    age: "45",
};
export default App;
Output
Example of Using defaultProps in Functional Components
import React from 'react';
function App(props) {
  return (
    <div >
      <Person name="kapil" eyeColor="blue" age="23"></Person>
      <Person name="Sachin" eyeColor="blue" ></Person>
      <Person name="Nikhil" age="23"></Person>
      <Person eyeColor="green" age="23"></Person>
    </div>
  );
}
function Person(props) {
  return (
    <div>
      <p> Name: {props.name} </p>
      <p>EyeColor: {props.eyeColor}</p>
      <p>Age : {props.age} </p>
      <hr></hr>
    </div>
  )
}
Person.defaultProps = {
  name: "Rahul",
  eyeColor: "deepblue",
  age: "45"
}
export default App;  
Output
Conclusion
defaultProps is an essential feature in React that ensures components always have a value for their props, even if the parent component doesn't pass one. It makes your code more predictable and helps avoid errors from undefined props. Whether you're using class or functional components, defaultProps can be easily added to provide fallback values for props, enhancing the robustness and reliability of your React applications.
