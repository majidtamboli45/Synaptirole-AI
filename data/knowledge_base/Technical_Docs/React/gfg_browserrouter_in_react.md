# BrowserRouter in React

> Source: https://www.geeksforgeeks.org/reactjs/browserrouter-in-react/

BrowserRouter is a component provided by React Router to enable client-side routing using the HTML5 history API, allowing navigation without full page reloads. It also updates the browser URL dynamically while preserving the application state during view changes.
- Client-side navigation: Handles routing in the browser using the HTML5 history API, avoiding full page reloads.
- State-preserving URL updates: Changes the browser URL during navigation while keeping the app state intact.
Syntax
<BrowserRouter>
<Routes>
<Route path="/" element={<Home />} />
<Route path="/about" element={<About />} />
</Routes>
</BrowserRouter>
- Enables Routing: BrowserRouter wraps the application, allowing URL-based navigation without page reloads.
- Defines Routes: Routes contain Route components, mapping paths (/, /about) to specific React components.
Features of BrowserRouter
- Real URL Updates: Reflects navigation in the browser's address bar using the HTML5 History API (pushState /replaceState ).
- Back & Forward Support: Native browser history buttons work out of the box for seamless navigation.
- Deep Linking: Users can bookmark, share, or directly access any route via its URL.
- SEO-Friendly: Clean, readable URLs (e.g., /products/123 ) are indexable by search engines.
- Server-Side Rendering Ready: Pairs well with SSR frameworks like Next.js for full-stack React apps.
Working
BrowserRouter uses the HTML5 history API, which consists of pushState, replaceState, and popstate events, to update the browser’s history and allow for dynamic routing.
Initialization of Browser Router
When the application is loaded, the BrowserRouter component is wrapped around the entire app (typically at the top level).
<BrowserRouter>
<App />
</BrowserRouter>
URL Detection
BrowserRouter uses the HTML5 History API to detect changes in the URL. This allows React Router to manipulate the URL while keeping the page from reloading. When a user navigates to a different route (e.g., clicking a <Link> or typing a URL), BrowserRouter listens for this URL change.
Matching the URL
Inside BrowserRouter the Route components define which URL path corresponds to which component. For instance, when the URL is /about, a <Route path="/about" component={About} /> is matched.
<Route path="/about" component={About} />
Rendering Components
After matching the URL to the corresponding Route, the associated component is rendered. If the URL matches /about, the About component will be displayed.
Navigating Between Views
When a user clicks a link, such as:
<Link to="/about">Go to About</Link>
Maintaining Application State
Since the page doesn't reload, the application's state (like form data or user input) remains intact. React will only re-render the relevant components, ensuring a seamless user experience.
History Management
The BrowserRouter uses the browser's built-in history stack, so users can navigate backward and forward between different routes using the browser's back and forward buttons.
Dynamic Updates
As the URL changes (either by user interaction or programmatically using the history object), BrowserRouter continues to handle the URL and re-render the app's UI accordingly, providing smooth transitions between views.
 React application using BrowserRouter
import React from "react";
import { useNavigate } from "react-router-dom";
const Home = () => {
  const navigate = useNavigate();
  const goabout = () => {
    navigate("/about");
  };
  return (
    <div>
      <h3>Welcome to home page</h3>
      <button onClick={goabout}>Go to About page</button>
    </div>
  );
};
export default Home;
import React from "react";
import { useNavigate } from "react-router-dom";
const About = () => {
  const navigate = useNavigate();
  const gohome = () => {
    navigate(-1);
  };
  return (
    <div>
      <h3>Welcome to about us page</h3>
      <button onClick={gohome}>Go to Home Page</button>
    </div>
  );
};
export default About;
import React from "react";
import { useParams } from "react-router-dom";
const UserDetail = () => {
  const { userId } = useParams();
  return (
    <div>
      <h1>User Details:</h1>
      <p>User information is:{userId}</p>
    </div>
  );
};
export default UserDetail;
import React from "react";
import { useNavigate } from "react-router-dom";
const UserProfile = () => {
  const navigate = useNavigate();
  const logout = () => {
    navigate("/login");
  };
  return (
    <div>
      <h1>User Profile</h1>
      <button onClick={logout}>Logout</button>
    </div>
  );
};
export default UserProfile;
//useNavigation with useParams...
import React from "react";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import Home from "./components/useNavigate/Home";
import About from "./components/useNavigate/About";
import UserDetail from "./components/useNavigate/UserDetail";
import UserProfile from "./components/useNavigate/UserProfile";
const App = () => {
  return (
    <div>
      <Router>
        <nav>
          <ul style={{ display: "flex", gap: "20px" }}>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/about">About</Link>
            </li>
            <li>
              <Link to="/user/123">User Details</Link>
            </li>
            <li>
              <Link to="/profile">User Profile</Link>
            </li>
          </ul>
        </nav>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/about" element={<About />} />
          <Route path="/user/:userId" element={<UserDetail />} />
          <Route path="/profile" element={<UserProfile />} />
        </Routes>
      </Router>
    </div>
  );
};
export default App;
Output:
In this code
- Implements Navigation: The code uses BrowserRouter and Routes to enable navigation between pages (Home, About, UserDetail, and UserProfile) without reloading.
- Handles Dynamic Routing : useParams retrieves route parameters (e.g., userId), and useNavigate enables programmatic navigation (go to about, logout).
