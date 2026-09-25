# Redux Toolkit

> Source: https://www.geeksforgeeks.org/reactjs/redux-toolkit/

Redux Toolkit (RTK) is a modern utility package that simplifies Redux development by reducing boilerplate and improving state management. It was introduced to address the complexity of traditional Redux and make store creation easier and more efficient.
- Provides utility functions to simplify Redux store setup and logic.
- Redux Toolkit is the official way to write Redux logic, simplifying store setup and state management.
- Easy to install using npm commands.
- It follows an opinionated approach to simplify common Redux patterns.
Problems solved by Redux Toolkit (RTK) in Redux
Redux Toolkit was created to solve these three common problems that we face in Redux.
- Too much code to configure the store.
- Writing too much boilerplate code to dispatch actions and store the data in the reducer.
- Extra packages like Redux-Thunk and Redux-Saga for doing asynchronous actions.
Steps to Install and Import Redux Toolkit(RTK)
Redux Toolkit is added to a React project to simplify state management with less boilerplate. After installation, you import its core utilities, create a centralized store with slices, and connect it to your app using a provider.
Step 1: Redux Toolkit (RTK) Installation
To install the Redux Toolkit in our project, type the following command in the terminal.
// using NPM
npm i @reduxjs/toolkit
npm i react-redux        // Used to connect React components with the Redux store
Step 2: Importing Redux Toolkit (RTK)
We import only the necessary functions in our code
// Importing 
import { configureStore } from '@reduxjs/toolkit';        // Creates a store
import { createSlice } from '@reduxjs/toolkit';              // Combines and creates reducer
Dependencies after installing the Redux Toolkit:
"dependencies": {
    "react": "^17.0.2",
    "react-dom": "^17.0.2",
    "@reduxjs/toolkit": "^1.6.1",
    "react-redux": "^7.2.5"
  }
Benefits of Redux Toolkit (RTK)
Redux Toolkit (RTK) is the modern, official way to use Redux for state management in applications. It simplifies complex Redux patterns while improving code readability and maintainability.
- Easier and more intuitive state management compared to traditional Redux.
- Significantly reduces boilerplate code.
- Provides built-in wrapper functions like slices and reducers.
- Officially recommended standard approach by the Redux team.
- Improves scalability and consistency in large applications.
Important function provided by Redux Toolkit
Redux Toolkit provides several utility functions that simplify traditional Redux development.
- configureStore(): Replaces the basic Redux createStore function and automatically sets up middleware and DevTools support.
- createReducer(): Simplifies reducer logic and makes the code shorter and easier to understand.
- createAction(): The createAction() utility that returns an action creator function.
- createSlice(): Combines reducers and action creators into a single function.
Also Read:
