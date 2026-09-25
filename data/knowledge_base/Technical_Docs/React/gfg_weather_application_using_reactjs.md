# Weather Application using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/weather-application-using-reactjs/

In this article, we will develop an Interactive Weather Application using ReactJS Framework. The developed application will provide real-time weather information to the user for the city they have searched. If the user searches, for the wrong city, an Error message is also displayed to the user, stating that the searched city is not found.
We have used OpenWeatherMap API which provides us with access to weather data from around the world. We have fetched the weather information for various locations, including wind speed and more.
You can follow the Weather Forecast Project to create your own weather application using HTML, CSS and JavaScript.
Let's have an interactive look at what our final project will look like:
Prerequisites
Approach
- Developed an interactive Weather Application using the ReactJS Framework.
- Enabled users to search and get weather information for various cities in real time.
- Integrated a weather API to fetch and display city-specific weather details based on user input.
- Ensured the application is fully responsive, offering a consistent experience across all devices.
- Delivered quick and accurate output upon city search to enhance user experience.
- Implemented easy navigation between components for seamless user interaction.
- Designed a user-friendly UI, making the application intuitive and simple to operate.
- Incorporated various icons to enhance visual appeal and make the interface more engaging.
Project Structure
The dependencies in package.json will look like this:
"dependencies": {
    "@fortawesome/free-solid-svg-icons": "^6.4.2",
    "@fortawesome/react-fontawesome": "^0.2.0",
    "@testing-library/jest-dom": "^5.17.0",
    "@testing-library/react": "^13.4.0",
    "@testing-library/user-event": "^13.5.0",
    "axios": "^1.4.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-loader-spinner": "^5.3.4",
    "vite": "^4.0.0",
    "web-vitals": "^2.1.4"
}
Steps to create the application
Step 1: Set up React project using the below command in VSCode IDE.
npm create vite@latest <<name of project>> --template react
Step 2: Navigate to the newly created project folder by executing the below command.
cd <<Name_of_project>>
Step 3: Install the required dependencies
npm install axios react-loader-spinner @fortawesome/react-fontawesome @fortawesome/free-solid-svg-icons
/* App.css */
* {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen,
        Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}
html {
    background-color: #f7f7f7;
}
.app-name {
    font-size: 2.3rem;
    color: rgb(17, 144, 0);
    margin-bottom: 16px;
}
.App {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 600px;
    min-height: 440px;
    background-color: rgb(255, 255, 255);
    text-align: center;
    margin: 128px auto;
    border-radius: 10px;
    padding-bottom: 32px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}
.city-search {
    width: 100%;
    max-width: 400px;
    box-sizing: border-box;
    border: 2px solid rgb(204, 204, 204);
    outline: none;
    border-radius: 20px;
    font-size: 16px;
    background-color: #e5eef0;
    background-position: 10px 12px;
    background-repeat: no-repeat;
    padding: 12px 40px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
    color: #333;
}
.city-search:focus {
    width: 100%;
}
.city-name {
    font-size: 1.5rem;
    color: #444;
    margin-bottom: 8px;
}
.date {
    font-size: 1.25em;
    font-weight: 500;
    color: #777;
}
.icon-temp {
    font-size: 3rem;
    font-weight: 700;
    color: #1e2432;
    text-align: center;
}
.deg {
    font-size: 1.3rem;
    vertical-align: super;
}
.des-wind {
    font-weight: 500;
    color: #666;
}
.error-message {
    display: block;
    text-align: center;
    color: #d32f2f;
    font-size: 24px;
    margin-top: auto;
}
.Loader {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
}
.Loader>div {
    margin: 0 auto;
}
.weather-icon {
    display: flex;
    justify-content: center;
    align-items: center;
}
.weather-icon img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
//App.js
import { Oval } from 'react-loader-spinner';
import React, { useState } from 'react';
import axios from 'axios';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faFrown } from '@fortawesome/free-solid-svg-icons';
import './App.css';
function GfGWeatherApp() {
    const [input, setInput] = useState('');
    const [weather, setWeather] = useState({
        loading: false,
        data: {},
        error: false,
    });
    const toDateFunction = () => {
        const months = [
            'January',
            'February',
            'March',
            'April',
            'May',
            'June',
            'July',
            'August',
            'September',
            'October',
            'November',
            'December',
        ];
        const WeekDays = [
            'Sunday',
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
        ];
        const currentDate = new Date();
        const date = `${WeekDays[currentDate.getDay()]} ${currentDate.getDate()} ${months[currentDate.getMonth()]
            }`;
        return date;
    };
    const search = async (event) => {
        if (event.key === 'Enter') {
            event.preventDefault();
            setInput('');
            setWeather({ ...weather, loading: true });
            const url = 'https://api.openweathermap.org/data/2.5/weather';
            const api_key = 'f00c38e0279b7bc85480c3fe775d518c';
            await axios
                .get(url, {
                    params: {
                        q: input,
                        units: 'metric',
                        appid: api_key,
                    },
                })
                .then((res) => {
                    console.log('res', res);
                    setWeather({ data: res.data, loading: false, error: false });
                })
                .catch((error) => {
                    setWeather({ ...weather, data: {}, error: true });
                    setInput('');
                    console.log('error', error);
                });
        }
    };
    return (
        <div className="App">
            <h1 className="app-name">
                GeeksforGeeks Weather App
            </h1>
            <div className="search-bar">
                <input
                    type="text"
                    className="city-search"
                    placeholder="Enter City Name.."
                    name="query"
                    value={input}
                    onChange={(event) => setInput(event.target.value)}
                    onKeyPress={search}
                />
            </div>
            {weather.loading && (
                <>
                    <br />
                    <br />
                    <Oval type="Oval" color="black" height={100} width={100} />
                </>
            )}
            {weather.error && (
                <>
                    <br />
                    <br />
                    <span className="error-message">
                        <FontAwesomeIcon icon={faFrown} />
                        <span style={{ fontSize: '20px' }}>City not found</span>
                    </span>
                </>
            )}
            {weather && weather.data && weather.data.main && (
                <div>
                    <div className="city-name">
                        <h2>
                            {weather.data.name}, <span>{weather.data.sys.country}</span>
                        </h2>
                    </div>
                    <div className="date">
                        <span>{toDateFunction()}</span>
                    </div>
                    <div className="icon-temp">
                        <img
                            className=""
                            src={`https://openweathermap.org/img/wn/$%7Bweather.data.weather%5B0%5D.icon%7D@2x.png%60%7D
                            alt={weather.data.weather[0].description}
                        />
                        {Math.round(weather.data.main.temp)}
                        <sup className="deg">°C</sup>
                    </div>
                    <div className="des-wind">
                        <p>{weather.data.weather[0].description.toUpperCase()}</p>
                        <p>Wind Speed: {weather.data.wind.speed}m/s</p>
                    </div>
                </div>
            )}
        </div>
    );
}
export default GfGWeatherApp;
Steps to run the application:
1. Execute the following command in the terminal.
npm run dev
2. Open the web browser and type the following URL in the address bar.
http://localhost:5173/
Output:
