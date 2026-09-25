# Implement Nested Routes in React.js

> Source: https://www.geeksforgeeks.org/reactjs/implement-nested-routes-in-react-js-react-router-dom-v6/

Nested routes in React JS provide hierarchical navigation which is implemented using the outlet component in React Router Dom. Routing in React not only provides routing for the pages but also for rendering multiple components inside that page. Nested routes implement this by defining Routes for Child components inside parent route components.
Prerequisites:
Nested Routes in React
Nested Routes in React are used to create multi level navigation. It allows us to build complex layouts rendering components at different levels. It is done with the help of Outlet component provided by react router dom.
Syntax:
// Define Nested Routes
<Route path="parent" element ={<Parent />}>
<Route path="child" element = {<Child/>}/>
</Route >
// Define Outlet position to render child
const Parent = ()=>{
return(<Outlet />)
}
Approach for Nested Routes
To Implement Nested Routes in React we will define child routes inside the Parent route with the help of path and element attributes. Use the outlet component inside parent component where you want to render the nested component.
Steps to Implement Nested Routes
Step 1: Create a React application by typing the following command in the terminal.
npx create-react-app nesting-demo
Step 2: Now, go to the project folder i.e. nesting-demo by running the following command.
cd nesting-demo
Project Structure:
Step 3: Let’s install the React Router DOM npm package required for this project
npm i react-router-dom
dependencies list after installaion in package.json
{
"name": "nesting-demo",
"version": "0.1.0",
"private": true,
"dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-router-dom": "^6.16.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
}
Example: Define two page Home and courses and child component for course named List and Search. Use Routes for Pages home and cources and inside course route the list and serach route is defined. Link the components inside courses file as shown below.
/* Filename: App.css */
/* Styling for the App component nav element 
and Course component course-nav div */
.App nav,
.courses-nav {
    background: #f2f2f2;
    height: 4vh;
    min-width: 600px;
    border-radius: 10px;
    text-align: center;
    border-bottom: 2px solid #2f8d46;
}
/* Styling for App component nav element anchor 
tag and Course component nav element anchor tag */
.App nav a,
.courses-nav a {
    padding: 20px 20px;
    font-size: 26px;
    font-weight: bold;
    text-transform: uppercase;
    text-decoration: none;
    color: #2f8d46;
}
/* Styling for Course component 
course-nav div anchor tag */
.courses-nav a {
    color: rgb(59, 117, 241);
}
/* Styling for the Home component main div */
.Page {
    width: 100%;
    height: 96vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 15px;
    background-color: lightgreen;
}
/* Styling for the Search & List component main div */
.Search,
.List {
    width: 50%;
    height: 40%;
    padding: 100px;
    background-color: whitesmoke;
}
// Filename: App.js
import {
    BrowserRouter as Router,
    Link,
    Routes,
    Route,
} from "react-router-dom";
import "./App.css";
import Home from "./Pages/Home";
import Courses from "./Pages/Courses";
import Search from "./Components/Search";
import List from "./Components/List";
function App() {
    return (
        <div className="App">
            <Router>
                <nav>
                    <Link to="/">Home</Link>
                    <Link to="courses">Courses</Link>
                </nav>
                <Routes>
                    <Route path="/" element={<Home />} />
                    <Route
                        path="/courses"
                        element={<Courses />}
                    >
                        <Route
                            path="search"
                            element={<Search />}
                        />
                        <Route
                            path="list"
                            element={<List />}
                        />
                    </Route>
                </Routes>
            </Router>
        </div>
    );
}
export default App;
// Filename: Pages/Home.js
import React from "react";
const Home = () => {
    return (
        <div className="Page">
            <h1>You are in the Home page!</h1>
            <h3>URL: localhost:3000/</h3>
        </div>
    );
};
export default Home;
// Filename: Components/Search.js
import React from "react";
const Search = () => {
    return (
        <div className="Search">
            <h2>You are inside the Search Component</h2>
            <h4>URL: localhost:3000/courses/search</h4>
        </div>
    );
};
export default Search;
// Filename: Components/List.js
import React from "react";
const List = () => {
    return (
        <div className="List">
            <h2>You are inside the List Component</h2>
            <h4>URL: localhost:3000/courses/list</h4>
        </div>
    );
};
export default List;
// Filename: Pages/Courses.js
import React from "react";
import { Link, Outlet } from "react-router-dom";
const Courses = () => {
    return (
        <div className="Page">
            <h1>You are in the Courses page!</h1>
            <h3>URL: localhost:3000/courses</h3>
            <div className="courses-nav">
                <Link to="/courses/search">Search</Link>
                <Link to="/courses/list">List</Link>
            </div>
            <Outlet />
        </div>
    );
};
export default Courses;
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Summary
Nested routes in react is a way for defining multi level navigation in the react app which is implemented wth the help of outlet component. Define the child routes enclosed with parent routes and place the outlet component inside parent for rendering.
Nested routes in react are implemented with the help of the outlet component in react router. Define the nested routes using the Route Component and use outlet inside parent component to render the nested routes.
