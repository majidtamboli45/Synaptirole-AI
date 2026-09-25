# Tenzies Game using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/tenzies-game-using-reactjs/

In this article, we are going to implement Tenzied Games using React JS. Tenzies is a fast-paced and fun game where players have to race to roll a specific combination with a set of ten dice. As we are building this game with ReactJS, we are using the functional components to build the application, and we have also used React Hooks to manage the application's behavior.
Preview of Final Output: Let us have a look at how the final output will look like.
Prerequisites
Approach
Tenzies Game in ReactJS is a fun game that is the same as Dice Game. This game consists of various dice represented in terms of numerical values. The game allows players to roll these ten dice, hold them to achieve the winning combination, and also track the number of rolls and time. React's state management and useEffect hook are used to make the application dynamic and more user-interactive. In the application, the user freezes the dice and performs the combination on other dice. When the combinations are matched, the game ends with the winning decoration using the CSS styles and properties. The application is completely dynamic and responsive in terms of behavior.
Steps to Create React Application and Install required modules:
Step 1: Set up the React project using the below command in VSCode IDE.
npm create vite@latest tenzies-game --template react
Step 2: Navigate to the newly created project folder by executing the below command.
cd tenzies-game
Step 3: After navigating we need to install all the required packages described in the package.json file. We can use the below command to install all the packages that are specified in the package.json file
npm install react-bootstrap @fortawesome/free-solid-svg-icons @fortawesome/react-fontawesome
Project Structure:
The updated dependencies in package.json will look like this:
 "dependencies": {
"@fortawesome/free-solid-svg-icons": "^6.4.2",
"@fortawesome/react-fontawesome": "^0.2.0",
"react": "^18.2.0",
"react-bootstrap": "^2.9.1",
"react-dom": "^18.2.0",
"vite": "^4.0.0"
},
"devDependencies": {
"vite": "^4.0.0"
}
Example: Implementation of the above approach in the following files.
- App.js : We called Game Component inside App.js
- GameComponent.js : It has the all functions to reset game, start game and all other required functions.
- HelpComponent.js : It displays all the rules of games.
- GameComponent.css: It has the styling of Game Component.
- HelpComponent.css : It has the styling for Help Component.
/*GameComponent.css*/
.tenzies-game {
    text-align: center;
    margin-top: 20px;
    font-family: "Arial", sans-serif;
    background-color: #ffebc0;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px
        rgba(0, 0, 0, 0.1);
}
.instructions-container {
    text-align: center;
    color: #555;
    margin-top: 10px;
}
.dice-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    max-width: 500px;
    margin: 0 auto;
}
.dice {
    width: 60px;
    height: 60px;
    background-color: #3498db;
    color: #fff;
    font-size: 28px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 10px;
    border-radius: 50%;
    cursor: pointer;
    transition: background-color 0.3s,
        transform 0.3s, box-shadow 0.3s;
    box-shadow: 0 0 5px
        rgba(0, 0, 0, 0.3);
}
.dice.frozen {
    background-color: #e74c3c;
    transform: scale(1.2);
    box-shadow: 0 0 10px
        rgba(231, 76, 60, 0.7);
}
button {
    background-color: #27ae60;
    color: #fff;
    border: none;
    padding: 12px 24px;
    margin: 20px 10px;
    font-size: 18px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s,
        transform 0.3s, box-shadow 0.3s;
}
button:hover {
    background-color: #219952;
    transform: scale(1.05);
    box-shadow: 0 0 10px
        rgba(0, 0, 0, 0.3);
}
.win-message {
    margin-top: 20px;
    font-size: 24px;
    color: #27ae60;
}
.tooltip-container {
    display: inline-block;
    position: relative;
}
.green-header {
    color: green;
}
.tooltip-text {
    display: none;
    position: absolute;
    background-color: #333;
    color: #fff;
    border-radius: 5px;
    padding: 10px;
    top: -60px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 1;
    white-space: nowrap;
    transition: opacity 0.3s;
    opacity: 0;
}
.tooltip-container:hover .tooltip-text {
    display: block;
    opacity: 1;
}
/*HelpComponent.css*/
.instructions-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 999;
    transition: opacity 0.3s ease-in-out;
}
.instructions-content {
    background: #fff;
    border-radius: 5px;
    padding: 20px;
    max-width: 80%;
    box-shadow: 0 0 10px
        rgba(0, 0, 0, 0.3);
    text-align: left;
}
.instructions-content h2 {
    font-size: 24px;
    margin-bottom: 10px;
}
.instructions-content ul {
    list-style: none;
    padding: 0;
}
.instructions-content ul li {
    margin-bottom: 10px;
}
.close-button {
    background: #ff5722;
    color: #fff;
    border: none;
    border-radius: 3px;
    padding: 8px 16px;
    cursor: pointer;
    transition: background-color 0.2s;
}
.close-button:hover {
    background: #e64900;
}
//App.js
import React from 'react';
import GameComponent from './GameComponent';
function App() {
	return (
		<div className="App">
			<GameComponent />
		</div>);
}
export default App;
// GameComponent.js
import React, { useState, useEffect } from 'react';
import './GameComponent.css';
import { Button, Card, Col, Container } from 'react-bootstrap';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faDice, faRedo, faPlay, faCheckCircle, faClock, faSync } 
	from '@fortawesome/free-solid-svg-icons';
import HelpComponent from './HelpComponent';
const GameComponent = () => {
	const [dice, set_Dice] = useState(Array(10).fill(1));
	const [roll, set_Rolls] = useState(0);
	const [gamewin, set_game_win] = useState(false);
	const [dfreeze, set_d_freeze] = useState(Array(10).fill(false));
	const [time, set_Time] = useState(0);
	const [timerun, set_Time_Run] = useState(false);
	const [gamestart, set_game_start] = useState(false);
	const [showhelp, set_show_help] = useState(false);
	const [playAgain, set_play_again] = useState(false);
	const rolldFunction = () => {
		if (gamestart && !gamewin && timerun) {
			const newd = dice.map((value, index) => {
				if (!dfreeze[index]) {
					return Math.floor(Math.random() * 6) + 1;
				}
				return value;
			});
			set_Dice(newd);
			set_Rolls(roll + 1);
		} 
		else {
			alert('Please start the game first!');
		}
	};
	const gamePlayFuntion = () => {
		if (playAgain) {
			newresetFuntion();
			set_play_again(false);
			set_game_start(true);
			set_Time_Run(true);
		} 
		else if (!gamestart) {
			newresetFuntion();
			set_game_start(true);
			set_Time_Run(true);
		}
	};
	const newresetFuntion = () => {
		const initialDice = Array(10).fill(1).map(() => Math.floor(Math.random() * 6) + 1);
		set_Dice(initialDice);
		set_Rolls(0);
		set_game_win(false);
		set_d_freeze(Array(10).fill(false));
		set_Time(0);
		set_Time_Run(false);
	};
	const dFreezeFunction = (index) => {
		if (!gamewin && gamestart) {
			const newFrozen = [...dfreeze];
			newFrozen[index] = !newFrozen[index];
			set_d_freeze(newFrozen);
		}
	};
	
	useEffect(() => {
		if (timerun && time < 60) {
			const timerInterval = setInterval(() => {
				if (timerun) {
					set_Time(time + 1);
				} else {
					clearInterval(timerInterval);
				}
			}, 1000);
			return () => {
				clearInterval(timerInterval);
			};
		}
	}, [timerun, time]);
	// Enable Play Again button
	useEffect(() => {
		if (dice.every((value) => value === dice[0]) && gamestart) {
			set_game_win(true);
			set_Time_Run(false);
			set_play_again(true); 
		}
	}, [dice, gamestart]);
	return (
		<Container>
			<Card className="tenzies-game">
				<Card.Header as="h1" className="green-header">
					GeeksforGeeks Tenzies Game
				</Card.Header>
				<Card.Body>
					<div
						className="instructions-container"
						style={{ display: 'flex', 
								justifyContent: 'center', 
								alignItems: 'center' }}>
						<Button variant="info"
								onClick={() => set_show_help(true)}
								size="lg">
							<FontAwesomeIcon icon={faPlay} /> 
							Show Instructions
						</Button>
					</div>
					<div className="dice-container">
						{dice.map((value, index) => (
							<div key={index}
								className={`dice ${dfreeze[index] ? 'frozen' : ''}`}
								onClick={() => dFreezeFunction(index)}>
								{value}
							</div>
						))}
					</div>
					<Button variant="success"
							onClick={rolldFunction}
							disabled={gamewin || !timerun}
							size="lg"
							block>
						<FontAwesomeIcon icon={faDice} /> 
						Roll Dice
					</Button>
					<p className="status">
						<FontAwesomeIcon icon={faSync} /> 
						Rolls: {roll}
					</p>
					<p className="status">
						<FontAwesomeIcon icon={faClock} /> 
						Time Elapsed: {time} seconds
					</p>
					<div className="buttons">
						<Button variant="primary"
								onClick={gamePlayFuntion}
								size="lg"
								block>
							{playAgain ? ( 
								
							// Display Play Again button when user wins
								<span>
									<FontAwesomeIcon icon={faPlay} /> Play Again
								</span>
							) : (
								<span>
									<FontAwesomeIcon icon={faPlay} /> Start Game
								</span>
							)}
						</Button>
					</div>
					{gamewin && (
						<div className="win-message">
							<p>
								You've won! Congratulations!{' '}
								<FontAwesomeIcon icon={faCheckCircle} />
							</p>
						</div>
					)}
				</Card.Body>
			</Card>
			<HelpComponent show={showhelp} handleClose={() => set_show_help(false)} />
		</Container>
	);
};
export default GameComponent;
// HelpComponent.js
import React from 'react';
import './HelpComponent.css';
const HelpComponent = ({ show, handleClose }) => {
	return (
		show && (
			<div className="instructions-overlay">
				<div className="instructions-content">
					<h2>Instructions</h2>
					<ul>
						<li>Step 1: Click on a dice to freeze or unfreeze it.</li>
						<li>Step 2: Click "Start Game" to begin.</li>
						<li>Step 3: Roll the dice to match a winning combination.</li>
						<li>Step 4: The timer will start when the game begins.</li>
						<li>Step 5: Win the game by matching all dice to the same number.</li>
					</ul>
					<button className="close-button" onClick={handleClose}>
						Close
					</button>
				</div>
			</div>
		)
	);
};
export default HelpComponent;
Steps to run the application
Step 1: Run the application by executing the following command in the terminal.
npm run dev Step 2: Open a web browser like Chrome or Firefox and type the following URL in the address bar.
http://localhost:5173/
