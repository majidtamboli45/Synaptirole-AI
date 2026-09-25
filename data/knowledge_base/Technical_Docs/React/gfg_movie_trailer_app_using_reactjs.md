# Movie Trailer app using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/movie-trailer-app-using-reactjs/

In this article, we are going to make a simple app that searches for any movie/web series trailers. The users can search for their favourite movie trailers using this application. The API will fetch the trailer from the internet and display it on the webpage. We will use 'movie-trailer' npm package to find such URLs and display the content using another npm package called 'react-player'.
Let us have a look at how the final application will look like:
Prerequisites: The pre-requisites for this project are:
Approach: Our app contains two sections i.e a section for taking the user input and the other for displaying the video. Whenever a user searches for a video, we will store that inside a state variable and whenever a user clicks on the search button we will call a function that will fetch the required video URL and store it in another state variable. Now we have the required URL, we will simply render that video using the 'ReactPlayer' component.
Creating React app and installing module:
- Step 1: Create a react application by typing the following command in the terminal:
npm create vite@latest movie-app --template react
- Step 2: Now, go to the project folder i.e movie-app by running the following command:
cd movie-app
- Step 3: Let's install some npm packages required for this project:
movie-trailer and react-player:
npm install movie-trailer
npm install react-player
Project Structure: It should look like this:
The updated dependencies in package.json will look like:
"dependencies": {
"movie-trailer": "^3.0.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-player": "^2.12.0",
"vite": "^4.0.0",
"web-vitals": "^2.1.4"
}
Example code: Write the following code in respective files.
- App.js file: This file contains our app logic:
- App.css file:This file contains all the required styling for that app:
/* App.css */
.App {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    height: 100vh;
    width: 100%;
    font-size: 22px;
}
.search-box {
    height: 10vh;
}
.search-box>input,
button {
    box-sizing: border-box;
    height: 25px;
    font-size: 20px;
}
// App..js
import './App.css';
import { useState } from 'react';
import ReactPlayer from 'react-player';
import movieTrailer from 'movie-trailer';
function App() {
    //Setting up the initial states using
    // react hook 'useState"
    const [video, setVideo] = useState("inception");
    const [videoURL, setVideoURL] =
        useState("https://www.youtube.com/watch?v=sa9l-dTv9Gk&feature=youtu.be");
    //A function to fetch the required URL
    // and storing it inside the
    // videoURL state variable
    function handleSearch() {
        movieTrailer(video).then((res) => {
            setVideoURL(res);
        });
    }
    return (
        <div className="App">
            <div className="search-box">
                <label>
                    Search for any movies/shows:{" "}
                </label>
                <input type="text" onChange=
                    {(e) => { setVideo(e.target.value) }} />
                <button onClick={() => { handleSearch() }}>
                    Search
                </button>
            </div>
      // Using 'ReactPlayer' component to
            // display the video
            <ReactPlayer url={videoURL} controls={true} />
        </div>
    );
}
export default App;
Step to run application: Type the following command in the terminal:
npm run dev
Output: Now Open http://localhost:5173/ in your browser to see our working app.
