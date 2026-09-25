# What is the Difference between Element and Component ?

> Source: https://www.geeksforgeeks.org/reactjs/what-is-the-difference-between-element-and-component/

An Element is an object that represents a DOM node it is a part of DOM structure, while a component is a reusable block of code that contains logic, states, and also returns the Element.
The element contains the information to be rendered on the UI and the Components are composed of the elements.
Steps to Create React Application
Step 1: Create the react project folder, open the terminal, and write the command npm create-react-app folder name, if you have already installed create-react-app globally.
npx create-react-app project
Step 2: After creating your project folder(i.e. project), move to it by using the following command.
cd project
Project Structure:
React Element
It is the basic building block in a react application, it is an object representation of a virtual DOM node. React Element contains both type and property. It may contain other Elements in its props. React Element does not have any methods, making it light and faster to render than components.
Syntax:
const ele1 =<h1> Hello, GFG </h1>;
// OR
const ele1 = React.createElement('h1', {props}, "Hello, GFG")
The React.createElement() function returns an object:
{
type: 'h1',
props: {
children: 'Hey Geek',
id: 'header'
}
}
Example 1: This example creates an element ele1 in the JSX format and render it on the UI.
// index.js
import React from 'react';
import ReactDOM from 'react-dom';
const ele1 = <h1>Welcome</h1>;
// Simple javaScript to get the div with id ="root"
ReactDOM.render(ele1, document.getElementById("root"));
Step to run the application: move to the terminal in your working directory, and run the command
npm start
Output: This output will be visible on http:/localhost:3000/ on the browser window.
Example 2: This example uses the react method to creat element in the javascript format and render it on the UI.
import React from 'react';
import React from 'react';
import ReactDOM from 'react-dom';
// Without JSX
const ele1 = React.createElement(
    'h1',
    { id: 'header' },
    'Hey Geek'
);
ReactDOM.render(ele1, document.getElementById('root'));
Output: This output will be visible on the http://localhost:3000/ on the browser window.
React Component
It is independent and reusable. It returns the virtual DOM of the element. One may or may not pass any parameter while creating a component. A component can be further described into functional components and class components.
Note: Always start the components name with the capital letter, react consider the lowercase component name as HTML tags so it will not show the component.
Syntax:
function name ({props){
return <div>{props.children}<div>
}
This is how we create a functional component.
Example: This example creates a component named Welcome with props that can be reused multiple time to create elements.
import React from 'react';
import ReactDOM from 'react-dom';
function Welcome(user) {
    return <div>
        <h3>Welcome {user.name}</h3>
    </div>
}
const ele = <Welcome name="Geek" />
ReactDOM.render(ele, document.getElementById("root"));
Output: This output will be visible on the http://localhost:3000/ on the browser window.
Difference between Element and Component
| An element is always gets returned by a component. | A component can be functional or a class that optionally takes input and returns an element. | 
| The element does not have any methods. | Each component has its life cycle methods. | 
| A React element is an object representation of a DOM node. | A component encapsulates a DOM tree. | 
| Elements are immutable i,e once created cannot be changed. | The state in a component is mutable. | 
| An element can be created using React.createElement( ) with type property. | A component can be declared in different ways like it can be an element class with render() method or can be defined as a function. | 
| We cannot use React Hooks with elements as elements are immutable. | React hooks can be used with only functional components | 
| Elements are light, stateless and hence it is faster. | It is comparatively slower than elements. | 
Conclusion
A React element represents a dom node and it is a plain JavaScript Object. On the other hand a component is the logical structure of reusable code containting state and other useful information that returns or creates element.
