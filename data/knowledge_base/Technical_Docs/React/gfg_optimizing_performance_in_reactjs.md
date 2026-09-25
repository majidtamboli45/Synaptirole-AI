# Optimizing Performance in ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/optimizing-performance-in-reactjs/

Performance matters a lot in any application. In ReactJS, Optimizing the performance is an important task to do before launching a React application. There are different ways to explore optimizing a React application that can help to increase speed and efficiency as well as user experience.
ReactJS is a JavaScript library for making UI and apps. React provide different ways to minimize the costly DOM operations required to update the UI. For most of the time, using React will lead to a fast UI experience without doing much work to optimize for performance.
There are several ways you can speed up your React application. These are the methods to follow:
- Using React.Fragment - When working with React, there are cases where we need to render multiple elements or return a group of related items. Using additional div to wrap will fix this, but it comes with a problem. Because we are adding an extra node to the DOM, which is totally not useful. In cases like this, where we have the child component which is enclosed within a parent component. Here we encounter this problem. Let’s solve this by using React Fragment, which will help not to add any additional node to the DOM.
- Use of production build - Another way of optimizing a React app is by making sure you bundle your app for production before deploying. By default, the app is in development mode, which means React will include helpful warnings which come with it. This method is useful while you are developing a ReactJS application, but it creates a problem that your app size is large and responses are slower than usual. If the project is built with create-react-app, This can be fixed by running npm run build before the deployment, which will create a production-ready build of your app in a build/ folder that can be then deployed. This can make sure that your app is in either development or production mode using the React Developer Tools.
From the project directory run the code:
npm run build
This will create a production build of the ReactJS app.
- Prefer component state local - Whenever a state updates in a parent component, it re-renders the parent and its child components. Therefore, we need to make sure that re-rendering a component only happens when it is necessary. We can achieve this by making it local to that part of the code.
- Memoizing React components - React.memo is a great way of optimizing performance as it helps cache functional components.
- Memoization in general is an optimization technique used primarily to speed up computer programs by storing the results of expensive function calls and returning the cached result when the same inputs occur again. Whenever a function is rendered using this technique, it saves the output in memory, and the next time the function with the same arguments is called it returns the saved output without executing the function again.
- Windowing or list virtualization - Windowing or List virtualization is a concept of only rendering or writing the visible portion in the current “ window ” to the DOM. The number of items rendered for the first time is smaller than the original one. The items which are not rendered in the first small window will load when scrolling down to it. The DOM nodes of items that exit from the current window are replaced by the new which were not rendered the first time. This improves the performance of rendering a large list.
Let's create an application and implement all the above to optimize our react app
Creating React Application:
Step 1: Create a React application using the following command:
npx create-react-app example
Step 2: After creating your project folder i.e. example, move to it using the following command:
cd example
Project structure: It will look like this.
Example: To demonstrate to optimize react app. Write down the following code in index.js and App.js
- index.js
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
- App.js
import React from "react";
const numbers = [1, 2, 3, 4, 5];
function List(props) {
    const numbers = props.numbers;
    const listItems = numbers.map((number, index) =>
        <li>{number}</li>);
    return (
        <> {/*This is a short format of fragment */}
            <div>List of numbers</div>
            <ul>{listItems}</ul>
        </>
    );
}
function App() {
    return (
        <React.Fragment> 
        {/*Fragment is a component that is not rendered */}
            <List numbers={numbers} />
        </React.Fragment>
    );
}
export default App;
In the above code, we used the React fragment, kept components local, and optimized the React app.
Step to run the application: Run the following command from the root directory of the project.
npm start
Output :
