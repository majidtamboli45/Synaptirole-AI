# How to use useState in arrow function instead of hook ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-usestate-in-arrow-function-instead-of-hook/

The useState hook is used to update the state in a React component. It is a hook that takes the initial state as an argument and returns an array of two entries. It can be used in a React class based component as well as a functional component (declared using the function or const keyword). The functional component loads before any code are executed while const component loads only when the interpreter reaches that line of code. Always remember that rendering a functional component created using function syntax can be done before it is defined in the code while if it's defined using const then it needs to be declared before using it.
The const functional components are also called arrow functions. By using these functions, we can get rid of annoying method of binding every time and can access hooks very easily.
Creating React Application:
- Step 1: Create a React application using the following command:npx create-react-app foldername
- Step 2: After creating your project folder i.e. foldername, move to it using the following command:cd foldername
Project Structure:
It will look like the following.
Example 1: We create an arrow function App in which we set up an initial state count with the value of 10 and a function setCount for updating the state value. We pass an onClick event to our button component which updates the state value when we click on it. When the state variable needs to be updated, it is done by updating the state variable directly inside setCount (like we have done here in the button component). We will learn how to do the same with an update function in our next example.
import React, { useState } from 'react'
const App = () => {
  const [count, setCount] = useState(10);
  return (
    <div>
     <h1>Countdown Information</h1>
     
<p>You have clicked me {10 - count} times</p>
     
     <button onClick={() => setCount(count - 1)}>
        Please click me {count} more times.
     </button>
     </div>
  )
}
export default App
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Example 2: We create two functions increaseCount and decreaseCount which increment and decrement the state value by 1 respectively. Both functions get triggered by onClick event and the state value gets updated. Note that we created two update functions and passed them as event handlers in our button components which just signifies how we can use useState in an arrow function in different ways.
import React, { useState } from 'react'
const App = () => {
  const [count, setCount] = useState(0);
  
  const increaseCount = () => {
    setCount(count + 1);
  }
  const decreaseCount = () => {
    setCount(count - 1); 
  }
  
  return (
    <div>
     <h1>Countdown Information</h1>
     
<p>Value is {count}</p>
     
     <button onClick={increaseCount}>
        Increment 
     </button>
     <button onClick={decreaseCount}>
        Decrement
     </button>
     </div>
  )
}
export default App
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
