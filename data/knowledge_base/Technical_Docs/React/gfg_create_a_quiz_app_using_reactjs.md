# Create a Quiz App using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/create-a-quiz-app-using-reactjs/

In this article, we will create a quiz application to learn the basics of ReactJS. We will be using class components to create the application with custom and bootstrap styling. The application will start with questions at first and then the score will be displayed at last. Initially, there are only 5 questions but you can keep adding more questions to make the quiz interesting.
Let's have a look at what our final project will look like:
Modules required:
Steps to create the project
Step 1: Create the project file using the command.
npm create vite@latest quiz --template react
Step 2: Navigate to the folder using the command.
cd quiz
Step 3: Install the required module using the command.
npm install bootstrap
Step 4: Create a folder named components in src file and create new files Option.js, Question.js, QuestionBank.js, and Score.js
Project Structure:
The dependencies in package.json will look like:
package.json
"dependencies": {
"bootstrap": "^5.3.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"vite": "^4.0.0",
"web-vitals": "^2.1.4"
},
Write the following codes in different files.
Example:
- App.js: This is our main file where all the logic for scoring and questions is written and other components are imported
- Question.js: This component contains the question component to be displayed
- QuestionBank.js: This component contains the raw data of the questions in our file
- Option.js: This component has options corresponding to a particular question
- Score.js: This component is used to display the final soce
/* App.css */
body {
  background-color: #292b2e;
  color: #ffffff;
}
.app-title {
  color: #ffffff;
  margin-top: 2rem;
}
// App.js
import React, { Component } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import Question from "./Components/Question";
import qBank from "./Components/QuestionBank";
import Score from "./Components/Score";
import "./App.css";
class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            questionBank: qBank,
            currentQuestion: 0,
            selectedOption: "",
            score: 0,
            quizEnd: false,
        };
    }
    handleOptionChange = (e) => {
        this.setState({ selectedOption: e.target.value });
    };
    handleFormSubmit = (e) => {
        e.preventDefault();
        this.checkAnswer();
        this.handleNextQuestion();
    };
    checkAnswer = () => {
        const { questionBank, currentQuestion, selectedOption, score } = this.state;
        if (selectedOption === questionBank[currentQuestion].answer) {
            this.setState((prevState) => ({ score: prevState.score + 1 }));
        }
    };
    handleNextQuestion = () => {
        const { questionBank, currentQuestion } = this.state;
        if (currentQuestion + 1 < questionBank.length) {
            this.setState((prevState) => ({
                currentQuestion: prevState.currentQuestion + 1,
                selectedOption: "",
            }));
        } else {
            this.setState({
                quizEnd: true,
            });
        }
    };
    render() {
        const { questionBank, currentQuestion, selectedOption, score, quizEnd } =
            this.state;
        return (
            <div className="App d-flex flex-column align-items-center justify-content-center">
                <h1 className="app-title">QUIZ APP</h1>
                {!quizEnd ? (
                    <Question
                        question={questionBank[currentQuestion]}
                        selectedOption={selectedOption}
                        onOptionChange={this.handleOptionChange}
                        onSubmit={this.handleFormSubmit}
                    />
                ) : (
                    <Score
                        score={score}
                        onNextQuestion={this.handleNextQuestion}
                        className="score"
                    />
                )}
            </div>
        );
    }
}
export default App;
// Question.js
import React, {Component} from "react";
import Options from "./Option";
class Question extends Component{
    render() {
        const {question, selectedOption, onOptionChange, onSubmit} = this.props;
        return(
            <div className="">
                <h3>Question {question.id}</h3>
                <h5 className="mt-2">{question.question}</h5>
                <form onSubmit={onSubmit} className="mt-2 mb-2">
                    <Options
                        options={question.options}
                        selectedOption={selectedOption}
                        onOptionChange={onOptionChange}
                    />
                    <button type="submit" className="btn btn-primary mt-2">
                        SUBMIT
                    </button>
                </form>
                
            </div>
        )
    }
}
export default Question;
// Option.js
import React, { Component } from 'react';
class Options extends Component {
    render() {
        const { options, selectedOption, onOptionChange } = this.props;
        return (
            <div className='options'>
                {options.map((option, index) => (
                    <div key={index} className="form-check">
                        <input
                            type="radio"
                            name="option"
                            value={option}
                            checked={selectedOption === option}
                            onChange={onOptionChange}
                            className="form-check-input"
                        />
                        <label className="form-check-label">{option}</label>
                    </div>
                ))}
            </div>
        );
    }
}
export default Options;
// Score.js
import React, { Component } from 'react';
import '../App.css'
class Score extends Component {
    render() {
        const { score, onNextQuestion } = this.props;
        return (
            <div>
                <h2>Results</h2>
                <h4>Your score: {score}</h4>
            </div>
        );
    }
}
export default Score;
// QuestionBank.js
const qBank = [
    {
        id: 1,
        question: "What is the capital of Haryana?",
        options: ["Yamunanagar", "Panipat", "Gurgaon", "Chandigarh"],
        answer: "Chandigarh",
    },
    {
        id: 2,
        question: "What is the capital of Punjab?",
        options: ["Patiala", "Ludhiana", "Amritsar", "Chandigarh"],
        answer: "Chandigarh",
    },
    {
        id: 3,
        question: "What is the capital of India?",
        options: ["Delhi", "Mumbai", "Kolkata", "Chennai"],
        answer: "Delhi"
    },
    {
        id: 4,
        question: "What is the capital of Uttarakhad?",
        options: ["Roorkee", "Haridwar", "Dehradun", "Nanital"],
        answer: "Dehradun"
    },
    {
        id: 5,
        question: "What is capital of Uttar Pradesh?",
        options: ["GB Nagar", "Lucknow", "Prayagraj", "Agra"],
        answer: "Lucknow"
    },
]
export default qBank;
Building a quiz app is a fun way to apply your React knowledge.
Steps to run the application:
Step 1: Type the following command in your command line
npm run dev
Step 2: Open http://localhost:5173/ URL in the browser. It will display the result.
Output
