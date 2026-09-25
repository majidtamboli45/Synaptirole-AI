# React JS ReactDOM

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-reactdom/

ReactDOM is a core React package that provides DOM-specific methods to interact with and manipulate the Document Object Model (DOM), enabling efficient rendering and management of web page elements.
ReactDOM is used for:
- Rendering Components: Displays React components in the DOM.
- DOM Manipulation: Allows efficient DOM updates.
- Server-Side Rendering: Supports rendering on both client and server.
- React & DOM Bridge: Connects React with the browser’s DOM.
How to use ReactDOM?
To use the ReactDOM in any React web app, we must first install the react-dom package in our project. To install the react-dom package, use the following command.
// Installing
npm i react-dom
After installing the package use the following command to import the package in your application file
// Importing
import ReactDOM from 'react-dom'
After installing react-dom, it will appear in the dependencies in the package. json file like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
}
Important Methods of ReactDOM
- render(): This is one of the most important methods of ReactDOM. This function is used to render a single React component or several components wrapped together in a component or a div element.
- findDOMNode(): This function is generally used to get the DOM node where a particular React component was rendered. This method is much less used, as the following can be done by adding a ref attribute to each component itself.
- unmountComponentAtNode(): This function is used to unmount or remove the React Component that was rendered to a particular container.
- hydrate(): This method is equivalent to the render() method but is implemented while using server-side rendering.
- createPortal(): It allows us to render a component into a DOM node that resides outside the current DOM hierarchy of the parent component.
Essential Functionalities of ReactJS
- ReactDOM.render() replaces the child of the given container if any. It uses a highly efficient diff algorithm and can modify any subtree of the DOM.
- React findDOMNode() function can only be implemented upon mounted components thus Functional components can not be used in findDOMNode() method.
- ReactDOM uses observables thus provides an efficient way of DOM handling.
- ReactDOM can be used on both the client-side and server-side.
