# How to use componentWillMount() in React Hooks?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-componentwillmount-in-react-hooks/

The componentWillMount() method allows us to execute the React code synchronously when the component gets loaded or mounted in the DOM (Document Object Model). This method is called during the mounting phase of the React Life-cycle.
You cannot use any of the existing React lifecycle methods like ComponentDidMount, ComponentWillUnmount, etc. in a hook based component. To use the functionality of the class-based methods, React hooks provide the alternative like useEffect Hook for componentDidMount, componentDidUpdate, and componentWillUnmount combined but for componentWillMount(), no such hook is provided even in the official React Docs.
ComponentWillMount() will go to be deprecated in future releases of React as per this issue. It is suggested to use ComponentDidMount() or useEffect hook as its alternative but you can still use ComponentWillMount() by calling it as UNSAFE_ComponentWillMount().
ComponentWillMount() is generally used to show a loader when the component is being loaded or when the data from the server is being fetched but once it will get completely deprecated then we can use SuspenseAPI as a better alternative.
Creating React Application:
Step 1: Create a React application using the following command:
npx create-react-app functiondemo
Step 2: After creating your project folder i.e. functiondemo, move to it using the following command:
cd functiondemo
Project Structure: It will look like the following.
Example: In this example, we are going to build an application that logs the message when the component is rendered in the DOM tree.
App.js: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
Using componentWillMount() Method:
import React from 'react';
class ComponentOne extends React.Component {
    UNSAFE_componentWillMount() {
        console.log('Component is mounted in the DOM');
    }
    render() {
        return <h1>Hello Geeks!</h1>;
    }
}
class App extends React.Component {
    render() {
        return (
            <div>
                <ComponentOne />
            </div>
        );
    }
}
export default App;
Alternative Using useLayoutEffect() Method:
import React, { useLayoutEffect } from 'react';
const ComponentOne = () => {
    // Defining the useLayoutEffect hook
    useLayoutEffect(() => {
        console.log('Component is mounted in the DOM');
    }, []);
    return <h1>Hello Geeks!</h1>;
};
const App = () => {
    return (
        <div>
            <ComponentOne />
        </div>
    );
};
export default App;
Note: You can define your own styling in the App.css file.
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output:
