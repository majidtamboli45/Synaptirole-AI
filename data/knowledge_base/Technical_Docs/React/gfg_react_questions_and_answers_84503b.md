# React  Questions and Answers

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-interview-questions-and-answers-intermediate-level/

React is a popular JavaScript library for building fast, dynamic, and interactive user interfaces. It is widely used by leading companies such as Meta, Netflix, Airbnb, Instagram, and Dropbox to develop modern single-page and web applications. Mastering key React interview questions is essential for succeeding in technical interviews for React, Frontend, and Full-Stack Developer roles.
Basic
1. How does React.js work?
React.js works on a component-based architecture and uses a virtual DOM to efficiently update and render user interfaces.
- Components: UI is broken into reusable, independent pieces.
- JSX: Allows writing HTML-like code inside JavaScript for easier UI development..
- Virtual DOM: A lightweight copy of the real DOM that tracks changes.
- Reconciliation: Compares old and new Virtual DOM and updates only the changed parts in the real DOM.
- One-way Data Flow: Ensures predictable UI updates by passing data from parent to child via props.
- State Management: React automatically re-renders components when their state changes.
2. What is JSX and how is it converted into JavaScript?
- JSX: Syntax extension for JavaScript, mainly used with React.
- HTML in JS: Allows writing HTML-like code inside JavaScript for easier readability and maintenance.
- Expressions: Embed JavaScript expressions in JSX using {} .
Example: The name written in curly braces { } signifies JSX
const name = "Learner";
const element = (
    <h1>
        Hello,
        {name}.Welcome to GeeksforGeeks.
    </h1>
);
Browsers can’t understand JSX directly. Instead, tools like Babel transpile it into plain JavaScript using React.createElement().
const element = <h1>Hello, Geeks!</h1>;
Babel converts it into:
const element = React.createElement("h1", null, "Hello, World!");
3. What is a React component?
A Component is one of the core building blocks of React. In other words, we can say that every application you will develop in React will be made up of pieces called components. Components make the task of building UIs much easier.
In React, we mainly have two types of components:
- Functional Components: Functional components are simply JavaScript functions. Initially, they were limited in terms of features like state and lifecycle methods. However, with the introduction of Hooks, functional components can now use state, manage side effects, and access other features that were once exclusive to class components.
- Class Components: Class components are more complex than functional components. They are able to manage state, handle lifecycle methods, and can also interact with other components. Class components can pass data between each other via props, similar to functional components.
4. Difference between functional and class component in React?
| Functional Components | Class Components | 
|---|---|
| A functional component is just a plain JavaScript pure function that accepts props as an argument | A class component requires you to extend from React. Component and create a render function | 
| No render method used | It must have the render() method returning JSX | 
| Also known as Stateless components | Also known as Stateful components | 
| React lifecycle methods (for example, componentDidMount) cannot be used in functional components. | React lifecycle methods can be used inside class components (for example, componentDidMount). | 
| Constructors are not used. | Constructor is used as it needs to store state. | 
| Uses hooks like useState for managing state. | Uses this.state and this.setState for state management | 
5. What are props and default props in React?
React allows us to pass information to a Component using something called props (which stands for properties). Props are objects which can be used inside a component. We can access any props inside from the component’s class to which the props is passed. The props can be accessed as shown below:
this.props.propName;
Default props are fallback values assigned to a component’s props when the parent does not provide them. They help prevent undefined errors and make components more robust. Default props can be defined using:
- Class components: ComponentName.defaultProps = { propName: defaultValue }
- Functional components: Assigning default values in function parameters.
6. What is state in React and how do you update it?
State is the internal, mutable data of a React component that controls its behavior and rendering. When state changes, React re-renders the component to update the UI.
State is updated using setState() in class components or the useState setter function in functional components. Updates are asynchronous and can be triggered by events, user interactions, or API responses. When new state depends on the previous state, the functional form (setState(prev => ...)) should be used.
7. Difference Between Props and State in React?
| PROPS | STATE | 
|---|---|
| The Data is passed from one component to another. | The Data is passed within the component only. | 
| It is Immutable (cannot be modified). | It is Mutable ( can be modified). | 
| Props can be used with state and functional components. | The state can be used only with the state components/class component (Before 16.0). | 
| Props are read-only. | The state is both read and write. | 
| Example: Passing a title oronClick handler to a button component. | Example: A counter value that increases when you click a button. | 
8. What are fragments in React?
In React, fragments allow you to group multiple elements without adding extra nodes to the DOM. Normally, returning multiple elements requires a wrapper like a <div>, which can create unnecessary DOM elements. Fragments solve this by letting you return multiple elements without extra wrappers.
- Fragments avoid extra DOM nodes.
- Short syntax: <> </> (cannot use attributes).
- Full syntax: <React.Fragment> </React.Fragment> (can use key).
- Useful in lists, tables, and grouping multiple elements.
- Helps keep the DOM clean and lightweight.
9. What is the difference between ReactDOM and React?
ReactDOM is a separate package that bridges React’s Virtual DOM with the browser’s real DOM. It provides methods to render, update, and remove React components in the DOM.
- Rendering Components: ReactDOM.createRoot and root.render mount components to a DOM node.
- Updating the DOM: ReactDOM applies Virtual DOM changes to the real DOM efficiently.
- Unmounting: ReactDOM.unmountComponentAtNode removes components from the DOM.
| React | ReactDOM | 
|---|---|
| JavaScript library for building UI components. | Package for rendering components to the browser DOM. | 
| Defines component structure, state, and logic. | Manages DOM rendering and updates. | 
| Component creation, state management, UI logic. | Interacting with the browser’s DOM. | 
| Create components, manage state/lifecycle. | createRoot, render, hydrate, unmount. | 
| N/A (no direct DOM interaction). | ReactDOM.createRoot, ReactDOM.hydrate, etc. | 
Example (ReactDOM):
import ReactDOM from 'react-dom/client';
import App from './App';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);
- React handles component logic; ReactDOM handles DOM integration.
- React 18 introduced createRoot for concurrent rendering, replacing ReactDOM.render.
- For more details, see ReactDOM and React vs ReactDOM.
10. What is Conditional Rendering in React?
Conditional rendering in React involves dynamically displaying components or elements based on conditions like state, props, or API responses. It’s essential for creating responsive UIs tailored to user interactions or data.
Use Cases:
- Show/hide elements based on authentication status.
- Display different layouts for user roles.
- Render loading spinners during data fetching.
- Conditionally show UI based on API responses.
Example:
import { useState } from 'react';
function UserStatus() {
const [isLoggedIn, setIsLoggedIn] = useState(false);
return (
<div>
{isLoggedIn ? <h1>Welcome, User!</h1> : <h1>Please Log In</h1>}
<button onClick={() => setIsLoggedIn(!isLoggedIn)}>
{isLoggedIn ? 'Log Out' : 'Log In'}
</button>
</div>
);
}
- Use ternary operators or logical && for concise rendering.
- Move complex logic outside JSX for readability.
- Avoid over-nesting conditions to maintain clarity.
11. What is the use of CSS Modules in React?
CSS Modules scope styles locally to a component, preventing style conflicts in large applications. They generate unique class names at build time, ensuring styles apply only to the intended component.
Example:
/* styles.module.css */
.button {
background-color: blue;
color: white;
}
import styles from './styles.module.css';
function Button() {
return <button className={styles.button}>Click</button>;
}
- CSS Modules are enabled in Create React App by default with .module.css files.
- Use camelCase for class names in JavaScript (e.g., styles.myButton).
- Alternatives include styled-components or Tailwind CSS.
12. Write a program to create a counter with increment and decrement?
This program demonstrates a simple counter using the useState hook to manage state and event handlers for incrementing and decrementing the count. The UI updates automatically when the state changes.
Example:
import React, { useState } from 'react';
function Counter() {
const [counter, setCounter] = useState(0);
const handleIncrement = () => {
setCounter(counter + 1);
};
const handleDecrement = () => {
setCounter(counter - 1);
};
return (
<div style={{ textAlign: 'center', marginTop: '50px' }}>
<h2>React Counter</h2>
<div style={{ fontSize: '24px', margin: '20px' }}>{counter}</div>
<div>
<button
onClick={handleIncrement}
style={{ margin: '5px', padding: '10px 20px' }}
>
Increment
</button>
<button
onClick={handleDecrement}
style={{ margin: '5px', padding: '10px 20px' }}
>
Decrement
</button>
</div>
</div>
);
}
export default Counter;
How It Works:
- useState initializes counter to 0 and provides setCounter to update it.
- handleIncrement increases the counter by calling setCounter(counter + 1).
- handleDecrement decreases the counter by calling setCounter(counter - 1).
- The UI displays the current counter value and updates on button clicks.
Points:
- Use descriptive handler names (e.g., handleIncrement) for clarity.
- Inline styles are used here for simplicity; prefer CSS Modules or styled-components in production.
- Ensure state updates are immutable to avoid bugs.
13. What are Hooks in React and why were they introduced?
Hooks are special functions in React that let you use state, lifecycle methods, and other React features in functional components, which were previously only available in class components.
Why introduced:
- Before hooks, state and lifecycle methods could only be used in class components, leading to more boilerplate code and complex patterns.
- Hooks allow simpler, cleaner code using functional components.
- They promote reusability and composition of logic between components.
import React, { useState } from 'react';
function Counter() {
  const [count, setCount] = useState(0);
  return (
    <div>
      <p>{count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}
14. How does the useState hook work?
The useState hook allows you to add state to functional components. It returns a state variable and a setter function to update that state. When the state changes, React re-renders the component with the updated value.
import { useState } from 'react';
function Counter() {
  const [count, setCount] = useState(0);
  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}
- count is the current state value.
- setCount is the function used to update state.
- 0 is the initial value when the component mounts. When setCount is called, React re-renders Counter with the new count value.
15. What are the rules of hooks and why are they important?
Hooks in React must follow certain rules to work correctly. These rules ensure that React can track state and effects reliably and prevent unexpected bugs.
- Always call hooks at the top level of your component or custom hook.
- Only call hooks from React functional components or custom hooks.
- Custom hooks should always start with use, like useFetch or useForm.
Why they are important:
- Preserve state and effect order between renders.
- Ensure components behave predictably.
- Prevent bugs and unexpected behavior when using hooks like useState and useEffect.
16. Can you explain what the Virtual DOM is and how React uses it?
The Virtual DOM (VDOM) is a lightweight, in-memory representation of the real DOM in the browser. Instead of updating the actual DOM directly, which can be slow and costly, React first updates the Virtual DOM when a component’s state or props change. React then compares the new Virtual DOM with the previous one using a process called diffing, identifies the minimum set of changes needed, and updates only those parts of the real DOM. This approach makes UI updates faster and more efficient by reducing unnecessary DOM manipulations. Key points:
- Virtual DOM is a JavaScript object representing the real DOM.
- React updates the VDOM first, not the real DOM.
- Uses a diffing algorithm to detect changes efficiently.
- Only the necessary parts of the real DOM are updated.
- Improves performance and user experience in dynamic applications.
17. How do you render a list of items in React?
In React, lists are usually rendered using JavaScript’s .map() method. Each list item should also have a unique key prop so React can efficiently track and update elements.
const fruits = ["Apple", "Banana", "Mango"];
return (
  <ul>
    {fruits.map((fruit, index) => (
      <li key={index}>{fruit}</li>
    ))}
  </ul>
);
In this Example, .map() is used to iterate over the array, and the key prop helps React identify each list item uniquely.
18. Why is the key prop important in React lists?
The key prop is important because it helps React efficiently manage list rendering. It allows React to identify which items have changed, been added, or removed, instead of re-rendering the entire list.
- Helps React track elements and update only what’s necessary.
- Prevents unnecessary re-renders, improving performance.
- Best practice: Use a unique ID as the key instead of the array index whenever possible.
19. What happens if we use the array index as a key in React?
Using the array index as a key technically works, but it is not recommended in most cases. If the list changes (items are reordered, added, or removed), React may reuse components incorrectly, leading to UI bugs.
- Can cause issues when list items are reordered.
- May lead to incorrect updates if items are added or removed.
- Safe only for static lists that never change.
20. What is the difference between rendering lists with map() vs forEach()?
When rendering lists, it’s important to return JSX elements for each item. The choice between map() and forEach() affects this:
- map(): Returns a new array, which can contain JSX elements to be rendered. This is the preferred method for rendering lists in React.
- forEach(): Does not return a new array, so it cannot directly produce elements for rendering. It’s only useful for side effects.
Example using map():
const fruits = ["Apple", "Banana", "Mango"];
return (
  <ul>
    {fruits.map(fruit => <li key={fruit}>{fruit}</li>)}
  </ul>
);
- map returns an array of<li> elements, which React renders.
- Using forEach here would not work, because it does not return the array of elements.
21. How are forms handled in React compared to plain HTML?
In plain HTML, the browser’s DOM manages form data. In React, form inputs are usually controlled components:
- The form values live in state.
- Each keystroke triggers an onChange handler to update state.
- This makes the data predictable and easy to validate before submission.
function MyForm() {
  const [name, setName] = React.useState("");
  const handleSubmit = (e) => {
    e.preventDefault();
    alert("Submitted: " + name);
  };
  return (
    <form onSubmit={handleSubmit}>
      <input 
        type="text" 
        value={name} 
        onChange={(e) => setName(e.target.value)} 
      />
      <button type="submit">Submit</button>
    </form>
  );
}
In this example, the input is fully controlled by React through value and onChange.
22. How do you prevent the default form submission behavior in React?
By using event.preventDefault() inside the form’s onSubmit handler.
const handleSubmit = (e) => {
  e.preventDefault();
  console.log("Form submitted!");
};
In this example, the page is stopped from reloading and lets React control what happens on submit.
23. Explain the types of routers in React?
React Router provides three types of routers for handling navigation in React applications, each suited for different use cases.
Types of Routers:
1. BrowserRouter: Uses HTML5 history API (pushState, replaceState, popState) to manage URLs, providing clean URLs (e.g., /about). Ideal for web applications with server support.
import { BrowserRouter } from 'react-router-dom';
2. HashRouter: Uses the hash portion of the URL (e.g., /#about) for routing. Suitable for static sites or environments without server-side routing.
import { HashRouter } from 'react-router-dom';
3. MemoryRouter: Stores URL history in memory, not in the browser. Useful for testing or non-browser environments like React Native.
import { MemoryRouter } from 'react-router-dom';
- BrowserRouter is the most common for modern web apps.
- HashRouter is simpler for static hosting but less SEO-friendly.
- MemoryRouter is rare, primarily for non-browser contexts.
24. What is React Router and why is it used?
React Router is a library that enables client-side routing in React applications. It allows you to create single-page applications (SPAs) where navigation between views happens without a full page reload, making apps faster and smoother.
25. Difference between <a> tag and <Link> in React Router?
- <a> tag: Reloads the whole page when navigating.
- <Link> component: Updates the URL and changes the component without reloading (SPA behavior).
26. What are the main components of React Router?
- <BrowserRouter> – Wraps the app and enables routing.
- <Routes> – Container for all route definitions.
- <Route> – Defines a path and the component to render.
- <Link> / <NavLink> – For navigation.
- useNavigate() – For programmatic navigation.
27. What is Redux?
Redux is a popular open-source state management library for JavaScript applications. It provides a way to centralize the state of an application in a single store, making it easier to debug, test, and reason about the state changes in the application.
28. Explain the core principles of Redux.
Three principles that Redux follows are:
- Redux is a Single Source of Truth
- The State is Reada only State
- The Modifications are Done with Pure Functions
29. What is the difference between Redux and Context API.
| Redux | Context API | 
| Redux supports middlewares for handling side effects like async calls and logging. | Context API does not support middlewares; side effects are handled inside components. | 
| It uses centralized global state accessible by all components. | It uses decentralized state local to providers. | 
| It enforces unidirectional data flow for predictable updates. | It allows bidirectional data flow, giving more flexibility | 
| It has a structured API: Actions, Reducers, Middleware. | It uses Context.Provider and Context.Consumer (or useContext). | 
30. What are pure functions in the context of Redux?
A pure function is defined as any function that doesn't alter input data, doesn't depend on the external state, and can consistently provide the same output for the same input. As opposed to React, Redux depends on such pure functions.
31. What are the key components of Redux architecture?
In Redux, actions describe what happened, reducers define how state changes, and the store holds the application’s state.
- Actions: Actions in Redux are plain JavaScript objects that provide information to the store, with a required type field and optional data fields for additional information.
- Reducers: Reducers are the pure functions that take the current state and action and return the new state and tell the store how to do.
- Store: The store is the object which holds the state of the application.
32. What is the purpose of the Redux store?
The Redux store is a centralized object that holds the state of the application. It allows components to access and update the state using dispatch and selectors. The state inside the store can only be modified by dispatching actions.
Functions:
- createStore(reducer): Creates a Redux store using a reducer function.
- dispatch(action): Sends an action to the store to update the state.
- getState(): Retrieves the current state of the store.
33. What is the purpose of the Provider component in React Redux?
The Provider component in React Redux makes the Redux store accessible to all nested components, allowing them to connect and use the store throughout the app.
- The Provider component makes the Redux store available to any nested components that need to access the Redux store.
- Since any React component in a React Redux app can be connected to the store, most applications will render a <Provider> at the top level, with the entire app's component tree inside of it.
34. What is the connect function in React Redux used for?
The connect() function in React Redux links a React component to the Redux store, providing it access to state data and dispatch functions to update the store.
- The connect() function connects a React component to a Redux store.
- It provides its connected component with the pieces of the data it needs from the store, and the functions it can use to dispatch actions to the store.
35. What is the purpose of the dispatch function in React Redux?
The dispatch function is mainly used for dispatching actions to the Redux store. It is a method provided by the Redux store that accepts an action object as its argument and triggers the state update process.
36. What are the two types of React components?
The two types of React components are class components and functional components.
Class components: These are ES6 classes that extend the React.Component class. They have a render() method where you define what should be rendered to the DOM. Class components can manage their own state using setState() and have access to lifecycle methods such as componentDidMount() and componentDidUpdate().
Syntax:
class Democomponent extends React.Component {
render() { return <h1>Welcome Message!</h1>;
}
}
Functional components: These are simple JavaScript functions that return JSX (a syntax extension for JavaScript used with React). They are also known as stateless functional components or just functional components.
Syntax:
function demoComponent() {
return <h1>Welcome Message!</h1>;
}
37. How do you create a class component in React?
To create a class component in React, you typically define a JavaScript class that extends the React.Component class. 
1. Import React:
import React from 'react';
2. Define your class component:
class MyComponent extends React.Component {
render() {
return (
// JSX code representing the component's UI
<div>
<h1>Hello, World!</h1>
</div>
);
}
}
3. Export your component:
export default MyComponent;
38. How do you create a functional component in React?
To create a functional component in React, you simply define a JavaScript function that returns JSX .
1. Import React (not always necessary, but required if using JSX):
import React from 'react';
2. Define your functional component:
function MyFunctionalComponent() {
return (
// JSX code representing the component's UI
<div>
<h1>Hello, World!</h1>
</div>
);
}
3. Export your component:
export default MyFunctionalComponent;
39. What is the purpose of the render() method in a class component?
The render() method in a class component is a fundamental part of React's component lifecycle. Its purpose is to define what should be rendered to the DOM when the component is rendered or updated.
- Returning JSX: The primary purpose of the render() method is to return JSX that represents the UI of the component.
- Component Re-rendering: Whenever the state or props of a component change, React will automatically call the render() method again to re-render the component and update the DOM with any changes.
- Virtual DOM: React uses a virtual DOM to efficiently update the actual DOM. The render() method generates a virtual DOM representation of the component's UI.
40. How do you render a React component on the DOM?
To render a React component on the DOM, you typically use the ReactDOM.render() method. 
1. Import React and ReactDOM:
import React from 'react';
import ReactDOM from 'react-dom';
2. Define your React component:
function MyComponent() {
return (
// JSX code representing the component's UI
<div>
<h1>Hello, World!</h1>
</div>
);
}
3. Use ReactDOM.render() to render your component onto the DOM:
ReactDOM.render(<MyComponent />, document.getElementById('root'));
41. What is JSX? How does it differ from HTML?
JSX stands for JavaScript XML. It is a syntax extension for JavaScript, often used with React to describe what the UI should look like. JSX may remind you of a template language, but it comes with the full power of JavaScript.
Difference between JSX and HTML
| Feature | JSX | HTML | 
|---|---|---|
| Case Sensitivity | JSX is case-sensitive with camelCase properties. | HTML is not case-sensitive. | 
| Logic Integration | JSX allows JavaScript expressions. | HTML does not have logic built-in; it requires a separate script. | 
| Node Structure | JSX requires a single root node. | HTML does not have this restriction. | 
| Attribute/Property Naming | Attributes are camelcased (e.g., onClick). | Attributes are lowercase (e.g., click). | 
| Custom Components | JSX can have custom components (e.g., <MyComponent />). | HTML does not support custom components natively. | 
42. How can you pass props to a React component?
You can pass props to a React component by adding attributes to the component when you use it in JSX.
// Define a functional component
function Greeting(props) {
return <h1>Hello, {props.name}!</h1>;
}
// Render the component with props
ReactDOM.render(<Greeting name="John" />, document.getElementById('root'));
43. How do you initialize state in a class component?
In a class component in React, you initialize state in the constructor method.
import React from 'react';
class MyComponent extends React.Component {
    constructor(props) {
        super(props);
        // Initialize state in the constructor
        this.state = {
            count: 0,
            name: 'John',
            isLoggedIn: false
        };
    }
    render() {
        return (
            <div>
                <h1>Hello, {this.state.name}!</h1>
                <p>Count: {this.state.count}</p>
                <p>User is logged in: {this.state.isLoggedIn ? 'Yes' : 'No'}</p>
            </div>
        );
    }
}
export default MyComponent;
44. What is the purpose of the setState() method?
The setState() method in React is used to update the state of a component, triggering a re-render with the updated state. It manages state changes asynchronously that allows React to batch multiple updates for performance optimization. When calling setState(), React merges the provided state updates with the current state, updating only the specified properties. 
45. How do you handle events in React?
In React, you handle events using JSX by passing event handler functions as props to React elements.
function MyComponent() {
const handleClick = () => {
console.log('Button clicked');
};
return (
<button onClick={handleClick}>Click Me</button>
);
}
46. How do you conditionally render elements in React?
In React, you can conditionally render elements by using JavaScript expressions inside JSX.
function MyComponent({ isLoggedIn }) {
if (isLoggedIn) {
return <p>Welcome, user!</p>;
} else {
return <p>Please log in to continue.</p>;
}
}
47. What is the purpose of the && operator in JSX?
The purpose of the && operator in JSX is to conditionally render elements based on a boolean expression. It allows you to render an element only if the expression evaluates to true, and if it evaluates to false, it will not render anything.
function MyComponent({ isLoggedIn }) {
return (
<div>
{isLoggedIn && <p>Welcome, user!</p>}
</div>
);
}
48. How do you use the ternary operator for conditional rendering in React?
In React, you can use the ternary operator (condition ? trueValue : falseValue) for conditional rendering. This allows you to render different JSX elements based on a condition. 
function MyComponent({ isLoggedIn }) {
return (
<div>
{isLoggedIn ? (
<p>Welcome, user!</p>
) : (
<p>Please log in to continue.</p>
)}
</div>
);
}
49. What are the different ways to style React components?
There are various way by which we can style our react components:
Inline CSS: In inline styling basically, we create objects of style. And render it inside the components in style attribute using the React technique to incorporate JavaScript variable inside the JSX (Using ‘{ }’ )
Styled Components: The styled-components allows us to style the CSS under the variable created in JavaScript. styled-components allow us to create custom reusable components which can be less of a hassle to maintain.
CSS Modules: A CSS module is a simple CSS file but a key difference is by default when it is imported every class name and animation inside the CSS module is scoped locally to the component that is importing it also CSS file name should follow the format ‘filename.module.css’.
50. What is React Hooks?
React Hooks is a function that lets us use state and other React features without writing a class. They were introduced in React 16.8 to enable functional components to use state which means to make the code good and easy to understand.
React hooks are functions that enable functional components to use state and lifecycle features that were previously only available in class components. Hooks provide functions like useState, useEffect, useContext, etc., that allow we to "hook into" React features from functional components.
51. What are the basic built-in React Hooks?
The basic built-in React Hooks are useState, useEffect, useContext, useReducer, useCallback, useMomo, useRef and useImperativeHandle.
- useState enables components to manage and update their own state without using classes.
- useEffect is used to connect components to an external system.
- useContext it is used to consume data from a Context in a functional component.
- useReducer is used to manage complex state logic through a reducer function.
- useCallback used to memoize functions, preventing unnecessary re-renders in child components.
- useMemo is used to memoize the result of a function computation, preventing unnecessary recalculations.
- useRef is used to create mutable references that persist across renders in functional components.
- useImperativeHandler customizes the instance value that is exposed when using  ref with functional components.
52. What is React Router?
React Router is a standard library for routing in React. It enables the navigation among views of various components in a React Application, allows changing the browser URL, and keeps the UI in sync with the URL.
53. How do you install React Router?
You can install React Router using npm or yarn:
- Using npm
npm install react-router-dom
- Using Yarn
yarn add react-router-dom
54. What are the benefits of using React Router?
- Declarative Routing: React Router provides a declarative way to define routing in your application using JSX syntax. This makes it easy to understand and maintain the routing configuration of your application.
- Dynamic Routing: React Router supports dynamic routing, that allows you to define routes with parameters that can change based on user input or application state. This makes it easy to create dynamic and data-driven UIs.
- Code Splitting: React Router supports code splitting that allows you to split your application into smaller chunks that are loaded on demand.
- History Management: React Router provides a history API that allows you to programmatically navigate between different pages in your application, as well as manage browser history (e.g., go back, go forward).
- Server-Side Rendering: React Router is compatible with server-side rendering (SSR) frameworks like Next.js, allowing you to render React components on the server and send the fully rendered HTML to the client. This can improve SEO and initial load performance.
55. Explain the Route component in React Router.
The Route component in React Router is a fundamental element used to define routes in React applications, and helps in the rendering of specific components based on the current URL. It takes props like "path" to specify the URL pattern. With Route, you can create dynamic and declarative routing structures for efficient navigation and rendering of components.
56. How do you create a route with a parameter in React Router?
You can create a route with a parameter using the :paramName syntax, for example:
<Route path ="/users/:userId" component ={UserComponent}/>
57. Explain the difference between Link and NavLink in React Router.
| Feature | Link | NavLink | 
|---|---|---|
| Functionality | Used to navigate between routes by rendering an anchor tag ( <a> ). | Same functionality as Link but with additional features for styling active links. | 
| activeClassName | No built-in support for adding an active class to the current link. | Supports adding an active class to the current link using the "activeClassName" prop. | 
| Active Style | No built-in support for applying styles to the active link. | Supports applying inline styles to the active link using the "activeStyle" prop. | 
| Exact Matching | Does not support exact matching of the active link's path. | Supports exact matching of the active link's path using the "exact" prop. | 
| Use Case | Suitable for basic navigation without styling active links. | Suitable for navigation with styled active links and precise route matching requirements. | 
Intermediate
58. Is it necessary to keep all the component states in the Redux store?
No, not all component states need to be in Redux; it’s best used for shared or global state, while local state can remain within components.
- While Redux provides a centralized state management solution, it's not meant to replace local component state entirely.
- There are several factors to consider when deciding whether to use Redux for a particular piece of state.
59. What is the significance of immutability in Redux?
Immutability in Redux ensures predictable state updates and simplifies management, allowing efficient change detection, better performance, and easier debugging.
- Allows quick detection of state changes without deep comparison.
- Ensures consistent and predictable updates across the application.
60. What do you understand about Redux Toolkit?
Redux Toolkit is an npm package that simplifies Redux by providing an easy, flexible, and powerful way to create and manage stores, especially for large applications.
- Redux toolkit is a npm package that is made to simplify the creation of redux store and provide easy state management.
- Before the introduction of the Redux toolkit state management was complex in simple redux.
- The Redux toolkit acts as a wrapper around redux and encapsulates its necessary functions.
- Redux toolkit is flexible and provides a simple way to make a store for large applications.
- It follows SOPE principle which means it is simple, Opinionated, Powerful, and Effective.
61. What’s the typical flow of data like in a React with Redux app ?
- User Interaction: Triggers an action in the component.
- Action Dispatch: The action is sent to the Redux store.
- Reducers Update State: The root reducer processes the action, updating the state by returning a new copy.
- Store Updates Components: The store notifies subscribed components, which then re-render with the new state.
62. Explain the mapStateToProps functions in React Redux.
In React Redux, mapStateToProps maps parts of the Redux state to a component’s props, allowing the component to access and use the required state data.
- In React Redux, the mapStateToProps function is used to connect Redux state to React component props.
- It's a function that maps parts of the Redux state to the props of a React component, and allows the component to access and use that state.
63. Explain mapDispatchToProps functions in React Redux.
In React Redux, mapDispatchToProps maps action creators to a component’s props, enabling the component to dispatch actions to the store without directly accessing it.
- The mapDispatchToProps function is used to map Redux action creators to component props.
- It allows components to dispatch actions to the Redux store without directly accessing the store or importing action creators.
64. What is Redux middleware?
Redux middleware is software that sits between action creators and reducers, intercepting actions to handle async tasks, modify actions, or add custom behavior before they reach the reducers.
- Redux middleware is a piece of software that works between the action creators and the reducers in a Redux application.
- It intercepts actions before they reach the reducers, and allows to perform asynchronous operations, modify actions, or implement custom behavior.
65. What is the difference between synchronous and asynchronous middleware in Redux?
Synchronous middleware in Redux handles actions immediately, while asynchronous middleware manages actions that involve delayed or async operations.
- Synchronous: executes actions instantly.
- Asynchronous: handles delayed or async tasks.
| Synchronous Middleware | Asynchronous Middleware | 
|---|---|
| Executes sequentially, one after the other. | Executes concurrently or in a non-blocking manner. | 
| May block subsequent middleware or actions until completion. | Does not block subsequent middleware or actions, allowing concurrent execution. | 
| Ideal for tasks requiring immediate response or strict order. | Suitable for async tasks like API calls or I/O operations. | 
| Example: Logging middleware, error handling middleware. | Example: Thunk middleware, Saga middleware. | 
66. Explain the purpose of the redux-thunk middleware.
Redux-Thunk middleware allows action creators to return functions instead of plain objects, enabling Redux to handle asynchronous logic and access the store’s dispatch and state.
- The purpose of the redux-thunk middleware is to enable Redux to handle asynchronous logic more easily, particularly when dealing with actions that don't immediately return an object, but instead return a function.
- Redux-thunk extends Redux functionality by allowing action creators to return functions instead of plain action objects.
- These functions, known as thinks and have access to the dispatch and getState functions of the Redux store.
67. Explain the concept of "single source of truth" in Redux?
In Redux, "Single Source of Truth" means that the entire application state is stored in a single central store, represented as an object tree. This ensures consistency, easy debugging, and predictable state management.
- Easier State Management: All components access state from a single source, reducing inconsistencies.
- Simplifies Debugging & DevTools: The state can be easily inspected and time-traveled (e.g., Undo/Redo).
- Universal (Isomorphic) Apps: The state can be serialized and transferred between the server and client.
- Predictable Updates: State changes occur only through dispatched actions, making the flow easier to track.
68. What are selectors in Redux?
Selectors in Redux are functions that extract and transform specific pieces of state, making data access efficient, reusable, and easier to manage across components.
- Encapsulate state access and transformation.
- Promote reuse across multiple components.
69. Explain the concept of "container components" in React Redux.
Container components in React Redux connect to the store and act as a bridge, supplying presentational components with state data and dispatchable actions.
- Container components are React components that are responsible for interacting with the Redux store.
- They are connected to the Redux store using the connect() function.
- Container components acts as the bridge between the Redux store and presentational components, providing them with the necessary data from the store and actions to dispatch.
70. What are lifecycle methods in React?
Every React Component has a lifecycle of its own, lifecycle of a component can be defined as the series of methods that are invoked in different stages of the component’s existence. A React Component can go through four stages.
71. Explain the lifecycle phases of a class component.
Class Component can go through stages of its life as follows.
- Mounting Phase:
  - constructor() : Initialize state and bind event handlers.
  - render() : Render UI based on state and props.
  - componentDidMount() : Perform side effects after the component is rendered.
- Updating Phase:
  - render() : Re-render UI based on state or prop changes.
  - componentDidUpdate() : Perform side effects after re-rendering.
- Unmounting Phase:
  - componentWillUnmount() : Clean up resources before the component is removed from the DOM.
- Error Handling:
  - componentDidCatch() : Handle errors during rendering or in lifecycle methods of child components.
72. What is the purpose of the componentDidMount() method?
Purpose of componentDidMount lifecycle method
- Initialization: componentDidMount is a crucial lifecycle method in React that gets invoked after a component has been successfully inserted into the DOM (Document Object Model).
- Asynchronous Operations: It is particularly useful for handling asynchronous operations such as data fetching.
- Interacting with the DOM: If your component needs to interact directly with the DOM or other JavaScript frameworks, componentDidMount is the appropriate stage for such operations.
- Integration with External Libraries: When integrating React with external libraries or non-React code, componentDidMount allows you to safely initiate these integrations.
73. What is the purpose of the componentWillUnmount() method?
Purpose of the componentWillUnmount() method:
- Cleanup Tasks: componentWillUnmount() is commonly used to perform cleanup tasks such as removing event listeners, canceling network requests, or unsubscribing from external data sources.
- Release Resources: componentWillUnmount() provides a hook to release resources which are no longer needed and ensure that they are properly cleaned up before the component is removed from the DOM.
- Prevent Memory Leaks: componentWillUnmount() allows you to release resources and unsubscribe from external data sources, preventing memory leaks and ensuring that resources are properly managed throughout the component's lifecycle.
74. What is component composition in React?
Component composition in React is used for building complex user interfaces by combining smaller, reusable components together. This helps breaking down the UI into smaller, more manageable pieces, each responsible for specific functionality or UI elements. By combining these components hierarchically and passing data and behavior through props, you can create scalable, maintainable, and customizable UIs.
75. What are higher-order components (HOCs) in React?
Higher-order components or HOC is the advanced method of reusing the component functionality logic. It simply takes the original component and returns the enhanced component.
Syntax:
const EnhancedComponent = higherOrderComponent(OriginalComponent);
Reason to use Higher-Order component:
- Easy to handle
- Get rid of copying the same logic in every component
- Makes code more readable
76. What are error boundaries in React?
Error boundaries are a React component that catches JavaScript errors anywhere in their child component tree, log those errors, and display a fallback UI instead of crashing the entire component tree. They are used to ensure that errors in one part of the UI don't affect the rest of the application.
77. What are some ways to optimize the performance of React components?
We can perform some actions and precautions to optimize the performance.
- Use binding functions in constructors: By adding an arrow function in a class, we add it as an object and not as the prototype property of the class. The most reliable way to use functions is to bind them with the constructor.
- Avoid inline style attributes: The browser often invests a lot of time rendering, when styles are implied inline. Creating a separate style.js file and importing it into the component is a faster method.
- Avoid bundling all of the front end code in a single file: By splitting the files into resource and on-demand code files we can reduce the time consumed in presenting bundled files to the browser transformers.
- Avoid inline function in the render method: If we use the inline function, the function will generate a new instance of the object in every render and there will be multiple instances of these functions which will lead to consuming more time in garbage collection.
78. What is memoization in React?
Memoization in React is the process of optimizing functional components by caching the result of expensive computations and reusing it when the component is re-rendered with the same props. This technique helps to avoid unnecessary re-computation of values, thereby improving performance by reducing the workload on the rendering process.
79. What is code-splitting in React?
Code-splitting in React is a technique used to improve the performance of web applications by splitting the JavaScript bundle into smaller chunks, which are loaded asynchronously at runtime. This allows the browser to download only the necessary code for the current view, reducing the initial load time and improving the overall performance of the application.
80. What problems do React Hooks solve?
React Hooks solves the problems of sharing the stateful logic between components in a more modular and reusable way than class components.
81. What is the purpose of useCallback Hooks?
The purpose of useCallback Hooks is used to memoize functions, and prevent unnecessary re-rendering of child components that rely on those components. The useCallback function in React is mainly used to keep a reference to a function constant across multiple re-renders. This feature becomes useful when we want to prevent the unnecessary re-creation of functions, especially when we need to pass them as dependencies to other hooks such as useMemo or useEffect.
82. How does useReducer differ from useState?
| useState | useReducer | 
|---|---|
| Handles state with a single value | Handles state with more complex logic and multiple values | 
| Simple to use, suitable for basic state needs | More complex, suitable for managing complex state logic | 
| Simple state updates, like toggles or counters | Managing state with complex transitions and logic | 
| Directly updates state with a new value | Updates state based on dispatched actions and logic | 
| Not used | Requires a reducer function to determine state changes | 
| Logic is dispersed where state is used | Logic is centralized within the reducer function | 
83. Explain the purpose of useLayoutEffect?
The useLayoutEffect is similar to useEffect but fires synchronously after all DOM mutations. It's useful for reading from the DOM or performing animations before the browser paints. Due to its synchronous nature, excessive usage of useLayoutEffect may potentially impact performance, especially if the logic within it is computationally intensive or blocking. It's essential to use useLayoutEffect judiciously and consider performance implications carefully.
84. What is Custom Hooks?
Custom hooks in React are like wer own personal tools that we can create to make building components easier. They're functions we write to do specific tasks, and then we can reuse them in different components. They're handy because they let we keep were code organized and share logic between different parts of wer application without repeating werself.
85. Can custom Hooks accept parameters?
Yes, custom hooks in React can indeed accept parameters. By accepting parameters, custom hooks become more flexible and can adapt their behavior based on the specific needs of different components.
import { useEffect } from 'react';
function useDocumentTitle(title) {
    useEffect(() => {
        document.title = title;
    }, [title]);
}
// Usage:
function MyComponent() {
    useDocumentTitle('Hello GfG!');
    return <div>GeeksforGeeks content...</div>;
}
86. What happens if we omit dependencies in the dependency array of useEffect?
If we omit dependencies in the dependency array of useEffect, the effect will run after every render. This means that the effect will be executed on the initial render and after every subsequent re-render, regardless of whether any specific values have changed.
import React, {
    useEffect,
    useState
}
    from 'react';
function App() {
    const [count, setCount] = useState(0);
    useEffect(() => {
        console.log("See the Effect here");
    });
    return (
        <div>
            <p>Count: {count}</p>
            <button onClick={() =>
                setCount(count + 1)}>
                Increment
            </button>
        </div>
    );
}
export default App;
87. What is the purpose of the second argument in useState?
The purpose of the second argument in useState is to initialize the state value. When we call useState(initialValue), the initialValue provided as the second argument is used to initialize the state variable.
const [count, setCount] = useState(0);
In this '0' is the initial value provided as the second argument to useState, so count will be initialized with '0' as its initial value.
88. Explain the concept of lazy initialization with useState?
Lazy initialization with useState allows we to initialize state lazily based on a function, which is only called on the initial render. The concept of lazy initialization with useState in React allows we to initialize state lazily, i.e., on-demand when it's needed, rather than eagerly during component initialization. This means that we can compute the initial state dynamically based on some conditions or heavy computations.
89. Can we use Hooks in class components?
No, we cannot use hooks in class components directly. Hooks are a feature introduced in React 16.8 to allow stateful logic to be used in functional components. They cannot be used in class components because hooks rely on the functional component's call order to manage state and lifecycle behaviors, which is not compatible with the class component's lifecycle methods.
90. Can we use React Router with server-side rendering?
Yes, React Router can be used with server-side rendering (SSR). While React Router primarily handles client-side routing, it is compatible with server-side rendering frameworks like Next.js that allows you to render React components on the server and send the fully rendered HTML to the client.
91. What is nested routing?
Nested routing refers to defining routes within other routes in a hierarchical manner. This is commonly used in frameworks like React Router or Next.js to organize and manage complex application structures. Nested routing is particularly useful for applications with multiple layers of content or sections that require their own routing logic.
92. What are the differences between react-router-dom and react-router-native?
|  | react-router-dom | react-router-native | 
|---|---|---|
| Platform | Primarily for web development. | Specifically designed for native mobile app development. | 
| Navigation Components | Provides components designed for web browsers, like BrowserRouter ,Link , andNavLink . | Offers components designed for native environments, such as NativeRouter andLink . | 
| Rendering | Renders using HTML elements and leverages the browser's history API for navigation. | Utilizes native navigation mechanisms provided by the platform (e.g., UINavigationController for iOS). | 
| Styling and UI | Renders standard HTML elements, allowing for easy integration with CSS frameworks. | Renders native UI components, providing a more authentic user experience on mobile devices. | 
| Dependencies | Typically relies on standard web dependencies like react-dom . | Requires dependencies on native modules, such as react-native and related packages for iOS and Android development. | 
93. What is activeClassName in React Router?
activeClassName is a prop used in React Router components to specify the CSS class that should be applied to the link when its corresponding route is active. When a link is active, Router applies the specified activeClassName to the link's HTML element, allowing you to style active links differently to provide visual feedback to users.
94. What is the purpose of the Redirect component in React Router? 
The Redirect component in React Router are used for programmatic redirection of users from one route to another based on specific conditions. It simplifies navigation management by providing a declarative approach to handle route changes, such as redirecting users to a login page if they are not authenticated or directing them to a dashboard after successful login. 
95. How do you handle 404 errors (page not found) in React Router?
To handle 404 errors (page not found) in React Router, you can use a catch-all route at the end of your route configuration that matches any path not explicitly defined by other routes. This catch-all route renders a component to display the 404 error page.
<Router>
    <Switch>
        <Route path="/" exact component={Home} />
        <Route path="/about" component={About} />
        <Route path="/contact" component={Contact} />
        {/* Catch-all route for 404 errors */}
        <Route component={NotFound} />
    </Switch>
</Router>
96. How do you access route parameters in React Router?
In React Router, you can access route parameters using the useParams hook or the match.params object.
Using the useParams hook (for functional components) you can extract route parameters from the URL. Here's how you can do it:
import { useParams } from 'react-router-dom';
function MyComponent() {
    const { paramValue } = useParams();
    // Use paramValue in your component logic
}
97. What is the difference between HashRouter and BrowserRouter in React Router?
| Aspect | HashRouter | BrowserRouter | 
|---|---|---|
| URL Structure | Uses the hash portion of the URL for routing. | Utilizes the HTML5 history API for routing, resulting in cleaner, semantic URLs without the # symbol. | 
| Browser Compatibility | Compatible with a wider range of browsers, including older ones. | Best suited for modern browsers that support the HTML5 history API. | 
| Server Configuration | Suitable for environments where server configuration is limited or unavailable. | Requires server configuration to handle URL requests for all routes. | 
| Base URL Handling | Works well for applications deployed at the root of a domain or subdirectory. | May require additional configuration for applications deployed at subdirectories due to potential URL conflicts. | 
| Deployment | Suited for static deployments (e.g., GitHub Pages) or applications where server-side routing is not possible. | Ideal for deployment in environments where server configuration is available, such as traditional web servers like Apache or Nginx. | 
98. How do you handle query parameters in React Router?
In React Router, you can handle query parameters using the useLocation hook or the location prop provided by the Route component. Here's how you can do it:
import { useLocation } from 'react-router-dom';
function MyComponent() {
    const location = useLocation();
    const queryParams = new URLSearchParams(location.search);
    const paramValue = queryParams.get('paramName');
    // Use paramValue in your component logic
}
This example uses the useLocation hook to access the current location object, including the search string containing query parameters. You can then parse the search string using the URLSearchParams API to extract the query parameters.
99. What is the purpose of the location object in React Router? 
In React Router, the location object represents the current location of the application. It contains information about the URL, including the pathname, search, hash, and other properties related to the current route. The purpose of the location object is to provide components with access to information about the current URL, allowing them to respond to changes in the route's location and perform actions accordingly.
100. Explain the purpose of the history object in React Router. 
The history object in React Router is a JavaScript object that represents the navigation history of the application. It allows you to programatically navigate between different URLs, manipulate the browser's history stack, and listen for changes to the browser's location. The main purpose of the history object is to provide a programmatic way to interact with the browser's history API within your React Router components.
101. What is the purpose of the match object in React Router? 
The match object in React Router provides information about how a component's route matches the current URL. It contains several properties that help you access information about the route's path, URL parameters, and other relevant details. The main purpose of the match object is to provide contextual information to the component about its route within the routing hierarchy. 
102. What is the significance of the useNavigate hook in React Router
The useNavigate hook is used for programmatically navigating to different routes in a React application. It returns a function that allows you to change the route, pass state, or handle redirects within your components. You would typically use useNavigate when you need to navigate without relying on the Link or NavLink components, such as after a form submission or a conditional action.
103. What is the difference between Route and Switch in React Router?
| Feature | Route | Switch | 
|---|---|---|
| Purpose | Renders a component when the path matches the current URL. | Used to group multiple Route components and render the first match only. | 
| Behavior | Every Route is checked for a match against the current URL. | Only the first Route that matches the current URL is rendered. | 
| Flexibility | Can be used independently or inside a Switch to render a specific route. | Must be used to wrap multiple Route components to provide exclusive rendering. | 
| Matching Routes | Matches any route that meets the defined path pattern. | Stops checking once a route is matched, preventing further route matches. | 
| Use Case | Defines a single route to be rendered based on the current path. | Group multiple routes where only one should be rendered based on the path. | 
104. What is the difference between controlled and uncontrolled components?
| Controlled Components | Uncontrolled Components | 
|---|---|
| The React state controls the form input value. | The DOM manages the input value. | 
| Every change in input updates the state via onChange . | React uses ref to access the current value when needed. | 
| Provides full control over input data. | Less code, simpler for basic forms. | 
| Useful for validation, conditional rendering, or complex forms. | Less control over validation and state management. | 
105. Explain CORS in React with Axios.
Cross-Origin Resource Sharing (CORS) is a security mechanism that allows or restricts requests from a different domain than the server’s. In React, CORS issues arise when the frontend (e.g., running on localhost:3000) makes requests to a backend on a different domain (e.g., api.example.com). Axios, a popular HTTP client, can be configured to handle CORS-compliant requests.
Handling CORS:
- Backend Configuration: The server must include CORS headers like Access-Control-Allow-Origin to permit requests from the frontend’s domain.
- Frontend with Axios: Ensure requests include proper headers and handle CORS errors gracefully.
Example (Axios with CORS):
import axios from 'axios';
function fetchData() {
axios.get('https://api.example.com/data', {
headers: {
'Content-Type': 'application/json',
},
withCredentials: true, // If cookies or auth are needed
})
.then(response => console.log(response.data))
.catch(error => console.error('CORS error:', error));
}
- CORS is a server-side concern; the frontend can only handle errors, not resolve CORS issues.
- Use a proxy in development (e.g., in package.json: "proxy": "https://api.example.com") to bypass CORS.
- Libraries like fetch can also handle CORS, but Axios simplifies configuration.
106. What is the Higher-Order Component?
A Higher-Order Component (HOC) is a pattern in React used to enhance or modify a component by wrapping it with another component.
- HOC is a function that takes a component and returns a new component with added functionality or behavior.
- It’s commonly used for cross-cutting concerns like authentication, fetching data, or adding styling.
- Example: Adding extra functionality (like logging) to an existing component without modifying the original component.
import React from 'react';
function withLogging(Component) {
    return function (props) {
        console.log('Rendering component with props:', props);
        return <Component {...props} />; 
    };
}
export default withLogging;
import React from 'react';
const MyComponent = (props) => {
    return <div>{props.message}</div>;
};
export default MyComponent;
import React from "react";
import MyComponent from "./MyComponent";
import withLogging from "./withLogging";
const ComponentLogging = withLogging(MyComponent);
const App = () => {
    return (
        <div>
            <ComponentLogging message="Hello, World!" />
        </div>
    );
};
export default App;
Output:
- withLogging.js: A HOC that logs props and returns a new component.
- MyComponent.js: Displays a message passed as a prop.
- App.js: Wraps MyComponent with withLogging to log props and display the message.
107. What is Axios and how to use it in React?
Axios is a promise-based HTTP client for making asynchronous requests to REST APIs. It’s widely used in React for CRUD operations due to its simplicity, support for the Promise API, and features like request cancellation and interceptors.
Installation:
npm install axios
Example:
import { useState, useEffect } from 'react';
import axios from 'axios';
function DataFetcher() {
const [data, setData] = useState(null);
const [loading, setLoading] = useState(true);
useEffect(() => {
axios.get('https://api.example.com/data')
.then(response => {
setData(response.data);
setLoading(false);
})
.catch(error => console.error('Error:', error));
}, []);
if (loading) return <div>Loading...</div>;
return <div>Data: {data.name}</div>;
}
- Axios supports features like request timeouts, interceptors, and automatic JSON parsing.
- Use interceptors for global error handling or adding auth headers.
- Alternatives include fetch, but Axios provides a more robust API.
108. What is React Material UI?
Material UI is a popular React UI framework that provides pre-built components following Google’s Material Design guidelines. It offers customizable, accessible, and responsive components for building modern React applications. Material UI is widely used for its ease of integration and compatibility with frameworks like React, Angular, and Vue.
Example:
import { Button, TextField } from '@mui/material';
function Form() {
return (
<div>
<TextField label="Name" variant="outlined" />
<Button variant="contained" color="primary">
Submit
</Button>
</div>
);
}
- Install with npm install @mui/material @emotion/react @emotion/styled.
- Components are highly customizable via props or theme overrides.
- Supports TypeScript and server-side rendering for production-ready apps.
109. How to avoid binding in ReactJS?
In class components, event handlers require binding to ensure the correct this context. However, binding can be avoided to reduce boilerplate and improve performance.
Methods to Avoid Binding:
1. Arrow Functions in Class Fields: Define methods as arrow functions to lexically bind this.
class MyComponent extends React.Component {
handleClick = () => {
console.log(this.state);
};
render() {
return <button onClick={this.handleClick}>Click</button>;
}
}
2. Arrow Functions in Render: Use inline arrow functions (but avoid for performance-critical components).
<button onClick={() => this.handleClick()}>Click</button>
3. Custom Hooks/HOCs: In functional components, hooks eliminate binding entirely.
function MyComponent() {
const handleClick = () => {
console.log('Clicked');
};
return <button onClick={handleClick}>Click</button>;
}
- Arrow functions are the modern standard to avoid binding.
- Avoid inline functions in render for memoized components to prevent re-renders.
- Functional components with hooks make binding obsolete.
110. What is the difference between useRef and createRef in React?
Both useRef and createRef create mutable references in React, but they differ in their usage, behavior, and context.
| useRef | createRef | 
|---|---|
| Hook used in React | Function used in React | 
| Used in functional components | Used in class components | 
| Persists the same ref object across re-renders | Creates a new ref object on every render | 
| Returns an object with a current property | Returns an object with a current property | 
| Used for DOM references instance variables and storing previous values | Mainly used for DOM references in class components | 
| Syntax: const ref = useRef(null) | Syntax: this.ref = React.createRef() | 
Example (useRef):
import { useRef, useEffect } from 'react';
function InputFocus() {
const inputRef = useRef(null);
useEffect(() => {
inputRef.current.focus();
}, []);
return <input ref={inputRef} />;
}
Example (createRef):
class InputFocus extends React.Component {
constructor(props) {
super(props);
this.inputRef = React.createRef();
}
componentDidMount() {
this.inputRef.current.focus();
}
render() {
return <input ref={this.inputRef} />;
}
}
- useRef is preferred in modern React for functional components.
- createRef in class components can cause issues if not managed carefully, as it creates a new ref on each render.
- useRef can store mutable values without triggering re-renders, unlike state.
111. What is useEffect in React and what is the role of its dependency array?
useEffect is a React hook that allows functional components to perform side effects such as fetching data, setting up subscriptions, or directly manipulating the DOM. It runs after the component renders, ensuring the UI is updated first.
The dependency array controls when the effect runs:
- [] : Runs once after the component mounts (like componentDidMount).
- [dep1, dep2] : Runs only when a dependency changes.
- Omitted (no array) : Runs after every render.
useEffect can also return a cleanup function that runs on unmount or before the next effect, helping prevent memory leaks.
useEffect(() => {
  console.log('Effect runs');
  return () => console.log('Cleanup runs');
}, [dependency]);
112. What is the difference between useEffect and useLayoutEffect?
| useEffect | useLayoutEffect | 
|---|---|
| Runs after render and painting | Runs before painting, after DOM updates | 
| Non-blocking | Blocking | 
| Used for data fetching, subscriptions, timers | Used for reading layout, measuring DOM, or sync DOM updates | 
| Safer for most side effects | Can slow rendering if heavy logic is used | 
| Runs after every render by default (or based on dependency array) | Use when DOM measurements are needed before painting | 
113. What is the useContext hook and when should you use it?
The useContext hook allows functional components to consume values from a React Context without passing props through every level of the component tree (avoiding “prop drilling”).
When to use it:
- Sharing global data like theme, user info, or authentication status.
- Avoiding prop drilling through many component levels.
- When multiple components need access to the same state or data.
114. What is the useReducer hook and when is it preferred over useState?
The useReducer is a React hook used to manage complex state logic in functional components. It works similarly to Redux: you define a reducer function that takes the current state and an action, and returns a new state.
const [state, dispatch] = useReducer(reducer, initialState);
// Example usage:
dispatch({ type: 'increment' });
- state is the current state.
- dispatch is used to send actions to update the state.
Preferred over useState when:
- State logic is complex or has multiple sub-values.
- Next state depends on previous state.
- You want centralized state management in a component.
115. Explain the difference between useMemo and useCallback?
| useMemo | useCallback | 
|---|---|
| Memoizes computed values | Memoizes functions | 
| Returns the result of a function | Returns the function itself | 
| Avoids expensive recalculations on re-render | Prevents re-creating functions on re-render | 
| Improves performance by caching values | Improves performance by avoiding unnecessary renders | 
| Key idea: caches value | Key idea: caches function | 
| Syntax: useMemo(() => computeValue(a, b), [a, b]) | Syntax: useCallback(() => handleClick(id), [id]) | 
116. What are custom hooks in React and how do you create one?
Custom hooks are reusable functions that let you extract and share logic between functional components. They are JavaScript functions whose names start with use and can call other hooks like useState or useEffect.
import { useState, useEffect } from 'react';
function useFetch(url) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    fetch(url)
      .then(res => res.json())
      .then(data => {
        setData(data);
        setLoading(false);
      });
  }, [url]);
  return { data, loading };
}
// Usage in a component
function App() {
  const { data, loading } = useFetch('https://api.example.com/data');
  if (loading) return <p>Loading...</p>;
  return <div>{JSON.stringify(data)}</div>;
}
In this example, useFetch is a custom hook that fetches data from an API and manages loading state. The hook is reused in App to keep the component clean and separate the data-fetching logic.
117. Explain Redux and its components.
Redux is a state management library for predictable state updates. Its core components are:
- Store: Holds the entire application state in a single object.
- Actions: Plain objects describing state changes (e.g., { type: 'ADD', payload: 1 }).
- Reducers: Pure functions that update state based on actions.
Example:
import { configureStore, createSlice } from '@reduxjs/toolkit';
import { Provider, useSelector, useDispatch } from 'react-redux';
// Slice
const counterSlice = createSlice({
name: 'counter',
initialState: { count: 0 },
reducers: {
add: (state, action) => {
state.count += action.payload;
},
},
});
const { add } = counterSlice.actions;
// Store
const store = configureStore({
reducer: counterSlice.reducer,
});
// Component
function Counter() {
const count = useSelector(state => state.count);
const dispatch = useDispatch();
return (
<div>
<p>Count: {count}</p>
<button onClick={() => dispatch(add(1))}>
Add
</button>
</div>
);
}
// App
function App() {
return (
<Provider store={store}>
<Counter />
</Provider>
);
}
- Use Redux Toolkit to reduce boilerplate in modern Redux.
- Middleware like Redux Thunk enables async actions.
Redux is overkill for small apps; consider Context API instead.
118. What are the benefits of using React Redux?
React Redux is the official React binding for Redux, a state management library that centralizes application state in a single store. It simplifies passing state between components, eliminating the need for prop drilling in large applications. Redux ensures predictable state updates through a unidirectional data flow, making it ideal for complex apps with shared state.
- Store: A single source of truth for the application state.
- Actions: Objects that describe state changes.
- Reducers: Pure functions that update the state based on actions.
Example:
import { configureStore, createSlice } from '@reduxjs/toolkit';
import { Provider, useSelector, useDispatch } from 'react-redux';
// Slice
const counterSlice = createSlice({
name: 'counter',
initialState: { count: 0 },
reducers: {
increment: (state) => {
state.count += 1;
},
},
});
const { increment } = counterSlice.actions;
// Store
const store = configureStore({
reducer: counterSlice.reducer,
});
// Component
function Counter() {
const count = useSelector((state) => state.count);
const dispatch = useDispatch();
return (
<div>
<p>{count}</p>
<button onClick={() => dispatch(increment())}>Increment</button>
</div>
);
}
// App
function App() {
return (
<Provider store={store}>
<Counter />
</Provider>
);
}
- React Redux connects React components to the Redux store using hooks like useSelector and useDispatch.
- It’s suited for large-scale apps with complex state requirements.
- Alternatives include Context API or Zustand for simpler state management.
119. How can we combine multiple reducers in React?
In Redux, large applications often require multiple reducers to manage different parts of the state. The combineReducers function from Redux merges these reducers into a single root reducer, which is then passed to the store.
Syntax:
import { combineReducers } from 'redux';
const rootReducer = combineReducers({
reducer1: reducer1,
reducer2: reducer2,
});
Example:
import { createStore, combineReducers } from 'redux';
// Books Reducer
const booksReducer = (state = [], action) => {
switch (action.type) {
case 'ADD_BOOK':
return [...state, action.payload];
default:
return state;
}
};
// Active Book Reducer
const activeBookReducer = (state = null, action) => {
switch (action.type) {
case 'SELECT_BOOK':
return action.payload;
default:
return state;
}
};
// Combine Reducers
const rootReducer = combineReducers({
books: booksReducer,
activeBook: activeBookReducer,
});
// Create Store
const store = createStore(rootReducer);
- combineReducers creates a state object where each key corresponds to a reducer’s state slice.
- Each reducer manages its own state independently, promoting modularity.
- Use with useSelector to access specific state slices in components.
120. What is State Management in React and what is the difference between Local and Global State?
State management refers to how an application handles and shares data across components. It ensures that the UI is updated correctly whenever the underlying data (state) changes. In React, state can be managed locally (inside components) or globally (shared across multiple components using context, Redux, Zustand, etc.).
| Local State | Global State | 
|---|---|
| Data managed within a single component. | Data shared across multiple components. | 
| Controlled using useState or useReducer inside the component. | Managed using Context API, Redux, Zustand, etc. | 
| Used for UI-related data like form inputs, modals, or toggles. | Used for app-wide data like authentication, user info, or theme | 
121. What are some popular state management solutions in React/Next.js?
There are several approaches and libraries for managing state in React and Next.js, depending on the scale and complexity of your application:
- React built-in hooks: useState, useReducer, useContext – for local or small-scale state management.
- Context API: Ideal for small to medium global state needs.
- Redux / Redux Toolkit: Widely used for large-scale applications with complex state logic.
- Zustand: Lightweight state management library for simplicity and performance.
- Recoil / Jotai / MobX: Alternative libraries offering fine-grained state control.
- Server-side state (Next.js): useSWR, React Query, or Server Actions for fetching and caching server data efficiently.
122. When should you use Redux over Context API?
Choosing between Redux and Context API depends on the size and complexity of your application:
Use Redux when:
- The application is large and complex.
- You need predictable state management with debugging tools (e.g., Redux DevTools).
- There are frequent state updates and many shared states across components.
Use Context API when:
- The application is small or medium-sized.
- You only need to share simple state, such as theme, language, or user info.
123. What is the difference between Client State and Server State?
| Client State | Server State | 
|---|---|
| Managed locally in the app | Managed on backend/server | 
| Controlled by useState, useReducer, Context | Controlled via API or DB | 
| Short-lived (browser session) | Persistent across sessions/users | 
| Examples: form inputs, UI toggles | Examples: user data, product list | 
124. Explain the Context API in React.
The Context API in React is used to share data globally across components without prop drilling. It allows you to wrap components with a provider and access the shared value anywhere in the tree using useContext.createContext() : Creates a context.
- Avoids prop drilling.
- Uses Provider to supply data.
- Components consume data with useContext or Consumer.
- Best for global values like theme, auth, language.
- Often combined with useState/useReducer for updates.
125. How do you handle persistent state in React apps?
Persistent state ensures that certain data remains available even after page reloads or across sessions. Common approaches include:
- localStorage or sessionStorage: Save state that persists across page reloads.
- Combine state hooks with effects: Use useState or useReducer together with useEffect to sync state with storage.
- IndexedDB: For larger or more complex client-side storage needs.
- Backend storage: Store state on a server/database via APIs for server-side persistence.
- State management libraries: Use Redux, Zustand, or Context API with persistence middleware.
- Cookies: Suitable for small pieces of data, like authentication tokens.
126. What is the difference between derived state and computed state in React?
In React, sometimes you need values that depend on other state or props. These values can be handled as derived state or computed state, but they work differently:
- Derived state: State calculated from props or other state. Should be avoided if it can be computed during render.
- Computed state: Calculated on the fly during render or using hooks like useMemo. Ensures data stays consistent without storing redundant state.
127. What is StrictMode in React?
StrictMode is a React component that wraps parts of an application to highlight potential issues during development. It doesn’t render any UI but enables additional checks and warnings to improve code quality.
Features:
- Identifies deprecated APIs and unsafe lifecycle methods.
- Warns about side effects in useEffect or useState.
- Detects unexpected side effects by double-invoking certain functions in development.
Example:
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
<React.StrictMode>
<App />
</React.StrictMode>
);
- Only active in development mode; no impact in production.
- Helps catch bugs early, especially with React 18’s concurrent features.
- Wrap only specific parts of the app if needed to isolate checks.
128. What do you understand by reconciliation in React? Why is it important?
Reconciliation in React is the process of comparing the new Virtual DOM with the previous one to determine what has changed. React then updates only the necessary parts of the real DOM, instead of re-rendering the entire UI. This approach improves performance, rendering speed, and efficiency, ensuring a smooth and responsive user experience. Key points:
- Reconciliation is React’s process to update the DOM efficiently.
- Compares new Virtual DOM with previous Virtual DOM using diffing.
- Updates only the changed parts of the real DOM.
- Improves performance, rendering speed, and efficiency.
- Ensures a smooth and responsive UI.
129. How does React.memo help improve performance?
React.memo is a higher-order component that prevents unnecessary re-renders of functional components. It re-renders a component only if its props have changed, which helps improve performance in components that render frequently or are part of large lists.
Example: If you have a large list of items and only one item changes, React.memo ensures that the other list items do not re-render, saving processing time and improving UI performance.
130. What do you mean by code splitting and lazy loading in React?
Code splitting and lazy loading are techniques used to improve performance by reducing the initial load time of a React application.
- Code Splitting: Breaks the app’s bundle into smaller chunks so the browser loads only what’s necessary.
- Lazy Loading: Loads components only when they are needed, instead of loading everything upfront.
In React, this is often implemented with React.lazy and <Suspense>:
const MyComponent = React.lazy(() => import('./MyComponent'));
function App() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <MyComponent />
    </Suspense>
  );
}
131. What is the difference between React.PureComponent and React.Component?
Both Component and PureComponent are used to create class components, but they handle re-rendering differently:
- React.Component: Always re-renders when setState is called, regardless of whether the state or props have changed.
- React.PureComponent: Implements a shallow comparison of props and state; it only re-renders if something has actually changed.
132. How do you update or remove an item from a list in React state?
State is immutable, so you cannot modify arrays directly. Instead, you create a new array using methods like .map() or .filter() and then update state with that new array.
Example (removing an item):
const [list, setList] = useState(["A", "B", "C"]);
const removeItem = (item) => {
  setList(list.filter(i => i !== item));
};
In this example, .filter() creates a new array without the removed item, and setList updates the state.
133. How would you render a nested list in React?
You can nest .map() calls: one for the parent array and another for the child array.
const categories = [
  { name: "Fruits", items: ["Apple", "Banana"] },
  { name: "Veggies", items: ["Carrot", "Tomato"] }
];
return (
  <div>
    {categories.map(cat => (
      <div key={cat.name}>
        <h3>{cat.name}</h3>
        <ul>
          {cat.items.map(item => (
            <li key={item}>{item}</li>
          ))}
        </ul>
      </div>
    ))}
  </div>
);
In this example, each level of data gets its own .map() loop, and both parent and child elements should have unique key props.
134. How do you handle dynamic sorting or filtering of lists in React?
In React, lists are usually stored in state, and you can sort or filter them dynamically by creating a new array based on the original list and updating the state.
const [users, setUsers] = useState([
  { name: "Alen", age: 25 },
  { name: "Roy", age: 30 },
  { name: "Sebin", age: 22 }
]);
// Filter active users
const filteredUsers = users.filter(user => user.age > 24);
// Sort by name
const sortedUsers = [...users].sort((a, b) => a.name.localeCompare(b.name));
- filter creates a new array containing only the items that meet the condition.
- sort rearranges the array items; using [...users] ensures the original state is not mutated.
- Updating state with the new array triggers a re-render, displaying the sorted or filtered list in the UI.
135. What is event bubbling and how can you stop it in React?
- Event Bubbling: When an event triggered on a child element propagates upward to its parent elements.
- In React, you can stop it using event.stopPropagation().
const handleClick = (e) => {
  e.stopPropagation();
  console.log("Child clicked, but won’t bubble up.");
};
136. How do you handle multiple input fields in a single form in React?
By using a single state object and updating it dynamically with name and value.
Example:
const [formData, setFormData] = useState({ name: "", email: "" });
const handleChange = (e) => {
  setFormData({ ...formData, [e.target.name]: e.target.value });
};
This way, one handler can manage multiple inputs.
137. What is the difference between useHistory and useNavigate?
- In React Router v5 : navigation was done using useHistory().
- In React Router v6 : replaced with useNavigate().
const navigate = useNavigate();
navigate("/dashboard");
138. What are route parameters and how do you access them?
Route params are dynamic parts of the URL.
<Route path="/users/:id" element={<User />} />
Inside User component:
import { useParams } from "react-router-dom";
const { id } = useParams();
/users/101 : id = 101
139. How do you redirect a user in React Router?
- Using <Navigate> component:
<Route path="/old" element={<Navigate to="/new" />} />
Using useNavigate() hook for programmatic redirects.
140. What is the difference between client-side routing and server-side routing?
Client-Side Routing
- In client-side routing, only the first request loads the HTML + JS bundle.
- After that, navigation happens inside the browser using JavaScript (like React Router).
- The page doesn’t reload : only the required component/view updates.
Example Flow:
- User visits /about.
- Server sends index.html + JS bundle (React app).
- React Router detects /about and loads <About /> component without reloading the page.
Server-Side Routing
In server-side routing, whenever a user clicks a link or enters a URL:
- A request goes to the server.
- The server processes it and sends back a new HTML page.
- The browser reloads the page completely.
Example Flow:
- User visits /about .
- Browser sends a request to server : /about .
- Server responds with an about.html page.
- Browser reloads and shows About page.
141. Difference between <Switch> and <Routes> in React Router
Switch:
- Used in React Router v5 to render only the first matching route.
- Checks routes from top to bottom and renders the first match.
- If multiple routes match, only the first one is rendered.
- The order of routes is very important.
- Supported component, render, and children props.
- Needed the exact keyword to avoid unwanted matches.
- Nested routes were harder to manage.
import { Routes, Route } from "react-router-dom";
<Routes>
  <Route path="/" element={<Home />} />
  <Route path="/about" element={<About />} />
  <Route path="/contact" element={<Contact />} />
</Routes>
Routes:
- Introduced in React Router v6 as a replacement for <Switch> .
- Uses a ranking algorithm to automatically find the best match.
- The order of routes does not matter.
- Supports only the element prop for rendering.
- Cleaner and simpler syntax compared to <Switch> .
- No need for the exact keyword anymore.
- Makes nested routing much easier.
- <Switch> is deprecated, and<Routes> is now the recommended way
<Routes>
  <Route path="/" element={<Home />} />
  <Route path="/about" element={<About />} />
  <Route path="/contact" element={<Contact />} />
</Routes>
Advanced
142. If I ask you to optimize a slow React application, what techniques would you use?
To improve performance in a slow React application, you can use several optimization techniques:
- Use React.memo, useMemo, and useCallback to avoid unnecessary re-renders.
- Split code using React.lazy and Suspense for on-demand component loading.
- Optimize large lists with react-window or react-virtualized.
- Avoid anonymous functions in render; use useCallback instead.
- Keep state localized as much as possible instead of placing everything in global state.
- Use proper key props when rendering lists.
- For server data, use libraries like React Query or SWR with caching to reduce unnecessary refetching.
143. How do useMemo and useCallback help improve performance in React?
In React, re-renders can be expensive if functions or computed values are recreated unnecessarily. useMemo and useCallback help optimize rendering by caching values and functions:
- useMemo: Memoizes the result of a computation so that it is recalculated only when its dependencies change.
- useCallback: Memoizes a function so that it is not recreated on every render, preventing unnecessary re-renders in child components.
- Both hooks help avoid expensive recalculations and unnecessary re-renders, improving performance in large or complex components.
144. What are some performance tips when rendering large lists in React?
Rendering very large lists can hurt performance, so React provides techniques and best practices to optimize them:
- Use unique keys so React can efficiently track items.
- Use virtualization libraries like react-window or react-virtualized to render only the visible portion of the list.
- Memoize list items with React.memo to prevent unnecessary re-renders.
- Implement pagination or lazy loading instead of rendering thousands of items at once.
145. What are action chaining in Redux middleware?
Action chaining in Redux middleware is the process of dispatching multiple actions in response to a single action, allowing complex sequences or multiple async operations to be handled efficiently.
146. What do you understand about the Redux Saga?
Redux-Saga is a library for managing side effects in Redux, making async tasks like data fetching easier to handle, test, and execute reliably while managing failures efficiently.
147. What are the differences between call() and put() in redux-saga?
call() and put() are both effects that can be used in Redux Saga to manage asynchronous operations, but they have different purposes:
| call() | put() | 
|---|---|
| Invokes a function or promise and waits for its result. | Dispatches an action to the Redux store. | 
| Suspends the Saga until the function or promise resolves or rejects. | Sends an action without blocking the Saga; execution continues immediately. | 
| Example: yield call(api.fetchData, action.payload) – calls a function and waits for its result. | Example: yield put({ type: 'INCREMENT' }) – dispatches an action to update the store. | 
| Blocks the Saga until the function/promise completes. | Does not block the Saga; execution continues. | 
| Returns the result of the function or promise. | No return value; only dispatches the action. | 
148. Describe the concept of Redux DevTools.
Redux DevTools is a powerful debugging tool for Redux applications that provides you with insights into the state and actions of their Redux store. It offers a range of features designed to simplify the debugging process and improve the development experience.
- Time-Travel Debugging
- State Inspection
- Action Replay
- Middleware Integration
- Customization Options
149. Explain time-travel debugging in Redux.
Time-travel debugging in Redux allows moving back and forth through the history of actions, helping track state changes over time and easily identify and fix bugs.
- Time-travel debugging in Redux lets you go back and forth through the history of actions in the Redux store.
- It helps you understand how the application's state changes over time and makes it easier to pinpoint and fix bugs by replaying specific scenarios.
- It's like rewinding and fast-forwarding through time to see how the state evolves.
150. What is the purpose of the reselect library in Redux?
The Reselect library in Redux optimizes selector performance by memoizing results, returning cached values when inputs haven’t changed to avoid unnecessary recalculations.
- The purpose of the Reselect library in Redux is to optimize the performance of selectors.
- It provides a memoization mechanism that caches the results of selector functions based on their input selectors.
- This means that if the input selectors and arguments to a selector function remain unchanged between invocations, Reselect will return the cached result instead of recomputing it, leading to significant performance improvements.
151. Can I dispatch an action in the reducer?
In Redux, while it's possible to dispatch actions within reducers, itis not suggested to do that. Reducers should remain pure functions, and responsible only for updating the state based on the dispatched action and returning a new state object.
152. How can we access a redux store outside a react component?
To access the Redux store outside a React component, you need to import the store instance from your Redux setup file. Then, you can use methods provided by Redux, such as store.getState() to access the current state of the store, or store.dispatch(action) to dispatch actions directly.
store = createStore(reducer);export default store;
153. How does Redux compare to other state management libraries like MobX, Recoil, or Zustand?
- Redux: Provides a centralized store for the state with unidirectional data flow. It's predictable but requires more boilerplate and a steep learning curve.
- MobX: Uses an observable state and automatic reactions to state changes, making it easier to use for smaller apps. It allows more flexibility, but can be less predictable for large apps.
- Recoil:Recoil is a modern React state management library using atom-based state, enabling components to subscribe to small, independent state pieces for more granular and efficient updates.
- Zustand: A minimalist state management library, emphasizing a small footprint with simple API. It uses hooks and provides global state management without boilerplate, ideal for smaller applications.
154. How does Redux work with server-side rendering (SSR)?
In server-side rendering with Redux, the store is initialized and populated on the server, sent to the client with HTML, and then rehydrated on the client to bootstrap the app with the initial state.
- On the server-side, the initial Redux store is created and populated with data fetched from the server.
- The server then sends the HTML markup along with the serialized Redux state to the client.
- On the client-side, the state is hydrated (re-hydrated from the serialized state sent by the server), and the application is bootstrapped with the initial state.
155. How do you implement authentication in Redux?
Authentication in Redux is implemented by storing tokens and user details securely in the store, using middleware like Thunk or Saga for login/logout actions, and managing global auth state to protect routes.
- Store the authentication token and user details in the Redux store, in a secure manner (e.g., avoiding storing sensitive information like passwords).
- Use middleware (like Redux Thunk or Redux Saga) to handle authentication-related actions like logging in, logging out, and checking the session.
- Implement a global authentication state and protect routes based on authentication status (e.g., redirecting to login page if the user is not authenticated).
156. How do you test Redux reducers and actions?
Redux reducers and actions are tested using Jest and Redux Testing Libraries to ensure they work correctly.
Reducers: Test reducers by dispatching actions and ensuring the correct state changes. Use tools like Jest and redux-mock-store for unit testing.
test('should handle initial state', () => {
    expect(reducer(undefined, {})).toEqual({ count: 0 });
});
Actions: Test action creators by simulating actions dispatched to the store and checking the output. Use redux-mock-store for async actions.
test('should dispatch an action', () => {
    const store = mockStore({});
    store.dispatch(fetchData());
    const actions = store.getActions();
    expect(actions[0]).toEqual({ type: 'FETCH_DATA' });
});
157. How do you handle real-time data updates with Redux?
Real-time updates in Redux are handled by receiving data via WebSockets or SSE and dispatching actions—using Thunk or Saga if needed—to update the store as events arrive.
- Use WebSockets or Server-Sent Events to receive real-time updates.
- Dispatch actions from your WebSocket event listener to update the Redux store. You can use Redux Thunk or Redux-Saga to handle side-effects for real-time data flows.
socket.on("newMessage", (message) => {
    dispatch({ type: "ADD_MESSAGE", payload: message });
});
158. What is the createAsyncThunk function in Redux Toolkit, and how does it simplify async logic?
createAsyncThunk provides a simple way to handle async logic inside Redux actions. It generates pending, fulfilled, and rejected actions automatically, making it easier to handle async states in Redux.
const fetchUser = createAsyncThunk(
    'user/fetchUser',
    async (userId) => {
        const response = await fetch(`/users/${userId}`);
        return response.json();
    }
);
159. How do we test components that use Hooks?
We can test components that use hooks in React using testing libraries like@testing-library/react or enzyme. Write test cases to simulate component rendering, user interactions, and expected outcomes. Use testing utilities like render, fireEvent, and expect to interact with components and assert their behavior, ensuring hooks are working correctly.
160. What is the purpose of the useImperativeHandle Hook?
The useImperativeHandle hook in React allows we to customize the instance value that is exposed when using ref with functional components. It's typically used to expose specific methods or properties from a child component's instance to its parent component.
161. What is the purpose of the withRouter higher-order component in React Router? 
The withRouter higher-order component in React Router is used to pass the router-related props (history, location, and match) to a component that is not directly rendered by a <Route> component. This allows access to routing information and functionality within the wrapped component, that enables programmatic navigation, accessing route parameters, or reacting to changes in the URL without the need for prop drilling. 
162. What are route guards in React Router?
In React Router, route guards are mechanisms that control and manage navigation by preventing route transitions, executing specific actions, or performing checks before rendering a route. They are used for enforcing security policies, implementing authentication and authorization logic, or fetching data before rendering a route.
163. What is the exact prop used for in React Router?
In React Router, the exact prop is used to ensure that a route is only matched if the URL matches the route's path exactly, without any additional trailing characters. When the exact prop is set to true, React Router will only render the component associated with the route if the URL path matches the route's path exactly.
For example, consider the following route configuration:
<Route exact path ="/home" component = {Home}/>
In this case, the Home component will only be rendered if the URL path is exactly /home. If the URL path includes additional characters, such as /home/about, the Home component will not be rendered unless the exact prop is set to true.
164. What is default route in React Router?
In React Router, a default route is a route configuration that matches any URL that doesn't belongs to specific routes defined in the application. It serves as a fallback route which ensures that users are directed to a designated component or page when they navigate to undefined routes, typically used for error handling or displaying a fallback UI.
165. What are protected routes in React Router?
Protected routes in React Router are routes that require authentication or authorization, ensuring that only authenticated users or users with specific permissions can access them. By implementing route guards or higher-order components, protected routes prevent unauthorized access to sensitive content within the application, redirecting users to a login page or displaying an error message if authentication or authorization requirements are not met.
166. How do you handle authentication and authorization using React Router?
You can handle authentication and authorization by creating protected routes using Route guards. If a user is not authenticated, you can redirect them to the login page using the Redirect component or programmatically using the history.push method.
import { Route, Redirect } from 'react-router-dom';
function ProtectedRoute({ component: Component, ...rest }) {
  const isAuthenticated = // check authentication status here;
  return (
    <Route
      {...rest}
      render={(props) =>
        isAuthenticated ? (
          <Component {...props} />
        ) : (
          <Redirect to="/login" />
        )
      }
    />
  );
}
167. What is React Router's useRouteMatch hook and how is it used?
The useRouteMatch hook is used to match the current URL to a route pattern. It returns a match object that contains details about how the route matches the URL, such as the path and any route parameters. It is particularly useful for creating nested routes or accessing match data without directly using the Route component.
import { useRouteMatch } from 'react-router-dom';
function MyComponent() {
  const match = useRouteMatch('/users/:userId');
  if (match) {
    return <div>User ID: {match.params.userId}</div>;
  }
  return <div>No match</div>;
}
168. How does React Router handle route transitions and animations between pages?
React Router itself does not provide built-in animations for route transitions. However, it can be integrated with animation libraries like React Transition Group or Framer Motion to manage animations during route changes. By wrapping route components with animation wrappers and listening to routing changes, developers can create smooth transitions when navigating between different views.
169. How React Router handle dynamic route rendering and loading for larger applications with multiple routes?
React Router handles dynamic route rendering by using the concept of dynamic routes and code splitting. In larger applications, you can use React’s React.lazy() function to lazily load components for specific routes, which ensures that only the necessary components are loaded when a user navigates to a particular route. This helps reduce the initial load time and improves performance by loading code in chunks as needed.
