# Build a simple Song Lyrics Finder app using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/build-a-simple-song-lyrics-finder-app-using-reactjs/

React is a super-awesome front-end library that we can use to build user interfaces. In this article, we will be building a simple application to find the lyrics of any song. This is a perfect project for beginners as it will teach you how to fetch information using an API and display that information accordingly.
Prerequisites: The pre-requisites for this project are:
Since we are building a lyrics finder app, we need two pieces of information that is the song's name and the artist's name. For this, in the UI we will have two user input sections. After getting those inputs we will then call an API to get the desired song lyrics and display them accordingly.
Creating a React application and installing some npm packages:
Step 1: Create a react application by typing the following command in the terminal:
npm create vite@latest lyrics-finder --template react
Step 2: Now, go to the project folder i.e lyrics-finder by running the following command:
cd lyrics-finder
Step 3: Let’s install some npm packages required for this project:
npm install axios
Project Structure: It will look like this
Example: Let's build the application.
- App.js: This is the only component that will contain the entire app logic. We will use a React hook named useState to manage states in the functional component. First, we declare two state variables to store the song's and the artist's name. Next, we will create a function named 'searchLyrics'. Whenever the user clicks on the search button, it will trigger the 'searchLyrics' function which will call an API with the required parameters and store the result in another state variable named 'lyrics'. We will be using an open-source API to get the song lyrics.
import './App.css';
import Axios from 'axios';
import { useState } from 'react';
function App() {
    const [artist, setArtist] = useState("");
    const [song, setSong] = useState("");
    const [lyrics, setLyrics] = useState("");
    function searchLyrics() {
        if (artist === "" || song === "") {
            return;
        }
        Axios.get(
`https://api.lyrics.ovh/v1/${artist}/${song}`).then(res => {
            console.log(res.data.lyrics);
            setLyrics(res.data.lyrics);
        })
    }
    return (
        <div className="App">
            <h1>Lyrics Finder ????</h1>
            <input className="inp" type="text" 
                placeholder='Artist name'
                onChange={(e) => { setArtist(e.target.value) }} />
            <input className="inp" type="text" 
                placeholder='Song name'
                onChange={(e) => { setSong(e.target.value) }} />
            <button className="btn" 
                onClick={() => searchLyrics()}>
                    ???? Search</button>
            <hr />
            <pre>{lyrics}</pre>
        </div>
    );
}
export default App;
- App.css: Now let’s edit the file named App.css to style our app.
@import url("https://fonts.googleapis.com/css2?family=Fredoka+One&family=Montserrat&display=swap");
.App {
    min-height: 100vh;
    height: auto;
    text-align: center;
    font-family: "Montserrat", sans-serif;
}
h1 {
    font-family: "Fredoka One", cursive;
    color: #ff7a8a;
}
pre {
    font-size: 24px;
    color: #113a5d;
}
hr {
    margin-top: 20px;
    width: 60%;
}
.inp {
    width: 200px;
    height: 40px;
    border: 2px solid #113a5d;
    margin: 0px 10px;
    padding-left: 6px;
    font-size: 22px;
}
.btn {
    width: 90px;
    height: 40px;
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm run dev
Output:
