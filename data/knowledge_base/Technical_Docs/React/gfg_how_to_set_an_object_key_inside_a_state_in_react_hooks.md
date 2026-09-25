# How to set an object key inside a state object in React Hooks?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-set-an-object-key-inside-a-state-object-in-react-hooks/

We can update a React hooks state object that has a nested object containing objects with index keys with the following approach, Before doing so, consider the following example:
Example: Following is the default state object:
const [data, setData] = useState({
   name:'',
   contact:'',
   address:{
     0:{},
     1:{},
   }
})
Following is the desired output after updating a nested object:
{
  name:'',
  contact:'',
  address:{
    0:{"city":'jaipur'},
    1:{},
  }  
}
Solution: We can use the below syntax to set an object key inside a state object:
data.address[0].city = 'jaipur';
setData({...data});
Creating React Application:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Filename: App.js
import React, { Component, useState } from "react";
const App = () => {
  const [data, setData] = useState({
    name: '',
    contact: '',
    address: {
      0: {},
      1: {},
    }
  })
  const handleUpdate = () => {
    data.address[0].city = 'jaipur';
    setData({ ...data });
  }
  return (
    <div >
      <button
        style={{ margin: 100 }}
        onClick={() => { handleUpdate() }} >
        change state
      </button>
      { data.address[0].city + " "}
    </div>
  );
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output:
- Following will be the output before clicking the button:
- Following will be the output after clicking the button:
