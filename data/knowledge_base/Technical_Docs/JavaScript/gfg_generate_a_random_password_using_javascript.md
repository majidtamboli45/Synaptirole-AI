# Generate a Random Password using JavaScript

> Source: https://www.geeksforgeeks.org/javascript/how-to-generate-a-random-password-using-javascript/

A random password generator is a beginner-friendly JavaScript project with real-world usefulness. It helps create strong, secure passwords to protect user accounts.
- Generates complex and randomized passwords for better security.
- Allows customization of length and character types.
Approach
We will create a Password Generator application that lets users:
- Define the password length.
- Include or exclude uppercase letters, numbers, and special characters.
- Generate a random password based on the selected criteria.
- Reset the input fields to default values.
Project Preview
Generate Random Password - HTML Structure
This code represents the structure of a simple password generator application. It includes input fields for customizing the password's length and character composition, along with buttons to generate or reset the password display.
<html>
<head></head>
<body>
    <div class="container">
        <h1>Password Generator</h1>
        <label>
            Password Length:
            <input id="len" min="6" type="number" value="12" />
        </label>
        <br />
        <label>
            <input id="upper" type="checkbox" checked /> Include Uppercase
        </label>
        <br />
        <label>
            <input id="nums" type="checkbox" checked /> Include Numbers
        </label>
        <br />
        <label>
            <input id="special" type="checkbox" checked /> Include Special Characters
        </label>
        <br />
        <button class="btn" onclick="generate()">Generate Password</button>
        <button class="btn" onclick="reset()">Reset</button>
        <div class="output" id="passOut">Your password will appear here</div>
    </div>
</body>
</html>
- The <div> with class container organizes the UI components.
- <input> elements capture user preferences for password length and character types.
- Buttons trigger the password generation and reset functions.
- The <div> with id="passOut" displays the generated password.
Generate Random Password - CSS Styles
This CSS styles a simple password generator interface. It sets a vibrant gradient background for the page, centers the content using flexbox, and applies a transparent, modern look to the container with a subtle shadow.
body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}
.container {
    background: rgba(255, 255, 255, 0.1);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    text-align: center;
    width: 300px;
}
.container h1 {
    margin-bottom: 20px;
}
.container input[type="number"] {
    width: 50px;
    margin-bottom: 20px;
}
.container input[type="checkbox"] {
    margin-right: 10px;
}
.output {
    margin: 20px 0;
    font-size: 1.2em;
    background: rgba(255, 255, 255, 0.2);
    padding: 10px;
    border-radius: 5px;
    word-wrap: break-word;
}
.btn {
    background-color: #6a11cb;
    border: none;
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
    margin: 5px;
}
.btn:hover {
    background-color: #2575fc;
}
- The body tag styles the page with a gradient background and centers the content.
- The .container styles the password generator box with padding, shadow, and rounded corners.
- .output styles the password display area for clarity and emphasis.
- .btn defines the appearance and hover effect for buttons.
Generate Random Password - JavaScript Logic
This JavaScript code defines functions to generate a random password based on user preferences, such as length and character types (uppercase, numbers, special characters).
function genPass(len, upper, nums, special) {
    const lower = "abcdefghijklmnopqrstuvwxyz";
    const upperChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const numChars = "0123456789";
    const specialChars = "!@#$%^&*()-_=+[]{}|;:,.<>?";
    let chars = lower;
    if (upper) chars += upperChars;
    if (nums) chars += numChars;
    if (special) chars += specialChars;
    let pass = "";
    for (let i = 0; i < len; i++) {
        const randIdx = Math.floor(Math.random() * chars.length);
        pass += chars[randIdx];
    }
    return pass;
}
function generate() {
    const len = parseInt(document.getElementById("len").value);
    const upper = document.getElementById("upper").checked;
    const nums = document.getElementById("nums").checked;
    const special = document.getElementById("special").checked;
    const pass = genPass(len, upper, nums, special);
    document.getElementById("passOut").textContent = pass;
}
function reset() {
    document.getElementById("len").value = 12;
    document.getElementById("upper").checked = true;
    document.getElementById("nums").checked = true;
    document.getElementById("special").checked = true;
    document.getElementById("passOut").textContent = "Your password will appear here";
}
- genPass generates a random password based on the selected length and character types.
- generate fetches user input, generates a password, and updates the display.
- reset restores default values and clears the password display.
Complete Code
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 300px;
        }
        .container h1 {
            margin-bottom: 20px;
        }
        .container input[type="number"] {
            width: 50px;
            margin-bottom: 20px;
        }
        .container input[type="checkbox"] {
            margin-right: 10px;
        }
        .output {
            margin: 20px 0;
            font-size: 1.2em;
            background: rgba(255, 255, 255, 0.2);
            padding: 10px;
            border-radius: 5px;
            word-wrap: break-word;
        }
        .btn {
            background-color: #6a11cb;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
            margin: 5px;
        }
        .btn:hover {
            background-color: #2575fc;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Password Generator</h1>
        <label>
            Password Length:
            <input id="len" min="6" type="number" value="12" />
        </label>
        <br />
        <label>
            <input id="upper" type="checkbox" checked /> Include Uppercase
        </label>
        <br />
        <label>
            <input id="nums" type="checkbox" checked /> Include Numbers
        </label>
        <br />
        <label>
            <input id="special" type="checkbox" checked /> Include Special Characters
        </label>
        <br />
        <button class="btn" onclick="generate()">Generate Password</button>
        <button class="btn" onclick="reset()">Reset</button>
        <div class="output" id="passOut">Your password will appear here</div>
    </div>
    <script>
        function genPass(len, upper, nums, special) {
            const lower = "abcdefghijklmnopqrstuvwxyz";
            const upperChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            const numChars = "0123456789";
            const specialChars = "!@#$%^&*()-_=+[]{}|;:,.<>?";
            let chars = lower;
            if (upper) chars += upperChars;
            if (nums) chars += numChars;
            if (special) chars += specialChars;
            let pass = "";
            for (let i = 0; i < len; i++) {
                const randIdx = Math.floor(Math.random() * chars.length);
                pass += chars[randIdx];
            }
            return pass;
        }
        function generate() {
            const len = parseInt(document.getElementById("len").value);
            const upper = document.getElementById("upper").checked;
            const nums = document.getElementById("nums").checked;
            const special = document.getElementById("special").checked;
            const pass = genPass(len, upper, nums, special);
            document.getElementById("passOut").textContent = pass;
        }
        function reset() {
            document.getElementById("len").value = 12;
            document.getElementById("upper").checked = true;
            document.getElementById("nums").checked = true;
            document.getElementById("special").checked = true;
            document.getElementById("passOut").textContent = "Your password will appear here";
        }
    </script>
</body>
</html>
