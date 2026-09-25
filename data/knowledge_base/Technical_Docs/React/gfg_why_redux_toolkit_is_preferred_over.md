# Why Redux Toolkit is preferred over Redux

> Source: https://www.geeksforgeeks.org/reactjs/why-redux-toolkit-is-preferred-over-redux/

Redux is a state management library used to manage and share data across components through a centralized store using actions and reducers. Redux Toolkit (RTK) is the officially recommended way to write Redux code, providing built-in utilities and boilerplate reduction to make state management simpler, cleaner, and more efficient.
Issues with basic Redux
- Configuring a Redux store is too complicated
- Have to add a lot of packages to build a large-scale application
- Redux requires too much boilerplate code which makes it cumbersome to write efficient and clean code.
Reasons to prefer Redux Toolkit
- Simplified Logic: Leverages a modern, hook-based API to eliminate complex manual implementations.
- Mutable-style Reducers: Uses Immer internally, allowing you to write intuitive, mutable-style code that safely handles immutable state updates.
- Reduced Boilerplate: Significantly minimizes repetitive code, resulting in a cleaner and more maintainable codebase.
- Built-in Data Fetching: Includes RTK Query to automate caching and request management, effectively replacing manual Thunks.
- Optimized Tooling: Comes pre-configured with Redux DevTools and essential utilities to streamline development.
Difference between Redux and Redux Toolkit
Here are the key differences between Redux and Redux Toolkit:
| Redux | Redux Toolkit (RTK) | 
|---|---|
| Redux often required writing a significant amount of boilerplate code, such as action creators, reducers, and store setups. | Redux Toolkit is designed to minimize boilerplate code. It includes utilities like createSlice for reducers and configureStore for store configuration, reducing the amount of manual setup required. | 
| Reducers are typically created using a switch statement, handling various action types explicitly. | With createSlice from the Redux Toolkit, reducers can be defined more concisely using a "slice" of the state and auto-generated action creators. | 
| Redux requires manual immutable updates, usually done via spread operator or helper libraries | It encourages immutability by providing utility functions immer internally, allowing more straightforward state updates within reducers. | 
| Setting up the Redux store involves configuring middleware, combining reducers, and applying additional enhancements. | configureStore From Redux Toolkit simplifies store configuration by integrating commonly used middleware and providing a more streamlined setup. | 
| Handling asynchronous actions requires additional middleware, like redux-thunk or redux-saga. | createAsyncThunk Is included in the Redux Toolkit which simplifies the process of managing asynchronous actions within the Redux store. | 
| It may have a steeper learning curve due to the amount of boilerplate code and manual configuration. | It is designed to improve developer experience by reducing boilerplate, making it more accessible and efficient, especially for beginners. | 
Comparison Between Redux and Redux Toolkit
Comparing Store and Reducers
- Redux: Creating Store and reducers.
- Redux Toolkit: Creating Store and reducers.
// Redux
const addHandler=(state=0,action)=>{
if(action.type==='ADD')
{
    return state+1;
}
return state;
}
const store = createStore(addHandler);
store.dispatch({type:'ADD'});
// Resux Toolkit
// Action Creators
const add = createAction('ADD'); 
const addHandler = createReducer(0, {  
  [add]: state => state + 1
})
const store = configureStore({
  reducer: addHandler
})
store.dispatch(add());
Comparing Redux DevTools Extension
- React: You have to add a predefined statement while creating the store to access the Redux DevTools.
- Redux Toolkit: It provides automatic support for Redux DevTools Extension.
 // Redux
 const store = createStore(
   reducer,   window.__REDUX_DEVTOOLS_EXTENSION__ && 
              window.__REDUX_DEVTOOLS_EXTENSION__()
 );
 // Reduc Toolkit
 const store = configureStore(
   reducer:rootReducer );
Comparing modification of states
- Redux: We need to manually handle and change the state immutably.
- Redux Toolkit: It provides the support for immer.js library which automatically changes the code immutably.
// Redux
const initialState={
counter:0}
const handler=(state=initialState,action){
return{
    ...state,
    counter:state.counter+1;
    }    
}
// Redux Toolkit
const initialState={
counter:0}
const handler=(state=initialState,action){
return{
    counter:state.counter+1;
    }    
}
