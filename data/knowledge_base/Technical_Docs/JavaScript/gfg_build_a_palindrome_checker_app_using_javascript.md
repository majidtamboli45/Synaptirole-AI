# Build a Palindrome Checker App using JavaScript

> Source: https://www.geeksforgeeks.org/javascript/build-a-palindrome-checker-app-using-javascript/

A Palindrome Checker app in JavaScript is used to determine whether a given word or phrase reads the same forwards and backwards. It’s a great beginner project to practice string manipulation and logic building.
- The app reverses the input string and compares it with the original string.
- It ignores spaces, punctuation, and case for accurate checking.
Approach
We will create a simple web application where users can input a word or phrase to check if it’s a palindrome. The application will feature:
- A clean and responsive design.
- A text input for the user to enter text.
- A button to trigger the palindrome check.
- A result section that displays whether the input is a palindrome.
Project Preview
Palindrome Checker App - HTML Structure
<html>
<head></head>
<body>
    <div class="container">
        <h1>Palindrome Checker</h1>
        <p>Enter a word or phrase to check if it’s a palindrome.</p>
        <input type="text" id="input" placeholder="Type here...">
        <button id="check">Check Palindrome</button>
        <div id="result"></div>
    </div>
</body>
</html>
- The <div> with class container organizes the UI components.
- <h1> displays the title "Palindrome Checker."
- <p> provides a brief instruction for the user.
- <input> accepts user input.
- <button> triggers the palindrome check.
- <div> with id="result" displays the output.
Palindrome Checker App - CSS Styles
body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f0f0f0;
    margin: 0;
}
.container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 90%;
    max-width: 400px;
}
h1 {
    font-size: 1.5em;
    color: #333;
}
p {
    font-size: 1em;
    color: #666;
    margin-bottom: 20px;
}
input {
    width: 100%;
    padding: 10px;
    font-size: 1em;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 10px;
}
button {
    width: 100%;
    padding: 10px;
    font-size: 1em;
    background-color: #007BFF;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
button:hover {
    background-color: #0056b3;
}
#result {
    margin-top: 20px;
    font-size: 1.1em;
}
- The body is styled to center the application on the screen.
- .container defines the application layout with padding and a shadow for aesthetics.
- h1, p, input, and button are styled for clarity and usability.
- #result is styled to display the output prominently.
Palindrome Checker App - JavaScript Functionality
document.getElementById("check").addEventListener("click", function () {
    const input = document.getElementById("input").value.trim();
    const result = document.getElementById("result");
    if (input) {
        // Normalize the text
        const norm = input.replace(/[^a-zA-Z0-9]/g, "").toLowerCase();
        const rev = norm.split("").reverse().join("");
        // Check if it’s a palindrome
        if (norm === rev) {
            result.textContent = `"${input}" is a palindrome!`;
            result.style.color = "green";
        } else {
            result.textContent = `"${input}" is not a palindrome.`;
            result.style.color = "red";
        }
    } else {
        result.textContent = "Please enter some text.";
        result.style.color = "orange";
    }
});
- The addEventListener listens for a click on the button.
- input fetches and trims user input.
- norm removes non-alphanumeric characters and converts text to lowercase.
- rev reverses the string for comparison.
- Conditional checks determine if the input is a palindrome and updates the result.
Complete Code
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 400px;
        }
        h1 {
            font-size: 1.5em;
            color: #333;
        }
        p {
            font-size: 1em;
            color: #666;
            margin-bottom: 20px;
        }
        input {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        button {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        #result {
            margin-top: 20px;
            font-size: 1.1em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Palindrome Checker</h1>
        <p>Enter a word or phrase to check if it’s a palindrome.</p>
        <input type="text" id="input" placeholder="Type here...">
        <button id="check">Check Palindrome</button>
        <div id="result"></div>
    </div>
<script>
    document.getElementById("check").addEventListener("click", function () {
        const input = document.getElementById("input").value.trim();
        const result = document.getElementById("result");
        if (input) {
            const norm = input.replace(/[^a-zA-Z0-9]/g, "").toLowerCase();
            const rev = norm.split("").reverse().join("");
            if (norm === rev) {
                result.textContent = `"${input}" is a palindrome!`;
                result.style.color = "green";
            } else {
                result.textContent = `"${input}" is not a palindrome.`;
                result.style.color = "red";
            }
        } else {
            result.textContent = "Please enter some text.";
            result.style.color = "orange";
        }
    });
</script>
</body>
</html>
