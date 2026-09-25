# IP address finder app using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/ip-address-finder-app-using-reactjs/

In this article, we will be building an IP address finder app that lets you find your client's approximate location on a map. An IP address is a unique address that identifies a device on the internet or a local network. IP stands for "Internet Protocol," which is the set of rules governing the format of data sent via the internet or local network. Through this article, we will learn how to get the user's IP address as well as display his/her approximate location on a map.
Lets take a look at how the final application will look like:
Prerequisites: The pre-requisites for this project are:
Creating a React application and Module installation:
Step 1: Create a react application by typing the following command in the terminal:
npm create vite@latest ip-finder --template react
Step 2: Now, go to the project folder i.e ip-finder by running the following command:
cd ip-finder
Step 3: Install some npm packages required for this project using the following command:
npm install axios 
npm install react-map-gl
npm install react-icons
Project Structure: It will look like this:
Example: Let us grab the Mapbox API key required for this project. Follow the simple steps below:
- Go to the website: https://www.mapbox.com/ and create a free account.
- Go to your account dashboard and at the bottom of the page you will find a section named "Access tokens".
Copy the default public access token and save it somewhere to use it later.
Example:
- App.js: In this file, we will fetch the user's IP address using a free open-source API named https://ipapi.co/ (free plan: 1000 requests/day).
- Map.js: Now write down the following code in the Map.js component.
Note: Replace <YOUR_API_KEY> with your own Mapbox public access token.
- App.css: This file contains the styling of the webpages.
/* App.js */
@import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');
.App {
    height: 70vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
.left {
    box-sizing: border-box;
    padding-left: 80px;
    width: 40%;
}
.map {
    width: 550px;
    height: 350px;
    border: 4px solid #1453dc;
}
.mark {
    padding: 40px;
    border-radius: 50%;
    background-color: #d2d8fabe
}
.heading {
    font-size: 60px;
    text-align: center;
    text-decoration: underline;
    font-family: 'Pacifico', cursive;
    color: #1453dc;
}
p {
    font-size: 20px;
    color: #1453dcaf;
}
#ip {
    color: #1453dc;
}
// App.js
import { useEffect, useState } from 'react';
import Axios from 'axios';
import Map from './components/Map';
import './App.css';
function App() {
    // Setting up the initial state variables
    const [ipDetails, setIpDetails] = useState([]);
    const [lat, setLat] = useState(22.5726);
    const [lon, setLon] = useState(88.3832);
    // Fetching the API once when the
    // component is mounted
    useEffect(() => {
        Axios.get('https://ipapi.co/json/').then((res) => {
            setIpDetails(res.data);
            setLat(res.data.latitude);
            setLon(res.data.longitude);
        });
    }, [])
    return (
        <>
            <h1 className="heading">IP Address Finder</h1>
            <div className="App">
                <div className="left">
                    <h4>What is my IPv4 address?</h4>
                    <h1 id="ip">{ipDetails.ip}</h1>
                    <h4>Approximate location: </h4>
                    <p>{ipDetails.city}, {ipDetails.region},
                        {ipDetails.country_name}.</p>
                    <h4>Internet Service Provider(ISP):</h4>
                    <p>{ipDetails.org}</p>
                </div>
                <Map lat={lat} lon={lon} />
            </div>
        </>
    );
}
export default App;
// Map.js
import React, { useEffect, useState } from 'react';
import ReactMapGL, { Marker } from 'react-map-gl';
import { RiUserLocationFill } from 'react-icons/ri';
const API_KEY = '<YOUR_API_KEY>';
const Map = ({ lat, lon }) => {
    // Setting up the initial viewport of the map
    const [viewport, setViewport] = useState({
        latitude: lat,
        longitude: lon,
        zoom: 14,
        bearing: 0,
        pitch: 0,
        width: '100%',
        height: '100%',
    });
    // Viewport re-renders whenever latitude
    // and longitude changes
    useEffect(() => {
        const a = { ...viewport };
        a.latitude = lat;
        a.longitude = lon;
        setViewport(a);
    }, [lat, lon]);
    return (
        <div className="map">
            <ReactMapGL
                mapboxApiAccessToken={API_KEY}
                {...viewport}
                onViewportChange={(viewport) => setViewport(viewport)}
                mapStyle="mapbox://styles/mapbox/streets-v11">
                <Marker latitude={lat} longitude={lon}>
                    <div className="mark">
                        <RiUserLocationFill size="25px" color="blue" />
                    </div>
                </Marker>
            </ReactMapGL>
        </div>
    );
};
export default Map;
Step to Run Application: Run the application using the following command from the root directory of the project.
npm run dev
Output: Now open your browser and go to http://localhost:5173/, you will see the following output:
