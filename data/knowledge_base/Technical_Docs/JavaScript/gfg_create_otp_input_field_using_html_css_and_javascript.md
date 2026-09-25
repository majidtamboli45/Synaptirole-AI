# Create OTP Input Field using HTML CSS and JavaScript

> Source: https://www.geeksforgeeks.org/javascript/create-otp-input-field-using-html-css-and-javascript/

This project demonstrates how to build an OTP (One-Time Password) input box using HTML, CSS, and JavaScript for a smooth and user-friendly verification experience. It focuses on creating an interactive UI that enhances usability and input efficiency.
- Allows users to enter OTP seamlessly with auto-focus between input fields.
- Improves user experience with clean design and responsive behavior.
- Built using HTML for structure, CSS for styling, and JavaScript for functionality.
Approach
- The OTP input box consists of a container, a group of input boxes, and an underline-style design.
- Creating a container and assigning it a class of "container." Inside the container, add a green color box that will hold the individual input boxes.
- Each input box will have a class of "input," a type of "text," and an input mode of "numeric" to ensure a numeric keyboard is displayed on mobile devices.
- Create four input boxes, and their length will be restricted to a single character.
- To enable the input box navigation and interaction, we added JavaScript code. Target the orange color box and add an event listener to handle input events.
- In the event callback, retrieve the entered value and check if it is a number. If it's not, remove the value and return it. Next, identify the next input box using the "nextElementSibling" property and move the focus to it.
- Additionally, add an event listener for key-up events to handle the delete operation.
- When the backspace or delete key is pressed, move the focus to the previous input box and delete the value from the current input box.
<!-- index.html  -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, 
                     initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>OTP Input</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <div class="container">
        <div id="inputs" class="inputs">
            <input class="input" type="text" 
                inputmode="numeric" maxlength="1" />
            <input class="input" type="text" 
                inputmode="numeric" maxlength="1" />
            <input class="input" type="text" 
                inputmode="numeric" maxlength="1" />
            <input class="input" type="text" 
                inputmode="numeric" maxlength="1" />
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
/* style.css */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}
.input {
    width: 40px;
    border: none;
    border-bottom: 3px solid rgba(0, 0, 0, 0.5);
    margin: 0 10px;
    text-align: center;
    font-size: 36px;
    cursor: not-allowed;
    pointer-events: none;
}
.input:focus {
    border-bottom: 3px solid orange;
    outline: none;
}
.input:nth-child(1) {
    cursor: pointer;
    pointer-events: all;
}
// script.js
const inputs = document.getElementById("inputs");
inputs.addEventListener("input", function (e) {
    const target = e.target;
    const val = target.value;
    if (isNaN(val)) {
        target.value = "";
        return;
    }
    if (val != "") {
        const next = target.nextElementSibling;
        if (next) {
            next.focus();
        }
    }
});
inputs.addEventListener("keyup", function (e) {
    const target = e.target;
    const key = e.key.toLowerCase();
    if (key == "backspace" || key == "delete") {
        target.value = "";
        const prev = target.previousElementSibling;
        if (prev) {
            prev.focus();
        }
        return;
    }
});
Output:
