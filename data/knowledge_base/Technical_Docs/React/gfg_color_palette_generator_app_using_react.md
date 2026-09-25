# Color Palette Generator app using React

> Source: https://www.geeksforgeeks.org/reactjs/color-palette-generator-app-using-react/

Color Palette Generator App using ReactJS is a web application which enables users to effortlessly generate random color palettes, view the colors, and copy the color codes to the clipboard with just a single click. There is also a search bar that allows the user to check different color themes for their specified color.
Let's have a quick look at what the final application will look like:
Steps to Create the project:
Step 1: Create a react application by using this command
npm create vite@latest colorPaletteGenerator
Step 2: After creating your project folder, i.e. colorPaletteGenerator, use the following command to navigate to it:
cd colorPaletteGenerator
Folder Structure:
The updated dependencies in package.json file will look like
  "dependencies": {
"react": "^19.1.0",
"react-dom": "^19.1.0",
},
"devDependencies": {
"@vitejs/plugin-react": "^4.6.0",
"vite": "^7.0.4"
}
Example: Write the below code in App.js file and App.css in the src directory
/* App.css */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.container {
    margin: 20px;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
}
.container .color {
    margin: 12px;
    padding: 7px;
    list-style: none;
    cursor: pointer;
    text-align: center;
    background: #fff;
    border-radius: 16px;
    box-shadow: 0 0px 30px 0px rgb(207, 206, 206);
    transition: all 0.3s ease;
}
h1 {
    text-align: center;
    padding: 10px;
    color: green;
}
.container .color:active {
    transform: scale(0.95);
}
.color .rect-box {
    width: 185px;
    height: 188px;
    border-radius: 10px;
}
.color:hover .rect-box {
    filter: brightness(107%);
}
.color .hex-value {
    display: block;
    color: #444;
    user-select: none;
    font-weight: 500;
    font-size: 1.15rem;
    margin: 12px 0 8px;
    text-transform: uppercase;
}
.refresh-btn {
    position: fixed;
    left: 50%;
    bottom: 40px;
    color: #fff;
    cursor: pointer;
    outline: none;
    font-weight: 500;
    font-size: 1.1rem;
    border-radius: 5px;
    background: green;
    padding: 13px 20px;
    border: none;
    transform: translateX(-50%);
    box-shadow: 0 0px 30px 0px grey;
    transition: all 0.3s ease;
}
.refresh-btn:hover {
    background: rgb(4, 95, 4);
}
.copied-message {
    margin: 10px;
    color: crimson;
    font-weight: bold;
    font-family: 'Courier New', Courier, monospace;
}
.search-container {
    position: relative;
    margin: 20px auto;
    width: 300px;
}
.search-input {
    width: 100%;
    padding: 15px;
    border: 2px solid #ccc;
    border-radius: 15px;
    font-size: 16px;
    outline: none;
    transition: border-color 0.3s;
    box-shadow: 0 0px 10px 0px #b3b2b2;
}
.search-input:hover {
    border-color: #007bff;
}
@media screen and (max-width: 500px) {
    .container {
        margin: 10px;
    }
    .container .color {
        margin: 8px;
        padding: 5px;
        width: calc(100% / 2 - 20px);
    }
    .color .rect-box {
        width: 100%;
        height: 148px;
    }
    .color .hex-value {
        font-size: 1.05rem;
    }
    .refresh-btn {
        font-size: 1rem;
    }
}
// App.js
import React, { Component } from "react";
import "./App.css";
class App extends Component {
    constructor() {
        super();
        this.state = {
            colorList: [],
            copiedColorIndex: null,
            searchInput: "",
            matchingColors: [], // Store matching colors
        };
    }
    componentDidMount() {
        this.generateColorPalette();
    }
    generateColorPalette = () => {
        const maxColorBoxes = 21;
        const colorList = [];
        for (let i = 0; i < maxColorBoxes; i++) {
            const randomHexColor = `#${Math.floor(Math.random() * 0xffffff)
                .toString(16)
                .padStart(6, "0")}`;
            colorList.push(randomHexColor);
        }
        this.setState({ colorList, copiedColorIndex: null });
    };
    copyColorToClipboard = (hexValue, index) => {
        navigator.clipboard
            .writeText(hexValue)
            .then(() => {
                this.setState({ copiedColorIndex: index });
            })
            .catch(() => {
                alert("Failed to copy the color code!");
            });
    };
    handleSearchChange = (e) => {
        const searchInput = e.target.value.toLowerCase();
        // Color mapping with arrays of related colors
        const colorMapping = {
            red: ["#FF0000", "#FF5733", "#c21919", "#FF6347", "#FF4500"],
            green: ["#00FF00", "#33FF73", "#C3FF00", "#228B22", "#008000"],
            blue: ["#0000FF", "#3373FF", "#00C3FF", "#1E90FF", "#4169E1"],
            yellow: ["#FFFF00", "#FFD700", "#FFEA00", "#F0E68C", "#FFAC33"],
            pink: ["#FFC0CB", "#FF69B4", "#FF1493", "#FF6EB4", "#FF82AB"],
            purple: ["#800080", "#9932CC", "#8A2BE2", "#A020F0", "#8000FF"],
            orange: ["#FFA500", "#FFD700", "#FF8C00", "#FF7F50", "#FF4500"],
            brown: ["#A52A2A", "#8B4513", "#D2691E", "#CD853F", "#DEB887"],
            cyan: ["#00FFFF", "#20B2AA", "#40E0D0", "#00CED1", "#00C5CD"],
            magenta: ["#FF00FF", "#FF69B4", "#DA70D6", "#BA55D3", "#FFA0B4"],
            teal: ["#008080", "#008B8B", "#00FFFF", "#20B2AA", "#40E0D0"],
            navy: ["#000080", "#00008B", "#0000FF", "#4169E1", "#0000CD"],
            lime: ["#00FF00", "#32CD32", "#7FFF00", "#00FA9A", "#00FF7F"],
            maroon: ["#800000", "#8B0000", "#B22222", "#A52A2A", "#800000"],
            olive: ["#808000", "#6B8E23", "#556B2F", "#8FBC8B", "#9ACD32"],
            silver: ["#C0C0C0", "#D3D3D3", "#DCDCDC", "#BEBEBE", "#A9A9A9"],
            black: ["#000000", "#080808", "#121212", "#1C1C1C", "#262626"],
            white: ["#FFFFFF", "#F5F5F5", "#FAFAFA", "#E0E0E0", "#D3D3D3"],
            // Add more color mappings as needed
        };
        // Check if the search input matches any color name
        const matchingColors = colorMapping[searchInput] || [];
        this.setState({ searchInput, matchingColors });
    };
    render() {
        const filteredColorList =
            this.state.matchingColors.length > 0
                ? this.state.matchingColors
                : this.state.colorList;
        return (
            <div>
                <h1>Color Palette Generator</h1>
                <div className="search-container">
                    <input
                        type="text"
                        className="search-input"
                        placeholder="Search for a color"
                        value={this.state.searchInput}
                        onChange={this.handleSearchChange}
                    />
                </div>
                {/* Render matching colors */}
                <ul className="container">
                    {filteredColorList.map((hexValue, index) => (
                        <li
                            className="color"
                            key={index}
                            onClick={() =>
                                this.copyColorToClipboard(hexValue, index)
                            }
                        >
                            <div
                                className="rect-box"
                                style={{ background: hexValue }}
                            ></div>
                            <span className="hex-value">
                                {hexValue}
                                {this.state.copiedColorIndex === index && (
                                    <p className="copied-message">Copied</p>
                                )}
                            </span>
                        </li>
                    ))}
                </ul>
                <button
                    className="refresh-btn"
                    onClick={this.generateColorPalette}
                >
                    Refresh Palette
                </button>
            </div>
        );
    }
}
export default App;
Steps to run the Application:
- Type the following command in the terminal:
npm run dev
- Type the following URL in the browser:
http://localhost:5173/
Output:
