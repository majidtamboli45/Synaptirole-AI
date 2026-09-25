# Paint App using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/paint-app-using-reactjs/

In this article, we will be building a simple paint application that lets you draw just like in MS-Paint. Through this article, we will learn how to implement and work with canvas in React.js. Our app contains two sections, one for drawing and the other is a menu where the user can customize the brush color, width, and opacity. The user will be provided with a brush and draw on the canvas using that brush.
Let us have a look at how the final project will look like:
Prerequisites: The pre-requisites for this project are:
Approach:
We will create three functions: startDrawing(), endDrawing() and draw(). The main idea is that whenever the mouse button is down, we execute the startDrawing function so that the cursor knows the x and y coordinate (starting coordinates) and we toggle the isDrawing state to true. Now whenever the user moves the mouse, we execute the draw function which will draw a stroke in the current x and y coordinate. If the user lifts the mouse button up we execute the endDrawing function which will close the stroke path and toggle the isDrawing state to false simultaneously.
Creating a React application:
- Step 1: Create a react application by typing the following command in the terminal:
npm create vite@latest paint-app --template react
- Step 2: Now, go to the project folder i.e paint-app by running the following command:
cd paint-app
npm install
Step 3: Create a folder called components in src directory and inside the components folder, create a file named Menu.js
Project Structure:
The dependencies in the package.json file will look like:
"dependencies": {
"@vitejs/plugin-react": "^2.3.1",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"vite": "^4.2.0"
}
Example: Write the following code in respective files.
- App.js: In this file we will implement the canvas and work with it. Now write down the following code in the App.js component.
- Menu.js: In this file we will creat a menu bar where users can customize the brush color, size, and opacity.
- App.css: In this file we will style our paint component.
/* App.css */
@import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
.App {
    width: 100%;
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
}
h1 {
    font-family: 'Lobster', cursive;
    font-size: 50px;
    color: #4644f0;
}
.draw-area {
    width: 1280px;
    height: 720px;
    border: 2px solid #808080;
    position: relative;
    background-color: white;
}
.Menu {
    width: 650px;
    height: 50px;
    display: flex;
    justify-content: space-evenly;
    border-radius: 5px;
    align-items: center;
    background-color: #a3a3a32d;
    margin: auto;
    margin-top: 10px;
}
// App.js
import { useEffect, useRef, useState } from "react";
import Menu from "./components/Menu";
import "./App.css";
function App() {
    const canvasRef = useRef(null);
    const ctxRef = useRef(null);
    const [isDrawing, setIsDrawing] = useState(false);
    const [lineWidth, setLineWidth] = useState(5);
    const [lineColor, setLineColor] = useState("black");
    const [lineOpacity, setLineOpacity] = useState(0.1);
    // Initialization when the component
    // mounts for the first time
    useEffect(() => {
        const canvas = canvasRef.current;
        const ctx = canvas.getContext("2d");
        ctx.lineCap = "round";
        ctx.lineJoin = "round";
        ctx.globalAlpha = lineOpacity;
        ctx.strokeStyle = lineColor;
        ctx.lineWidth = lineWidth;
        ctxRef.current = ctx;
    }, [lineColor, lineOpacity, lineWidth]);
    // Function for starting the drawing
    const startDrawing = (e) => {
        ctxRef.current.beginPath();
        ctxRef.current.moveTo(
            e.nativeEvent.offsetX,
            e.nativeEvent.offsetY
        );
        setIsDrawing(true);
    };
    // Function for ending the drawing
    const endDrawing = () => {
        ctxRef.current.closePath();
        setIsDrawing(false);
    };
    const draw = (e) => {
        if (!isDrawing) {
            return;
        }
        ctxRef.current.lineTo(
            e.nativeEvent.offsetX,
            e.nativeEvent.offsetY
        );
        ctxRef.current.stroke();
    };
    return (
        <div className="App">
            <h1>Paint App</h1>
            <div className="draw-area">
                <Menu
                    setLineColor={setLineColor}
                    setLineWidth={setLineWidth}
                    setLineOpacity={setLineOpacity}
                />
                <canvas
                    onMouseDown={startDrawing}
                    onMouseUp={endDrawing}
                    onMouseMove={draw}
                    ref={canvasRef}
                    width={`1280px`}
                    height={`720px`}
                />
            </div>
        </div>
    );
}
export default App;
// Menu.js
import React from "react";
import "../App.css";
const Menu = ({ setLineColor, setLineWidth,
    setLineOpacity }) => {
    return (
        <div className="Menu">
            <label>Brush Color </label>
            <input
                type="color"
                onChange={(e) => {
                    setLineColor(e.target.value);
                }}
            />
            <label>Brush Width </label>
            <input
                type="range"
                min="3"
                max="20"
                onChange={(e) => {
                    setLineWidth(e.target.value);
                }}
            />
            <label>Brush Opacity</label>
            <input
                type="range"
                min="1"
                max="100"
                onChange={(e) => {
                    setLineOpacity(e.target.value / 100);
                }}
            />
        </div>
    );
};
export default Menu;
Steps to Run Application
Step 1: Run the application using the following command from the root directory of the project.
npm run dev
Step 2: Open your browser and go to http://localhost:5173/
Output
