# React JS Types of Routers

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-types-of-routers/

When creating a React application, managing navigation between different views or pages is important. React Router is the standard library for routing in React, enabling seamless navigation while maintaining the Single Page Application (SPA) behaviour.
React Router
React Router is a declarative, component-based routing library for React applications. It enables navigation without reloading the page, making the application faster and more dynamic.
- Supports client-side routing in React applications.
- Provides nested routes for better organization.
- Allows for dynamic routing using parameters.
- Enables programmatic navigation via hooks like useNavigate() .
Before diving into types of routers, let’s ensure that React Router DOM is installed in your React project
npm install react-router-dom
Types of Routers in React
React provides several types of routers that serve different purposes. The main routers in React are
- Browser Router (<BrowserRouter>)
- Hash Router (<HashRouter>)
- Memory Router (<MemoryRouter>)
- Static Router (<StaticRouter>)
- Native Router (<NativeRouter>)
1. Browser Router
BrowserRouter is the most commonly used router in React applications that are deployed in a modern web environment.
- It uses the HTML5 history API to manage the navigation.
- This router makes use of pushState, replaceState, and the popState event to keep the UI in sync with the URL.
- It allows for clean and human-readable URLs without hash fragments.
Usage of BrowserRouter
BrowserRouter is a powerful and commonly used router in React applications, and it’s ideal for web applications that require clean, SEO-friendly URLs and rely on server-side routing.
- Hosting on a Web Server with Proper Routing: BrowserRouter works best when your app is hosted on a web server that can handle dynamic URLs (server-side routing).
- Improved SEO: Since BrowserRouter generates URLs without the hash, search engines can more easily crawl and index your pages.
- Single Page Applications (SPA): BrowserRouter is commonly used in SPAs, where the entire app runs on a single page.
- Handling Multiple Views or Pages: If your app includes multiple views or pages BrowserRouter helps manage these views by linking each one to a specific URL.
import React from "react";
import { BrowserRouter, Routes, Route, Link } from "react-router-dom";
import Home from "./components/Home";
import About from "./components/About";
import Contact from "./components/Contact";
const App = () => {
    return (
        <BrowserRouter>
            <div style={{ fontFamily: "Arial, sans-serif" }}>
                {/* Navigation Bar */}
                <nav
                    style={{
                        backgroundColor: "#333",
                        padding: "10px",
                        display: "flex",
                        justifyContent: "center",
                    }}
                >
                    <ul
                        style={{
                            listStyle: "none",
                            display: "flex",
                            gap: "20px",
                            padding: "0",
                            margin: "0",
                        }}
                    >
                        <li>
                            <Link to="/" style={linkStyle}>
                                Home
                            </Link>
                        </li>
                        <li>
                            <Link to="/about" style={linkStyle}>
                                About Us
                            </Link>
                        </li>
                        <li>
                            <Link to="/contact" style={linkStyle}>
                                Contact Us
                            </Link>
                        </li>
                    </ul>
                </nav>
                {/* Page Content */}
                <div
                    style={{ display: "flex", justifyContent: "center", padding: "20px" }}
                >
                    <Routes>
                        <Route path="/" element={<Home />} />
                        <Route path="/about" element={<About />} />
                        <Route path="/contact" element={<Contact />} />
                    </Routes>
                </div>
            </div>
        </BrowserRouter>
    );
};
// Style for navigation links
const linkStyle = {
    textDecoration: "none",
    color: "white",
    fontSize: "18px",
    fontWeight: "bold",
};
export default App;
import React from "react";
const Home = () => {
    return (
        <div style={{ textAlign: "center", maxWidth: "600px" }}>
            <h2 style={{ color: "#2c3e50" }}>Home Page</h2>
            <p style={{ fontSize: "18px", fontWeight: "bold" }}>
                Welcome to the home page!
            </p>
        </div>
    );
};
export default Home;
import React from "react";
const About = () => {
    return (
        <div style={{ textAlign: "center", maxWidth: "600px" }}>
            <h2 style={{ color: "#2c3e50" }}>About Us</h2>
            <p style={{ fontSize: "18px", fontWeight: "bold" }}>
                GeeksforGeeks is a computer science portal. You can visit it here:
                <a
                    href="https://www.geeksforgeeks.org/"
                    target="_blank"
                    rel="noopener noreferrer"
                    style={{
                        textDecoration: "none",
                        color: "#007bff",
                        fontWeight: "bold",
                    }}
                >
                    GeeksforGeeks
                </a>
            </p>
        </div>
    );
};
export default About;
import React from "react";
const Contact = () => {
    return (
        <div style={{ textAlign: "center", maxWidth: "600px" }}>
            <h2 style={{ color: "#2c3e50" }}>Contact Us</h2>
            <p style={{ fontSize: "18px", fontWeight: "bold" }}>
                You can find us here:
            </p>
            <address
                style={{
                    fontSize: "16px",
                    fontWeight: "bold",
                    color: "#333",
                    marginTop: "10px",
                }}
            >
                GeeksforGeeks, 5th Floor, A-118, Sector-136, Noida, Uttar Pradesh -
                201305, India
            </address>
        </div>
    );
};
export default Contact;
Output:
- App.js: Uses BrowserRouter for navigation with clean URLs (e.g., /about). It defines routes and a navigation menu.
- Home.js: Displays a simple home page with a welcome message.
- About.js: Shows an "About Us" section with a GeeksforGeeks link.
- Contact.js: Displays contact details with the GeeksforGeeks Noida address.
2. Memory Router
Memory Router is used when there is no web browser, like in testing or mobile apps. It remembers the navigation history inside the app but does not change the URL. This makes it helpful for testing and non-browser environments.
- No URL Change: Unlike Browser Router or HashRouter, MemoryRouter does not change the browser's URL. It stores the location state internally.
- In-memory history: It maintains history in memory, not in the URL or browser history, making it ideal for non-browser environments.
Usage of Memory Router
Here are some use cases of Memory Router
- Server-Side Rendering (SSR): When rendering React components on the server, where there is no URL to manage.
- Testing: Ideal for unit tests, allowing routing logic to be tested without modifying the browser’s URL.
- React Native: Since React Native doesn't rely on URLs, Memory Router helps manage navigation in mobile apps.
- Non-Browser Environments: Useful in applications like Electron where the app does not interact with a browser's URL.
- When URL Doesn’t Matter: If you don’t need to reflect state changes in the URL, Memory Router can manage routing internally
import React from "react";
import { MemoryRouter, Routes, Route, Link } from "react-router-dom";
import Home from "./components/Home";
import About from "./components/About";
import Contact from "./components/Contact";
const App = () => {
    return (
        <MemoryRouter>
            <div style={{ fontFamily: "Arial, sans-serif" }}>
                {/* Navigation Bar */}
                <nav
                    style={{
                        backgroundColor: "#333",
                        padding: "10px",
                        display: "flex",
                        justifyContent: "center",
                    }}
                >
                    <ul
                        style={{
                            listStyle: "none",
                            display: "flex",
                            gap: "20px",
                            padding: "0",
                            margin: "0",
                        }}
                    >
                        <li>
                            <Link to="/" style={linkStyle}>
                                Home
                            </Link>
                        </li>
                        <li>
                            <Link to="/about" style={linkStyle}>
                                About Us
                            </Link>
                        </li>
                        <li>
                            <Link to="/contact" style={linkStyle}>
                                Contact Us
                            </Link>
                        </li>
                    </ul>
                </nav>
                {/* Page Content */}
                <div
                    style={{ display: "flex", justifyContent: "center", padding: "20px" }}
                >
                    <Routes>
                        <Route path="/" element={<Home />} />
                        <Route path="/about" element={<About />} />
                        <Route path="/contact" element={<Contact />} />
                    </Routes>
                </div>
            </div>
        </MemoryRouter>
    );
};
// Style for navigation links
const linkStyle = {
    textDecoration: "none",
    color: "white",
    fontSize: "18px",
    fontWeight: "bold",
};
export default App;
import React from "react";
const Home = () => {
    return (
        <div style={{ textAlign: "center", maxWidth: "600px" }}>
            <h2 style={{ color: "#2c3e50" }}>Home Page</h2>
            <p style={{ fontSize: "18px", fontWeight: "bold" }}>
                Welcome to the home page!
            </p>
        </div>
    );
};
export default Home;
import React from "react";
const Contact = () => {
    return (
        <div style={{ textAlign: "center", maxWidth: "600px" }}>
            <h2 style={{ color: "#2c3e50" }}>Contact Us</h2>
            <p style={{ fontSize: "18px", fontWeight: "bold" }}>
                You can find us here:
            </p>
            <address
                style={{
                    fontSize: "16px",
                    fontWeight: "bold",
                    color: "#333",
                    marginTop: "10px",
                }}
            >
                GeeksforGeeks, 5th Floor, A-118, Sector-136, Noida, Uttar Pradesh -
                201305, India
            </address>
        </div>
    );
};
export default Contact;
import React from "react";
const About = () => {
    return (
        <div style={{ textAlign: "center", maxWidth: "600px" }}>
            <h2 style={{ color: "#2c3e50" }}>About Us</h2>
            <p style={{ fontSize: "18px", fontWeight: "bold" }}>
                GeeksforGeeks is a computer science portal. You can visit it here:
                <a
                    href="https://www.geeksforgeeks.org/"
                    target="_blank"
                    rel="noopener noreferrer"
                    style={{
                        textDecoration: "none",
                        color: "#007bff",
                        fontWeight: "bold",
                    }}
                >
                    GeeksforGeeks
                </a>
            </p>
        </div>
    );
};
export default About;
Output:
- Contact.js: Displays a "Contact Us" section with an address (GeeksforGeeks Noida) in a bold, formatted style.
- About.js: Shows an "About Us" section with a brief description of GeeksforGeeks and a clickable link to its website.
- When linked in React Router, they render on /contact and /about routes.
3. Hash Router
A Hash Router is another type of router used in React applications. It works by using the hash portion of the URL (the part that comes after the # symbol) to manage navigation.
- It uses URL hash (#) to represent different routes (e.g., http://example.com/#/home).
- The hash part is not sent to the server but is used to change the displayed content in the browser.
- It's useful for handling navigation in environments where you can't use regular URLs (like in static websites or when there's no server-side routing).
Usage of Hash Router
HashRouter is a useful and simple router for React applications that rely on URL hashes for navigation, especially in environments where server-side routing is not available.
- Hosting on Static File Servers: HashRouter works best when your app is hosted on static file servers, like GitHub Pages, that cannot handle dynamic routing or need the URL to stay static.
- No Server-Side Routing: Ideal for situations where server-side routing is not set up or you don’t have access to configure it. It keeps the routing within the client-side, without needing the server to manage different routes.
- Simpler Projects: For smaller, simpler projects or prototypes that don't require clean URLs or SEO optimization, HashRouter offers an easy solution for adding routing
import React from "react";
import { HashRouter, Routes, Route, Link } from "react-router-dom";
import Home from "./components/Home";
import About from "./components/About";
import Contact from "./components/Contact";
const App = () => {
    return (
        <HashRouter>
            <div style={{ fontFamily: "Arial, sans-serif" }}>
                {/* Navigation Bar */}
                <nav
                    style={{
                        backgroundColor: "#333",
                        padding: "10px",
                        display: "flex",
                        justifyContent: "center",
                    }}
                >
                    <ul
                        style={{
                            listStyle: "none",
                            display: "flex",
                            gap: "20px",
                            padding: "0",
                            margin: "0",
                        }}
                    >
                        <li>
                            <Link to="/" style={linkStyle}>
                                Home
                            </Link>
                        </li>
                        <li>
                            <Link to="/about" style={linkStyle}>
                                About Us
                            </Link>
                        </li>
                        <li>
                            <Link to="/contact" style={linkStyle}>
                                Contact Us
                            </Link>
                        </li>
                    </ul>
                </nav>
                {/* Page Content */}
                <div
                    style={{ display: "flex", justifyContent: "center", padding: "20px" }}
                >
                    <Routes>
                        <Route path="/" element={<Home />} />
                        <Route path="/about" element={<About />} />
                        <Route path="/contact" element={<Contact />} />
                    </Routes>
                </div>
            </div>
        </HashRouter>
    );
};
// Style for navigation links
const linkStyle = {
    textDecoration: "none",
    color: "white",
    fontSize: "18px",
    fontWeight: "bold",
};
export default App;
import React from "react";
const Home = () => {
    return (
        <div style={{ textAlign: "center", maxWidth: "600px" }}>
            <h2 style={{ color: "#2c3e50" }}>Home Page</h2>
            <p style={{ fontSize: "18px", fontWeight: "bold" }}>
                Welcome to the home page!
            </p>
        </div>
    );
};
export default Home;
import React from "react";
const About = () => {
    return (
        <div style={{ textAlign: "center", maxWidth: "600px" }}>
            <h2 style={{ color: "#2c3e50" }}>About Us</h2>
            <p style={{ fontSize: "18px", fontWeight: "bold" }}>
                GeeksforGeeks is a computer science portal. You can visit it here:
                <a
                    href="https://www.geeksforgeeks.org/"
                    target="_blank"
                    rel="noopener noreferrer"
                    style={{
                        textDecoration: "none",
                        color: "#007bff",
                        fontWeight: "bold",
                    }}
                >
                    GeeksforGeeks
                </a>
            </p>
        </div>
    );
};
export default About;
import React from "react";
const Contact = () => {
    return (
        <div style={{ textAlign: "center", maxWidth: "600px" }}>
            <h2 style={{ color: "#2c3e50" }}>Contact Us</h2>
            <p style={{ fontSize: "18px", fontWeight: "bold" }}>
                You can find us here:
            </p>
            <address
                style={{
                    fontSize: "16px",
                    fontWeight: "bold",
                    color: "#333",
                    marginTop: "10px",
                }}
            >
                GeeksforGeeks, 5th Floor, A-118, Sector-136, Noida, Uttar Pradesh -
                201305, India
            </address>
        </div>
    );
};
export default Contact;
Output:
- App.js: Uses HashRouter for navigation. It contains a navigation bar with links and defines routes for Home, About, and Contact pages.
- Home.js: Displays a simple Home Page with a heading and a welcome message.
- About.js: Shows an "About Us" section describing GeeksforGeeks with a clickable link.
- Contact.js: Displays a "Contact Us" section with the GeeksforGeeks Noida address.
