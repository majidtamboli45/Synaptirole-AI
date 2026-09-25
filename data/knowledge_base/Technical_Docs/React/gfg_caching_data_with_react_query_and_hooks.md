# Caching Data with React Query and Hooks

> Source: https://www.geeksforgeeks.org/reactjs/caching-data-with-react-query-and-hooks/

Standard data fetching methods in React often trigger redundant API requests upon component remounts, degrading overall application performance. To resolve this issue through data caching, article demonstrates how to implement TanStack Query to minimize unnecessary network calls, utilizing the FreeTestAPI Books API as a practical testing environment.
React Query/TanStack Query
TanStack Query (formerly React Query) simplifies data fetching and state management in JavaScript by replacing complex boilerplate with clean, efficient code. This article focuses on its powerful caching capabilities, which are driven by a few core mechanics:
- The useQuery Hook: The primary function used within components to execute data fetching and caching.
- Intelligent Caching: Automatically stores API responses and serves them instantly to eliminate redundant network requests.
- Background Synchronization: Silently updates data and manages the cache without disrupting the user experience
Setting Up TanStack Query in React App
Step 1: Create a new React.js project and install the required dependencies:
npx create-react-app my-react-app.
Step 2: Navigate to the root directory of your project using the following command.
cd my-react-app
Project Structure:
Directly Installing:
$ npm i @tanstack/react-query
# or
$ yarn add @tanstack/react-query
Step 3: Now to use the TanStack Query you will need to first wrap it around the main function like we had to do in redux or react-router, so you can use this on your App.jsx or main.jsx. I'll wrap it around the main.jsx
So for that import the QueryClient to create a client and QueryClientProvider to provide that client in your main.jsx file and then wrap that around the App component
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
//main.jsx
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import './index.css'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
// Create a client
const queryClient = QueryClient();
ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
        {/* Provide the client to your App */}
    <QueryClientProvider client={queryClient}>
      <App />
    </QueryClientProvider>
  </React.StrictMode>,
)
In this code, QueryClient is being imported from @tanstack/react-query and a new instance of it is being created. This queryClient is then provided to the entire React application using the QueryClientProvider component.
Step 4: Now define your custom function that will fetch the data from the API and then return response in Json format. Like I here create fetchData function to get data from api .
  const fetchData = async () => {
    const response = await fetch('https://freetestapi.com/api/v1/books');
    return response.json();
  }
Step 5: Now import useQuery hook from '@tanstack/react-query'
import { useQuery } from '@tanstack/react-query';
The useQuery Hook will do all the work for you now from handling fetch requests to caching.
  const { data, isLoading, isError } = useQuery({ queryKey: ['books'], queryFn: fetchData })
- queryFn : Takes the function responsible for fetching data from the API. You can either pass a pre-defined function likefetchData or write an inline callback directly insideuseQuery .
- queryKey : A unique identifier for the data returned byqueryFn . For example,fetchData 's response is identified by the'books' key. It drives refetching, caching, and data sharing across components. It's defined as an array since multiple keys can be provided. We'll see how this is used for caching in further steps.
- data : Holds the data fetched from the API viaqueryFn , ready to be used in the UI.
- isLoading : A boolean that istrue while data is being fetched andfalse once it's available.
- isError : A boolean that is set totrue if an error occurs during the API request.
Step 6: Now write conditions for isLoading and isError to display Loading text on webpage in case of any delay or show error in case or error while fetching the data from the api.
  if (isLoading) return <div>Loading...</div>;
  if (isError) return <div>Error fetching data</div>;
Step 7: That's our work with the caching is complete and now we have to show the data fetched from the API to the webpage. But before rendering the lets first understand how caching will work. First see the below code on how it will look on completing (except for the rendering on webpage part).
//App.jsx
import { useQuery } from '@tanstack/react-query';
import './App.css';
const App = () => {
  const fetchData = async () => {
    const response = await fetch('https://freetestapi.com/api/v1/books');
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  }
  
  const { data, isLoading, isError } = useQuery({ queryKey: ['books'], queryFn: fetchData })
  if (isLoading) return <div>Loading...</div>;
  if (isError) return <div>Error fetching data</div>;
  return (
    <>
      <div>hi</div>
    </>
  );
}
export default App;
When useQuery is called, it first checks the cache for the given queryKey (here, ['books']):
- Cache hit: Cached data is returned immediately, data is populated andisLoading isfalse , enabling instant rendering. This holds true even across component re-renders or when another component uses the samequeryKey , avoiding redundant network requests and improving performance.
- Cache miss: queryFn (fetchData ) is called to fetch data from "https://freetestapi.com/api/v1/books" . While it's running,data isundefined andisLoading istrue , so you can display a loading state. Once it resolves, the cache is updated and the component re-renders with the fetched data andisLoading set tofalse . If it rejects (e.g. a network failure),isError is set totrue , letting you display an error state.
useQuery also provides options to control caching and re-fetching behavior, especially useful when your API isn't static and data changes over time, requiring periodic re-fetches. There are many such options (see useQuery Options); the key ones are:
- cacheTime: Default: 5 minutes (always in ms). Within this window, the cache is considered fresh. After it expires, the cache turns stale but isn't immediately removed, it continues to be served for the samequeryKey while React Query silently refetches in the background to keep data up-to-date.
- staleTime: Defines how long stale cache stays in memory before being replaced. During this period,queryFn runs in the background to fetch fresh data, which then replaces the stale cache once it arrives. Meanwhile, any new requests with the samequeryKey still receive the cached data without triggering an additional refetch.
- refetchInterval: Forces a refetch at the specified interval (in ms), regardless ofcacheTime orstaleTime .
So I told you three main options which are mostly used in useQuery like in the code below cacheTime is 60 seconds after that cache is termed as stale and then during the stale time which is 30 seconds here , the query will re-fetch the data and will store in cache. Where as refetchInterval will make the query to run in every 2 minutes :-
  const { data, isLoading, isError } = useQuery({ queryKey: ['books'], queryFn: fetchData,  cacheTime: 60000,
    staleTime: 30000,
    refetchInterval: 120000, })
Step 8: Display the data on the Webpage also using the map.
import { useQuery } from '@tanstack/react-query';
import './App.css';
const App = () => {
  const fetchData = async () => {
    const response = await fetch('https://freetestapi.com/api/v1/books');
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  }
  const { data, isLoading, isError } = useQuery({ queryKey: ['books'], queryFn: fetchData })
  if (isLoading) return <div>Loading...</div>;
  if (isError) return <div>Error fetching data</div>;
  return (
    <>
      <div>hi</div>
      <div>
        {
          data.map((item) => (
            <div key={item.id}>
              <h2>{item.title}</h2>
              <p>{item.author}</p>
            </div>
          ))
        }
      </div>
    </>
  );
}
export default App;
