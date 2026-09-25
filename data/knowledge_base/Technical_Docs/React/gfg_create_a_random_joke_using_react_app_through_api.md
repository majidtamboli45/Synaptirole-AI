# Create a Random Joke using React app through API

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-a-random-joke-using-react-app-through-api-fetching/

In this tutorial, we'll make a website that fetches data (joke) from an external API and displays it on the screen. We'll be using React completely to base this website. Each time we reload the page and click the button, a new joke fetched and rendered on the screen by React. As we are using React for this project, we need not reload the page to display the fetched data.
Let us take a look at how the final feature will look like:
Prerequisite: The pre-requisites for this project are:
Approach: The "Joke" file is a functional component and contains a state variable Joke, which initially set to an empty string, and depending upon the state of the Joke, the output gets rendered. The Component outputs the "Button" component which on click generates a joke. The "Button" component that is getting rendered is also an imported functional component that outputs a button element. We are also passing some props to the "Button" component, which is a method named callAPI. The prop is fetching the Joke from API whenever the code is being fetched.
Steps to create the application:
Step 1: Initialize the project from terminal using the command.
npm create vite@latest jokegenerator --template react
Step 2: Navigate to the project folder using the command.
cd jokegenerator
Step 3: Create a folder called components and add two files in it Button.js and Joke.js
Example: Write the following code in respective files.
- App.js: This file imports the components to render it on the web page
- Joke.js: This file contains the joke to be displayed and makes the API call
- Joke.css: This file contains the styling of all the elements
- Button.js: This file contains the button component which generates the joke on click
- Button.css: This file contains the styling of button element
/* Joke.css */
body {
    background-color: rgb(47, 97, 80);
}
.joke {
    width: auto;
    height: auto;
    margin: auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: beige;
}
h1 {
    text-align: center;
    color: beige;
}
/* Button.css */
button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #70a03a;
    color: #ffffff;
    border: none;
    font-size: 16px;
    cursor: pointer;
    border-radius: 8px;
    transition: background-color .5s;
}
button:hover {
    background-color: #c1f590;
}
button:active {
    background-color: #297910;
}
// App.js
import Joke from "./components/Joke";
function App() {
    return (
        <div className="App">
            <h1>Joke Generator Using React and Joke API</h1>
            <Joke/>
        </div>
    );
}
export default App;
// Joke.js
import React from "react";
 
import Button from "./Button";
import './Joke.css';
const Joke = () => {
    const [Joke, setJoke] = React.useState("");
    const fetchApi = () => {
        fetch("https://sv443.net/jokeapi/v2/joke/Programming?type=single")
            .then((res) => res.json())
            .then((data) => setJoke(data.joke));
    };
    return (
        <div className="joke">
            <Button callApi={fetchApi} /> 
            <p>{Joke}</p>    
        </div>
    );
}
export default Joke;
// Button.js
import React from "react";
import './Button.css'
const Button = (props) => {
    return <button onClick={props.callApi}>
        Click to generate a joke.
    </button>;
}
// Export Button Component
export default Button;
Steps to run the application:
Step 1: Type the following command in terminal of your project directory
npm run dev
Step 2: Type the following URL in your web browser.
http://localhost:5173/
Output:
