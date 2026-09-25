# HTML legend Tag

> Source: https://www.geeksforgeeks.org/html/html-legend-tag

The HTML <legend> tag is used to provide a title or caption for content grouped within a <fieldset> element, improving clarity and usability for all users, including those using screen readers.
- Should be placed as the first child inside a <fieldset>.
- Supports global HTML attributes and event handlers.
- Widely used in accessible web forms for a better user experience.
Syntax
<legend> Text </legend>
Attributes
The align attribute specifies the alignment of the <legend> text, with possible values like left, center, or right.
| Attribute | Description | Example Value | 
|---|---|---|
| align | Specifies the alignment of the legend text. | left, center, right | 
Example 1: The <legend> tag is used inside a <fieldset> to group and label form elements related to student information.
<!DOCTYPE html>
<html>
<body>
    <h1>GeeksforGeeks</h1>
    <strong>HTML Legend Tag</strong>
    <form>
        <fieldset>
            <legend>STUDENT::</legend>
            <label>Name:</label>
            <input type="text">
            <br><br>
            <label>Email:</label>
            <input type="text">
            <br><br>
            <label>Date of birth:</label>
            <input type="text">
            <br><br>
            <label>Address:</label>
            <input type="text">
            <br><br>
            <label>Enroll No:</label>
            <input type="text">
        </fieldset>
    </form>
</body>
</html>
Example 2: The <legend> tag creates a styled title for grouped form elements within a <fieldset>.
<!DOCTYPE html>
<html>
<head>
    <style>
        form {
            width: 50%;
        }
        legend {
            display: block;
            padding-left: 10px;
            padding-right: 10px;
            border: 3px solid green;
            background-color: tomato;
            color: white;
            ;
        }
        label {
            display: inline-block;
            float: left;
            clear: left;
            width: 90px;
            margin: 5px;
            text-align: left;
        }
        input[type="text"] {
            width: 250px;
            margin: 5px 0px;
        }
        .gfg {
            font-size: 40px;
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="gfg">GeeksforGeeks</div>
    <h2>HTML Legend Tag</h2>
    <form>
        <fieldset>
            <legend>STUDENT:</legend>
            <label>Name:</label>
            <input type="text">
            <br>
            <label>Email:</label>
            <input type="text">
            <br>
            <label>Date of birth:</label>
            <input type="text">
            <br>
            <label>Address:</label>
            <input type="text">
            <br>
            <label>Enroll No:</label>
            <input type="text">
        </fieldset>
    </form>
</body>
</html>
