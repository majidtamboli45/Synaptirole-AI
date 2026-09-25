# Number Format Converter using React

> Source: https://www.geeksforgeeks.org/reactjs/number-format-converter-using-react/

In this article, we will create Number Format Converter, that provides various features for users like to conversion between decimal, binary, octal and hexadecimal representations. Using functional components and state management, this program enables users to input a number and perform a range of calculations and conversions. It showcases the integer significant digits and decimal places for rounding, and also word representation. This program is implemented using JSX which helps to take input values and show the output values for different features.
Let's have a look at what our final project will look like:
Technologies Used/Prerequisites:
Approach/Functionalities:
Utilizes ReactJS functional components and state management to create an interactive web-based Number Format Converter. Employs a series of mathematical algorithms to perform conversions, rounding, and significant digit calculations based on user input.
- Input and State Management: The program begins by capturing a number input from the user and employs React state to manage various numerical values.
- Conversion Logic: It calculates and displays the binary, octal, decimal, and hexadecimal representations of the entered number, as well as the integer and fractional parts.
- Rounding and Significant Digits: Users can round the input to a specified number of decimal places and choose the number of significant digits they want in the result.
- Fractional Representation: The program determines the fractional part of the input and displays the numerator and denominator when applicable.
- In-Word Representation: For the integer part of the decimal, it provides a textual representation in words, making it a comprehensive tool for numeric conversions and calculations.
Steps to create the application :
Step 1: Set up React project using the command
npm create vite@latest <<name-of-project>> --template react
Step 2:. Navigate to the project folder using
cd <<Name_of_project>>
Step 3: Create a folder “components” and add two new files in it namely Numberformat.js and Numberformat.css.
Step 4:. Also Install the 'number-to-words' module to convert the integer number into words using terminal. Open a new terminal window and type:
npm install number-to-words
Project Structure:
The updated dependencies in package.json will look like:
"dependencies": {
"number-to-words": "^1.2.4",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"vite": "^4.0.0",
"web-vitals": "^2.1.4"
}
Example: Write the following code in respective files
- App.js: This file imports the Numberformat components and exports it.
- Numberformat.js: This file contains the logic for the Number format converter, converting techniques, and techniques to convert a number from decimal format to another base format , rounding and significant digits and also In-Word Representation.
- Numberformat.css: This file contains the design of the Numberformat elements.
/* Numberformat.css */
body{
    margin: 0;
    padding: 0;
}
.application{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
}
.application h1{
    margin: 5px;
}
.section{
    background-color: #f0eedc;
    border: 1px solid #e0e0e0;
    border-radius: 7px;
    width: calc(100% - 55px);
    max-width: 500px;
    padding: 20px;
}
.row{
    margin-bottom: 5px;
}
.row p{
    margin: 0;
    text-align: left;
    padding: 5px 7px;
}
.row div{
    display: flex;
    justify-content: center;
    align-items: center;
}
.row input{
    width: calc(100% - 33px);
    font-size: 1rem;
    padding: 6px 10px;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    outline: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
}
.row:first-child select{
    display: block;
    width: calc(100% - 10px);
    padding: 9px;
    border: 1px solid #ced4da;
    border-radius: 0.25em;
    margin: 0px 5px;
    outline: none;
}
.row:nth-child(2) input{
    width: calc(100% - 135px);
}
.row button{
    font-size: 16px;
    outline: none;
    border: 1px solid #28a745;
    padding: 9px 20px;
    border-radius: 4px;
    color: #fff;
    cursor: pointer;
    background-color: #28a745;
    transition: background-color .15s ease-in-out;
    margin-left: 5px;
}
.row button:hover{
    background-color: #1f953a;
}
.row:nth-child(4) input{
    width: calc(100% - 90px);
}
.row:nth-child(4) select{
    padding: 9px;
    width: 50px;
    margin-left: 5px;
    border-radius: 0.25em;
    outline: none;
    border: 1px solid #ced4da;
}
.row:nth-child(5) input{
    width: calc(100% - 90px);
}
.row:nth-child(5) select{
    padding: 9px;
    width: 50px;
    margin-left: 5px;
    border-radius: 0.25em;
    outline: none;
    border: 1px solid #ced4da;
}
.row:nth-child(6) div{
    width: calc(100% - 5px);
}
.row:nth-child(6) p{
    width: 6%;
    text-align: center;
}
.row:nth-child(6) input{
    width: 17%;
}
.row:nth-child(6) input:first-child{
    width: 60%;
    margin-right: 5px;
    margin-left: 5px;
}
// App.js
import './App.css';
import NumberFormat from './components/Numberformat.js';
function App() {
  return (
    <div className="App">
      <NumberFormat/>
    </div>
  );
}
export default App;
// NumberFormat.js
import React, { useState } from 'react'
import './Numberformat.css';
import numberToWords from 'number-to-words';
export default function Numberformat() {
    const [inputFormat, setInputFormat] = useState('decimal');
    const [inputNumber, setInputNumber] = useState('');
    const [decimal, setDecimal] = useState('');
    const [binary, setBinary] = useState('');
    const [octal, setOctal] = useState('');
    const [hexadecimal, setHexadecimal] = useState('');
    const [rounddigit, setRoundDigit] = useState('');
    const [rounddigitindex, setRoundDigitindex] = useState('2');
    const [significantno, setSignificantno] = useState('');
    const [significantnoindex, setSignificantnoindex] = useState('2');
    const [integer, setInteger] = useState(' ');
    const [numerator, setNumerator] = useState('0');
    const [denominator, setDenominator] = useState('0');
    const [inword, setInword] = useState('');
    const handleConversion = () => {
        let decimalValue;
        switch (inputFormat) {
            case 'binary':
                decimalValue = parseInt(inputNumber, 2);
                break;
            case 'octal':
                decimalValue = parseInt(inputNumber, 8);
                break;
            case 'hexadecimal':
                decimalValue = parseInt(inputNumber, 16);
                break;
            default:
                decimalValue = parseInt(inputNumber, 10);
        }
        if (inputFormat !== 'decimal') setDecimal(decimalValue);
        // Finding Integer Number
        setInteger(Math.floor(decimalValue));
        // Finding the Binary Representation
        setBinary((Math.floor(decimalValue)).toString(2));
        // Finding the Octal Representation
        setOctal((Math.floor(decimalValue)).toString(8));
        // Finding the Hexadecimal Representation
        setHexadecimal((Math.floor(decimalValue)).toString(16).toUpperCase());
        // Setting the word for given integer
        if(decimalValue <= 1000000000000000) setInword(numberToWords.toWords(decimalValue));
        else setInword("Over Limit (Max-Limit : 1000000000000000");
        // Setting the Rounded Number
        if (inputFormat === 'decimal') setRoundDigit(roundToKthInteger(parseFloat(decimal, 10), parseInt(rounddigitindex, 10)));
        else setRoundDigit(roundToKthInteger(parseFloat(decimalValue, 10), parseInt(rounddigitindex, 10)));
        // Setting the numerator and denominator
        if (inputFormat === 'decimal' && parseFloat(decimal, 10) - decimalValue !== 0) {
            const result = floatToFraction(parseFloat(decimal, 10) - decimalValue);
            setNumerator(result.numerator);
            setDenominator(result.denominator);
        } else {
            setNumerator('0');
            setDenominator('0');
        }
        // Setting the Significant Digits
        if (inputFormat === 'decimal') setSignificantno(roundToSignificantDigits(parseFloat(decimal, 10), parseInt(significantnoindex, 10)));
        else setSignificantno(roundToSignificantDigits(parseFloat(decimalValue, 10), parseInt(significantnoindex, 10)));
    }
    function floatToFraction(number) {
        const tolerance = 0.000001;
        let numerator = 1;
        let denominator = 1;
        let error = number - numerator / denominator;
        while (Math.abs(error) > tolerance) {
            if (error > 0) numerator++;
            else denominator++;
            error = number - numerator / denominator;
        }
        return {
            numerator: numerator,
            denominator: denominator
        };
    }
    function roundToKthInteger(number, k) {
        const multiplier = Math.pow(10, k);
        return Math.round(number * multiplier) / multiplier;
    }
    function roundToSignificantDigits(number, significantDigits) {
        if (significantDigits <= 0) return 0;
        const multiplier = Math.pow(10, significantDigits - Math.floor(Math.log10(Math.abs(number))) - 1);
        const roundedNumber = (Math.round(number * multiplier) / multiplier);
        return roundedNumber;
    }
    return (
        <div className='application'>
            <h1>Number Format Converter</h1>
            <div className="section">
                <div className="row">
                    <p>From</p>
                    <select value={inputFormat} onChange={(e) => setInputFormat(e.target.value)}>
                        <option value="binary">Binary</option>
                        <option value="decimal">Decimal</option>
                        <option value="octal">Octal</option>
                        <option value="hexadecimal">Hexadecimal</option>
                    </select>
                </div>
                <div className="row">
                    <p>Enter {inputFormat} Number</p>
                    <div>
                        <input
                            type={(inputFormat !== 'decimal') ? "text" : "number"}
                            value={inputNumber}
                            onChange={(e) => {
                                if (inputFormat === 'decimal') {
                                    setDecimal(e.target.value);
                                    setInputNumber(e.target.value)
                                } else {
                                    setInputNumber(e.target.value);
                                }
                            }}
                        />
                        <button onClick={handleConversion}>Convert</button>
                    </div>
                </div>
                <div className="row">
                    <p>Integer Number</p>
                    <input
                        type="number"
                        value={integer}
                        onChange={(e) => { }}
                    />
                </div>
                <div className="row">
                    <p>Significant Number</p>
                    <div>
                        <input
                            type="number"
                            value={significantno}
                            onChange={(e) => { }}
                        />
                        <select value={significantnoindex} onChange={(e) => {
                            setSignificantnoindex(e.target.value)
                            if (decimal !== '') setSignificantno(roundToSignificantDigits(parseFloat(decimal, 10), parseInt(e.target.value, 10)));
                        }}>
                            {[...Array(9).keys()].map((value) => (
                                <option key={value + 1} value={value + 1}>
                                    {value + 1}
                                </option>
                            ))}
                        </select>
                    </div>
                </div>
                <div className="row">
                    <p>Rounded Number</p>
                    <div>
                        <input
                            type="number"
                            value={rounddigit}
                            onChange={(e) => { }}
                        />
                        <select value={rounddigitindex} onChange={(e) => {
                            setRoundDigitindex(e.target.value);
                            if (decimal !== '') setRoundDigit(roundToKthInteger(parseFloat(decimal), parseInt(e.target.value, 10)));
                        }}>
                            {[...Array(10).keys()].map((value) => (
                                <option key={value} value={value}>
                                    {value}
                                </option>
                            ))}
                        </select>
                    </div>
                </div>
                <div className="row">
                    <p>Fraction</p>
                    <div>
                        <input
                            type="number"
                            value={integer}
                            onChange={(e) => { }}
                        />
                        <input
                            type="number"
                            value={numerator}
                            onChange={(e) => { }}
                        />
                        <p> / </p>
                        <input
                            type="number"
                            value={denominator}
                            onChange={(e) => { }}
                        />
                    </div>
                </div>
                <div className="row">
                    <p>{(inputFormat === 'binary') ? "Decimal" : "Binary"} Format(Base-{(inputFormat === 'binary') ? "10" : "2"}) of Integer {integer}</p>
                    <input
                        type="number"
                        value={(inputFormat === 'binary') ? decimal : binary}
                        onChange={(e) => { }}
                    />
                </div>
                <div className="row">
                    <p>{(inputFormat === 'octal') ? "Decimal" : "Octal"} Format(Base-{(inputFormat === 'octal') ? "10" : "8"}) of Integer {integer}</p>
                    <input
                        type="number"
                        value={(inputFormat === 'octal') ? decimal : octal}
                        onChange={(e) => { }}
                    />
                </div>
                <div className="row">
                    <p>{(inputFormat === 'hexadecimal') ? "Decimal" : "Hexadecimal"} Format(Base-{(inputFormat === 'hexadecimal') ? "10" : "16"}) of Integer {integer}</p>
                    <input
                        type="text"
                        value={(inputFormat === 'hexadecimal') ? decimal : hexadecimal}
                        onChange={(e) => { }}
                    />
                </div>
                <div className="row">
                    <p>In Words of Integer {integer}</p>
                    <input
                        type="text"
                        value={inword}
                        onChange={(e) => { }}
                    />
                </div>
            </div>
        </div>
    )
}
Steps to run the application:
1. Type the following command in terminal.
npm run dev
2. Open web-browser and type the following URL
http://localhost:5173/
Output
