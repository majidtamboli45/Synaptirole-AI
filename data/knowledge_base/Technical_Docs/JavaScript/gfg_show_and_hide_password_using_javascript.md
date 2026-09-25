# Show And Hide Password Using JavaScript

> Source: https://www.geeksforgeeks.org/javascript/show-hide-password-using-javascript/

A simple JavaScript feature to show and hide passwords improves user experience by letting users verify their input. It is commonly used in login and signup forms.
- It works by toggling the input field type between "password" and "text".
- A button or icon is used to trigger the toggle action.
- It enhances usability while maintaining security when needed.
Approach
- We will create a "Password Hide and Show" feature that will allow users to toggle the visibility of their password.
- It will include an input field for the password and a button or icon (like an eye) to show or hide the text.
- Using HTML for structure, CSS for styling, and JavaScript for functionality, clicking the button will toggle the input field’s type between "password" (hidden) and "text" (visible), enhancing user experience and security.
HTML code
The "Show and Hide Password" feature allows users to toggle the visibility of their password input field with a button, enhancing usability and security in web forms.
<html>
<head></head>
<body>
    <div class="container">
        <label for="passes">Enter Password</label>
        <div class="input-container">
            <input id="passes" placeholder="Your password" type="password" />
            <span class="eye-icon" id="eye-icon"> 👁️ </span>
        </div>
    </div>
</body>
</html>
- The div with class container organizes the label and input field for the password.
- The label is linked to the password input field using the for attribute and prompts the user to enter a password.
- The input field with type="password" accepts the user's password and shows placeholder text when empty.
- The span with class eye-icon and an eye emoji (👁️) is intended to toggle the visibility of the password.
CSS Styling
The CSS styling for the "Show and Hide Password" feature ensures a clean, user-friendly interface by styling the input field, button, and positioning the eye icon. It uses flexbox for alignment and adds padding, borders, and rounded corners for a polished look.
body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f4f4f4;
}
.container {
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 300px;
    text-align: center;
}
.input-container {
    display: flex;
    align-items: center;
    position: relative;
}
input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 2px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}
.eye-icon {
    position: absolute;
    right: 10px;
    cursor: pointer;
    font-size: 20px;
    color: #333;
}
label {
    font-size: 18px;
    margin-bottom: 10px;
    display: block;
}
- Container Styling: Adds a white background, rounded corners, padding, and shadow for modern look.
- Input Field: Stretches to fit the container width, includes padding, a light gray border, and rounded corners for usability and style.
- Eye Icon: Positioned on the right of the input field, with a pointer cursor and dark gray color for clear interactivity.
- Label Styling: Features larger text, proper spacing, and a block layout for alignment and readability.
- Input-Icon Layout: Uses flexbox for horizontal alignment and relative positioning for precise placement.
JavaScript Functionality
The JavaScript functionality for the "Show and Hide Password" feature toggles the input field's type between "password" and "text" when the button is clicked, updating the button text accordingly. It ensures that the password visibility can be switched with each click, providing interactive user experience.
let input = document.getElementById('passes');
let eyeIcon = document.getElementById('eye-icon');
eyeIcon.addEventListener('click', function () {
    if (input.type === 'password') {
        input.type = 'text';
        eyeIcon.textContent = '🙉';
    } else {
        input.type = 'password';
        eyeIcon.textContent = '👁️';
    }
})
- Variable Declarations: Selects the password input field (passes) and the button element (eye-icon) for manipulation and interactivity.
- Event Listener: Adds a click event to the button that toggles password visibility.
- Toggle Functionality: Checks the input field's type and toggles between "password" and "text", updating the button text to "Show" or "Hide" accordingly.
- Button Text Change: Updates the button text to "Hide" when password is visible and "Show" when hidden.
- Password Security: Keeps the password hidden by default and only reveals it when the button is clicked.
Complete code
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .input-container {
            display: flex;
            align-items: center;
            position: relative;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 2px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .eye-icon {
            position: absolute;
            right: 10px;
            cursor: pointer;
            font-size: 20px;
            color: #333;
        }
        label {
            font-size: 18px;
            margin-bottom: 10px;
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <label for="passes">
            Enter Password
        </label>
        <div class="input-container">
            <input id="passes" placeholder="Your password" type="password" />
            <span class="eye-icon" id="eye-icon"> 👁️ </span>
        </div>
    </div>
    <script>
        let input = document.getElementById('passes');
        let eyeIcon = document.getElementById('eye-icon');
        eyeIcon.addEventListener('click', function () {
            if (input.type === 'password') {
                input.type = 'text';
                eyeIcon.textContent = '🙉';
            } else {
                input.type = 'password';
                eyeIcon.textContent = '👁️';
            }
        })
    </script>
</body>
</html>
