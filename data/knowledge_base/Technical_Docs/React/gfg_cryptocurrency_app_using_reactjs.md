# Cryptocurrency App using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-a-cryptocurrency-app-in-reactjs/

In this article, we are going to build a cryptocurrency app that lists all the available cryptos in the market. In this application user can see the current price, market cap, available supply of all the cryptocurrencies. The user can also search for an individual crypto coin and get information about it. We will convert the currency into INR by passing it in our API request.
Let us see how the final application will look like.
Approach
Our app contains two sections, one for searching the name of the cryptocurrency and the other for displaying all the available cryptocurrencies in the market. Initially, we will fetch all the data from the API and store it inside a state variable. Then we will map through all the data and display it in a table. Whenever a user searches for some specific crypto, we will filter that and display only the matching results.
Prerequisites
The pre-requisites for this project are:
Creating a React application and Module Installation
Step 1: Create a react application by typing the following command in the terminal:
npm create vite@latest crypto-app --template react
Step 2: Now, go to the project folder i.e crypto-app by running the following command:
cd crypto-app
Step 3: Install Axios which is an npm package. It is a promise-based HTTP client for the browser and node.js.
npm install axios
Project Structure: It will look like this.
The updated dependencies in package.json file will look like:
"dependencies": {
"axios": "^1.4.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"vite": "^4.0.0"
}
Example: Write the following code in respective files
- App.js: This file contains the logic and structure of the project along with API call using axios
- App.css: This file contains the design of the project.
/* App.css */
.App {
    min-height: 100vh;
    height: auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 15px;
    padding: 40px;
    font-size: 16px;
    background-image: linear-gradient(to top, #dfe9f3 0%, white 100%);
}
h1 {
    color: forestgreen;
}
input {
    padding-left: 5px;
    font-size: 20px;
    width: 250px;
    height: 30px;
}
table {
    width: 1000px;
    border-collapse: separate;
    border-spacing: 0 1em;
}
thead {
    background-color: rgb(44, 44, 44);
    color: white;
    text-align: center;
}
tbody>tr {
    text-align: right;
}
.rank {
    text-align: center;
    font-weight: bold;
}
.logo {
    display: flex;
    justify-content: flex-start;
    padding-left: 10%;
    gap: 10px;
}
.symbol {
    text-align: center;
}
// App.js
import "./App.css";
import Axios from "axios";
import { useEffect, useState } from "react";
function App() {
    // Setting up the initial states using
    // react hook 'useState'
    const [search, setSearch] = useState("");
    const [crypto, setCrypto] = useState([]);
    // Fetching crypto data from the API only
    // once when the component is mounted
    useEffect(() => {
        Axios.get(
            `https://api.coinstats.app/public/v1/coins?skip=0&limit=100¤cy=INR%60
        ).then((res) => {
            setCrypto(res.data.coins);
        });
    }, []);
    return (
        <div className="App">
            <h1>All Cryptocurrencies</h1>
            <input
                type="text"
                placeholder="Search..."
                onChange={(e) => {
                    setSearch(e.target.value);
                }}
            />
            <table>
                <thead>
                    <tr>
                        <td>Rank</td>
                        <td>Name</td>
                        <td>Symbol</td>
                        <td>Market Cap</td>
                        <td>Price</td>
                        <td>Available Supply</td>
                        <td>Volume(24hrs)</td>
                    </tr>
                </thead>
                {/* Mapping all the cryptos */}
                <tbody>
                    {/* Filtering to check for the searched crypto */}
                    {crypto
                        .filter((val) => {
                            return val.name.toLowerCase().includes(search.toLowerCase());
                        })
                        .map((val, id) => {
                            return (
                                <>
                                    <tr id={id}>
                                        <td className="rank">{val.rank}</td>
                                        <td className="logo">
                                            <a href={val.websiteUrl}>
                                                <img src={val.icon} alt="logo" width="30px" />
                                            </a>
                                            <p>{val.name}</p>
                                        </td>
                                        <td className="symbol">{val.symbol}</td>
                                        <td>₹{val.marketCap}</td>
                                        <td>₹{val.price.toFixed(2)}</td>
                                        <td>{val.availableSupply}</td>
                                        <td>{val.volume.toFixed(0)}</td>
                                    </tr>
                                </>
                            );
                        })}
                </tbody>
            </table>
        </div>
    );
}
export default App;
Steps to Run Application:
Step 1: Run the application using the following command from the root directory of the project:
npm run dev
Step 2: Now open your browser and go to http://localhost:3000/, you will see the output:
Output:
