# Inspirational Quote Generator with React

> Source: https://www.geeksforgeeks.org/reactjs/inspirational-quote-generator-with-react/

The Inspirational Quotes Website is a web app constructed using React. It showcases quotes to inspire and uplift users. Users have the ability to explore a selection of quotes and even share their quotes on social media. There is an option for navigating back to the already read quotes and a share button for social profiles. The background theme changes with each quote.
Let's have a quick look at what the final application will look like:
Approach
The idea is to display the quote on the homepage along with the name of quoter, It can be easily done with the help of a node package which will provide us, a large amount of quotes which we can show on our website.
- Showcasing a motivational quote on the page.
- Allowing users to click a button for a quote.
- Utilizing a minimalist user friendly and adaptable design.
Steps to create Project
Step 1: Create a new React JS project using the following command
npm create vite@latest inspirationalquotes
Step 2: Change to the project directory
cd inspirationalquotes
Step 3: Install some npm packages required for this project using the following command:
npm install @divyanshu013/inspirational-quotes
Folder Structure:
The updated dependencies in package.json will look like this:
 "dependencies": {
"@divyanshu013/inspirational-quotes": "^1.0.7",
"react": "^19.1.0",
"react-dom": "^19.1.0",
},
"devDependencies": {
"@vitejs/plugin-react": "^4.6.0",
"vite": "^7.0.4"
}
Example: Write the following code in respective files
/* FileName: App.css */
html,
body {
    height: 100%;
    margin: 0;
    padding: 0;
}
body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica,
        Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    text-align: center;
    color: rgba(255, 255, 255, 0.8);
    background: linear-gradient(45deg, #f0f2ef, #f0f1f0);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    margin: 0;
}
.content {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 1rem 2rem;
}
#top {
    color: green;
}
blockquote {
    background-color: rgba(255, 255, 255, 0.2);
    padding: 20px;
    border-radius: 5px;
    margin: 10px;
}
button {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    border: 2px solid #23870e;
    border-radius: 5px;
    background-color: #23870e;
    color: #ffffff;
    cursor: pointer;
    transition: background-color 0.3s ease, color 0.3s ease, border 0.3s ease;
    margin: 10px;
}
.button-container {
    display: flex;
    justify-content: center;
}
// FileName: App.js
import React, { useState, useEffect } from "react";
import { getRandom, getAll } from "@divyanshu013/inspirational-quotes";
import "./App.css";
export default function App() {
    const [quotes, setQuotes] = useState([]);
    const [currentIndex, setCurrentIndex] = useState(0);
    useEffect(() => {
        // Fetch all quotes and set them in the state
        const quotesData = getAll();
        setQuotes(quotesData);
    }, []);
    const handleNextClick = () => {
        setCurrentIndex((prevIndex) => (prevIndex + 1) % quotes.length);
    };
    const handlePreviousClick = () => {
        setCurrentIndex((prevIndex) =>
            prevIndex === 0 ? quotes.length - 1 : prevIndex - 1
        );
    };
    const currentQuote = quotes.length > 0 ? quotes[currentIndex] : null;
    const backgroundColors = ["#8cc084", "#b7ebc3", "#ffb37e", "#7fa8d7"];
    const currentBackgroundColor =
        backgroundColors[currentIndex % backgroundColors.length];
    return (
        <div className="content" style={{ background: currentBackgroundColor }}>
            <h1 id="top">GeeksforGeeks</h1>
            <h1>Inspirational Quote Generator</h1>
            {currentQuote && (
                <blockquote>
                    <p>"{currentQuote.quote}"</p>
                </blockquote>
            )}
            {currentQuote && <h2>{currentQuote.author}</h2>}
            {currentQuote && <h3>{currentQuote.source}</h3>}
            <div className="button-container">
                <button onClick={handlePreviousClick}>Previous</button>
                <button onClick={handleNextClick}>Next</button>
                <button
                    onClick={() =>
                        window.open(
`https://www.facebook.com/sharer/sharer.php?u=$%7Bwindow.location.href%7D%60
                        )
                    }
                >
                    Share on Facebook
                </button>
            </div>
        </div>
    );
}
Steps to run the project:
- Type the following command in terminal.
npm run dev
- Open web-browser and type the following URL
http://localhost:5173/
Output:
