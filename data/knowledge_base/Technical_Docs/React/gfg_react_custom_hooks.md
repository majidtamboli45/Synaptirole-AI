# React Custom Hooks

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-custom-hooks/

Custom Hooks are a React pattern for extracting reusable logic into a separate function. They help keep component code cleaner by separating behavior from presentation, making the codebase easier to organize and maintain.
- Reuse shared logic across components
- Keep components focused on UI
- Improve code organization
Note: Custom Hooks must start with use and can only call Hooks at the top level of a React function or another custom Hook.
Syntax
function useCustomHook() {
// Use built-in hooks here
return someValue;
}
Steps to Create a Custom Hook
Step 1: Create a function whose name starts with use. Every custom Hook must follow this naming convention.
function useCustomHook() {
    // Hook logic here
    return someValue;
}
Step 2: Add the reusable logic that you want to share across multiple components. This can include state management and other Hook-related functionality.
function useCounter() {
    const [count, setCount] = useState(0);
    return [count, () => setCount(count + 1)];
}
Step 3: If the custom Hook needs to perform side effects, such as fetching data, add that logic using useEffect.
function useFetchData(url) {
    const [data, setData] = useState(null);
    useEffect(() => {
        fetch(url)
            .then(response => response.json())
            .then(setData);
    }, [url]);
    return data;
}
Step 4: Return the values or functions that should be accessible to components using the custom Hook.
function useToggle(initialValue = false) {
    const [state, setState] = useState(initialValue);
    const toggle = () => setState(prev => !prev);
    return [state, toggle];
}
Step 5: Import and use the custom Hook inside a React component.
function ExampleComponent() {
    const [isOn, toggle] = useToggle();
    return (
        <button onClick={toggle}>
            {isOn ? "ON" : "OFF"}
        </button>
    );
}
Implementing A Custom Hook
1. Creating a Custom Hook for Fetching Data
Custom hooks can be used for handling the API requests.
import { useState, useEffect } from 'react';
function useFetch(url) {
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);
    useEffect(() => {
        fetch(url)
            .then((response) => response.json())
            .then((data) => {
                setData(data);
                setLoading(false);
            });
    }, [url]);
    return { data, loading };
}
function DataComponent() {
    const { data, loading } = useFetch("https://jsonplaceholder.typicode.com/todos/1");
    return (
        <div>
            {loading ? <p>Loading...</p> : <p>Data: {JSON.stringify(data)}</p>}
        </div>
    );
}
export default DataComponent;
In this code,
- useFetch is a custom hook that encapsulates API fetching logic so multiple components can reuse it.
- The hook manages two pieces of state: the fetched data and the loading status, keeping network-related logic separate from UI logic.
- useEffect is used to perform the asynchronous fetch operation whenever the provided URL changes.
- DataComponent consumes the hook and focuses only on rendering UI based on the hook's returned state (data andloading ).
Output
2. Creating a Custom Hook for the Save Button with Online/Offline Status
This example consists of a custom hook (useOnlineStatus) that tracks the online/offline status of a user and a React component (SaveButton) that uses this custom hook to enable or disable a button based on the network status.
//src/App.js
import useOnlineStatus from './useOnlineStatus';
export default function SaveButton() {
    const isOnline = useOnlineStatus();
    function handleSaveClick() {
        console.log('✅ Progress saved');
    }
    return (
        <button disabled={!isOnline} onClick={handleSaveClick}>
            {isOnline ? 'Save progress' : 'Reconnecting...'}
        </button>
    );
}
//src/useOnlineStatus.js
import { useState, useEffect } from 'react';
function useOnlineStatus() {
    const [isOnline, setIsOnline] = useState(navigator.onLine);
    useEffect(() => {
        function handleOnline() {
            setIsOnline(true);
        }
        function handleOffline() {
            setIsOnline(false);
        }
        window.addEventListener('online', handleOnline);
        window.addEventListener('offline', handleOffline);
        return () => {
            window.removeEventListener('online', handleOnline);
            window.removeEventListener('offline', handleOffline);
        };
    }, []);
    return isOnline;
}
export default useOnlineStatus;
In this code,
- useOnlineStatus is a custom hook that provides the user's current internet connection status.
- The component uses that status to determine whether saving should be allowed.
- The button is enabled when online and disabled when offline.
- The button text updates dynamically to reflect the connection state.
Output
Use Cases of Custom Hooks
Custom Hooks are useful for sharing stateful logic across multiple components without duplicating code.
- Data Fetching: Reuse API request, loading, and error-handling logic across components.
- Form Management: Centralize form state, validation, and submission behavior.
- UI State Management: Handle reusable behaviors such as toggles, modals, and pagination.
- External Integrations: Encapsulate authentication, subscriptions, and browser API interactions.
