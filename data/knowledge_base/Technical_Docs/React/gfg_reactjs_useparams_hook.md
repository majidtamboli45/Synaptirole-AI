# ReactJS useParams Hook

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-useparams-hook/

The useParams Hook allows you to access dynamic values from the URL in React Router. It helps render content based on route parameters like /user/:id.
- Extracts parameters directly from the URL
- Enables dynamic routing and data display
- Commonly used to fetch or show user-specific content
Syntax
const { param1, param2, ... } = useParams();
- param1, param2, etc., are route parameters defined in the path.
- useParams returns an object where keys are the parameter names and values are the values from the URL.
Note:
- Route parameters obtained using useParams() may sometimes be missing or invalid.
- It is recommended to validate them (e.g., check for undefined or correct format) before using.
- In such cases, you can show a fallback UI or redirect the user to a safe route.
Now let's understand this with the help of example:
import React from "react";
import { BrowserRouter as Router, Route, Routes, useParams } from "react-router-dom";
function BlogPost() {
  let { id } = useParams();
  return <div style={{ fontSize: "50px" }}>Now showing post {id}</div>;
}
function Home() {
  return <h3>Home page</h3>;
}
function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/page/:id" element={<BlogPost />} />
      </Routes>
    </Router>
  );
}
export default App;
Output
- useParams is called inside the BlogPost component to fetch the dynamic parameter id from the URL.
- The URL /post/:id means that the value for id is dynamically passed and can be accessed via useParams.
