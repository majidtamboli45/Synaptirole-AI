# How to create an Avatar generator app in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-an-avatar-generator-app-in-reactjs/

In this article, we are going to make a simple avatar generator app that generates random images. In this avatar generator, we have several buttons for different categories to choose from, the next button to generate random images, and a download button to finally download your favorite avatar.
Prerequisites: The pre-requisites for this project are:
- React
- Functional components
- React Hooks
- React Axios & API
- Javascript ES6
Basic setup: Start a project by the following command:
npx create-react-app avatarApp
Now, go to the project folder i.e avatarApp:
cd avatarApp
Now, go to the src folder and create a Components folder and a Styles folder. Under the Components folder, create a file 'Avatar.jsx' and under the Styles folder, create a file 'Avatar.css'
- Now, open the console and install the Axios npm package:
npm install axios
- index.js:
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
- App.js: App component renders a single Avatar component
import './App.css';
import Avatar from './Components/Avatar';
function App() {
  return (
    <div className="App">
      <Avatar />
    </div>
  );
}
export default App;
- App.css: This sets the background of our app to a nice CSS gradient
.App {
margin: 0;
padding: 0;
background-color: #b8c6db;
background-image: linear-gradient(315deg, #b8c6db 0%, #f5f7fa 74%);
}
- Avatar.jsx: This file contains all the logic. We will be using a free opensource API (no auth required) called 'DiceBear Avatars' to fetch random avatars based on several parameters.
import React, { useState } from 'react';
import '../Styles/Avatar.css';
import Axios from 'axios';
const Avatar = () => {
    // Setting up the initial states using react hook 'useState'
    const [sprite, setSprite] = useState("bottts");
    const [seed, setSeed] = useState(1000);
    
    // Function to set the current sprite type
    function handleSprite(spritetype) {
        setSprite(spritetype);
    }
    
    // Function to generate random seeds for the API
    function handleGenerate() {
        let x = Math.floor(Math.random() * 1000);
        setSeed(x);
    }
    
    // Function to download image and save it in our computer
    function downloadImage() {
        Axios({
            method: "get",
            url: `https://www.dicebear.com/api/$%7Bsprite%7D/$%7Bseed%7D.svg%60,
            responseType: "arraybuffer"
        })
        .then((response) => {
            var link = document.createElement("a");
            link.href = window.URL.createObjectURL(
                new Blob([response.data], 
                { type: "application/octet-stream" })
            );
            link.download = `${seed}.svg`;
            document.body.appendChild(link);
            link.click();
            setTimeout(function () {
                window.URL.revokeObjectURL(link);
            }, 200);
        })
        .catch((error) => { });
    }
    return (
        <div className="container">
            <div className="nav">
                <p>Random Avatar Generator</p>
            </div>
            <div className="home">
                <div className="btns">
                    <button onClick={() => { 
                        handleSprite("avataaars") }}>Human</button>
                    <button onClick={() => { 
                        handleSprite("human") }}>Pixel</button>
                    <button onClick={() => { 
                        handleSprite("bottts") }}>Bots</button>
                    <button onClick={() => { 
                        handleSprite("jdenticon") }}>Vector</button>
                    <button onClick={() => { 
                        handleSprite("identicon") }}>Identi</button>
                    <button onClick={() => { 
                        handleSprite("gridy") }}>Alien</button>
                    <button onClick={() => { 
                        handleSprite("micah") }}>Avatars</button>
                </div>
                <div className="avatar">
                    <img src=
{`https://www.dicebear.com/api/$%7Bsprite%7D/$%7Bseed%7D.svg%60%7D alt="Sprite" />
                </div>
                <div className="generate">
                    <button id="gen" onClick={() => { 
                        handleGenerate() }}>Next</button>
                    <button id="down" onClick={() => { 
                        downloadImage() }}>Download</button>
                </div>
            </div>
        </div>
    )
}
export default Avatar;
- Avatar.css: Use this file to decorate our app
@import url('https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;600;700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Zen+Tokyo+Zoo&display=swap');
.nav{
height: 6vh;
width: 100%;
background-color: #313442;
display: flex;
justify-content: center;
align-items: center;
color: white;
font-family: 'Zen Tokyo Zoo', cursive;
font-size: 35px;
}
.home{
box-sizing: border-box;
height: 94vh;
width: 100%;
gap: 15px;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
}
.avatar{
height: 50%;
width: 50%;
max-width: 400px;
max-height: 400px;
margin-top: 40px;
margin-bottom: 45px;
}
.btns{
display: flex;
flex-wrap: wrap;
align-items: center;
justify-content: center;
}
button{
width: 6em;
height: 2.5em;
margin: 10px;
font-size: 20px;
font-weight: 600;
font-family: 'Roboto Mono', monospace;
background-color: rgb(231, 231, 231);
box-shadow: 2px 3px 5px rgb(102, 101, 101);
border-radius: 15px;
border: none;
transition: 0.2s;
}
button:active{
box-shadow: none;
}
.btns > button:hover{
background-color: #ffffff;
}
#gen{
background-color: #4361ee;
color: white;
}
#down{
background-color: #EB3349;
color: white;
}
- Save all the files and start the server:
npm start
Open http://localhost:3000/ URL in the browser. It will display the result. Our app is now complete and it should be working now.
