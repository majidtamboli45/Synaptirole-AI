# How to Create a Dictionary App in ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-a-dictionary-app-in-reactjs/

In this article, we will be building a very simple Dictionary app with the help of an API. This is a perfect project for beginners as it will teach you how to fetch information from an API and display it and some basics of how React actually works. Also, we will learn about how to use React icons. Let's begin.
Approach: Our app contains two sections, one for taking the user input and the other is for displaying the data. Whenever a user searches for a word, we store that input in a state and trigger an API call based on the searched keyword parameter. After that when the API call is made, we simply store that API response in another state variable, and then we finally display the information accordingly.
Prerequisites:
The pre-requisites for this project are:
Creating a React application and installing some npm packages:
Step 1: Create a react application by typing the following command in the terminal:
npm create vite@latest dictionary-app --template react
Step 2: Now, go to the project folder i.e dictionary-app by running the following command:
cd dictionary-app
Step 3: Let's install some npm packages required for this project:
npm install axiosnpm install react-icons
Project Structure: It should look like this:
Example: It is the only component of our app that contains all the logic. We will be using a free opensource API (no auth required) called 'Free Dictionary API' to fetch all the required data. Our app contains two sections i.e a section for taking the user input and a search button, the other is for displaying the data. Apart from displaying the information that we received, we will also have a speaker button that lets users listen to the phonetics.
Now write down the following code in the App.js file. Here, the App is our default component where we have written our code. Here, the filename is App.js and App.css
@import url(
'https://fonts.googleapis.com/css2?family=Pacifico&display=swap');
@import url(
'https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,600;0,800;1,300&display=swap');
.App {
  height: 100vh;
  width: 100vw;
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: #f6f6f6;
  background-image: linear-gradient(315deg, #f6f6f6 0%, #e9e9e9 74%);
  font-family:'Poppins', sans-serif;
}
h1 {
  text-align: center;
  font-size: 3em;
  font-family: 'Pacifico', cursive;
  color: #4DB33D;
  padding: 1.5em;
}
h2{
  font-size: 30px;
  text-decoration: underline;
  padding-bottom: 20px;
}
h4{
  color: #4DB33D;
}
input{
  width: 400px;
  height: 38px;
  font-size: 20px;
  padding-left: 10px;
}
.searchBox > button{
  background-color: #4DB33D;
  height: 38px;
  width: 60px;
  border: none;
  color: white;
  box-shadow: 0px 3px 2px #439e34;
  cursor: pointer;
  padding: 0;
}
.showResults{
  width: 500px;
  padding: 20px;
}
.showResults > h2 > button{
  background: none;
  border: none;
  cursor: pointer;
}
import { React, useState } from "react";
import Axios from "axios";
import "./App.css";
import { FaSearch } from "react-icons/fa";
import { FcSpeaker } from "react-icons/fc";
function App() {
  // Setting up the initial states using react hook 'useState'
  const [data, setData] = useState("");
  const [searchWord, setSearchWord] = useState("");
  // Function to fetch information on button 
  // click, and set the data accordingly
  function getMeaning() {
    Axios.get(
      `https://api.dictionaryapi.dev/api/v2/entries/en_US/$%7BsearchWord%7D%60
    ).then((response) => {
      setData(response.data[0]);
    });
  }
  // Function to play and listen the 
  // phonetics of the searched word
  function playAudio() {
    let audio = new Audio(data.phonetics[0].audio);
    audio.play();
  }
  return (
    <div className="App">
      <h1>Free Dictionary</h1>
      <div className="searchBox">
        // Taking user input
        <input
          type="text"
          placeholder="Search..."
          onChange={(e) => {
            setSearchWord(e.target.value);
          }}
        />
        <button
          onClick={() => {
            getMeaning();
          }}
        >
          <FaSearch size="20px" />
        </button>
      </div>
      {data && (
        <div className="showResults">
          <h2>
            {data.word}{" "}
            <button
              onClick={() => {
                playAudio();
              }}
            >
              <FcSpeaker size="26px" />
            </button>
          </h2>
          <h4>Parts of speech:</h4>
          
<p>{data.meanings[0].partOfSpeech}</p>
          <h4>Definition:</h4>
          
<p>{data.meanings[0].definitions[0].definition}</p>
          <h4>Example:</h4>
          
<p>{data.meanings[0].definitions[0].example}</p>
        </div>
      )}
    </div>
  );
}
export default App;
 
Step to Run Application: Run the application using the following command from the root directory of the project:
npm run dev
Output: Now open your browser and go to http://localhost:5173/, you will see the following output:
