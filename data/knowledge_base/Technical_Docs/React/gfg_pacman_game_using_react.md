# PacMan game using React

> Source: https://www.geeksforgeeks.org/reactjs/pacman-game-using-react/

Let's make a Pacman game using React for a fun and nostalgic web experience. We'll include classic features like the maze, pellets, and ghosts, and learn some cool React stuff along the way. The game will be easy to play with arrow keys, and we'll add extras like keeping score and power pellets. It's like bringing the old Pacman joy into today's browsers with a modern twist! Just click "Start" and enjoy.
Preview of final output: Let us have a look at how the final output will look like.
Prerequisites:
Approach to create PacMan Game:
- Create a 2D maze with React components and a CSS grid layout.
- Use animation elements of the Pacman and different types of ghosts with their own dynamic motion patterns.
- To drive Pacman through a maze and out of bad ghosts, you need keyboard controls.
- Track dot collection, updating the score with each chomp and displaying it on the screen.
- Design algorithms for ghost movement, level progression, and game-over conditions.
- Enhance game play with classic audio effects for munching and ghostly encounters
Steps to Create the Game application:
- You need to install the React and any other libraries that are required. You can organize your project files by component, asset, and style directories.
- To create a familiar maze structure, create a React component for the maze grid using CSS or other layout techniques.
- Create separate components for Pac ReactMan and each type of ghost. To make them come alive, use animation libraries or CSS animations.
- To capture keyboard inputs and update PacMan's position according to the chosen direction, use event listeners.
- In order to prevent him from crossing the walls, think about introducing an obstacle detection system. The rest of the dots will be tracked, their score updated with every chomp and displayed on the screen.
- Develop algorithms for the movement pattern of all ghosts to ensure that they are following Pacman and avoiding collisions. In order to address this additional challenge, the level progression and gameover conditions shall be implemented.
- Add sound effects to doteating, ghost encounters, and game events. In order to increase the experience, add visuals and animations of PacMan and ghosts.
- In order to assure a smooth game play and uninterrupted operation, check thoroughly for bugs in your game. Consider creating a game on the internet, sharing your creation with the world!
Project Structure:
Steps to Create a React Project:
Step 1: Create your react project and navigate to your project folder ( commands in your terminal)
npm create vite@latest Pacman-game --template react
cd Pacman-game
Step 2: Create the 'components' folder to create the file 'Maze.js', 'Ghost.js', 'Pacman.js', 'GameLogic.js'.
Step 3: Images that are used in the application. Download it from google drive link (https://drive.google.com/drive/folders/1HDKSE-ypleoTSHXTr4LwM2r7cbfdRlTR?usp=sharing). Save all the images in the 'images' folder as mentioned in project structure.
Example:
- The project folder includes components, styles, assets and helpful functions, for your React application.
- App.js is the React component for managing the overall interface of the game.
- The Maze.js program takes care of creating and displaying the grid and dots for the maze.
- Pacman.js handles Pac Mans movement, animation and collision detection.
- Ghost.js serves as a foundation component with its AI logic that allows for different types of ghosts to be created.
- GameLogic.js manages the games state, including keeping track of scores advancing levels and determining game over conditions.
- App.css defines the styles for all elements in the game such, as the maze, Pac Man, ghosts and text elements.
/* Write CSS Here */
* {
    color: white;
}
.wall {
    width: 50px;
    height: 50px;
    background-color: #5e318c;
    display: inline-block;
}
.coin {
    width: 50px;
    height: 50px;
    display: inline-block;
}
.ground {
    width: 50px;
    height: 50px;
    display: inline-block;
}
.ghost {
    width: 50px;
    height: 50px;
    display: inline-block;
}
.pacman {
    width: 50px;
    height: 50px;
    display: inline-block;
}
div {
    line-height: 0px;
}
import React, { useState, useEffect } from "react";
import wall from "./assets/wall.png";
import coin from "./assets/coin.png";
import pacmann from "./assets/pacman.png";
import bg from "./assets/bg.png";
import ghost from "./assets/ghost2.png";
import "./App.css"; // Import your CSS file
const PacManGame = () => {
    // State for PacMan position and game map
    const [pacman, setPacman] = useState({ x: 6, y: 4 });
    const [map, setMap] = useState([
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
        [1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1],
        [1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1],
        [1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1],
        [1, 2, 2, 2, 1, 1, 5, 1, 1, 2, 2, 2, 1],
        [1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1],
        [1, 2, 1, 1, 2, 2, 1, 2, 2, 1, 1, 2, 1],
        [1, 2, 2, 2, 2, 2, 1, 4, 2, 2, 2, 2, 1],
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    ]);
    const [gameOver, setGameOver] = useState(false);
    // Function to handle PacMan movement
    const handleKeyDown = (event) => {
    if (gameOver) return;
    let newX = pacman.x;
    let newY = pacman.y;
    // Directional movement
    if (event.keyCode === 37 && pacman.x > 0 && map[pacman.y][pacman.x - 1] !== 1) { // Left
        newX -= 1;
    } else if (event.keyCode === 38 && pacman.y > 0 && map[pacman.y - 1][pacman.x] !== 1) { // Up
        newY -= 1;
    } else if (event.keyCode === 39 && pacman.x < map[0].length - 1 && map[pacman.y][pacman.x + 1] !== 1) { // Right
        newX += 1;
    } else if (event.keyCode === 40 && pacman.y < map.length - 1 && map[pacman.y + 1][pacman.x] !== 1) { // Down
        newY += 1;
    } else {
        return; // Invalid move
    }
    // Create a new map with updated position
    const newMap = map.map(row => [...row]); // Deep clone
    newMap[pacman.y][pacman.x] = 3;  // Mark old position as ground
    newMap[newY][newX] = 5;          // Mark new position as Pacman
    // Update state and check for winning condition
    setPacman({ x: newX, y: newY });
    setMap(newMap);
    checkWinningCondition(newMap);
};
    // Function to check for winning condition and collision detection
    const checkWinningCondition = () => {
        if (!map.some((row) => row.includes(2))) {
            setGameOver(true);
            alert("Congratulations! You collected all the coins. You win!");
            // Additional logic for restarting the game or other actions
        } else if (!map.some((row) => row.includes(4))) {
            setGameOver(true);
            alert("Game over !! You collided with the ghost");
            // Additional logic for restarting the game or other actions
        }
    };
    // Initial rendering
    useEffect(() => {
        const handleKeyDownEvent = 
            (event) => handleKeyDown(event);
        document.addEventListener("keydown", handleKeyDownEvent);
        // Cleanup event listener on component unmount
        return () => {
            document.removeEventListener("keydown", handleKeyDownEvent);
        };
    }, [handleKeyDown]);
    return (
        <div id="world" style={{ backgroundColor: "white" }}>
            {/* Render the game map */}
            {map.map((row, rowIndex) => (
                <div key={rowIndex}>
                    {row.map((cell, colIndex) => (
                        <div
                            key={colIndex}
                            className={
                                cell === 1
                                ? "wall"
                                : cell === 2
                                ? "coin"
                                : cell === 3
                                ? "ground"
                                : cell === 4
                                ? "ghost"
                                : cell === 5
                                ? "pacman"
                                : null
                            }
                            style={
                                cell === 1
                                    ? { backgroundImage: `url(${wall})` }
                                    : cell === 2
                                    ? { backgroundImage: `url(${coin})` }
                                    : cell === 3
                                    ? { backgroundImage: `url(${bg})` }
                                    : cell === 4
                                    ? { backgroundImage: `url(${ghost})` }
                                    : cell === 5
                                    ? { backgroundImage: `url(${pacmann})` }
                                    : null
                            }
                        ></div>
                    ))}
                </div>
            ))}
        </div>
    );
};
export default PacManGame;
Steps to the application:
Step 1: Type the following command in terminal.
npm run dev
Step 2: Open your default web-browser and type the following URL.
http://localhost:5173/
Output:
