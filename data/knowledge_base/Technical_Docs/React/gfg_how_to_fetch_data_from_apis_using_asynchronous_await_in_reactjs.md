# How to fetch data from APIs using Asynchronous await in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-fetch-data-from-apis-using-asynchronous-await-in-reactjs/

Fetching data from an API in ReactJS is a common and crucial task in modern web development. Fetching data from API helps in getting real-time updates dynamically and efficiently. API provides on-demand data as required rather than loading all data.
Prerequisites
Approach
To fetch data from APIs using Asynchronous await in ReactJS we will make an API request. Fetching data is an asynchronous process which means it does not update instantly and takes time to fetch the data. The await keyword enables the assignment to state le when data is available and is completely fetched.
API
APIs are basically a type of application that stores data in the format of JSON (JavaScript Object Notation) and XML (Extensible Markup Language). It makes it possible for any device to talk to each other.
Asynchronous Await
Async ensures that the function returns a promise and wraps non-promises in it. There is another word Await, that works only inside the async function.
Syntax
const fun = async () => {
const value = await promise;
};
Steps to create React Application
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: Move to the project directory using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the required module using the following command:
npm i axios
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"axios": "^1.6.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
Example: This example creates async function and use await to use data when it is completely fetched.
// Filename: App.js
import React, { useState, useEffect } from "react";
import axios from "axios";
function App() {
    const [loading, setLoading] = useState(false);
    const [posts, setPosts] = useState([]);
    useEffect(() => {
        const loadPost = async () => {
            // Till the data is fetch using API
            // the Loading page will show.
            setLoading(true);
            // Await make wait until that
            // promise settles and return its result
            const response = await axios.get(
                "https://jsonplaceholder.typicode.com/posts/"
            );
            // After fetching data stored it in posts state.
            setPosts(response.data);
            // Closed the loading page
            setLoading(false);
        };
        // Call the function
        loadPost();
    }, []);
    return (
        <>
            <div className="App">
                {loading ? (
                    <h4>Loading...</h4>
                ) : (
                    posts.map((item) => (
                        // Presently we only fetch
                        // title from the API
                        <h4>{item.title}</h4>
                    ))
                )}
            </div>
        </>
    );
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
