# Currency converter app using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-a-currency-converter-app-in-reactjs/

In this article, we will be building a very simple currency converter app with the help of an API. Our app contains three sections, one for taking the user input and storing it inside a state variable, a menu where users can change the units of conversion, and finally, a display section where we display the final results.
Let us have a look at how the final application will look like:
Prerequisites: The pre-requisites for this project are:
Approach: At first, we call the API and store the required conversion rates inside a state variable and later we perform some operations that convert the currencies. Our app contains a flip switch where users can switch currencies at any time. We will be using functional components to create the application
Steps to create the application:
Step 1: Create a react application by typing the following command in the terminal:
npm create vite@latest currency-converter --template react
Step 2: Now, go to the project folder i.e currency-converter by running the following command:
cd currency-converter
Step 3: Let’s install some npm packages required for this project:
npm install axios
npm install react-dropdown
npm install react-icons
Project Structure:
The updated dependencies in package.json will look like:
"dependencies": {
"axios": "^1.4.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-dropdown": "^1.11.0",
"react-icons": "^4.10.1"
}
Example: Write the following code in respective files:
- App.js: This component of our app contains all the logic. We will be using a free opensource (no auth requires) API called 'currency-api' to fetch a list of all the available currencies.
- App.css: This file contains the styling of our project
/* App.css */
@import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');
.App {
    height: 100vh;
    width: 100%;
    display: flex;
    align-items: center;
    flex-direction: column;
    background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
}
.heading {
    font-family: 'Pacifico', cursive;
    font-size: 35px;
}
.container {
    height: auto;
    width: 800px;
    display: flex;
    justify-content: space-around;
    align-items: center;
}
input {
    padding-left: 5px;
    font-size: 20px;
    height: 36px;
}
.middle,
.right {
    width: 120px;
}
.switch {
    padding: 5px;
    background-color: rgb(226, 252, 184);
    border-radius: 50%;
    cursor: pointer;
}
.result {
    box-sizing: border-box;
    width: 800px;
    padding-left: 30px;
}
button {
    width: 100px;
    height: 30px;
    font-weight: bold;
    font-size: 20px;
    margin-top: 15px;
    border: 2px solid forestgreen;
    background-color: rgb(226, 252, 184);
    cursor: pointer;
}
p,
h3,
button,
.switch {
    color: forestgreen;
}
p {
    font-size: 30px;
}
// App.js
import { useEffect, useState } from 'react';
import Axios from 'axios';
import Dropdown from 'react-dropdown';
import { HiSwitchHorizontal } from 'react-icons/hi';
import 'react-dropdown/style.css';
import './App.css';
function App() {
    // Initializing all the state variables 
    const [info, setInfo] = useState([]);
    const [input, setInput] = useState(0);
    const [from, setFrom] = useState("usd");
    const [to, setTo] = useState("inr");
    const [options, setOptions] = useState([]);
    const [output, setOutput] = useState(0);
    // Calling the api whenever the dependency changes
    useEffect(() => {
        Axios.get(
`https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/$%7Bfrom%7D.json%60)
            .then((res) => {
                setInfo(res.data[from]);
            })
    }, [from]);
    // Calling the convert function whenever
    // a user switches the currency
    useEffect(() => {
        setOptions(Object.keys(info));
        convert();
    }, [info])
    // Function to convert the currency
    function convert() {
        var rate = info[to];
        setOutput(input * rate);
    }
    // Function to switch between two currency
    function flip() {
        var temp = from;
        setFrom(to);
        setTo(temp);
    }
    return (
        <div className="App">
            <div className="heading">
                <h1>Currency converter</h1>
            </div>
            <div className="container">
                <div className="left">
                    <h3>Amount</h3>
                    <input type="text"
                        placeholder="Enter the amount"
                        onChange={(e) => setInput(e.target.value)} />
                </div>
                <div className="middle">
                    <h3>From</h3>
                    <Dropdown options={options}
                        onChange={(e) => { setFrom(e.value) }}
                        value={from} placeholder="From" />
                </div>
                <div className="switch">
                    <HiSwitchHorizontal size="30px"
                        onClick={() => { flip() }} />
                </div>
                <div className="right">
                    <h3>To</h3>
                    <Dropdown options={options}
                        onChange={(e) => { setTo(e.value) }}
                        value={to} placeholder="To" />
                </div>
            </div>
            <div className="result">
                <button onClick={() => { convert() }}>Convert</button>
                <h2>Converted Amount:</h2>
                <p>{input + " " + from + " = " + output.toFixed(2) + " " + to}</p>
            </div>
        </div>
    );
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm run dev
Output: Now open your browser and go to http://localhost:5173/, you will see the following output:
