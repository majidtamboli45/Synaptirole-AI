# Understanding Prop Drilling

> Source: https://www.geeksforgeeks.org/reactjs/what-is-prop-drilling-and-how-to-avoid-it/

Prop drilling occurs when data is passed through multiple nested React components, even if intermediate components don’t use it, creating unnecessary chains of props.
- Leads to harder-to-maintain code as the component hierarchy grows.
- Can be avoided using state management tools like Context API or Redux.
import React from "react";
// Parent component that holds the message and passes it down
function Parent() {
    const message = "Hello from Parent";
    return (
        <div>
            <Child message={message} />
        </div>
    );
}
function Child({ message }) {
    return (
        <div>
            <Grandchild message={message} />
        </div>
    );
}
function Grandchild({ message }) {
    return (
        <div>
            <p>Message: {message}</p>
        </div>
    );
}
export default function App() {
    return (
        <div>
            <Parent />
        </div>
    );
}
Output
Message: Hello from Parent
- Intermediate components receive props they don’t need, adding unnecessary complexity.
- Scaling the app becomes difficult as prop chains grow longer and harder to track.
Challenges of Prop Drilling in React
Prop drilling is problematic because:
- Code Complexity: It makes the component tree overly complicated, as intermediate components receive and forward props without using them, cluttering your code and causing confusion.
- Maintenance Overhead: Any change to the props requires updating multiple components, which can be time-consuming and error-prone.
- Reduced Readability: It becomes difficult to trace how and where data flows through components, making debugging and development more challenging.
- Tight Component Coupling: Components become less reusable and more tightly coupled, leading to reduced flexibility and difficulties in refactoring.
- Scalability Issues: As your application grows, prop drilling worsens, leading to further complexity and making the app harder to scale effectively.
Strategies to Prevent Prop Drilling in React
Below are the some approaches which is used to avoid prop drilling:
1. Using Context API
The React Context API provides a way to share values (like state, functions, or constants) between components without explicitly passing props.
import React, { createContext, useContext } from 'react';
const UserContext = createContext();
const App = () => {
    const userName = 'geeksforgeeks';
    return (
        <UserContext.Provider value={userName}>
            <Parent />
        </UserContext.Provider>
    );
};
const Parent = () => {
    return <Child />;
};
const Child = () => {
    return <GrandChild />;
};
const GrandChild = () => {
    const userName = useContext(UserContext); // Access context value
    return <p>Hello, {userName}!</p>;
};
export default App;
Output
Hello geeksforgeeks!
- createContext() creates UserContext to share data across components.
- App uses UserContext.Provider to pass userName ('geeksforgeeks').
- ParentComponent and its children are wrapped by the provider.
- GrandChildComponent accesses the value via useContext(UserContext).
- Displays “Hello, geeksforgeeks!” in a <p> tag.
2. Using Custom Hooks
Custom hooks are reusable functions in React that encapsulate stateful logic, starting with use (e.g., useFetch). They improve code reusability, keep components clean, and allow sharing logic across components.
import React, { createContext, useContext } from "react";
const UserContext = createContext();
const useUser = () => { return useContext(UserContext); };
const App = () => {
    const userName = "GeeksforGeeks";
    return (
        <UserContext.Provider value={userName}>
            <Component />
        </UserContext.Provider>
    );
};
const Component = () => {
    return <Child />;
};
const Child = () => { return <Grand />; };
const Grand = () => {
    const userName = useUser();
    return <p>Hello, {userName}!</p>;
};
export default App;
Output
Hello, GeeksforGeeks!
- createContext() creates UserContext to share data across components.
- useUser() is a custom hook wrapping useContext(UserContext) for simplicity.
- App provides the context value ("GeeksforGeeks") using UserContext.Provider.
- Nested components (Component, Child, Grand) inherit the context value.
- Grand accesses the value via useUser() and displays "Hello, GeeksforGeeks!
3. Global State Management (Redux, Zustand, MobX)
In this approach we use libraries such as Redux, Zustand, or MobX manage application state globally, eliminating the need for prop drilling entirely.
import { configureStore, createSlice } from "@reduxjs/toolkit";
const userSlice = createSlice({
    name: "user",
    initialState: { name: "Alen", age: 30 },
    reducers: {}
});
const store = configureStore({
    reducer: {
        user: userSlice.reducer
    }
});
export default store;
import React from "react";
import Header from "./components/Header";
function App() {
    return (
        <div>
            <h1>React Redux App</h1>
            <Header />
        </div>
    );
}
export default App;
import React from "react";
import UserProfile from "./UserProfile";
function Header() {
    return (
        <header>
            <h2>Header Component</h2>
            <UserProfile />
        </header>
    );
}
export default Header;
import React from "react";
import { useSelector } from "react-redux";
function UserProfile() {
  const user = useSelector((state) => state.user);
  return (
    <div>
      <h3>User Profile</h3>
      <p>Name: {user.name}</p>
      <p>Age: {user.age} years old</p>
    </div>
  );
}
export default UserProfile;
Output
User Profile
Name: Alen
Age: 30 years old
- store.js: Creates a Redux store containing initial user data { name: "Alen", age: 30 }.
- App.js: Wraps the application with the Redux Provider to make the store accessible to all components.
- UserProfile.js: Uses the useSelector hook to access user data (name and age) from the Redux store and display it in the UI.
