# What are error boundaries in ReactJS (16) ?

> Source: https://www.geeksforgeeks.org/reactjs/what-are-error-boundaries-in-reactjs-16/

React employs error boundaries to manage runtime errors, preventing application breakdown. By implementing `static getDerivedStateFromError()` and/or `componentDidCatch()` lifecycle methods in a class component, developers can create error boundaries for rendering fallback UIs and logging error information.
Error boundaries don't catch errors for:
- Event handlers
- Asynchronous code (e.g. setTimeout or network request )
- Server Side rendering
- Errors are thrown in the error boundary itself (rather than its children)
Steps to Create the React Application
Step 1: Create a React application using the following command:
npx create-react-app error-boundary-demo
Step 2: After creating your project folder i.e. error-boundary-demo, move to it using the following command:
cd error-boundary-demo
Step 3: Create a directory and name it Component.
mkdir Component
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example: Error Boundary catch the errors anywhere in their component tree, and display a fallback UI. Let's add it. Component directory and write down the following code.
import React from "react";
import ErrorBoundary from "./Component/ErrorBoundary";
import HeroViewar from "./Component/HeroViewar";
const App = () => {
    return (
        <>
            <ErrorBoundary>
                <HeroViewar name="Superman" />
            </ErrorBoundary>
            <ErrorBoundary>
                <HeroViewar name="Batman" />
            </ErrorBoundary>
            <ErrorBoundary>
                <HeroViewar name="Joker" />
            </ErrorBoundary>
        </>
    );
};
export default App;
import React, { Component } from 'react'
class ErrorBoundary extends Component {
    constructor(props) {
        super(props)
        this.state = { hasError: false }
    }
    
    static getDerivedStateFromError(error){
        // Update state so the next render
        // will show the fallback UI.
        return { hasError: true }
    }
    componentDidCatch(error, errorInfo) {
        // You can also log the error to
        // an error reporting service
        console.log(error, errorInfo)
    }
    render() {
        if (this.state.hasError) {
          // You can render any custom fallback UI
          return <h2>Something went wrong!</h2>
        }    
        return this.props.children 
      }
}
export default ErrorBoundary
import React from "react";
import HeroViewar from "./Component/HeroViewar";
const App = () => {
    return (
        <>
            <HeroViewar name="Superman" />
            <HeroViewar name="Batman" />
            <HeroViewar name="Joker" />
        </>
    );
};
export default App;
import React from "react";
const HeroViewar = ({ name }) => {
    // Throw an error if not hero
    if (name === "Joker") throw new Error("Not a Hero!");
    return <h2>{name}</h2>;
};
export default HeroViewar;
Step 4: Update App.js to wrap each and every HeroViewar with ErrorBoundary like:
<ErrorBoundary>
<HeroViewar name="..." />
</ErrorBoundary>
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output:
