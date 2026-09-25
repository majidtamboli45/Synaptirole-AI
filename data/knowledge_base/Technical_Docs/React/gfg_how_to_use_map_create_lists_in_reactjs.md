# How to use map() to Create Lists in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-map-to-create-lists-in-reactjs/

The map function is generally used to render the list items dynamically in react. This function iterates over the array and each iteration returns the JSX for respective item. It helps to render and display the list efficiently.
Prerequisites:
Approach
To create and render lists in React using the map function we will use useState to store the data as an array. Iterate this array using map and transform each item to a react component. Render it as a list on the UI by enclosing it with a parent div.
Creating React Application
Step 1: Create a React application using the following command:
npx create-react-app listmapdemo
Step 2: After creating your project folder i.e. listmapdemo, move to it using the following command:
cd listmapdemo
Project Structure:
It will look like the following.
Example: This example uses the map function to render a lsit of fruits items stored as an array. The index of array item is used as the key in the final list.
// Filename - App.js
import React from "react";
function App() {
    // Declared an array of items
    const fruits = ["Apple", "Mango", "Banana", "GFG"];
    // Some styling for the items
    const styles = {
        backgroundColor: "white",
        width: "50px",
        marginBottom: "10px",
        padding: "10px",
        color: "green",
        boxShadow: "rgb(0,0,0,0.44) 0px 5px 5px",
    };
    return (
        <>
            {
                /*  This maps each array item to a div adds
                the style declared above and return it */
                fruits.map((fruit) => (
                    <div key={fruit} style={styles}>
                        {fruit}
                    </div>
                ))
            }
        </>
    );
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
