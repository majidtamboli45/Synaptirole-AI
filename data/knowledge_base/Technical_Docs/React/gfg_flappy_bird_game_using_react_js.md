# Flappy Bird Game Using React JS

> Source: https://www.geeksforgeeks.org/reactjs/flappy-bird-game-using-react-js/

The game Flappy Bird has gained popularity with millions of people, from, all over the world playing it. In this game, players take control of a bird that needs to navigate between pipes while flying. The bird cannot get crashed into the pipes or the ground. If the bird does, then the game is over. In this article we will learn how we can create it using ReactJS.
Preview of the project: Let us have a look at how the final output will look like.
Prerequisites
Approach:
- At the start of the game we set the position of the bird, create an array for pipes and establish the initial game state.
- During gameplay if the user inputs a command to make the bird jump and if the game is still ongoing we update its position accordingly.
- We also have collision detection in place which updates the score and checks for conditions that could lead to a game over.
- Gravity plays a role in determining how the birds position changes over time.
- To keep things interesting pipes are. Move from right to left on the screen.
- When the game is over we make sure to clear any intervals that were set up during gameplay to prevent any memory leaks.
- Finally, based on aspects of our game state such as whether its ongoing or over we render different components including displaying visuals, for birds and pipes as well as showing appropriate messages when its game over.
Steps to Create the Project
Step 1: Create a ReactJS project:
npm create vite@latest flappy-bird-game --template react
Step 2: Navigate to the project
cd flappy-bird-game
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"vite": "^4.0.0"
}
Images used:
Bird: https://media.geeksforgeeks.org/wp-content/uploads/20231211115925/flappy_bird_by_jubaaj_d93bpnj.gif
Pipes: https://media.geeksforgeeks.org/wp-content/uploads/20231211115753/6d2a698f31595a1.png
Example: Write the following code in respective files:
- App.js: This file imports all the components and contains the collision and scoring logic.
- Bird.js: This file is used to render bird image and set its position.
- Pipes.js: This file renders pipes on the screen.
- App.css: This file contains the styling of the application
/* src/App.css */
.App {
    position: relative;
    width: 600px;
    height: 600px;
    border: 1px solid #000;
    overflow: hidden;
    background-color: #87ceeb;
    /* Sky Blue */
    transition: background-color 0.5s ease;
}
.game-over {
    background-color: #ff6347;
    /* Tomato */
}
.game-over-message {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 24px;
    font-weight: bold;
    color: white;
}
.bird {
    position: absolute;
    width: 50px;
    height: 50px;
    user-select: none;
}
.pipe {
    position: absolute;
    width: 100px;
    height: 600px;
}
// App.js
import React, { useState, useEffect } from 'react';
import Bird from './components/Bird';
import Pipes from './components/Pipes';
import './App.css';
const App = () => {
	const [birdPosition, setBirdPosition] = useState({ x: 50, y: 200 });
	const [pipes, setPipes] = useState([]);
	const [gameOver, setGameOver] = useState(false);
	const [score, setScore] = useState(0);
	const [gameStarted, setGameStarted] = useState(false);
	const jump = () => {
		if (!gameOver && gameStarted) {
			setBirdPosition((prev) => ({ ...prev, y: prev.y - 60 }));
		} else if (!gameOver && !gameStarted) {
			// Start the game on the first jump
			setGameStarted(true);
		} else {
			// Restart the game
			setBirdPosition({ x: 50, y: 200 });
			setPipes([]);
			setGameOver(false);
			setGameStarted(true);
		}
	};
	const checkCollision = () => {
		const birdTop = birdPosition.y;
		const birdBottom = birdPosition.y + 50;
		const birdLeft = birdPosition.x;
		const birdRight = birdPosition.x + 50;
		pipes.forEach((pipe) => {
			const pipeTop = pipe.y;
			const pipeBottom = pipe.y + 600;
			const pipeLeft = pipe.x;
			const pipeRight = pipe.x + 100;
			const isColliding =
				birdRight > pipeLeft &&
				birdLeft < pipeRight &&
				birdBottom > pipeTop &&
				birdTop < pipeBottom;
			if (isColliding) {
				if (birdLeft > pipeLeft && birdRight < pipeRight && birdBottom < pipeBottom) {
					// Bird has crashed through the pipe, increase score
					setScore((prevScore) => prevScore + 1);
				} else {
					// Bird has hit the pipe, end the game
					setGameOver(true);
					setGameStarted(false);
				}
			}
		});
		// Check if bird is out of the screen vertically
		if (birdBottom > 800 || birdTop < -170) {
			// Bird is out of bounds, end the game
			setGameOver(true);
			setGameStarted(false);
		}
	};
	useEffect(() => {
		checkCollision();
	}, [birdPosition, pipes, gameOver]);
	useEffect(() => {
		const gravity = setInterval(() => {
			setBirdPosition((prev) => ({ ...prev, y: prev.y + 5 }));
			checkCollision();
		}, 30);
		const pipeGenerator = setInterval(() => {
			if (!gameOver && gameStarted) {
				setPipes((prev) => [
					...prev,
					{ x: 400, y: Math.floor(Math.random() * 300) },
				]);
			}
		}, 2000);
		const pipeMove = setInterval(() => {
			if (!gameOver && gameStarted) {
				setPipes((prev) =>
					prev.map((pipe) => ({ ...pipe, x: pipe.x - 5 }))
				);
			}
		}, 30);
		return () => {
			clearInterval(gravity);
			clearInterval(pipeGenerator);
			clearInterval(pipeMove);
		};
	}, [gameOver, gameStarted]);
	return (
		<div className={`App ${gameOver ? 'game-over' : ''}`} onClick={jump}>
			<Bird birdPosition={birdPosition} />
			{pipes.map((pipe, index) => (
				<Pipes key={index} pipePosition={pipe} />
			))}
			{gameOver && (
				<center>
					<div className="game-over-message">
						Game Over!
						<br />
						<p style={{ backgroundColor: 'blue', padding: "2px 6px", borderRadius: '5px' }}>Click anywhere to Restart</p>
					</div>
				</center>
			)}
		</div>
	);
};
export default App;
// Bird.js
import React from "react";
const Bird = ({ birdPosition }) => {
	return (
		<img
			src={"https://media.geeksforgeeks.org/wp-content/uploads/20231211115925/flappy_bird_by_jubaaj_d93bpnj.gif"}
			alt="bird"
			className="bird"
			style={{
				left: birdPosition.x,
				top: birdPosition.y,
			}}
			draggable={true}
		/>
	);
};
export default Bird;
// Pipes.js
import React from "react";
const Pipes = ({ pipePosition }) => {
	return (
		<img
			src={'https://media.geeksforgeeks.org/wp-content/uploads/20231211115753/6d2a698f31595a1.png'}
			alt="pipe"
			className="pipe"
			style={{
				left: pipePosition.x,
				top: pipePosition.y,
			}}
			draggable={true}
		/>
	);
};
export default Pipes;
Output:
