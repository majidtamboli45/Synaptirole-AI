# Navigation and Routing in React Apps

> Source: https://www.geeksforgeeks.org/reactjs/mastering-react-routing-learn-navigation-and-routing-in-react-apps/

React Routing allows navigation between different components or views in a React application without reloading the page, making Single Page Applications fast and seamless.
- Enables navigation without full page refresh.
- Maps URLs to specific components.
- Improves user experience in SPAs.
- Managed using the React Router library.
Navigation in React
Navigation in React allows users to move between different components or views in a Single Page Application without reloading the page, using client-side routing for smooth transitions.
- Navigation happens without reloading the entire page, making the application faster and smoother.
- Routing is handled on the client side instead of requesting new pages from the server.
- It improves user experience by providing quick and seamless view changes.
- React Router is commonly used to manage navigation between components.
To implement routing in React we do not have in-built modules but instead, we use the react-router-dom module after installing and importing it.
Syntax
// Installing
npm i react-router-dom
// Importing
import { BrowserRouter } from 'react-router-dom';
- Installing: npm i react-router-dom installs React Router for routing in React.
- Importing: import { BrowserRouter } from 'react-router-dom'; imports BrowserRouter to enable routing in your app.
Programmatically Navigate in React
Programmatic navigation allows you to navigate between different routes based on actions, such as button clicks or form submissions. This method provides more control over routing, enabling navigation in response to events triggered by the user.
Approach
React navigation using useNavigate allows users to programmatically move between pages or components in a Single Page Application without reloading the page.
- Create 2 basic pages between which you want to redirect.
- Create buttons on each page to redirect the user.
- Import the useNavigate hook provided with react-router-dom.
- Use this hook on the onClick event button to redirect.
// App.js
import { BrowserRouter, Routes, Route } from "react-router-dom";
import "./App.css";
import AboutUs from "./components/AboutUs";
import ContactUs from "./components/CotactUs";
function App() {
    return (
        <div className="App">
            <BrowserRouter>
                <Routes>
                    <Route exact path="/" element={<AboutUs />} />
                    <Route exact path="/contactus" element={<ContactUs />} />
                </Routes>
            </BrowserRouter>
        </div>
    );
}
export default App;
// AboutUs.js
import React from "react";
import { useNavigate } from "react-router-dom";
function AboutUs() {
    const nav = useNavigate();
    return (
        <div>
            <h2>GeeksforGeeks is a computer science portal for geeks!</h2>
            Read more about us at :
            <a href="https://www.geeksforgeeks.org/about/">
                https://www.geeksforgeeks.org/about/
            </a>
            <br></br>
            <br></br>
            <button
                onClick={() => {
                    nav("contactus");
                }}
            >
                Click Here to check contact details
            </button>
        </div>
    );
}
export default AboutUs;
// ContactUs.js
import React from "react";
import { useNavigate } from "react-router-dom";
function ContactUs() {
    const nav = useNavigate();
    return (
        <div>
            <address>
                You can find us here:
                <br />
                GeeksforGeeks
                <br />
                5th & 6th Floor, Royal Kapsons, A- 118, <br />
                Sector- 136, Noida, Uttar Pradesh (201305)
            </address>
            <br></br>
            <br></br>
            <button
                onClick={() => {
                    nav(-1);
                }}
            >
                Click Here to Go Back
            </button>
        </div>
    );
}
export default ContactUs;
Output:
- App.js: This file displays the AboutUs component.
- AboutUs.js: This components creates the link to Contact Us page using Button.
- ContactUs.js: This component has a button to send back to previous page.
Dynamic Routing with React router
Adding Link routes gets very lengthy when there are multiple pages, so we use the concept of Dynamic Routing to reduce the lines of code and make the code shorter. Dynamic routing allows you to define routes dynamically based on certain conditions.
Approach
Dynamic routing in React allows passing parameters through URLs, enabling components to render content based on route-specific data using useParams.
- Create a page which will create Link components using map.
- Create a page which will display data dynamically using useParams.
- Create a dynamic Route component which passes the id as a parameter. It comes under the component folder.
import { BrowserRouter, Routes, Route, Link } from "react-router-dom";
import CourseDetails from "./components/CourseDetails";
function App() {
    const courses = ["JavaScript", "React", "HTML", "DSA"];
    return (
        <BrowserRouter>
            <h1>Dynamic Routing with React</h1>
            <ul>
                {courses.map((course) => {
                    return (
                        <li key={course}>
                            <Link to={`courses/${course}`}>{course}</Link>
                        </li>
                    );
                })}
            </ul>
            <Routes>
                <Route path="courses/:courseId" element={<CourseDetails />} />
            </Routes>
        </BrowserRouter>
    );
}
export default App;
// components/CourseDetails.js
import { useParams } from "react-router-dom";
function CourseDetails() {
    const { courseId } = useParams();
    return (
        <div>
            <h1>This is {courseId} course</h1>
        </div>
    );
}
export default CourseDetails;
Output:
- App.js: This file creates Link component dynamically and sends course name as a parameter.
- CourseDetails.js: This component, placed in the components folder, receives the course as a parameter and displays its details.
Handling 404 Errors (Page Not Found)
Sometimes user types a URL which does not exist in the website and the router fails and shows an error. To solve this problem we create a universal Route component which redirects to Link not found page whenever incorrect URL is passed.
Approach
Handling 404 routes in React ensures users are redirected to a custom NoPageFound page when they navigate to undefined paths, improving app usability.
- Create 3 basic pages where you want to add navigation.
- Create a Navbar to handle navigation between the pages.
- Create NoPageFound.js file to handle routing for all incorrect routing.
- Add a path for non-configured routes which will be redirected to NoPageFound file.
- the path with '*' handles all non-configured routes.
import logo from "./logo.svg";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import "./App.css";
import NavBar from "./components/Navbar";
import Home from "./components/Home";
import AboutUs from "./components/AboutUs";
import ContactUs from "./components/CotactUs";
import NoPageFound from "./components/NoPageFound";
function App() {
    return (
        <div className="App">
            <BrowserRouter>
                <NavBar />
                <Routes>
                    <Route exact path="/" element={<Home />} />
                    <Route exact path="/about" element={<AboutUs />} />
                    <Route exact path="/contact" element={<ContactUs />} />
                    <Route path="*" element={<NoPageFound />} />
                </Routes>
            </BrowserRouter>
        </div>
    );
}
export default App;
import React from "react";
function AboutUs() {
    return (
        <div>
            <h2>GeeksforGeeks is a computer science portal for geeks!</h2>
            Read more about us at :
            <a href="https://www.geeksforgeeks.org/about/">
                https://www.geeksforgeeks.org/about/
            </a>
        </div>
    );
}
export default AboutUs;
import React from "react";
function ContactUs() {
    return (
        <address>
            You can find us here:
            <br />
            GeeksforGeeks
            <br />
            5th & 6th Floor, Royal Kapsons, A- 118, <br />
            Sector- 136, Noida, Uttar Pradesh (201305)
        </address>
    );
}
export default ContactUs;
import React from "react";
function Home() {
    return <h1>Welcome to the world of Geeks!</h1>;
}
export default Home;
import { Link } from "react-router-dom";
export default function NavBar() {
    return (
        <div>
            <ul className="r">
                <li>
                    <Link to="/">Home</Link>
                </li>
                <li>
                    <Link to="/about">About Us</Link>
                </li>
                <li>
                    <Link to="/contact">Contact Us</Link>
                </li>
            </ul>
        </div>
    );
}
export default function NoPageFound() {
    return <h1>Error 404: Page Not Found</h1>;
}
Output:
- App.js: This file imports all the components and applies routing to them
- AboutUs.js: This file contains the About Us Page
- ContactUs.js: This file displays the Contact Us Page
- Home.js: This component acts as the home page
- Navbar.js: This component has the Navbar to redirect to all linking pages
- NoPageFound.js: This page is displayed when invalid links are added.
