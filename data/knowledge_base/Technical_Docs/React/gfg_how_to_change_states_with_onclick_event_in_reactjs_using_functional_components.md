# How to change states with onClick event in ReactJS using functional components ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-change-states-with-onclick-event-in-reactjs-using-functional-components/

In modern web applications, to change states with onClick event in React JS using functional components is done by Hooks in React as the functional components don't have inbuilt states like class components. With Hooks, state objects are completely independent of each other, so you can have as many state objects as you want. In a single-page application, the useState hook is the best way to simply change the state with a click without reloading the entire page.
Prerequisites
Approach
Using useState hook to dynamically change the states with onClick event in react js. When clicking on the button the state for the component to be rendered is set to true and other to false.
Steps to create React Application:
Step 1: Create a React application using the following command.
npx create-react-app projectname
Step 2: After creating your project folder i.e. projectname, move to it using the following command.
cd projectname
Project Structure
Example: Switching components with onClick event to update state to true or false using useState hook.
// Filename - App.js
import ComponentOne from "./components/ComponentOne";
import "./App.css";
function App() {
    return (
        <div className="App">
            <h1 className="geeks">GeeksforGeeks</h1>
            <h3>
                Change States with onClick Event in React JS
            </h3>
            
            <ComponentOne />
        </div>
    );
}
export default App;
// Filename - components/ComponentOne.js
import { useState } from "react";
function ComponentOne() {
    const [description, setDescription] = useState(true);
    const [reviews, setReviews] = useState(false);
    const descriptionHandler = () => {
        setDescription(true);
        setReviews(false);
    };
    const reviewsHandler = () => {
        setDescription(false);
        setReviews(true);
    };
    return (
        <div>
            <button onClick={descriptionHandler}>
                Descriptions
            </button>
            <button onClick={reviewsHandler}>
                Reviews
            </button>
            <div className="container">
                {description && (
                    <div>
                        <p>
                            This is a <b> descriptive </b>
                            component
                        </p>
                        <h3>Descriptions:</h3>
                    </div>
                )}
                {reviews && (
                    <div>
                        <p>
                            This is a <b> Review </b>
                            component
                            <br />
                        </p>
                        <h3>Reviews:</h3>
                    </div>
                )}
            </div>
        </div>
    );
}
export default ComponentOne;
/* Filename - App.js */
.App {
    text-align: center;
}
.geeks {
    color: green;
}
.container {
    width: 20rem;
    margin: auto;
    box-shadow: 0px 5px 10px gray;
    border-radius: 15px;
    padding: 3%;
}
button {
    font-size: large;
    margin: 2%;
    background-color: green;
    color: white;
    border-radius: 5px;
    padding: 10px;
}
Step to run the application: Run the application using the following command:
npm start
Output: Now, open the URL http://localhost:3000/, and you will see the following output.
