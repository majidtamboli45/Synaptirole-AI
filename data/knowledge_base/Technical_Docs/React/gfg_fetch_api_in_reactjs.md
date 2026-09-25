# Fetch API in ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/how-to-fetch-data-from-an-api-in-reactjs/

React provides multiple ways to fetch data from APIs and manage it within components for dynamic rendering.
- Using fetch(): Built-in method to retrieve data from APIs.
- Using Axios: Popular library for simplified HTTP requests.
- State Management: Store and update fetched data using state.
- Async Handling: Manage loading and error states during requests.
Prerequisites
[Method 1]: Using JavaScript fetch() method
The fetch() method in JavaScript is used to make network requests (such as HTTP requests) and fetch data from a specified URL. It returns a Promise that resolves to the Response object representing the response to the request.
/* App.css*/ 
.App {
    text-align: center;
    /* color: Green; */
}
.container {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
}
.item {
    min-width: 33rem;
    text-align: left;
}
.geeks {
    color: green;
}
import React, { useState, useEffect } from "react";
import "./App.css";
const App = () => {
    const [items, setItems] = useState([]);
    const [dataIsLoaded, setDataIsLoaded] = useState(false);
    useEffect(() => {
        fetch("https://jsonplaceholder.typicode.com/users")
            .then((res) => res.json())
            .then((json) => {
                setItems(json);
                setDataIsLoaded(true);
            });
    }, []); 
    if (!dataIsLoaded) {
        return (
            <div>
                <h1>Please wait some time....</h1>
            </div>
        );
    }
    return (
        <div className="App">
            <h1 className="geeks">GeeksforGeeks</h1>
            <h3>Fetch data from an API in React</h3>
            <div className="container">
                {items.map((item) => (
                    <div className="item" key={item.id}>
                        <ol>
                            <div>
                                <strong>User_Name: </strong>
                                {item.username},
                            </div>
                            <div>Full_Name: {item.name}</div>
                            <div>User_Email: {item.email}</div>
                        </ol>
                    </div>
                ))}
            </div>
        </div>
    );
};
export default App;
Output:
- Uses functional component with React Hooks
- useEffect is used to fetch data when the component mounts
- fetch() calls the API and retrieves user data
- Data is stored using useState (items)
- dataIsLoaded state tracks loading status
- Shows "Please wait" message while data is loading
- Once loaded, displays username, name, and email for each user
- Works similar to componentDidMount in class components
[Method 2]: Using axios library
Axios library is a popular, promise-based JavaScript library used to make HTTP requests from the browser or NodeJS. It simplifies making requests to APIs, handling responses, and managing errors compared to the native fetch() method.
Install Axios library using the following command
npm install axios
The updated dependencies in the package.json file are:
"dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.3.1",
"react-dom": "^18.3.1",
"axios": "^1.6.7",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
Note: The version number may differ slightly depending on the latest release. As of early 2025, version 1.6.x is common.
/* App.css*/ 
.App {
    text-align: center;
    /* color: Green; */
}
.container {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
}
.item {
    min-width: 33rem;
    text-align: left;
}
.geeks {
    color: green;
}
// App.js
import React, { useState, useEffect } from "react";
import "./App.css";
import axios from "axios";
const App = () => {
    const [items, setItems] = useState([]);
    const [dataIsLoaded, setDataIsLoaded] = useState(false);
    useEffect(() => {
        axios
            .get("https://jsonplaceholder.typicode.com/users")
            .then((res) => {
                setItems(res.data);
                setDataIsLoaded(true);
            });
    }, []);
    if (!dataIsLoaded) {
        return (
            <div>
                <h1>Please wait some time....</h1>
            </div>
        );
    }
    return (
        <div className="App">
            <h1 className="geeks">GeeksforGeeks</h1>
            <h3>Fetch data from an API in React</h3>
            <div className="container">
                {items.map((item) => (
                    <div className="item" key={item.id}>
                        <ol>
                            <div>
                                <strong>User_Name: </strong>
                                {item.username},
                            </div>
                            <div>Full_Name: {item.name}</div>
                            <div>User_Email: {item.email}</div>
                        </ol>
                    </div>
                ))}
            </div>
        </div>
    );
};
export default App;
Output:
- This React component uses axios to fetch data from an API when the component mounts.
- It stores the fetched data in the state and displays the users' username, name, and email once the data is loaded.
- If the data is not loaded, it shows a loading message.
[Method 3]: Using the Stale-While-Revalidate (SWR) Method
SWR is a data-fetching library developed by vercel that makes it easy to fetch and cache data in React applications. The concept behind SWR is simple: fetch data, use stale data for immediate UI rendering, and revalidate it in the background to get fresh data. SWR includes useState() and useEffect(), so there is no need to import them.
Below we have mentioned Steps to Install SWR
Step1 : Install swr
npm install swr
Step 2: Import all the packages needed for the App.
import React from 'react';
import useSWR from 'swr';
const fetcher = (url) => fetch(url).then((res) => res.json());
const App = () => {
    const { data, error } = useSWR('https://jsonplaceholder.typicode.com/users', fetcher);
    if (error) return <p>Error loading data</p>;
    if (!data) return <p>Loading...</p>;
    return (
        <div>
            <ul>
                {data.map((user) => (
                    <li key={user.id}>
                        <h3>{user.username}</h3>
                        <p>{user.name}</p>
                        <p>{user.email}</p>
                    </li>
                ))}
            </ul>
        </div>
    );
};
export default App;
Output:
- SWR automatically handles caching, background revalidation, and state management for data fetching.
- The useSWR hook fetches the data and handles the logic for loading, error, and success states.
- It provides an automatic re-fetching of data if the component re-renders or if the data becomes stale.
[Method 4]: Using the React Query Library
React Query is another powerful library that simplifies data fetching, caching, synchronization, and more. It is great for applications where the data changes frequently and you need efficient, real-time data fetching with minimal boilerplate.
Steps to Install React Query
npm install react-query
import React from 'react';
import { useQuery } from 'react-query';
// Function to fetch data
const fetchUsers = async () => {
    const res = await fetch('https://jsonplaceholder.typicode.com/users');
    if (!res.ok) throw new Error('Network error');
    return res.json();
};
const App = () => {
    // Use useQuery to fetch data
    const { data, error, isLoading } = useQuery('users', fetchUsers);
    if (isLoading) return <p>Loading...</p>;
    if (error) return <p>Error loading data</p>;
    return (
        <div>
            <h1>User List</h1>
            <ul>
                {data.map((user) => (
                    <li key={user.id}>
                        <h3>{user.username}</h3>
                        <p>{user.name}</p>
                        <p>{user.email}</p>
                    </li>
                ))}
            </ul>
        </div>
    );
};
export default App;
import React from 'react';
import { QueryClient, QueryClientProvider } from 'react-query';
import App from './App';
const queryClient = new QueryClient();
function Root() {
    return (
        <QueryClientProvider client={queryClient}>
            <App />
        </QueryClientProvider>
    );
}
export default Root;
Output:
- React Query’s useQuery hook is used to fetch data and manage state.
- It automatically handles caching, background refetching, and error handling.
- If the data is still loading, it shows a loading message. If there's an error, it displays an error message.
[Method 5]: Use the useFetch custom hook from react-fetch-hook
A custom hook in React is a regular Javascript function that lets you reuse logic across different components. It's built using React's built-in hooks like useState and useEffect.
Custom hooks make your code cleaner and easier to manage by putting shared functionality in one place. For example:- if you fetch data in several components, you can write a custom hook like useFetch to handle it.
Step 1: Install the react-fetch-hook
npm install react-fetch-hook
Once the installation is complete, navigate to the start of your application's file
Step 2: Import the package for React App file.
import useFetch from "react-fetch-hook";
Syntax:
import React from 'react';
import useFetch from 'react-fetch-hook';
function App() {
  const { isLoading, data, error } = useFetch("https://jsonplaceholder.typicode.com/posts");
  if (isLoading) return <p>Loading...</p>;
  if (error) return <p>Error: {error.message}</p>;
  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1>Posts</h1>
      <ul>
        {data.slice(0, 10).map((post) => (
          <li key={post.id}>
            <strong>{post.title}</strong>
            <p>{post.body}</p>
          </li>
        ))}
      </ul>
    </div>
  );
}
export default App;
Each Method has it's own strength but choosing the Best API Method in React is essential while Fetching Data from an API.
- fetch():fetch() is a lightweight, built-in API for making simple HTTP requests without external dependencies.
- axios: axios provides a cleaner API with automatic JSON parsing, enhanced error handling, and interceptor support.
- SWR: SWR handles caching, revalidation, and background data fetching for efficient synchronization.
- React Query: React Query offers advanced server-state management with caching, refetching, and pagination for complex applications.
- react-fetch-hook (useFetch): It Simplifies data fetching with an easy-to-use custom hook, making it great for developers who want minimal setup and a lightweight solution.
Efficiency and Use Cases of API Fetching Methods in React
| Fetching Method | Ideal Use Case | Strength | Drawbacks | 
|---|---|---|---|
| fetch(Native) | Simple, lightweight applications | Built-in, no dependencies, good for quick prototyping | Requires manual JSON parsing and error handling | 
| Axios | Medium to large-scale projects | Cleaner syntax, auto-parsing, request/response interceptors | Requires installing an external library | 
| SWR | Real-time data or performance-sensitive apps | Auto-caching, background updates, minimal boilerplate | Less control over logic, smaller ecosystem | 
| React Query | Complex, data-intensive, production-ready apps | Advanced caching, pagination, mutations, background refetching. | More configuration and steeper learning curve | 
| react-fetch-hook | Small to mid-sized apps with shared data logic | Reusable hook, easy setup, minimal configuration | Limited to basic use cases, fewer customization options |
