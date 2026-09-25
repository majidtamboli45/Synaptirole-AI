# How to get multiple cache data in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-get-multiple-cache-data-in-reactjs/

We can use the following approach in ReactJS to get multiple cache data. We can get multiple cache data from the browser and use them in our application whenever needed. Caching is a technique that helps us to store a copy of a given resource in our browser and serve it back when requested.
Prerequisites:
Approach:
To retrieve multiple cache data in React JS, implement a `getMultipleCacheData` function, specifying the cache names, and trigger it on a button click. This example demonstrates fetching data from browser caches named CacheOne and CacheFour out of five available caches: CacheOne, CacheTwo, CacheThree, CacheFour, and CacheFive.
Steps to Create the React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example: Now write down the following code in the App.js file.
import * as React from 'react';
export default function App() {
  // Our state to store fetched cache data
  const [cacheData, setCacheData] = React.useState();
  // Function to get multiple cache data
  const getMultipleCacheData = async (cacheNames) => {
    if (typeof caches === 'undefined') return false;
    var cacheDataArray = []
    for (var i = 0; i < cacheNames.length; i++) {
      const cacheStorage = await caches.open(cacheNames[i].cacheName);
      const cachedResponse = await cacheStorage.match(cacheNames[i].url);
      // If no cache exists
      if (!cachedResponse || !cachedResponse.ok) {
        cacheDataArray[i] = `Unable to fetch ${cacheNames[i].cacheName}`
      } else {
        var data = await cachedResponse.json()
        cacheDataArray[i] = data
      }
    }
    // Putting commas in between caches data
    // to display properly
    setCacheData(cacheDataArray.join(', '))
  };
  // Caches names which has to be fetched from browser 
  const cachesToFetch = [
    { cacheName: 'CacheOne', url: 'https://localhost:300' },
    { cacheName: 'CacheFour', url: 'https://localhost:300' }
  ]
  return (
    <div style={{ height: 500, width: '80%' }}>
      <h4>How to get multiple cache data in ReactJS?</h4>
      <button onClick={() => getMultipleCacheData(cachesToFetch)} >
        Get Multiple Cache Data</button>  <br />
      <h6>Multiple Cache Data is: {cacheData}</h6>
    </div>
  );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output:
Now open your browser and go to http://localhost:3000
