# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-jsx-introduction/

JSX is a powerful syntax extension in React that makes writing and managing UI components easier and more readable.
- It lets developers write HTML-like code directly inside JavaScript.
- JSX improves code clarity by combining structure and logic in one place.
- It is compiled into regular JavaScript before running in the browser.
const element = <h1>Hello, world!</h1>;
- <h1>Hello, world!</h1> is a JSX element, similar to HTML, that represents a heading tag.
- JSX is converted into JavaScript, where React uses React.createElement() to create React elements (virtual DOM representations).
Working of JSX
When React processes this JSX code, it converts it into JavaScript using Babel. This JavaScript code creates React elements (virtual DOM), which React then uses to efficiently update the real browser DOM.
Note: Babel acts as a translator for your React code. It takes modern JavaScript (like JSX) that browsers don't understand directly. Finally, it converts it into older, compatible JavaScript so your application runs everywhere.
JSX Transformation Process
- Writing JSX: Write JSX just like HTML inside JavaScript files (React components).
const element = <h1>Hello, World!</h1>;
- JSX Gets Transformed: JSX is not directly understood by browsers. So, it gets converted into JavaScript by a tool called Babel. After conversion, the JSX becomes equivalent to React.createElement() calls. After transformation JSX becomes.
const element = React.createElement('h1', null, 'Hello, World!');
- React Creates Elements: React takes the JavaScript code generated from JSX and uses it to create real DOM elements that the browser can render on the screen.
Implementing JSX in Action
JSX can be implemented in a React project to create dynamic and interactive UI components. Here are the steps to use JSX in a React application:
- Create a React App
- Write JSX in the Component: In the src/App.js file, write JSX to display a message:
import React from "react";
function App() {
    const message = "Hello, JSX works!";
    
    return <h1>{message}</h1>;
}
export default App;
Output:
- The JSX code <h1>{message}</h1> will be transformed into JavaScript by Babel. Then React will create a virtual DOM element for the<h1> tag with the text inside. This virtual DOM is then used to update the actual browser DOM, displaying "Hello, JSX works!" on the screen.
- After React processes the JSX, it renders the message on the screen.
Uses of JSX
Here are some significant uses of JSX:
1. Embedding Expressions
JSX allows you to embed JavaScript expressions directly within the HTML-like syntax. You can use curly braces {} to insert JavaScript expressions.
const name = 'Jonny';
const greeting = <h1>Hello, {name}!</h1>;
- {name} in JSX dynamically inserts the value of the name variable into the rendered output.
2. Using Attributes in JSX
In JSX, attributes are specified similarly to HTML, but with some differences. Since JavaScript is used alongside JSX, certain attribute names are written in camelCase instead of the lowercase syntax used in HTML.
const element = <img src="" alt="A description" />;
- CamelCase for Attribute Names: In JSX, some HTML attributes are written in camelCase.
- For example, class becomes className, for becomes htmlFor, and style is an object. This is because class and for are reserved words in JavaScript.
3. Passing Children in JSX
In JSX, components or elements can accept children just like HTML elements. Children are nested elements or content that are passed into a component. This allows for flexible and reusable components.
const Welcome = (props) => {
  return <div>{props.children}</div>;
};
const App = () => {
  return (
    <Welcome>
      <h1>Hello, World!</h1>
      <p>Welcome to React.</p>
    </Welcome>
  );
};
- Children as Props: The Welcome component does not explicitly define the content inside it. Instead, it uses {props.children} to render any child elements that are passed between the opening and closing tags of the component when it is used.
- Flexibility: The App component passes two child elements (<h1> and <p>) to Welcome. By using {props.children}, the Welcome component can render any child content, making it reusable with different content each time it’s used.
4. JSX Represents Objects
JSX is not directly rendered as HTML by React; instead, it gets compiled into JavaScript objects representing virtual DOM elements. These objects are later used by React to efficiently update the real DOM.
const element = React.createElement(
  "button",
  {
    className: "btn",
    onClick: () => alert("Clicked!"),
  },
  "Click Me"
);
The JSX code is converted into a JavaScript object
{
  type: 'button',                 
  props: {                        
    className: 'btn',             
    onClick: () => alert('Clicked!'), 
    children: ['Click Me']        
  }
}
- type: 'button': Defines the element type (button).
- props: Contains attributes like:
- className: 'btn': For styling.
- onClick: () => alert('Clicked!'): Event handler for click.
- children: ['Click Me']: Content inside the button.
- React converts JSX into a JavaScript object to efficiently render and manage the UI.
