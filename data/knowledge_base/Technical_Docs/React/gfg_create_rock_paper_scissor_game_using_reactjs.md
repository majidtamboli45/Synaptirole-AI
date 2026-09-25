# Create Rock Paper Scissor Game using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/create-rock-paper-scissor-game-using-reactjs/

In this article, we will create Rock, Paper, Scissors game using ReactJS. This project basically implements class components and manages the state accordingly. The player uses a particular option from Rock, Paper, or Scissors and then Computer chooses an option randomly. The logic of scoring and winning is implemented using JSX.
Let's have a look at what our final project will look like:
Technologies Used/Pre-requisites:
Approach:
- Initialize your React project using Create React App.
- Create a Game component to handle the game logic and UI.
- Use the component’s state to keep track of player and computer choices, scores, and game results.
- Define the possible choices (Rock, Paper, Scissors) and their winning conditions.
- Implement a function to compare the player's choice with the computer’s choice and determine the winner.
- Update scores based on the game outcome. Create buttons for each choice (Rock, Paper, Scissors).
- Handle button clicks to set the player’s choice and initiate the game logic. Use React's state to manage player and computer choices, and scores.
- Update the state based on the results of the game.
Project Structure:
Steps to create Rock Paper Scissor Game using ReactJS
1. Set up React project using the command
npm create vite@latest <<name_of_project>> --template react
2. Navigate to the project folder using
cd <<Name_of_project>>
3. Create a folder "components" and add two new files in it namely Game.js and Game.css.
4. Import the icon pack using the following command in the index.html file of the public folder.
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
Example: Write the following code in different files(The name of the files is mentioned in the first line of each code block)
- index.html: This is an automatically created file in the public folder we just have to import the icon pack in its <head> tag.
- App.js: This file imports the game components and exports it.
- Game.js: This file contains the logic for the game, scoring techniques, and random function with which the computer chooses a value
- Game.css: This file contains the design of the game elements.
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" 
          href=
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <meta charset="utf-8" />
    <link rel="icon" 
          href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" 
          content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Web site created using create-react-app"/>
    <link rel="apple-touch-icon" 
          href="%PUBLIC_URL%/logo192.png" />
    <link rel="manifest"
          href="%PUBLIC_URL%/manifest.json" />
    <title>React App</title>
  </head>
  <body>
    <noscript>
      You need to enable JavaScript to run this app.
    </noscript>
    <div id="root"></div>
  </body>
</html>
/* Apply base styles to html and body for full height and reset margin */
html,
body {
  height: 100%;
  margin: 0;
}
/* Main background styling for the body */
body {
  background: linear-gradient(135deg, #3a3a3a, #1e1e1e); /* Gradient background for the body */
  color: #fff; /* White text color */
  font-family: Arial, sans-serif; /* Font family */
  display: flex;
  justify-content: center;
  align-items: center;
}
/* Container to center the game content vertically and horizontally */
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100%;
  text-align: center; /* Center text alignment */
  background-color: #444; /* Darker background for the game container */
  border-radius: 10px; /* Rounded corners for the container */
  padding: 20px; /* Padding inside the container */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* Shadow for the container */
}
/* Header styling */
h1 {
  font-size: 2rem; /* Responsive font size */
  margin-bottom: 20px; /* Margin below the header */
  color: #4caf50; /* Green color */
  text-transform: uppercase; /* Uppercase text */
}
/* Styling for buttons */
button {
  margin: 0 10px; /* Margin around the button */
  padding: 10px 20px; /* Padding inside the button */
  font-size: 1rem; /* Font size for the button text */
  background-color: #4caf50; /* Green background */
  color: white; /* White text color */
  border: none; /* No border */
  border-radius: 4px; /* Rounded corners */
  cursor: pointer; /* Pointer cursor on hover */
  transition: background-color 0.3s ease; /* Smooth background color transition */
}
button:hover {
  background-color: #45a049; /* Darker green on hover */
}
/* Styling for content area */
.content {
  color: #fff; /* White text color */
  font-size: 1.125rem; /* Font size for content text */
  font-weight: bold; /* Bold text */
  text-shadow: 1px 1px 2px #000; /* Subtle text shadow for better readability */
  letter-spacing: 1px; /* Letter spacing for text */
}
/* Additional styling for choice buttons if needed */
.choice-button {
  margin: 10px;
  padding: 12px 24px;
  font-size: 1.125rem;
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}
.choice-button:hover {
  background-color: #45a049;
}
/* Styling for the result section */
.result {
  margin-top: 20px;
  font-size: 1.25rem; /* Font size for result text */
  font-weight: bold; /* Bold text */
  color: #ffeb3b; /* Bright yellow color for result */
}
// App.js
import { Component } from 'react';
import './App.css';
import Game from './components/Game';
class App extends Component{  
    render(){
      return (
      <Game/>
    );
  }
}
export default App;
// Game.js
import React, {Component} from "react";
import './Game.css';
class Game extends Component{
    constructor(props) {
        super(props)
        this.state = {
            playerVal : null,
            computerVal : null,
            playerScore: 0,
            compScore: 0,
        };
    }
    logic = (playerVal, computerVal)=>{
        if(playerVal == computerVal){
            return 0;
        } else if ((playerVal == "ROCK" && computerVal == "SCISSORS") ||
            (playerVal == "SCISSORS" && computerVal == "PAPER") ||
            (playerVal == "PAPER" && computerVal == "ROCK")
        ) {
            return 1;
        } else {
            return -1;
        }
    }
    decision = (playerChoice)=> {
        const choices = ["ROCK", "PAPER", "SCISSORS"];
        const compChoice =  choices[Math.floor(Math.random() * choices.length)];
        const val = this.logic(playerChoice, compChoice)
        if(val == 1) {
            console.log("Hello")
            this.setState({
                playerVal: playerChoice,
                computerVal : compChoice, 
                playerScore : this.state.playerScore +1
            })
        } else if(val == -1) {
            console.log("Hello")
            this.setState({
                playerVal: playerChoice,
                computerVal : compChoice,
                compScore : this.state.compScore +1
            })
        } else {
            console.log("Hello")
            this.setState({
                computerVal : compChoice,
                playerVal : playerChoice
            })
        }
    }
    render(){
        const {playerVal, computerVal, playerScore, compScore} = this.state;
        return(
            <div className="container">
                <h1>Welcome to Rock, Paper, Scissors Game</h1>
                <div >
                    <button onClick={()=>this.decision("ROCK")}>
                        <i className={`fas fa-hand-rock`} /> Rock
                    </button>
                    <button onClick={()=>this.decision("PAPER")}>
                        <i className={`fas fa-hand-paper`} /> Paper
                    </button>
                    <button onClick={()=>this.decision("SCISSORS")}>
                        <i className={`fas fa-hand-scissors`} />  Scissors 
                    </button>
                </div>
                <div className="content">
                    <p>Your choice: {playerVal}</p>
                    <p>Computer's choice: {computerVal}</p>
                    <h2>Your Score:{playerScore}</h2>
                    <h2>Computer Score: {compScore}</h2>
                </div>
            </div>
        )
    }
}
export default Game;
Steps to run the application:
1. Type the following command in terminal.
npm run dev
2. Open web-browser and type the following URL
http://localhost:5173/
Output:
