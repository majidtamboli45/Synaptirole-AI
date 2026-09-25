# React.js Error Boundaries

> Source: https://www.geeksforgeeks.org/reactjs/react-js-error-boundaries/

Error boundaries are React components that catch errors during rendering, in constructors, lifecycle methods, and within child components. They prevent the entire React application from crashing due to errors in specific components.
- Catches Errors: Catches errors during rendering, lifecycle methods, and in child components.
- Prevents Crashes: Avoids the app from crashing entirely due to errors in isolated parts of the UI.
- Fallback UI: Displays an alternative UI when errors occur.
- Logs Errors: Useful for logging errors to external services for debugging.
Working
Error boundaries work similarly to try/catch in JavaScript. If an error occurs within a component’s rendering process or lifecycle methods, React looks for the nearest error boundary in the component tree. The error boundary captures the error and renders a fallback UI, preventing the error from propagating and crashing the whole application.
They do not catch errors in:
- Event handlers(e.g., onClick, onSubmit)
- Asynchronous code (e.g., setTimeout, requestAnimationFrame)
- Server-side rendering (SSR)
- Errors thrown inside the error boundary component itself.
Implementing Error Boundaries in a React App
Follow these steps to implement Error Boundaries:
Step 1: Create a React application using the following command:
npm create vite@latest error-boundary
Step 2: After creating the error-boundary directory move to it.
cd error-boundary
Project Structure: It will look like the following.
Step 3: Using Error Boundaries
import React from "react";
class ErrorBoundary extends React.Component {
    constructor(props) {
        super(props);
        this.state = { error: null, errorInfo: null };
    }
    componentDidCatch(error, errorInfo) {
        this.setState({
            error: error,
            errorInfo: errorInfo
        })
    }
    render() {
        if (this.state.errorInfo) {
            return (
                <div>
                    <h2>An Error Has Occurred</h2>
                    <details>
                        {this.state.error && this.state.error.toString()}
                        <br />
                        {this.state.errorInfo.componentStack}
                    </details>
                </div>
            );
        }
        return this.props.children;
    }
}
// This is a component for Counter,Named Counter
class Counter extends React.Component {
    constructor(props) {
        super(props);
        this.state = { counter: 0 };
        this.handleClick = this.handleClick.bind(this);
    }
    handleClick() {
        this.setState(({ counter }) => ({
            counter: counter + 1
        }));
    }
    render() {
        if (this.state.counter === 3) {
            throw new Error('Crashed!!!!');
        }
        return <h1 onClick={this.handleClick}>{this.state.counter}</h1>;
    }
}
function App() {
    return (
        <div style={{ marginLeft: '30px', marginTop: '50px' }}>
            <div style={{ textAlign: "center" }}>
                <h1>
                    <strong>To see the working of Error boundaries
                        click on the Counters to increase the value
                    </strong>
                </h1>
                <p>
                    Program is made such a way that as soon as the counter
                    reaches the value of 3, Error boundaries will throw an
                    error.
                </p>
            </div>
            <hr style={{ width: "500px" }} />
            <ErrorBoundary>
                <p>
                    These two counters are inside the same error boundary.
                    If one crashes, then the effect will be done on both
                    as the error boundary will replace both of them.
                </p>
                <Counter />
                <Counter />
            </ErrorBoundary>
            <hr style={{ width: "500px" }} />
            <p>
                These two counters are each inside of their
                own error boundary. So if one crashes, the
                other is not affected.
            </p>
            <ErrorBoundary><Counter /></ErrorBoundary>
            <ErrorBoundary><Counter /></ErrorBoundary>
        </div>
    );
}
export default App;
//index.js 
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
ReactDOM.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>,
    document.getElementById('root')
);
reportWebVitals();
Step 4: Running the Application
Start the development server using the following command:
npm run dev
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
- If both counters are wrapped in a single error boundary, an error in either one (e.g., reaching 3) will prevent both from rendering, displaying a fallback UI instead.
- If each counter has its own error boundary, only the counter that causes the error stops rendering, while the other continues to function normally.
- This approach ensures better error isolation, allowing unaffected components to remain operational.
Handling Errors Using react-error-boundary
The react-error-boundary library provides an alternative approach to handling errors in React applications using hooks and functional components.
To install the package, run:
npm i react-error-boundary
import React from "react";
import { ErrorBoundary } from "react-error-boundary";
function ErrorFallback({ error, resetErrorBoundary }) {
    return (
        <div>
            <h2>Something went wrong:</h2>
            <pre>{error.message}</pre>
            <button onClick={resetErrorBoundary}>Try again</button>
        </div>
    );
}
function BuggyComponent() {
    throw new Error("Oops! Something went wrong.");
}
function App() {
    return (
        <ErrorBoundary FallbackComponent={ErrorFallback}>
            <BuggyComponent />
        </ErrorBoundary>
    );
}
export default App;
- Error Handling: react-error-boundary provides an easy way to catch and handle errors in functional components.
- Fallback UI: Displays an error message and a retry button when an error occurs.
- Recovery: Allows users to reset the error state using resetErrorBoundary.
Limitations of Error Boundaries
Error boundaries have some restrictions in handling errors in React.
- Can only be used with class components (unless using react-error-boundary).
- Do not catch errors in event handlers, async code, SSR, or inside the boundary itself.
- Uncaught errors still cause React to unmount the entire component tree.
- try/catch cannot fully replace error boundaries because React is declarative.
Usage of Error Boundaries
Error boundaries help in handling and isolating UI errors effectively.
- At the top level of the application to prevent complete crashes.
- Around UI components that may fail (e.g., third-party widgets).
- Around dynamic content such as fetched data.
- Around isolated features, so one broken component doesn’t affect the whole app.
