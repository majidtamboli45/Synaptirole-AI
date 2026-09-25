# Introduction to Redux (Action, Reducers and Store)

> Source: https://www.geeksforgeeks.org/reactjs/introduction-to-redux-action-reducers-and-store/

Redux is a state management library used in JavaScript applications. It stores all application data in a single central store, making the data flow predictable and easy to manage. Redux is especially useful when we need to:
- Manage complex application state
- Share data between many components
- Track and debug state changes easily
- Build scalable and well-structured applications
Principles of Redux
- Single Source of Truth: The entire application state is stored in a single store, making data consistent and easier to debug.
- State is Read-Only (Immutability): State cannot be modified directly; instead, a new state object is created for every change.
- Changes via Pure Functions (Reducers): Reducers are pure functions that take the previous state and an action, then return a new updated state.
Building Parts of redux
Redux is built using core components like the store, actions, and reducers, which work together to manage and update application state in a predictable way.
Actions
Actions are plain JavaScript objects that describe what happened in the application and are the only way to send data to the Redux store. Each action must have a type property, while the remaining fields carry the required data; action creators are functions that generate and return these action objects.
- Actions are simple JavaScript objects that describe state changes.
- The type field defines the kind of action to be performed.
- Action creators are functions that create and return action objects.
Example: The easiest example we can take try is To-do. So we will create two action creators one for adding a task in to-do and for removing.
 
function addTask(task) {
  
  return {
    
    type: 'ADD_TODO',
    task: task
  }
}
function removeTask(task) {
 
  return {
    type: 'REMOVE_TODO',
    task: task
  }
}
So, the above two functions are action creators. One is for adding a task and one for removing, and see both have a type which tells what is the purpose of actions creator and they will be used with reducers.
Reducers
Reducers are pure functions that define how the application state should change in response to an action. They take the current state and an action as input, then return a new updated state without modifying the original one.
- Reducers specify how the state changes, not what happened.
- They take the current state and an action as arguments.
- Reducers always return a new state and follow immutability principle
Let's create a reducer for our To-do.
function task(tasks = [], action) {
  
  if (action.type === 'ADD_TODO') {
    return [...tasks, action.task];
  } else if (action.type === 'REMOVE_TODO') {
      return tasks.filter(task => task !== action.task);
    }
  return tasks;
}
- A reducer function takes two arguments: the current state and an action, and it starts with an initial state (like an empty array for an empty task list).
- It checks the action type to decide what operation to perform (such as adding or removing a task).
- For actions like add or remove, it returns a new state by copying the old state and applying changes without mutating the original state.
- If no action matches, it returns the existing state, and for complex apps, multiple reducers can be combined using combineReducers() .
Store
The store is the central object in Redux that holds the entire state of the application and manages state updates. It acts as a bridge between actions and reducers, ensuring predictable state management.
- createStore() is used to create the Redux store.
- dispatch(action) sends actions to update the state.
- getState() retrieves the current state of the store.
Example: Let's create a store for our To-do. 
 
import { createStore } from 'Redux';
// Creating store
const store = createStore(taskList);
// Here add is action as you can see console,
// its an object with some info
const add = addTask('Wake up');
console.log(add);
// Dispatch usually trigger reducer and perform task
store.dispatch(add);
// getState() function is used to get current state
console.log(store.getState());
store.dispatch(addTask('Study'));
store.dispatch(addTask('Eat'));
store.dispatch(addTask('Go to sleep'));
store.dispatch(removeTask('Eat'));
store.dispatch(addTask('Work'));
store.dispatch(addTask('Sleep'));
store.dispatch(removeTask('Sleep'));
console.log(store.getState());
