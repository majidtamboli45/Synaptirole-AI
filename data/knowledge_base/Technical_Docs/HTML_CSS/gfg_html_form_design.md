# HTML Form Design

> Source: https://www.geeksforgeeks.org/html/html-design-form

HTML forms are used on websites to collect information from users. They allow users to input information such as their name, email address, password, or feedback.
- The <form> tag defines the form structure.
- Form elements like <input>, <button>, and <select> are used to collect data.
- HTML forms are essential for tasks such as login, registration, and surveys.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
	<form action="/submit-form" method="post">
		<label for="name">Name:</label>
		<input type="text" id="name" name="name" required>
		<br><br>
		<label for="email">Email:</label>
		<input type="email" id="email" name="email" required>
		<br><br>
		<label for="message">Message:</label>
		<textarea id="message" name="message" rows="4" cols="30"></textarea>
		<br><br>
		<button type="submit">Submit</button>
	</form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
Output:
- <form> defines a section for collecting user inputs with attributes specifying where (action) and how (method) to send the data.
- <label>, <input>, and <button> create a simple field for text input and a button to submit the form.
Input Elements in HTML Forms
HTML forms include a variety of elements that allow users to input data. Understanding these elements and how to use them properly is key to creating a functional and user-friendly form.
1. Text Field
A text field allows users to enter a single line of text. It's one of the most commonly used input elements in forms, ideal for capturing user information like names, addresses, or usernames.
<!--Driver Code Starts-->
<html>
  
<body>
    <h3>Example of Text Field</h3>
<!--Driver Code Ends-->
    <form>
        <label for="email">Email ID:</label><br>
        <input type="text" name="email" id="email"><br>
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The <input type="text"> element creates a single-line text field for user input.
- The <label> element provides a descriptive label for the text field, enhancing accessibility and usability.
2. Number Field
A number field allows the user to input only numerical values. It is useful when you expect numbers, such as age, quantity, or price.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form>
        <label for="age">Age:</label><br>
        <input type="number" name="age" id="age">
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The <input type="number"> element creates a numeric input field, allowing users to enter their age.
- The <label> element provides a descriptive label ("Age:") for the input field, enhancing accessibility and usability.
3. Password Field
A password field is used for capturing sensitive information such as passwords. This field hides the user's input with asterisks or dots.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form>
        <label for="password">Password:</label><br>
        <input type="password" name="password" id="password">
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The <input type="password"> element creates a password input field where user entries are masked, enhancing privacy during data entry.
4. Radio Buttons
Radio buttons are used when you need to present a set of options, but the user can select only one. They are useful for choices like gender, status, or preferences.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form>
        <label>Select Gender:</label><br>
        <input type="radio" name="gender" 
              id="male" value="Male">
        <label for="male">Male</label><br>
        <input type="radio" name="gender" 
              id="female" value="Female">
        <label for="female">Female</label>
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The <input type="radio"> elements create radio buttons, allowing users to select one option from the provided choices (e.g., "Male" or "Female").
- Each <label> element is associated with a corresponding radio button, providing descriptive text and enhancing accessibility by enabling users to click on the label to select the associated option.
5. Checkboxes
Checkboxes allow users to select one or more options. They are commonly used for multi-selection fields like preferences or terms agreement.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form>
        <b>Select Subjects:</b><br>
        <input type="checkbox" name="subject" 
             id="maths" value="Maths">
        <label for="maths">Maths</label><br>
        <input type="checkbox" name="subject" 
             id="science" value="Science">
        <label for="science">Science</label><br>
        <input type="checkbox" name="subject" 
             id="english" value="English">
        <label for="english">English</label>
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
The <input type="checkbox"> elements create checkboxes, allowing users to select multiple subjects (e.g., "Maths," "Science," "English") simultaneously.
6. File Select Box
The file input allows users to select a file from their local device and upload it. It is created using the <input> element with type="file".
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form>
        <label for="fileupload">Upload a file:</label>
        <input type="file" name="fileupload" id="fileupload">
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The <input type="file"> element creates a file upload field, allowing users to select a file from their device for submission.
- The <label> element provides a descriptive label ("Upload a file:") for the file input field, enhancing accessibility and usability.
7. Textarea
A textarea allows users to input multi-line text. It is created using the <textarea> element.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form>
        <label for="description">Description:</label><br>
        <textarea name="description" 
              id="description" rows="5" cols="50"></textarea>
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The <textarea> element creates a multi-line text input field, allowing users to enter longer blocks of text, such as a description or comments.
- The <label> element provides a descriptive label ("Description:") for the textarea, enhancing accessibility and usability by indicating the purpose of the input field.
8. Select Boxes
A select box presents a dropdown list from which the user can choose one (or multiple) options.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form>
        <label for="country">Country:</label>
        <select name="country" id="country">
            <option value="India">India</option>
            <option value="Sri Lanka">Sri Lanka</option>
            <option value="Australia">Australia</option>
        </select>
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The <select> element creates a drop-down list labeled "Country," allowing users to choose one option from the provided list.
- Each <option> element within the <select> defines an individual choice in the drop-down menu, such as "India," "Sri Lanka," and "Australia."
9. Reset And Submit Buttons
Submit and reset buttons are essential in HTML forms. The submit button sends the form data to the server, while the reset button restores the form fields to their default values.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form action="test.php" method="post" id="users">
        <label for="username">Username:</label>
        <input type="text" name="username" id="Username">
        <input type="submit" value="Submit">
        <input type="reset" value="Reset">
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The <input type="submit"> element creates a button that, when clicked, submits the form data to the server.
- The <input type="reset"> element creates a button that, when clicked, resets all form fields to their default values.
Attributes used in HTML Forms
Defines properties that control form behavior, data submission, and user interaction.
1. Action Attribute
The action attribute specifies what happens when the form is submitted. It defines the URL (web page) where the form data will be sent after the user clicks the submit button.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form action="test.php" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username">
        <input type="submit" value="Submit">
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The form sends the entered username to the "test.php" page upon submission.
- The action attribute defines the destination for the form data.
2. Target Attribute
The target attribute controls where the results of the form submission will open. By default, it opens in the same window (_self). If you want the result to open in a new tab, set the target attribute to _blank.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form action="test.php" target="_blank">
        <label for="username">Username:</label>
        <input type="text" name="username">
        <input type="submit" value="Submit">
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The form opens the response (from "test.php") in a new browser tab.
- The target="_blank" attribute ensures a new tab is used for the response.
3. Name Attribute
The name attribute is required for each input field in a form. If you don't specify a name for an input field, its value won't be sent when the form is submitted.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<body>
<!--Driver Code Ends-->
    <form action="/test.php" target="_blank">
        Username:<br>
        <input type="text">
        <br>
        Password:<br>
        <input type="password" name="password">
        <br><br>
        <input type="submit" value="Submit">
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The input field's value is submitted with the name "username".
- Without the name attribute, the input's value would not be sent to the server.
4. Method Attribute
It is used to specify the HTTP method used to send data while submitting the form. There are two kinds of HTTP Methods, which are GET and POST.
- GET Method: In the GET method, form data is visible in the URL of the browser after submission. This is not ideal for sensitive information like passwords.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form action="/test.php" target="_blank" 
          method="GET">
        Username:<br>
        <input type="text" name="username">
        <br>
        Password:<br>
        <input type="password" name="password">
        <br><br>
        <input type="submit" value="Submit">
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- Post Method : In the POST method, form data is sent in the background and is not visible in the browser's address bar. This method is more secure for submitting sensitive data.
<!--Driver Code Starts-->
<html>
<body>
<!--Driver Code Ends-->
    <form action="/test.php" target="_blank" 
          method="post">
        Username:<br>
        <input type="text" name="username">
        <br>
        Password:<br>
        <input type="password" name="password">
        <br><br>
        <input type="submit" value="Submit">
    </form>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
Best Practices for HTML Form Design
Best Practices for HTML Form Design focus on using semantic elements, keeping forms concise, providing clear labels and instructions, and offering inline validation for a better user experience.
- Use Semantic HTML5 Elements: Utilize <form>, <fieldset>, <legend>, and <label> to enhance form structure and accessibility.
- Keep Forms Concise: Limit the number of fields to essential information to prevent user overwhelm.
- Provide Clear Labels and Instructions: Use descriptive labels and placeholders to guide users in completing the form accurately.
- Implement Inline Validation: Provide real-time feedback to users as they complete the form to reduce errors and improve user experience.
