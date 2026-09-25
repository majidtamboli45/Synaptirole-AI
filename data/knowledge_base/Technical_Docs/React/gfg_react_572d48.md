# React Introduction

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-introduction/

ReactJS is a component-based JavaScript library used for building dynamic and interactive user interfaces. It enables developers to create reusable UI components and develop fast, scalable single-page applications (SPAs) with efficient rendering and updates.
- Uses reusable components for better code organization.
- Improves performance with a virtual DOM.
- Supports unidirectional data flow for predictable behavior.
"Hello, World!" Program in React
import React from "react";
function App()
{
    return (<div><h1>Hello, World!</h1>
    </div>);
}
export default App;
In this code,
- import React from 'react': Imports React to create components and use JSX.
- function App() { ... }: Defines a functional component called App.
- return ( ... ): Returns JSX that represents the UI (a div with an h1 tag displaying "Hello, World!").
- export default App: Exports the App component so it can be used elsewhere.
Working of React
React operates by creating an in-memory Virtual DOM rather than directly manipulating the browser’s DOM. It processes and compares changes within this virtual representation before updating the actual browser DOM.
- Actual DOM and Virtual DOM: Initially, there is an Actual DOM(Real DOM) containing a div with two child elements: h1 and h2. React maintains a previous Virtual DOM to track the UI state before any updates.
- Detecting Changes: When a change occurs (e.g., adding a new h3 element), React generates a New Virtual DOM. React compares the previous Virtual DOM with the New Virtual DOM using a process called reconciliation.
- Efficient DOM Update: React identifies the differences (this case, the new h3 element). Instead of updating the entire DOM, React updates only the changed part in the New Actual DOM, making the update process more efficient.
- Applying Changes to the Browser: After identifying the differences, React updates only the affected elements in the Actual DOM. This minimizes unnecessary DOM operations and improves rendering performance.
