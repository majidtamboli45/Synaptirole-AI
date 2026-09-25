# Design a Student Grade Calculator using JavaScript

> Source: https://www.geeksforgeeks.org/javascript/design-a-student-grade-calculator-using-javascript/

This project explains how to build a Student Grade Calculator using HTML, CSS, and JavaScript to evaluate academic performance efficiently. It helps students calculate their overall grade based on different assessment scores.
- Calculates grades based on inputs like assignments, quizzes, and exams.
- Provides clear and accurate feedback on student performance.
- Built using HTML for structure, CSS for styling, and JavaScript for logic.
Working of Calculation
The main goal is to calculate the percentage of total marks obtained out of the maximum possible marks, then assign a grade based on that percentage
Formula to Calculate Percentage
percentage=(marks obtained/total marks)×100
Now let's understand this with the help of example:
Suppose a student scores a total of 320 marks out of 400
percentage=(320/400)×100=0.8×100=80%
Working of Student Grade Calculator
This calculator accepts marks from different subjects — for example, Chemistry, Hindi, and Math — computes the total, calculates the percentage, and then assigns a grade based on predefined criteria.
Steps to Build the Calculator
- Create a function called calculate() to perform all operations.
- Retrieve input values from the user (marks for each subject).
- Convert input values to numerical form for calculation.
- Calculate total marks by summing the marks of all subjects.
- Calculate the percentage using the total marks and maximum possible marks.
- Assign the grade based on the percentage using if-else conditions.
- Validate input to ensure no empty or invalid values are entered.
- Display results including total marks, percentage, grade, and pass/fail status.
Example: Now let's start the implementation of the student's grades calculator.
<html>
<head>
    <link href=
"https://fonts.googleapis.com/css?family=Righteous&display=swap" 
          rel="stylesheet" />
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <div class="container">
        <h1>Student grade calculator</h1>
        <div class="screen-body-item">
            <div class="app">
                <div class="form-group">
                    <input type="text" 
                           class="form-control" 
                           placeholder="CHEMISTRY" 
                           id="chemistry" />
                </div>
                <div class="form-group">
                    <input type="text" 
                           class="form-control" 
                           placeholder="HINDI" id="hindi" />
                </div>
                <div class="form-group">
                    <input type="text" 
                           class="form-control" 
                           placeholder="MATHS" id="maths" />
                </div>
                <div class="form-group">
                    <input type="text" 
                           class="form-control" 
                           placeholder="PHYSICS" id="phy" />
                </div>
                <div>
                    <input type="button" 
                           value="show Percentage" 
                           class="form-button" 
                           onclick="calculate()" />
                </div>
            </div>
        </div>
        <div class="form-group showdata">
            <p id="showdata"></p>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
    background: #006600;
    font-size: 12px;
}
.container {
    flex: 0 1 700px;
    margin: auto;
    padding: 10px;
}
.screen-body-item {
    flex: 1;
    padding: 50px;
}
input {
    margin: 10px 10px 10px;
}
.showdata {
    color: black;
    font-size: 1.2rem;
    padding-top: 10px;
    padding-bottom: 10px;
}
JavaScript code
- Retrieve and Convert Inputs: Use document.querySelector to get values from input fields and convert them to numbers with parseFloat.
- Calculate Total Marks: Sum the converted values of the four subjects.
- Compute Percentage: Divide the total marks by 400 and multiply by 100 to find the percentage.
- Assign Grade and Display Result: Use if-else conditions to determine the grade and innerHTML to display the total marks, percentage, grade, and pass/fail status on the webpage.
const calculate = () => {
    let chemistry = document.querySelector("#chemistry").value;
    let hindi = document.querySelector("#hindi").value;
    let maths = document.querySelector("#maths").value;
    let phy = document.querySelector("#phy").value;
    let grades = "";
    let totalgrades =
        parseFloat(chemistry) +
        parseFloat(hindi) +
        parseFloat(maths) +
        parseFloat(phy);
    let percentage = (totalgrades / 400) * 100;
    if (percentage <= 100 && percentage >= 80) {
        grades = "A";
    } else if (percentage <= 79 && percentage >= 60) {
        grades = "B";
    } else if (percentage <= 59 && percentage >= 40) {
        grades = "C";
    } else {
        grades = "F";
    }
    if (chemistry == "" || hindi == ""
        || maths == "" || phy == "") {
        document.querySelector("#showdata").innerHTML
            = "Please enter all the fields";
    } else {
        if (percentage >= 39.5) {
            document.querySelector(
                "#showdata"
            ).innerHTML =
                ` Out of 400 your total is  ${totalgrades} 
          and percentage is ${percentage}%. <br> 
          Your grade is ${grades}. You are Pass. `;
        } else {
            document.querySelector(
                "#showdata"
            ).innerHTML =
                ` Out of 400 your total is  ${totalgrades} 
          and percentage is ${percentage}%. <br> 
          Your grade is ${grades}. You are Fail. `;
        }
    }
};
Output
