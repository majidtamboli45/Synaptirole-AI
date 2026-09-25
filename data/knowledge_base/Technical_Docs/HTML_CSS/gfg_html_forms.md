# HTML Forms

> Source: https://www.geeksforgeeks.org/html/html-forms

HTML forms, defined using the <form> tag, are essential for collecting user input on web pages. They include interactive controls like text fields, emails, passwords, checkboxes, radios, and buttons.
- Widely used, over 85% of websites rely on forms to gather user data.
- They play a crucial role in modern web development by enabling user interaction and data submission.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, initial-scale=1.0">
    <title>HTML</title>
</head>
<body>
    <h2>HTML Forms</h2>
    <form>
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username"><br><br>
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password"><br><br>
        <input type="submit" value="Submit">
    </form>
</body>
Output:
- The code has a basic HTML structure with a title "HTML Forms".
- The <h2> tag displays "HTML Forms" as the main heading on the page.
- The <form> tag defines a form for user input.
- A text input field for the username with a label.
- A password input field and a submit button to send the form data.
Syntax:
<form>
      <!--form elements-->
</form>
Advance HTML Forms
This HTML form collects users personal information, including name, email, password, gender, date of birth, and address. It features proper styling for input fields and submission buttons.
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML Form</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        form {
            width: 400px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        fieldset {
            border: 1px solid black;
            padding: 10px;
            margin: 0;
        }
        legend {
            font-weight: bold;
            margin-bottom: 10px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        textarea,
        input[type="date"] {
            width: calc(100% - 20px);
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .gender-group {
            margin-bottom: 10px;
        }
        .gender-group label {
            display: inline-block;
            margin-left: 10px;
        }
        input[type="radio"] {
            margin-left: 10px;
            vertical-align: middle;
        }
        input[type="submit"] {
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form>
        <fieldset>
            <legend>User Personal Information</legend>
            <label for="name">Enter your full name:</label>
            <input type="text" id="name" name="name" required />
            <label for="email">Enter your email:</label>
            <input type="email" id="email" name="email" required />
            <label for="password">Enter your password:</label>
            <input type="password" id="password" name="pass" required />
            <label for="confirmPassword">Confirm your password:</label>
            <input type="password" id="confirmPassword" name="confirmPass" required />
            <label>Enter your gender:</label>
            <div class="gender-group">
                <input type="radio" name="gender" value="male" id="male" required />
                <label for="male">Male</label>
                <input type="radio" name="gender" value="female" id="female" />
                <label for="female">Female</label>
                <input type="radio" name="gender" value="others" id="others" />
                <label for="others">Others</label>
            </div>
            <label for="dob">Enter your Date of Birth:</label>
            <input type="date" id="dob" name="dob" required />
            <label for="address">Enter your Address:</label>
            <textarea id="address" name="address" required></textarea>
            <input type="submit" value="Submit" />
        </fieldset>
    </form>
</body>
</html>
Output:
Here are some of the key attributes that can be used with the <form> element:
- action: Specifies the URL where the form data is sent upon submission.
- method: Defines the HTTP method used to send the data — either "get" or "post".
- target: Determines where to display the server’s response (e.g., "_blank", "_self", "_parent", "_top", or an iframe name).
- enctype: Specifies how form data is encoded when using method="post" (e.g., application/x-www-form-urlencoded, multipart/form-data, text/plain).
- autocomplete: Controls whether the browser should auto-fill form fields ("on" or "off").
- novalidate: A Boolean attribute that prevents the form from being validated before submission.
Form Elements
Below are essential HTML form elements used to build interactive and user-friendly forms:
| Elements | Descriptions | 
|---|---|
| <label> | It defines labels for <form> elements. | 
| <input> | It is used to get input data from various types such as text, password, email, etc by changing its type. | 
| <button> | It defines a clickable button to control other elements or execute a functionality. | 
| <select> | It is used to create a drop-down list. | 
| <textarea> | It is used to get input long text content. | 
| <fieldset> | It is used to draw a box around other form elements and group the related data. | 
| <legend> | It defines a caption for fieldset elements | 
| <datalist> | It is used to specify pre-defined list options for input controls. | 
| <output> | It displays the output of performed calculations. | 
| <option> | It is used to define options in a drop-down list. | 
| <optgroup> | It is used to define group-related options in a drop-down list. | 
Input Types in HTML Forms
Here are the commonly used input types in HTML Forms:
| Input Type | Description | 
|---|---|
| <input type="text"> | Defines a one-line text input field | 
| <input type="password"> | Defines a password field | 
| <input type="submit"> | Defines a submit button | 
| <input type="reset"> | Defines a reset button | 
| <input type="radio"> | Defines a radio button | 
| <input type="email"> | Validates that the input is a valid email address. | 
| <input type="number"> | Allows the user to enter a number. You can specify min, max, and step attributes for range. | 
| <input type="checkbox"> | Used for checkboxes where the user can select multiple options. | 
| <input type="date"> | Allows the user to select a date from a calendar. | 
| <input type="time"> | Allows the user to select a time. | 
| <input type="file"> | Allows the user to select a file to upload. |
