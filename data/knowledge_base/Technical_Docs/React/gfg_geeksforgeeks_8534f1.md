# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/reactjs/what-is-react-router-dom/

React Router DOM is an npm package that enables you to implement dynamic routing in a web app. It allows you to display pages and allow users to navigate them. It is a fully-featured client and server-side routing library for React.
- Used to build single-page applications with multiple components or views.
- Updates content dynamically based on the URL without refreshing the page.
- This process is called routing and is handled using React Router DOM.
Functionality of React Router DOM
React Router DOM helps React apps navigate between pages without reloading. It makes switching pages easy and organizes the app with clear routes. Here are some benefits of using React Router Dom :
- Seamless Navigation: Allows users to navigate between pages without refreshing the entire application.
- Dynamic Routing: Dynamic routes support parameters, where the content can be customized by the input from the user.
- URL-Based Rendering: Dynamically renders components based on the current URL.
- Nested Routes: This allows for the definition of routes inside routes, thus complex layouts can easily be achieved.
Components of React Router DOM
These components help in defining routes, handling navigation, and managing dynamic content within a React application.
BrowserRouter (<BrowserRouter>)
- BrowserRouter Enables routing in a React application by wrapping the entire app.
- It listens to changes in the URL and renders the correct components accordingly.
import { BrowserRouter } from "react-router-dom";
<BrowserRouter>
    <App />
</BrowserRouter>;
Routes (<Routes>)
- Routes acts as a container for all <Route> components.
- Ensures that only one matching route is rendered at a time.
<Routes>
  <Route path="/" element={<Home />} />
  <Route path="/about" element={<About />} />
</Routes>;
Route (<Route>)
- Route defines a specific path and maps it to a React component.
- When the URL matches the route path, the respective component is displayed.
<Route path="/contact" element={<Contact />} />
Link (<Link>)
- Used to navigate between pages without refreshing the page.
- Unlike <a> , it prevents full-page reloads and enhances performance.
<Link to="/about">About Us</Link>
NavLink (<NavLink>)
- Works like <Link> but provides active styling when the route is active.
- Useful for highlighting the active page in navigation menus.
<NavLink to="/home" className="nav-link">Home</NavLink>
useParams (useParams())
- useParams extracts dynamic parameters from the URL.
- Helps in fetching user-specific or product-specific details based on the route.
import { useParams } from "react-router-dom";
function UserProfile() {
    let { id } = useParams();
    return <h1>User ID: {id}</h1>;
}
useNavigate (useNavigate())
- useNavigate Allows programmatic navigation between routes.
- Useful for redirecting users after an action, such as form submission.
import { useNavigate } from "react-router-dom";
function Home() {
    const navigate = useNavigate();
    return <button onClick={() => navigate("/about")}>Go to About</button>;
}
Working
React Router DOM allows for the transition through the entirety of the React application by setting multiple routes and page transitions without page reloading. This is the overall structure for how this is achieved:
Setting Up the Router: The entire app is wrapped around <BrowserRouter>, which allows for routing throughout the application.
import { BrowserRouter } from "react-router-dom";
function App() {
    return (
        <BrowserRouter>
            <Routes>{/* Define your routes here */}</Routes>
        </BrowserRouter>
    );
}
Defining Routes: Multiple pages or components are assigned provided paths using <Routes> and <Route>, where the right content is displayed when you visit the URL.
<Routes>
    <Route path="/" element={<Home />} />
    <Route path="/about" element={<About />} />
</Routes>;
Navigating Between Pages: Instead of the traditional <a> tag, React incorporates the use of <Link> or <NavLink> for navigating, providing for non-page refresh transitions.
import { Link } from "react-router-dom";
function Navbar() {
    return (
        <nav>
            <Link to="/">Home</Link>
            <Link to="/about">About</Link>
        </nav>
    );
}
Rendering Components Dynamically: When a user visits a specific URL, React Router checks for a matching route and displays the assigned component.
function Home() {
    return <h1>Welcome to Home Page</h1>;
}
function About() {
    return <h1>About Us</h1>;
}
Using Nested Routes: Routes can be structured inside other routes, making it easier to manage layouts for complex apps.
<Routes>
    <Route path="/dashboard" element={<Dashboard />}>
        <Route path="settings" element={<Settings />} />
        <Route path="profile" element={<Profile />} />
    </Route>
</Routes>;
Handling Dynamic Routes: Some routes accept parameters, allowing content to change based on user input. The useParams hook retrieves these values.
<Route path="/user/:id" element={<UserProfile />} />
Steps to Implement React-router-dom
To implement React Router DOM for navigation in a React application. Follow these steps:
Step 1: Install React Router DOM
Before using React Router DOM, install it in your project using:
npm install react-router-dom
Updated dependencies:
"dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.22.3",
    "react-scripts": "5.0.1"
}
Step 2: Import Required Components
Import the necessary components inside App.js:
import React from "react";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import "./App.css";
Step 3: Create Components for Different Pages
Define components that represent different pages:
const Home = () => <h1>GeeksforGeeks</h1>;
const About = () => <h1>Geeks Learning</h1>;
const Contact = () => <h1>Geeks Contact page</h1>;
Step 4: Set Up Router and Define Routes
Wrap your app with <Router> and use <Routes> to define different paths:
function App() {
    return (
        <Router>
            <nav className="navbar">
                <ul className="nav-list">
                    <li className="nav-item">
                        <Link to="/">Home</Link>
                    </li>
                    <li className="nav-item">
                        <Link to="/about">About</Link>
                    </li>
                    <li className="nav-item">
                        <Link to="/contact">Contact</Link>
                    </li>
                </ul>
            </nav>
            <div className="content">
                <Routes>
                    <Route path="/" element={<Home />} />
                    <Route path="/about" element={<About />} />
                    <Route path="/contact" element={<Contact />} />
                </Routes>
            </div>
        </Router>
    );
}
export default App;
Step 5: Navigation Using <Link>
Use <Link> instead of <a> to enable navigation without refreshing:
<Link to="/">Home</Link>
<Link to="/about">About</Link>
<Link to="/contact">Contact</Link>
Output:
- App.js: Sets up routing using <BrowserRouter>, defines routes with <Routes> and <Route>, and includes navigation using <Link>.
- Home.js: A simple React component that renders a heading (GeeksforGeeks). It is displayed when the user visits /.
- About.js: Displays "Geeks Learning" and is rendered when the user navigates to /about.
- Contact.js: Shows "Geeks Contact Page" when the user visits /contact.
