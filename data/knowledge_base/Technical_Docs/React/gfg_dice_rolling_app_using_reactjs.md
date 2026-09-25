# Dice Rolling App using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/dice-rolling-app-using-reactjs/

This article will create a dice-rolling application that rolls two dice and displays a random number between 1 and 6 as we click the button both dice shake and generate a new number that shows on the upper face of the dice (in dotted form as a standard dice). The numbers on the upper face are generated randomly each time we roll the dice.
There are two components Die and RollDice. The Die component is responsible for showing one individual Dice. It is a stateless component. It uses the font-awesome library to show the standard dots on the upper face of the dice. RollDice component contains all the logic to generate random numbers to show on the upper face of the dice, roll each dice upon clicking on the roll button. There are two states involved in the RollDice component named 'die1' and 'die2'. Each one has initialized with the value one i.e. each die shows one(one dot) when the application first starts.
Preview Image
Prerequisites
Steps to Create the Application
Step 1: Create the application using the following command:
npm create vite@latest DiceRoll -- --template react
Step 2: Navigate to the project folder
cd dice-roll
Step 3: Install the required modules.
 npm i @fortawesome/fontawesome-svg-core @fortawesome/free-solid-svg-icons @fortawesome/react-fontawesome
Step 5 :Create the required files in the components folder that are RollDice.js, Die.js, RollDice.css and Die.css
Project Structure:
Updated Dependencies:
"dependencies": {
"@fortawesome/fontawesome-svg-core": "^6.4.0",
"@fortawesome/free-solid-svg-icons": "^6.4.0",
"@fortawesome/react-fontawesome": "^0.2.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"web-vitals": "^2.1.4"
}
Example: Write the following code in the respective files
- App.js component renders a single RollDice component only.
- RollDice.js: It contains all the behind logic. The setting event handler updates all the states according to the user's interaction render Die component. This file has to be created by you.
- RollDice.css: Styling RollDice component contents
- Die.js: Responsible to show single-die component only with the correct dotted number face as communicated by the parent RollDice component. This file has to be created by you.
- Die.css: Styling each die component and setting animation effects to it.
/* RollDice.css File */
.RollDice {
    display: flex;
    flex-flow: column nowrap;
    min-height: 100vh;
}
/* Shows each dice in one row */
.RollDice-container {
    display: flex;
    justify-content: center;
    align-content: center;
}
/* Styling rolldice button */
.RollDice button {
    width: 15em;
    padding: 1.5em;
    border: 0px;
    border-radius: 10px;
    color: white;
    background-color: black;
    margin-top: 3em;
    align-self: center;
}
/* Setting hover effect on button */
.RollDice button:hover {
    cursor: pointer;
    background-color: rgb(34, 33, 33);
}
.RollDice-rolling {
    border: 0px;
    border-radius: 10px;
    background-color: darkslateblue !important;
    opacity: 0.7
}
/* Die.css File */
/* Styling each Die */
.Die {
    font-size: 10em;
    padding: 0.25em;
    color: slateblue;
}
/* Applying Animation */
.Die-shaking {
    animation-name: wobble;
    animation-duration: 1s;
}
/* Setting Animation effect to the 
     dice using css keyframe */
@keyframes wobble {
    from {
        transform: translate3d(0, 0, 0);
    }
    15% {
        transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg);
    }
    30% {
        transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg);
    }
    45% {
        transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg);
    }
    60% {
        transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg);
    }
    75% {
        transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg);
    }
    to {
        transform: translate3d(0, 0, 0);
    }
}
// App.js File
import React from 'react';
import RollDice from './components/RollDice'
import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
library.add(fas)
function App() {
    return (
        <div>
              <RollDice />
        </div>
    );
}
export default App;
// RollDice.js File
import React, { Component } from 'react'
import './RollDice.css'
import Die from './Die'
class RollDice extends Component {
    // Face numbers passes as default props
    static defaultProps = {
        sides: ['one', 'two', 'three',
            'four', 'five', 'six']
    }
    constructor(props) {
        super(props)
        // States
        this.state = {
            die1: 'one',
            die2: 'one',
            rolling: false
        }
        this.roll = this.roll.bind(this)
    }
    roll() {
        const { sides } = this.props
        setTimeout(() => {
            this.setState({
                // Changing state upon click
                die1: sides[(Math.floor(Math.random() * sides.length))],
                die2: sides[(Math.floor(Math.random() * sides.length))],
                rolling: true
            })
            // Start timer of one sec when rolling start
            // Set rolling to false again when time over
            this.setState({ rolling: false })
        }, 1000)
    }
    render() {
        const handleBtn = this.state.rolling ?
            'RollDice-rolling' : ''
        const { die1, die2, rolling } = this.state
        return (
            <div className='RollDice'>
                <div className='RollDice-container'>
                    <Die face={die1} rolling={rolling} />
                    <Die face={die2} rolling={rolling} />
                </div>
                <button className={handleBtn}
                    disabled={this.state.rolling}
                    onClick={this.roll}>
                    {this.state.rolling ? 'Rolling' : 'Roll Dice!'}
                </button>
            </div>
        )
    }
}
export default RollDice
// Die.js File
import React, {Component} from 'react'
import './Die.css'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
class Die extends Component{
render(){
    const {face, rolling} = this.props
    
    // Using font awesome icon to show
    // the exactnumber of dots
    return (
            <div>
                <FontAwesomeIcon icon={['fas', `fa-dice-${face}`]} className={`Die 
                ${rolling && 'Die-shaking'}`} />
            </div >
        )
}
}
export default Die
Steps to run the Application:
- Type the following command in the terminal:
npm run dev
Output: Type the following URL in the browser: http://localhost:5173/.
