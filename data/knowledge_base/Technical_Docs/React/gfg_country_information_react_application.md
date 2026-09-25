# Country Information React Application

> Source: https://www.geeksforgeeks.org/reactjs/react-application-that-provides-country-information/

Country Information App is a web application to get the country's information using ReactJS. This project basically implements functional components and manages states.
The user can insert the country name in the search input field, and after clicking the search button, this application makes an API call to retrieve the specific country information. If the country name is not valid, then it will show an error message. This application is implemented using ReactJS and has a simple and responsive UI.
Preview of Final Project
Prerequisites
Approach/Functionalities
- Utilizes ReactJS functional components for building a dynamic UI.
- Implements state management using React's useState and useEffect hooks.
- Allows the user to enter a country name in an input field.
- On clicking the Search button, the app makes an API request to restcountries.com.
- The API retrieves detailed information about the specified country.
- If the API call fails, an error message is displayed to the user.
- On a successful response, displays country details such as name, flag image, capital, population, borders, area, and calling code.
Steps to Create the Application
Step 1: Set up React project using the command
npm create vite@latest country-information-app --template react
Step 2: Navigate to the project folder using
cd country-information-app
Step 3: Create a folder “components” and add three new files in it and name them as CountryInfo.js, CountryInformation.js and CountryInformation.css.
Project Structure
The updated dependencies in package.json will look like this:
{
  "name": "country-information-app",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "vite": "^4.0.0",
    "web-vitals": "^2.1.4"
  },
  "devDependencies": {
    "@vitejs/plugin-react": "^4.0.0"
  }
}
Example: Write the following code in respective files
- App.js: This file imports the CountryInformation components and exports it.
- CountryInformation.js: This file contains a logic to allow users to search for country information by entering a country name and passes the retrieve data to child component CountryInfo.js.
- CountryInfo.js: It displays data, including flags, capital, population, and more, providing a user-friendly interface for exploring country details.
- CountryInformation.css: This file contains the design of the CountryInformation elements.
/* CountryInformation.css */
body{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: 'Noto Sans Mono', monospace;
    background-color: #f2f5f1;
}
.container {
    max-width: 650px;
    margin: 5px;
    width: calc(100% - 10px);
    padding: 30px;
    border-radius: 10px;
    box-sizing: border-box;
    background: #fff;
    box-shadow: 6px 10px 17px -8px rgba(0,0,0,0.57);
}
input {
    padding: 10px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    outline: none;
    font-size: 15px;
    width: calc(100% - 125px);
}
#search-btn {
    padding: 10px 20px;
    outline: none;
    border: 1px solid #ced4da;
    margin: 5px;
    border-radius: 4px;
    cursor: pointer;
    background: #1d9bf0;
    color: #fff;
    font-size: 16px;
    transition: all 0.5s;
}
#search-btn:hover{
    background-color: #1879ba;
}
#result img{
    width: 298px;
    margin-top: 10px;
    height: 200px;
    border: 1px solid #ced4da;
}
#result h2{
    margin-top: 0;
}
.dataRow{
    text-align: left;
}
.dataRow h4{
    margin: 0;
    font-size: 15px;
}
.dataRow span{
    display: block;
    margin-bottom: 10px;
    font-size: 13px;
    max-width: 300px;
}
// App.js
import './App.css';
import CountryInformation from './components/CountryInformation';
function App() {
    return (
        <div className="App">
            <CountryInformation />
        </div>
    );
}
export default App;
// CountryInformation.js
import React, { useState } from 'react';
import './CountryInformation.css';
import CountryInfo from './CountryInfo';
function CountryInformation() {
    const [countryName, setCountryName] = useState('');
    const [countryData, setCountryData] = useState(null);
    const [error, setError] = useState('');
    const handleSearch = () => {
        if (!countryName) {
            setError('The input field cannot be empty');
            setCountryData(null);
            return;
        }
        const finalURL = `https://restcountries.com/v3.1/name/$%7BcountryName.trim()}?fullText=true`;
        fetch(finalURL)
            .then((response) => response.json())
            .then((data) => {
                if(data.message === "Not Found"){
                    setError("Country Information is not Found");
                    setCountryData(null);
                }else if (data.length === 0) {
                    setError('Please enter a valid country name.');
                    setCountryData(null);
                } else {
                    setError('');
                    setCountryData(data[0]);
                }
            })
            .catch(() => {
                setError('An error occurred while fetching data.');
                setCountryData(null);
            });
    };
    return (
        <div className="container">
            <div className="search">
                <input
                    type="text"
                    id="countryName"
                    placeholder="Enter a country name here..."
                    value={countryName}
                    onChange={(e) => setCountryName(e.target.value)}
                />
                <button id="search-btn" onClick={handleSearch}>
                    Search
                </button>
            </div>
            <div id="result">
                {error && <h3>{error}</h3>}
                {countryData && (<CountryInfo countryData={countryData} />)}
            </div>
        </div>
    );
}
export default CountryInformation;
// CountryInfo.js
import React from 'react';
function CountryInfo({ countryData }) {
    return (
        <div>
            <img src={countryData.flags.svg} alt="Flag" className="flagImage" />
            <h2>{countryData.name.common}</h2>
            <div className="row">
                <div className="dataRow">
                    <h4>Capital:</h4>
                    <span>{countryData.capital[0]}</span>
                </div>
            </div>
            <div className="row">
                <div className="dataRow">
                    <h4>Continent:</h4>
                    <span>{countryData.continents[0]}</span>
                </div>
            </div>
            <div className="row">
                <div className="dataRow">
                    <h4>Population:</h4>
                    <span>{countryData.population}</span>
                </div>
            </div>
            <div className="row">
                <div className="dataRow">
                    <h4>Currency:</h4>
                    <span>
                        {countryData.currencies[
                            Object.keys(countryData.currencies)[0]
                        ].name}{' '}
                        - {Object.keys(countryData.currencies)[0]}
                    </span>
                </div>
            </div>
            <div className="row">
                <div className="dataRow">
                    <h4>Common Languages:</h4>
                    <span>
                        {Object.values(countryData.languages)
                            .toString()
                            .split(',')
                            .join(', ')}
                    </span>
                </div>
            </div>
            <div className="row">
                <div className="dataRow">
                    <h4>Borders:</h4>
                    <span>
                        {(countryData.borders) ? Object.values(countryData.borders)
                            .toString()
                            .split(',')
                            .join(', ') : "NAN"}
                    </span>
                </div>
            </div>
            <div className="row">
                <div className="dataRow">
                    <h4>Area:</h4>
                    <span>{countryData.area}</span>
                </div>
            </div>
            <div className="row">
                <div className="dataRow">
                    <h4>Calling Are:</h4>
                    <span>{countryData.idd.root}{countryData.idd.suffixes[0]}</span>
                </div>
            </div>
            <div className="row">
                <div className="dataRow">
                    <h4>Capital Latitudes and Longitudes are:</h4>
                    <span>{countryData.capitalInfo.latlng[0]} {countryData.capitalInfo.latlng[1]}</span>
                </div>
            </div>
            <div className="row">
                <div className="dataRow">
                    <h4>TimeZones:</h4>
                    <span>
                        {Object.values(countryData.timezones)
                            .toString()
                            .split(',')
                            .join(', ')}
                    </span>
                </div>
            </div>
        </div>
    );
}
export default CountryInfo;
To start the application run the following command
npm run dev
Output
