# HashRouter in React Router

> Source: https://www.geeksforgeeks.org/reactjs/hashrouter-in-react-router/

React Router is a ReactJS Library used for handling the navigation and routing in a web application. 'HashRouter' is a component in the react-router-dom library. It is used for implementing client-side routing in a React Application.
- 'HashRouter' uses the hash portion ('#') of the URL to manage the client-side routing.
- It creates a simple and effective way of handling navigation without causing a full page to reload.
Features of HashRouter
There are some common features in HashRouter that is explained here.
- Hash-Based Routing: The 'HashRouter' uses the hash portion (the part after the '#' symbol) of the URL to determine the current application state.
- Client Side Navigation: The 'HashRouter' facilitates client-side navigation by listening to changes in the URL's hash and updating the UI accordingly. It allows for a more dynamic and responsive user experience without triggering a full page reload.
Difference Between HashRouter and BrowserRouter
| HashRouter | BrowserRouter | 
|---|---|
| Uses URLs with a hash symbol eg (/#/about) | Uses cleaner URL without a hash ( eg: '/about') | 
| It can uses in simpler application or static site deployments | Suitable for more complex applications with server-side rendering support | 
| import {HashRouter} from 'react-router-dom' ; | import {BrowserRouter} from 'react-router-dom' | 
Steps to Create the HashRouter:
Step 1: Set up React project using the command
npx create-react-app client
Step 2: Navigate to the project folder using
cd client
Step 3: Installing the required packages:
npm install react-router-dom
Step 4: Create the required files and write the following code in respective files.
// App.js
import React from "react";
import { HashRouter, Route, Routes, Link } from "react-router-dom";
import Home from "./pages/Home";
import About from "./pages/About";
const App = () => {
    return (
        <HashRouter>
            <nav>
                <ul>
                    <li>
                        <Link to="/home">Home</Link>
                    </li>
                    <li>
                        <Link to="/about">About</Link>
                    </li>
                </ul>
            </nav>
            <Routes>
                <Route path="/home" element={<Home />} />
                <Route path="/about" element={<About />} />
            </Routes>
        </HashRouter>
    );
};
export default App;
// ./pages/Home.js
export default function Home() {
    return <div>Home Page</div>;
}
// ./pages/About.js
export default function About() {
    return <div>About Page</div>;
}
Output
