# HTML textarea name Attribute

> Source: https://www.geeksforgeeks.org/html/html-textarea-name-attribute

Defines the behavior and properties of single-line text input fields in HTML forms, allowing users to enter and submit textual data.
- Used with <input type="text"> to accept single-line user input.
- Supports attributes like placeholder, maxlength, and required.
- Commonly used for names, emails, and short text entries.
Syntax:
<textarea name="text">
Attribute Values: It contains the value i.e name which specifies the name for the <Textarea> element.
Example: Demonstrates the use of the name attribute in a <textarea> element.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h3>Textarea Example</h3>
    <p>Please enter your comments:</p>
    <textarea name="userComments" rows="4" cols="50" 
        placeholder="Enter your text here...">
    </textarea>
    <br>    
</body>
</html>
- name="userComments": Identifies the textarea for server-side data access.
- rows="4": Sets the visible number of text lines (height).
- cols="50": Defines the width in terms of characters per line.
- Text inside <textarea>: Acts as default content that must be manually removed, unlike a placeholder.
Guidelines for Using the name Attribute
The name attribute should be unique and meaningful to clearly identify each form field and simplify data handling on the server side.
- Ensure that each name attribute in your form is unique so that each data field can be individually identified.
- Use meaningful names that relate to their function, making it easier to handle data on the server side.
