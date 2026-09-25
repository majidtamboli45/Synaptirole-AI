# How to delete multiple cache data in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-delete-multiple-cache-data-in-reactjs/

In React, we can access all cache data from the browser and modify it as required whenever needed using the Cache Storage of the browser. Caching is a technique that helps us to store a copy of a given resource in our browser and serve it back when requested.
Prerequisites:
Approach:
Follow these simple steps in order to delete specific cache data in ReactJS. We have created our deleteMultipleCache function which takes the cache names as an array and deletes it from the browser cache. When we click on the button, the function is triggered, and the given caches get deleted from the browser, and we see an alert popup.
In the following example, we have 5 caches stored in the browser named CacheOne, CacheTwo, CacheThree, CacheFour, and CacheFive as shown below, and we delete CacheOne and CacheFour using our defined function.
Steos to Create React Application:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure:
Example: This example uses window cache storage to access and delete multiple cache form the browser.
// Filename - App.js
import * as React from "react";
export default function App() {
    // Function to delete our give caches
    const deleteMultipleCache = (cacheArray) => {
        for (let i = 0; i < cacheArray.length; i++) {
            if ("caches" in window) {
                caches
                    .delete(cacheArray[i])
                    .then(function (res) {
                        return res;
                    });
            }
        }
        alert("Multiple Caches Deleted!");
    };
    return (
        <div style={{ height: 500, width: "80%" }}>
            <h4>
                How to delete multiple cache data in
                ReactJS?
            </h4>
            <button
                onClick={() =>
                    deleteMultipleCache([
                        "CacheOne",
                        "CacheFour",
                    ])
                }
            >
                Delete Multiple Cache
            </button>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
