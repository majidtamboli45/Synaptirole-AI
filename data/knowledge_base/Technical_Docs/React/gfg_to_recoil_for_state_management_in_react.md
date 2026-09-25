# Introduction to Recoil For State Management in React

> Source: https://www.geeksforgeeks.org/reactjs/introduction-to-recoil-for-state-management-in-react/

State Management is a core aspect of React development, especially as applications grow in size and complexity. While there are many libraries available to handle state, recoil has emerged as the fresh, modern approach that simplifies state management without the bloat of more complex systems like Redux. In this article, we'll introduce Recoil, Its core concepts, and why it is a compelling choice for React Developers.
These are the following topics that we are going to discuss:
Table of Content
What is Recoil?
Recoil is a state management library for React. It makes it simple to handle both local and global states by breaking, states up into smaller and more manageable units known as "Atoms". As Recoil uses an atomic model. It also presents the concept of selectors, which are functions that can extract the state of atoms.
Recoil scales effectively in complex applications since it is made to interact easily with React's concurrent mode.
Why Recoil?
- No Boilerplate: Unlike Redux, which requires extensive boilerplate (reducers, actions, dispatches), Recoil is minimalistic. You can create atoms and selectors in just a few lines of code.
- Built for React: Since Recoil was built specifically for React, it fits naturally into React’s hooks ecosystem. This makes it easier to adopt without learning a completely new paradigm.
- Fine-Grained Updates: Recoil provides fine-grained control over re-renders, ensuring that only the components that depend on a piece of state are updated, making the app more performant.
- Concurrent Mode Ready: Recoil was designed with React’s future in mind, ensuring compatibility with concurrent rendering for better performance under heavy loads.
Atoms: The Building Blocks of Recoil
An atom is the most basic unit of state in Recoil. Each atom holds a single piece of state, and multiple components can subscribe to it. When an atom changes, only the components that depend on that atom will re-render, which ensures optimal performance.
Here is an example of creating an Atom:
import {atom } from 'recoil';
const countState = atom({
	key:'countState', // unique Id(required)
	default:0  //default value (initial state)
});
In this case, countState is an atom that holds an integer value, with an initial state of 0. Now, any component can access and modify this state using Recoil hooks.
Selectors: Deriving State
Selectors in recoil allows you to create derived state, which are computed , based on atoms or other selectors. This is very useful when you need to transform or compute values based on the current state without manually tracking the changes..
An example of a selector that derives state from the countState atom are as follows:
In this case, doubledCountState returns the value of countState which is multiplied by 2. Recoil ensures that this selector stays up-to-date whenever countState changes.
import { selector } from 'recoil';
import {countState} from './atoms';
const doubledCountState = selector({
  key:'doubleCountState',
  get :({get})=>{
    const count = get(countState);
    return count * 2;
  },
});
Implementing Recoil in Your React Application
Now, we have the basic understanding of what Recoil is . let's get dive deep into how to implement our it in our React app. We will walk through by setting up of Recoil , how to use atoms and selectors and managing asynchronous state.
Setting Up Recoil
Firstly, we need to install recoil in our project:
npm install recoil
Once its done ,Recoil requires a RecoilRoot component to be placed at the top level of our application, just similar to how we would wrap our app in Redux Provider.
import React from 'react';
import { RecoilRoot } from 'recoil';
import App from './App';
const Root = () => (
  <RecoilRoot>
    <App />
  </RecoilRoot>
);
export default Root;
This RecoilRoot component provides the Recoil state to your entire application, by making it available to each and every component that uses Recoil hooks.
Using Atoms in Components
Let's start to implement a simple counter using Recoil's atom and hooks. The useRecoilState hook allows components to read and update the value of atom.
import React from 'react';
import { atom, useRecoilState } from 'recoil';
const countState = atom({
  key: 'countState',
  default: 0,
});
const Counter = () => {
  const [count, setCount] = useRecoilState(countState);
  return (
    <div>
      <h1>Count: {count}</h1>
      <button onClick={() => setCount(count + 1)}>Increment</button>
      <button onClick={() => setCount(count - 1)}>Decrement</button>
    </div>
  );
};
export default Counter;
In this very simple example:
- we create an atom called countState.
- The Counter component read and updates the state using useRecoilState hook.
Whenever the button is clicked, the atom is updated, and only the Counter component re-renders. Other components that don't rely on countState remain unaffected.
Asynchronous State Management in Recoil
Managing asynchronous data, such as fetching from an API, is a breeze with Recoil’s async selectors.
Here’s an example:
import { selector } from 'recoil';
const userDataQuery = selector({
  key: 'userDataQuery',
  get: async () => {
    const response = await fetch('https://jsonplaceholder.typicode.com/users');
    const data = await response.json();
    return data;
  },
});
In this case, userDataQuery fetches user data from an API. This selector can then be used in components just like any other atom or selector.
import React from 'react';
import { useRecoilValue } from 'recoil';
import { userDataQuery } from './selectors';
const UsersList = () => {
  const users = useRecoilValue(userDataQuery);
  return (
    <ul>
      {users.map(user => (
        <li key={user.id}>{user.name}</li>
      ))}
    </ul>
  );
};
export default UsersList;
With this setup, UsersList automatically fetches and displays user data and React will re-render the component when the data is ready.
Conclusion
Recoil is a state management library that fits well into the React ecosystem and is lightweight, adaptable, and modern. Because of its atom-based architecture, which minimizes needless re-renders, it offers fine-grained control over state management and optimal performance. Recoil offers a simple yet robust API, which reduces the learning curve in contrast to more sophisticated alternatives like Redux. Because of this, developers of all skill levels who want to simplify state management in their React apps can use it.
