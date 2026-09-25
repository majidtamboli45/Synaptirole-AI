# Typing Speed Tester using React

> Source: https://www.geeksforgeeks.org/reactjs/typing-speed-tester-using-react/

In this article, we will create a Typing Speed Tester that provides a random paragraph for the user to type as accurately and quickly as possible within a fixed time limit of one minute. This application also displays the time remaining, counts mistakes calculates the words per minute and characters per minute, and updates these all dynamically in real time. Users can reset the game by clicking the reset button and can try again with a new paragraph. This application is implemented by JSX and provides a simple UI design.
Preview of Final Output:
Prerequisites and Technologies:
Approach:
Utilizes ReactJS functional components and state management to create an interactive web-based Typing Speed Tester that provides a real-time typing challenge with random paragraphs. Users can type the characters of paragraph by pressing the key in the keyboard. This application tracks remaining time, calculates WPM and CPM and also count mistakes and shows to the user dynamically. This application provides an engaging typing experience, encouraging users to improve their typing speed and accuracy within a time constraint.
Steps to create the application :
Step 1: Set up React project using the command
npm create vite@latest typing-speed-tester --template react
Step 2: Navigate to the project folder using
cd typing-speed-tester
Step 3: Install Dependencies
npm install
Step 4: Create a folder “components” and add three new files in it namely SpeedTypingGame.js and SpeedTypingGame.css and TypingArea.js.
Project Structure:
The updated dependencies in package.json will look like this:
{
"name": "typing-speed-tester",
"version": "0.1.0",
"private": true,
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"vite": "^4.0.0",
"web-vitals": "^2.1.4"
},
"devDependencies": {
"@vitejs/plugin-react": "^2.0.0"
}
}
Example: Write the following code in respective files
- App.js: This file imports the SpeedTypingGame components and exports it.
- SpeedTypingGame.js: Manages game state and logic, including paragraph generation and user input.
- TypingArea.js: Renders typing area and stats, tracks time, mistakes, and provides a reset button.
- SpeedTypingGame.css: This file contains the design of the SpeedTypingGame elements.
/* SpeedTypingGame.css */
body{
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: 'Noto Sans Mono', monospace;
  background-color: #e7e9e9;
}
.container {
  max-width: 650px;
  margin: 5px;
  width: calc(100% - 10px);
  padding: 30px;
  border-radius: 10px;
  box-sizing: border-box;
  border: 1px solid #ced4da;
  background: #fff;
  box-shadow: 0 0 6px rgba(0,0,0,0.25);
}
input.input-field{
  opacity: 0;
  z-index: -999;
  position: absolute;
}
#paragraph{
  word-break: break-all;
  text-align: left;
}
.section{
  border: 1px solid #ced4da;
  border-radius: 5px;
  padding: 20px;
  padding-top: 0;
}
.section1{
  border-bottom: 1px solid #ced4da;
}
span{
  font-size: 20px;
  user-select: none;
  cursor: tex;
}
span.wrong{
  color: darkred;
  background-color: pink;
}
span.correct{
  color: #0e630e;
  background: #e7fbd3;
}
span.active{
  border-bottom: 3px solid #0a6bf9;
}
.section2{
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 5px;
}
.section2 ul{
  padding-inline-start: 0px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 0px;
  width: calc(100% - 120px);
}
.section2 ul li{
  list-style-type: none;
  margin: 0 10px;
}
.section2 ul li p{
  margin: 5px;
  font-size: 12px;
}
.section2 ul li span{
  font-size: 18px;
}
button.btn {
  padding: 10px 20px;
  outline: none;
  border: 1px solid #ced4da;
  margin: 5px;
  border-radius: 4px;
  cursor: pointer;
  background: #1d9bf0;
  color: #fff;
  font-size: 16px;
  transition: all 0.5s;
}
button.btn:hover{
  background-color: #1879ba;
}
@media screen and (max-width : 550px){
  .section2{
      flex-direction: column;
  }
  .section2 ul{
      width: 100%;
      justify-content: space-between;
  }
  button.btn{
      width: 100%;
      margin-top: 10px;
  }
}
// App.js
import './App.css';
import SpeedTypingGame from './components/SpeedTypingGame';
function App() {
  return (
    <div className="App">
      <SpeedTypingGame />
    </div>
  );
}
export default App;
// SpeedTypingGame.js
import React, {
    useState,
    useEffect
} from 'react';
import './SpeedTypingGame.css';
import TypingArea from './TypingArea'; // Import the TypingArea component
const SpeedTypingGame = () => {
    const paragraphs = [
        "A plant is one of the most important living things that 
        develop on the earth and is made up of stems, leaves, 
        roots, and so on.Parts of Plants: The part of the plant
        that developed beneath the soil is referred to as root 
        and the part that grows outside of the soil is known as shoot.
        The shoot consists of stems, branches, leaves, fruits, 
        and flowers.Plants are made up of six main parts: roots, stems,
        leaves, flowers, fruits, and seeds.
        ",
        "The root is the part of the plant that grows in the soil. 
        The primary root emerges from the embryo.Its primary
        function is to provide the plant stability in the earth
        and make other mineral salts from the earth available to the plant
        for various metabolic
        processes There are three types of roots i.e.Tap Root, 
        Adventitious Roots, and Lateral Root.The roots arise from 
        the parts of the plant and not from the rhizomes roots.
        ",
        "Stem is the posterior part that remains above the ground 
        and grows negatively geotropic. Internodes and nodes are 
        found on the stem.Branch, bud, leaf, petiole, flower, and
        inflorescence on a node are all those parts of the plant 
        that remain above the ground and undergo negative subsoil 
        development.The trees have brown bark and the young and
        newly developed stems are green.The roots arise from the 
        parts of plant and not from the rhizomes roots.
        ",
        "It is the blossom of a plant. A flower is the part of a plant 
        that produces seeds, which eventually become other flowers.They 
        are the reproductive system of a plant. Most flowers consist of 
        04 main parts that are sepals, petals, stamens, and carpels.
        The female portion of the flower is the carpels.The majority 
        of flowers are hermaphrodites,
        meaning they have both male and female components.Others may 
        consist of one of two parts and may be male or female.
        ",
        "An aunt is a bassoon from the right perspective. 
        As far as we can estimate, some posit the melic myanmar to 
        be less than kutcha.One cannot separate foods from blowzy bows.
        The scampish closet reveals itself as a sclerous llama to 
        those who look.A hip is the skirt of a peak.Some hempy laundries 
        are thought of simply as orchids.A gum is a trumpet from 
        the right perspective.A freebie flight is a wrench of the mind.Some
        posit the croupy.
        "
    ];
    const [typingText, setTypingText] = useState('');
    const [inpFieldValue, setInpFieldValue] = useState('');
    const maxTime = 60;
    const [timeLeft, setTimeLeft] = useState(maxTime);
    const [charIndex, setCharIndex] = useState(0);
    const [mistakes, setMistakes] = useState(0);
    const [isTyping, setIsTyping] = useState(false);
    const [WPM, setWPM] = useState(0);
    const [CPM, setCPM] = useState(0);
    const loadParagraph = () => {
        const ranIndex = Math.floor(Math.random() * paragraphs.length);
        const inputField = document.getElementsByClassName('input-field')[0];
        document.addEventListener("keydown", () => inputField.focus());
        const content = Array.from(paragraphs[ranIndex]).map((letter, index) => ( <
            span key = {
                index
            }
            style = {
                {
                    color: (letter !== ' ') ? 'black' : 'transparent'
                }
            }
            className = {
                `char ${index === 0 ? 'active' : ''}`
            } > {
                (letter !== ' ') ? letter : '_'
            } <
            /span>
        ));
        setTypingText(content);
        setInpFieldValue('');
        setCharIndex(0);
        setMistakes(0);
        setIsTyping(false);
    };
    const handleKeyDown = (event) => {
        const characters = document.querySelectorAll('.char');
        if (event.key === 'Backspace' && charIndex > 0 &&
            charIndex < characters.length && timeLeft > 0) {
            if (characters[charIndex - 1].classList.contains('correct')) {
                characters[charIndex - 1].classList.remove('correct');
            }
            if (characters[charIndex - 1].classList.contains('wrong')) {
                characters[charIndex - 1].classList.remove('wrong');
                setMistakes(mistakes - 1);
            }
            characters[charIndex].classList.remove('active');
            characters[charIndex - 1].classList.add('active');
            setCharIndex(charIndex - 1);
            let cpm = (charIndex - mistakes - 1) * (60 / (maxTime - timeLeft));
            cpm = cpm < 0 || !cpm || cpm === Infinity ? 0 : cpm;
            setCPM(parseInt(cpm, 10));
            let wpm = Math.round(((charIndex - mistakes) / 5) / (
            maxTime - timeLeft) * 60);
            wpm = wpm < 0 || !wpm || wpm === Infinity ? 0 : wpm;
            setWPM(wpm);
        }
    }
    const initTyping = (event) => {
        const characters = document.querySelectorAll('.char');
        let typedChar = event.target.value;
        if (charIndex < characters.length && timeLeft > 0) {
            let currentChar = characters[charIndex].innerText;
            if (currentChar === '_') currentChar = ' ';
            if (!isTyping) {
                setIsTyping(true);
            }
            if (typedChar === currentChar) {
                setCharIndex(charIndex + 1);
                if (charIndex + 1 < characters.length) characters[charIndex +
                    1].classList.add('active');
                characters[charIndex].classList.remove('active');
                characters[charIndex].classList.add('correct');
            } else {
                setCharIndex(charIndex + 1);
                setMistakes(mistakes + 1);
                characters[charIndex].classList.remove('active');
                if (charIndex + 1 < characters.length) characters[charIndex +
                    1].classList.add('active');
                characters[charIndex].classList.add('wrong');
            }
            if (charIndex === characters.length - 1) setIsTyping(false);
            let wpm = Math.round(((charIndex - mistakes) / 5) / (
                maxTime - timeLeft) * 60);
            wpm = wpm < 0 || !wpm || wpm === Infinity ? 0 : wpm;
            setWPM(wpm);
            let cpm = (charIndex - mistakes) * (60 / (maxTime - timeLeft));
            cpm = cpm < 0 || !cpm || cpm === Infinity ? 0 : cpm;
            setCPM(parseInt(cpm, 10));
        } else {
            setIsTyping(false);
        }
    };
    const resetGame = () => {
        setIsTyping(false);
        setTimeLeft(maxTime);
        setCharIndex(0);
        setMistakes(0);
        setTypingText('');
        setCPM(0);
        setWPM(0);
        const characters = document.querySelectorAll('.char');
        characters.forEach(span => {
            span.classList.remove("correct");
            span.classList.remove('wrong');
            span.classList.remove('active');
        });
        characters[0].classList.add('active');
        loadParagraph();
    };
    useEffect(() => {
        loadParagraph();
    }, []);
    useEffect(() => {
        let interval;
        if (isTyping && timeLeft > 0) {
            interval = setInterval(() => {
                setTimeLeft(timeLeft - 1);
                let cpm = (charIndex - mistakes) * (60 / (maxTime - timeLeft));
                cpm = cpm < 0 || !cpm || cpm === Infinity ? 0 : cpm;
                setCPM(parseInt(cpm, 10));
                let wpm = Math.round(((charIndex - mistakes) / 5) / (
                    maxTime - timeLeft) * 60);
                wpm = wpm < 0 || !wpm || wpm === Infinity ? 0 : wpm;
                setWPM(wpm);
            }, 1000);
        } else if (timeLeft === 0) {
            clearInterval(interval);
            setIsTyping(false);
        }
        return () => {
            clearInterval(interval);
        };
    }, [isTyping, timeLeft]);
    return ( <
            div className = "container" >
            <
            input type = "text"
            className = "input-field"
            value = {
                inpFieldValue
            }
            onChange = {
                initTyping
            }
            onKeyDown = {
                handleKeyDown
            }
            /> {
            /* Render the TypingArea child component */
        } <
        TypingArea typingText = {
            typingText
        }
    inpFieldValue = {
        inpFieldValue
    }
    timeLeft = {
        timeLeft
    }
    mistakes = {
        mistakes
    }
    WPM = {
        WPM
    }
    CPM = {
        CPM
    }
    initTyping = {
        initTyping
    }
    handleKeyDown = {
        handleKeyDown
    }
    resetGame = {
        resetGame
    }
    /> < /
    div >
);
};
export default SpeedTypingGame;
// TypingArea.js
import React from 'react';
const TypingArea = ({
  typingText,
  inpFieldValue,
  timeLeft,
  mistakes,
  WPM,
  CPM,
  initTyping,
  handleKeyDown,
  resetGame,
}) => {
  return (
    <div className="section">
      <div className="section1">
        <p id="paragraph">{typingText}</p>
      </div>
      <div className="section2">
        <ul className="resultDetails">
          <li className="time">
            <p>Time Left:</p>
            <span>
              <b>{timeLeft}</b>s
            </span>
          </li>
          <li className="mistake">
            <p>Mistakes:</p>
            <span>{mistakes}</span>
          </li>
          <li className="wpm">
            <p>WPM:</p>
            <span>{WPM}</span>
          </li>
          <li className="cpm">
            <p>CPM:</p>
            <span>{CPM}</span>
          </li>
        </ul>
        <button onClick={resetGame} className="btn">
          Try Again
        </button>
      </div>
    </div>
  );
};
export default TypingArea;
Steps to run the application:
Step 1: Type the following command in terminal
npm run dev
Step 2: Open web-browser and type the following URL
http://localhost:5173/
Output:
