# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-router/

React Router is a library used in React to manage client-side routing by mapping URL paths to components without reloading the page.
- Client-Side Routing: Enables navigation without full page reloads.
- URL Mapping: Connects URL paths to specific components.
- Dynamic Navigation: Allows seamless switching between views.
- Improved Performance: Updates only required components instead of the whole page.
Types of React Routers
There are three types of routers in React:
- BrowserRouter: The BrowserRouter is the most commonly used router for modern React applications. It uses the HTML5 History API to manage routing, which allows the URL to be dynamically updated while ensuring the browser's address bar and history are in sync.
- HashRouter: The HashRouter is useful when you want to use a URL hash (#) for routing, rather than the HTML5 history API. It doesn't require server configuration and works even if the server doesn't support URL rewriting.
- MemoryRouter: The MemoryRouter is used in non-browser environments, such as in React Native or when running tests.
Features
React Router provides flexible and efficient routing capabilities for React applications.
- Declarative Routing: Define routes using Routes and Route components.
- Nested Routes: Supports hierarchical routing structures.
- Programmatic Navigation: Use useNavigate for navigation control.
- Route Parameters: Enables dynamic routing with URL parameters.
- TypeScript Support: Provides better type safety and development experience.
Components
Here are the main components used in React Router:
1. BrowserRouter and HashRouter
- BrowserRouter: Uses the HTML5 history API to keep your UI in sync with the URL.
- HashRouter: Uses the hash portion of the URL (i.e., window.location.hash) to keep your UI in sync with the URL.
<BrowserRouter>
    {/* Your routes go here */}
</BrowserRouter>
2. Routes and Route
- Routes: A container for all your route definitions.
- Route: Defines a single route with a path and the component to render.
<Routes>
    <Route path="/" element={<Home />} />
    <Route path="/about" element={<About />} />
</Routes>
3. Link and NavLink
- Link: Creates navigational links in your application.
- NavLink: Similar to Link but provides additional styling attributes when the link is active.
<NavLink 
  to="/" 
  className={({ isActive }) => (isActive ? "active" : "")}
>
  Home
</NavLink>
Steps to Create Routes using React Router
Steps to Creating routes using React Router involves configuring navigation paths and linking them to components to enable dynamic page rendering within a React application.
Step 1: Initialize React Project
Run the following command to create a new React application:
npm create vite@latest react-router-example
cd react-router-example
Step 2: Install React Router
Install react-router in your application write the following command in your terminal
npm install react-router-dom@6
Project Structure
Dependencies list after installing react router
"dependencies": {
    "@testing-library/jest-dom": "^5.17.0",
    "@testing-library/react": "^13.4.0",
    "@testing-library/user-event": "^13.5.0",
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "react-router-dom": "^6.24.1",
    "web-vitals": "^2.1.4"
}
Example: This example demonstrates implementing basic routes in a React App.
/* src/index.css */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}
h2 {
    text-align: center;
    color: #333;
}
nav ul {
    display: flex;
    justify-content: center;
    list-style: none;
    padding: 0;
}
nav li {
    margin: 0 10px;
}
nav a {
    text-decoration: none;
    color: #333;
}
button {
    display: block;
    margin: 20px auto;
    padding: 10px 20px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
button:hover {
    background-color: #0056b3;
}
// src/index.js
import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import App from "./App";
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>
);
// src/App.js
import React from "react";
import {
    BrowserRouter as Router,
    Routes,
    Route,
    Link,
    useNavigate,
    Outlet,
} from "react-router-dom";
// Home Page Component
const Home = () => {
    const navigate = useNavigate();
    return (
        <div>
            <h2>Home Page</h2>
            <button onClick={() =>
                 navigate("/contact")}>Go to Contact</button>
        </div>
    );
};
// About Page Component 
const About = () => (
    <div>
        <h2>About Page</h2>
        <nav>
            <ul>
                <li>
                    <Link to="team">Our Team</Link>
                </li>
                <li>
                    <Link to="company">Our Company</Link>
                </li>
            </ul>
        </nav>
        <Outlet />
    </div>
);
// Components for other pages
const Contact = () => <h2>Contact Page</h2>;
const Team = () => <h2>Team Page</h2>;
const Company = () => <h2>Company Page</h2>;
function App() {
    return (
        <Router>
            <nav>
                <ul>
                    <li>
                        <Link to="/">Home</Link>
                    </li>
                    <li>
                        <Link to="/about">About</Link>
                    </li>
                    <li>
                        <Link to="/contact">Contact</Link>
                    </li>
                </ul>
            </nav>
            {/*Implementing Routes for respective Path */}
            <Routes>
                <Route path="/" element={<Home />} />
                <Route path="/about" element={<About />}>
                    <Route path="team" element={<Team />} />
                    <Route path="company" element={<Company />} />
                </Route>
                <Route path="/contact" element={<Contact />} />
            </Routes>
        </Router>
    );
}
export default App;
Step 3: Run the application using the following command.
npm run dev
Output:
Uses of React Router
- Navigation and Routing: React Router provides a declarative way to navigate between different views or pages in a React application. It allows users to switch between views without refreshing the entire page.
- Dynamic Routing: React Router supports dynamic routing, which means routes can change based on the application's state or data, making it possible to handle complex navigation scenarios.
- URL Management: React Router helps manage the URLs in your application, allowing for deep linking, bookmarkable URLs, and maintaining the browser's history stack.
- Component-Based Approach: Routing is handled through components, making it easy to compose routes and navigation in a modular and reusable way.
- Handling Nested Routes: React Router allows the creation of nested routes, which enables a more organized and structured approach to rendering content. This is particularly useful for larger applications with a complex structure.
