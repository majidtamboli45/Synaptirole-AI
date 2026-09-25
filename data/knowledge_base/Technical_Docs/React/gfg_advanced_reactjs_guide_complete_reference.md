# Advanced ReactJS Guide Complete Reference

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-advanced-guides-complete-reference/

React is a powerful library for building dynamic and interactive user interfaces. Beyond basics like components and state, advanced features help create faster, scalable, and more efficient applications.
- Improves performance using techniques like memorization and lazy loading.
- Helps manage complex state with hooks and advanced patterns.
- Enables building scalable and maintainable applications.
Rendering in React
Rendering is the process where React takes the component's data (state and props) and turns it into a UI that the user can interact with. When a component is first loaded, React renders the component and displays it in the DOM.
import React from "react";
function MyComp() {
    return <h1>Hello, World!</h1>;
}
export default MyComp;
- React functional component called MyComponent.
- It returns JSX that renders the text "Hello, World!" inside an <h1> element.
- The component is exported using export default so it can be imported and used in other parts of the application.
Re-rendering in React
Re-rendering happens when the state or props of a component change. React will trigger a re-render to reflect the updated data in the UI. However, React optimizes this process to avoid unnecessary re-renders.
Causes of Component Re-rendering
- Re-rendering occurs when: State changes: If the component’s internal state (useState, setState) changes, React will re-render the component to show the new state.
- Props change: If the props passed to the component change, React re-renders that component to reflect the new props.
Real DOM
The Real DOM is the actual representation of the UI in the browser. It’s a programming interface for web documents and represents the structure of a webpage as a tree of elements.
- Slower Updates: When the state or data changes in a web application, the entire DOM may need to be updated.
- Direct Manipulation: The Real DOM is updated directly. When a change is made, the browser updates the actual page, often causing reflows and repaints, which can be resource-intensive.
- Heavy Operations: Modifying the Real DOM can trigger heavy operations like layout recalculations, which makes direct manipulation of the Real DOM inefficient, especially for large applications.
Virtual DOM
The Virtual DOM is a lightweight, in-memory representation of the Real DOM. It’s an abstraction that React uses to optimize the process of updating the UI. Rather than manipulating the Real DOM directly, React updates the Virtual DOM first and then compares it with the previous version to efficiently apply the minimal number of changes to the Real DOM. This process is called reconciliation.
- Faster Updates: The Virtual DOM allows React to perform batch updates. It avoids direct manipulation of the Real DOM, making updates much faster.
- Efficient Rendering: React uses a diffing algorithm to compare the Virtual DOM with the Real DOM and calculates the minimal set of changes needed to update the UI.
- No Reflows or Repaints: By updating only what is necessary, React avoids reflows and repaints, which are costly operations in the Real DOM.
Higher-Order Components (HOCs)
Higher-Order Components (HOCs) are a powerful pattern in React. HOCs are functions that take a component and return a new component with additional props. They are typically used for cross-cutting concerns like authentication, logging, or data fetching, providing reusable functionality.
import React from 'react';
import DisplayMessage from './DisplayMessage';
import withLogging from './withLogging';
const EnhancedDisplayMessage = withLogging(DisplayMessage);
function App() {
  return (
    <div>
      <h1>React App with Higher-Order Component (HOC)</h1>
      <EnhancedDisplayMessage message="Hello, World!" />
    </div>
  );
}
export default App;
import React from 'react';
function withLogging(WrappedComponent) {
    return function msg(props) {
        console.log('Rendering Enhanced Component with props:', props);
        // Render the wrapped component
        return <WrappedComponent {...props} />;
    };
}
export default withLogging;
import React from 'react';
function DisplayMessage({ message }) {
    return <h1>{message}</h1>;
}
export default DisplayMessage;
Output:
React Context API
The Context API allows you to share values between components without explicitly passing props down through every level of the tree. It is ideal for state that needs to be accessed by many components, such as themes or authentication status.
import React from 'react';
import MyContext from './MyContext';  // Import the created context
import ChildComponent from './ChildComponent';  // Import the child component
function App() {
    return (
        <MyContext.Provider value="Hello from Context!">
            <div>
                <h1>React Context API Example</h1>
                <ChildComponent />
            </div>
        </MyContext.Provider>
    );
}
export default App;
import React from 'react';
// Create a Context with a default value
const MyContext = React.createContext('Default Value');
export default MyContext;
import React, { useContext } from 'react';
import MyContext from './MyContext';
function ChildComponent() {
    const contextValue = useContext(MyContext);
    console.log('Context Value:', contextValue);
    return <p>{contextValue}</p>;
}
export default ChildComponent;
Output:
React Suspense and Lazy Loading
The React.lazy() function is used to dynamically import a component. This enables code splitting, where the components are loaded only when they are required.
- React.lazy(): This is used to define the LazyComponent. It will only load the component when it is required (i.e., when it’s rendered).
const LazyComponent = lazy(() => import('./LazyComponent'));
- Suspense: This is a wrapper around the lazy-loaded component. It displays a fallback (such as a loading spinner or a message) while the component is being loaded asynchronously.
<Suspense fallback={<div>Loading...</div>}>
<LazyComponent />
</Suspense>
Performance Optimization in React
Optimizing the performance of a React application is crucial to ensure it runs smoothly, especially for larger applications with complex UIs and state management. Here are the key strategies and best practices for performance optimization in React:
Memoization of Components
React.memo() is a higher-order component (HOC) that helps to prevent unnecessary re-renders of a component. It wraps a component and only re-renders it if its props change.
Syntax:
const MyComponent = React.memo(function MyComponent({ count }) {
console.log('Rendering MyComponent');
return <p>Count: {count}</p>;
});
Using useCallback for Memoizing Functions
The useCallback hook memoizes functions and ensures they are not re-created on every render. This is useful when passing functions as props to child components, especially when those functions are used inside a React.memo() wrapped component.
Syntax:
const increment = useCallback(() => setCount(count + 1), [count]);
return <ChildComponent increment={increment} />;
}
State Management with Redux
Redux is a predictable state container for JavaScript apps. It is ideal for managing the global state of the app. Redux allows you to centralize the state and dispatch actions to update the state.
Steps involved in Redux
- Store: Holds the state.
- Actions: Describe what happened.
- Reducers: Specify how the state changes in response to actions.
import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { increment } from './actions';
const App = () => {
    const count = useSelector(state => state.count);  // Select only count
    const dispatch = useDispatch();
    return (
        <div>
            <h1>{count}</h1>
            <button onClick={() => dispatch(increment())}>Increment</button>
        </div>
    );
};
export default App;
export const increment = () => ({
    type: 'INCREMENT',
});
  
const initialState = {
    count: 0,
    theme: 'light',
};
const counterReducer = (state = initialState, action) => {
    switch (action.type) {
        case 'INCREMENT':
            return { ...state, count: state.count + 1 };
        case 'TOGGLE_THEME':
            return { ...state, theme: state.theme === 'light' ? 'dark' : 'light' };
        default:
            return state;
    }
};
export default counterReducer;
import { createStore } from 'redux';
import counterReducer from './reducer';
const store = createStore(counterReducer);
export default store;
Output:
Error Boundaries
Error Boundaries are React components that catch JavaScript errors anywhere in their child component tree, log those errors, and display a fallback UI instead of crashing the whole app.
import React from 'react';
import ErrorBoundary from './ErrorBoundary';
import BuggyComponent from './BuggyComponent';
function App() {
    return (
        <div>
            <h1>React Error Boundaries Example</h1>
            {/* Wrap BuggyComponent in ErrorBoundary */}
            <ErrorBoundary>
                <BuggyComponent />
            </ErrorBoundary>
        </div>
    );
}
export default App;
import React, { Component } from 'react';
class ErrorBoundary extends Component {
    constructor(props) {
        super(props);
        this.state = { hasError: false, errorMessage: '' };
    }
    static getDerivedStateFromError(error) {
        // Update state to show fallback UI
        return { hasError: true, errorMessage: error.message };
    }
    componentDidCatch(error, info) {
        // Log the error for debugging (optional)
        console.log('Error caught by ErrorBoundary:', error);
        console.log('Error information:', info);
    }
    render() {
        if (this.state.hasError) {
            // Fallback UI if there is an error
            return (
                <div>
                    <h1>Something went wrong:</h1>
                    <p>{this.state.errorMessage}</p>
                </div>
            );
        }
        return this.props.children;  // Render children if no error
    }
}
export default ErrorBoundary;
import React, { useState } from 'react';
function BuggyComponent() {
    const [count, setCount] = useState(0);
    if (count === 5) {
        // Simulate an error when count is 5
        throw new Error('I crashed!');
    }
    return (
        <div>
            <h1>Count: {count}</h1>
            <button onClick={() => setCount(count + 1)}>Increment</button>
        </div>
    );
}
export default BuggyComponent;
Output:
Reconciliation Algorithm
The Reconciliation Algorithm in React is the process of comparing the new Virtual DOM with the previous one and determining the minimal set of changes required to update the Real DOM efficiently. This is important for React’s performance, as it allows React to make updates with minimal computational overhead, resulting in faster rendering.
Working of Reconciliation in React
When the state or props of a React component change, React needs to update the UI. Here’s how the Reconciliation process works step-by-step:
- Virtual DOM Creation: When a component is rendered, React first creates a Virtual DOM (an in-memory representation of the real DOM) to describe what the UI should look like.
- Change in State/Props: When the state or props of a component change (e.g., through setState() or useState()), React triggers a re-render of that component.
- New Virtual DOM Tree: React creates a new Virtual DOM based on the updated state or props. This tree represents the desired UI after the update.
- Comparison (Diffing): React compares the new Virtual DOM tree with the previous one. This process is known as "diffing". React uses a series of heuristics to make this comparison more efficient.
- Minimal Updates to Real DOM: After identifying the differences (or "diffs") between the old and new Virtual DOM, React applies the minimal set of changes to the Real DOM. These are the "patches" that update the actual page on the screen.
Server-Side Rendering (SSR)
Server-Side Rendering is a technique where the HTML for a page is generated on the server at the time the request is made by the user, rather than in the browser.
Working of SSR
- When a user requests a page (for example, by visiting a URL), the server generates the HTML content for that page on the fly.
- The server sends the fully rendered HTML to the browser, which then displays the content to the user.
- Once the initial HTML is loaded, JavaScript runs on the client-side to make the page interactive (by attaching event listeners, fetching data, etc.).
Static Site Generation (SSG):
Static Site Generation is a technique where the HTML for a page is generated at build time instead of runtime. The pages are pre-rendered into static HTML files that are served to the user.
Working of SSG
- During build time, all pages of the website are rendered into static HTML files.
- These static files are saved and served by the server or CDN (Content Delivery Network) when requested by the user.
- The user receives the static HTML immediately, and JavaScript is used for adding interactivity on the client side.
React Hooks
- useReducer: Manage complex state logic in functional components.
- useCallback & useMemo: Optimize performance by memoizing functions and values.
- Custom Hooks: Reuse logic across components efficiently.
The Complete List of ReactJS Advanced Guides are listed below:
