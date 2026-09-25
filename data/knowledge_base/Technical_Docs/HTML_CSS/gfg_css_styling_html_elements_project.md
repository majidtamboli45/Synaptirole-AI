# CSS Styling HTML Elements Project

> Source: https://www.geeksforgeeks.org/css/styling-html-elements-project

Create a simple Student Portfolio and Registration Page that presents a student's profile, skills, academic details, and registration form in a clean and user-friendly way. The project will use the concepts learned in the Styling HTML Elements module, including text formatting, image styling, lists, tables, forms, and links.
Module Articles Used
Step-by-Step Implementation
1. Create the Profile Section
Start with a profile image, heading, introduction, and a link to view more information.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portfolio</title>
    <style>
        .profile {
            width: 700px;
            margin: 40px auto;
            padding: 25px;
            text-align: center;
            background-color: #f4f8fc;
            border: 1px solid #d5e0ea;
        }
        .profile img {
            width: 150px;
            height: 150px;
            max-width: 100%;
            border-radius: 50%;
            margin-bottom: 15px;
        }
        .profile h1 {
            margin: 10px 0;
            color: #222;
            font-size: 30px;
            text-transform: capitalize;
        }
        .intro {
            color: #555;
            font-size: 16px;
            line-height: 1.6;
            letter-spacing: 0.3px;
        }
    </style>
</head>
<body>
    <div class="profile">
        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo-100.png"
        alt="profile image">
        <h1>Mohit</h1>
        <p class="intro">
            Computer Science student interested in web development
            and software design.
        </p>
        <a href="#" class="profile-link">View Profile</a>
    </div>
</body>
</html>
Here, text formatting is used for the heading and introduction, while the image is given a circular shape and responsive width.
2. Add Skills and Academic Details
Use a list for skills and a table for academic details.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
<!--Driver Code Ends-->
        .skills {
            padding-left: 25px;
            list-style-type: square;
        }
        .skills li {
            margin: 8px 0;
        }
        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }
        caption {
            caption-side: top;
            margin-bottom: 10px;
            font-weight: bold;
        }
        th,
        td {
            padding: 12px;
            border: 1px solid #c8d2dc;
            text-align: center;
        }
        th {
            background-color: #e8f1f8;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <div class="profile">
        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo-100.png"
        alt="Profile image">
        <h1>Mohit</h1>
        <p class="intro">
            Computer Science student interested in web development
            and software design.
        </p>
        <a href="#">View Profile</a>
    </div>
    <h2>My Skills</h2>
    <ul class="skills">
        <li>HTML</li>
        <li>CSS</li>
        <li>JavaScript</li>
        <li>Problem Solving</li>
    </ul>
    <h2>Academic Details</h2>
    <table>
        <caption>Semester Performance</caption>
        <tr>
            <th>Semester</th>
            <th>Course</th>
            <th>Grade</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Web Development</td>
            <td>A</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Programming</td>
            <td>A</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Database Systems</td>
            <td>B+</td>
        </tr>
    </table>
</body>
</html>
<!--Driver Code Ends-->
3. Create the Registration Form
Add a simple form where a student can enter their details.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .profile {
            text-align: center;
        }
        .profile img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }
        .skills {
            padding-left: 25px;
            list-style-type: square;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th,
        td {
            padding: 12px;
            border: 1px solid #c8d2dc;
            text-align: center;
        }
<!--Driver Code Ends-->
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin: 12px 0 6px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"] {
            width: 90%;
            padding: 12px;
            margin-bottom: 8px;
            border: 1px solid #b8c5d0;
            border-radius: 6px;
            background-color: #fff;
            color: #222;
        }
        input[type="text"]:focus,
        input[type="email"]:focus {
            border: 2px solid #2878c8;
            background-color: #f2f8ff;
        }
        button {
            margin-top: 12px;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            background-color: #2878c8;
            color: white;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <div class="profile">
        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo-100.png" 
        alt="Profile image">
        <h1>Mohit</h1>
        <p>
            Computer Science student interested in web development
            and software design.
        </p>
    </div>
    <h2>My Skills</h2>
    <ul class="skills">
        <li>HTML</li>
        <li>CSS</li>
        <li>JavaScript</li>
        <li>Problem Solving</li>
    </ul>
    <h2>Academic Details</h2>
    <table>
        <tr>
            <th>Semester</th>
            <th>Course</th>
            <th>Grade</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Web Development</td>
            <td>A</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Programming</td>
            <td>A</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Database Systems</td>
            <td>B+</td>
        </tr>
    </table>
    <h2>Register for the Course</h2>
    <form>
        <label for="name">Name</label>
        <input type="text" id="name" placeholder="Enter your name">
        <label for="email">Email</label>
        <input type="email" id="email" placeholder="Enter your email">
        <label for="course">Course</label>
        <input type="text" id="course" placeholder="Enter your course">
        <button type="submit">Register</button>
    </form>
</body>
</html>
<!--Driver Code Ends-->
The list is styled with custom markers, while the table uses borders, padding, alignment, and collapsed borders for better readability.
The form uses attribute selectors to target different input types. The :focus selector changes the input appearance when the user selects a field.
4. Add Interactive Links
Add links for navigation and style their different states.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .profile {
            text-align: center;
        }
        .profile img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }
        .skills {
            padding-left: 25px;
            list-style-type: square;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th,
        td {
            padding: 12px;
            border: 1px solid #c8d2dc;
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin: 12px 0 6px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"] {
            width: 90%;
            padding: 12px;
            margin-bottom: 8px;
            border: 1px solid #b8c5d0;
            border-radius: 6px;
        }
        button {
            margin-top: 12px;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            background-color: #2878c8;
            color: white;
        }
<!--Driver Code Ends-->
        .links {
            margin-top: 25px;
            text-align: center;
        }
        .links a {
            display: inline-block;
            margin: 5px;
            padding: 8px 15px;
            background-color: #e8f1f8;
            color: #2878c8;
            border-radius: 5px;
            text-decoration: none;
        }
        .links a:visited {
            color: #2878c8;
        }
        .links a:hover {
            background-color: #2878c8;
            color: white;
        }
        .links a:active {
            background-color: #18558f;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <div class="profile">
        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo-100.png"
        alt="Profile image">
        <h1>Mohit</h1>
        <p>
            Computer Science student interested in web development
            and software design.
        </p>
    </div>
    <h2>My Skills</h2>
    <ul class="skills">
        <li>HTML</li>
        <li>CSS</li>
        <li>JavaScript</li>
        <li>Problem Solving</li>
    </ul>
    <h2>Academic Details</h2>
    <table>
        <tr>
            <th>Semester</th>
            <th>Course</th>
            <th>Grade</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Web Development</td>
            <td>A</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Programming</td>
            <td>A</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Database Systems</td>
            <td>B+</td>
        </tr>
    </table>
    <h2>Register for the Course</h2>
    <form>
        <label for="name">Name</label>
        <input type="text" id="name" placeholder="Enter your name">
        <label for="email">Email</label>
        <input type="email" id="email" placeholder="Enter your email">
        <label for="course">Course</label>
        <input type="text" id="course" placeholder="Enter your course">
        <button type="submit">Register</button>
    </form>
    <div class="links">
        <a href="#">Home</a>
        <a href="#">Courses</a>
        <a href="#">Contact</a>
    </div>
</body>
</html>
<!--Driver Code Ends-->
The links are styled like navigation buttons. Their appearance changes when the user hovers over or clicks them.
Final Source Code
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portfolio & Registration</title>
    <style>
        body {
            margin: 0;
            background-color: #ffffff;
            font-family: Arial, sans-serif;
            color: #333;
        }
        .container {
            width: 700px;
            margin: 40px auto;
            padding: 25px;
            border: 1px solid #d5e0ea;
            background-color: #f9fbfd;
        }
        .profile {
            padding: 25px;
            text-align: center;
            background-color: #f4f8fc;
            border: 1px solid #d5e0ea;
        }
        .profile img {
            width: 150px;
            height: 150px;
            max-width: 100%;
            border-radius: 50%;
            margin-bottom: 15px;
        }
        .profile h1 {
            margin: 10px 0;
            color: #222;
            font-size: 30px;
            text-transform: capitalize;
        }
        .intro {
            color: #555;
            font-size: 16px;
            line-height: 1.6;
            letter-spacing: 0.3px;
        }
        h2 {
            margin-top: 30px;
            color: #222;
            text-decoration: underline;
            text-decoration-color: #2878c8;
        }
        .skills {
            padding-left: 25px;
            list-style-type: square;
        }
        .skills li {
            margin: 8px 0;
        }
        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }
        caption {
            caption-side: top;
            margin-bottom: 10px;
            font-weight: bold;
        }
        th,
        td {
            padding: 12px;
            border: 1px solid #c8d2dc;
            text-align: center;
        }
        th {
            background-color: #e8f1f8;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin: 12px 0 6px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"] {
            width: 90%;
            padding: 12px;
            margin-bottom: 8px;
            border: 1px solid #b8c5d0;
            border-radius: 6px;
            background-color: #fff;
            color: #222;
        }
        input[type="text"]:focus,
        input[type="email"]:focus {
            border: 2px solid #2878c8;
            background-color: #f2f8ff;
        }
        button {
            margin-top: 12px;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            background-color: #2878c8;
            color: white;
        }
        .links {
            margin-top: 25px;
            text-align: center;
        }
        .links a {
            display: inline-block;
            margin: 5px;
            padding: 8px 15px;
            background-color: #e8f1f8;
            color: #2878c8;
            border-radius: 5px;
            text-decoration: none;
        }
        .links a:visited {
            color: #2878c8;
        }
        .links a:hover {
            background-color: #2878c8;
            color: white;
        }
        .links a:active {
            background-color: #18558f;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="profile">
            <img src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo-100.png" 
            alt="Profile image">
            <h1>Mohit</h1>
            <p class="intro">
                Computer Science student interested in web development
                and software design.
            </p>
        </div>
        <h2>My Skills</h2>
        <ul class="skills">
            <li>HTML</li>
            <li>CSS</li>
            <li>JavaScript</li>
            <li>Problem Solving</li>
        </ul>
        <h2>Academic Details</h2>
        <table>
            <caption>Semester Performance</caption>
            <tr>
                <th>Semester</th>
                <th>Course</th>
                <th>Grade</th>
            </tr>
            <tr>
                <td>1</td>
                <td>Web Development</td>
                <td>A</td>
            </tr>
            <tr>
                <td>2</td>
                <td>Programming</td>
                <td>A</td>
            </tr>
            <tr>
                <td>3</td>
                <td>Database Systems</td>
                <td>B+</td>
            </tr>
        </table>
        <h2>Register for the Course</h2>
        <form>
            <label for="name">Name</label>
            <input type="text" id="name" placeholder="Enter your name">
            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Enter your email">
            <label for="course">Course</label>
            <input type="text" id="course" placeholder="Enter your course">
            <button type="submit">Register</button>
        </form>
        <div class="links">
            <a href="#">Home</a>
            <a href="#">Courses</a>
            <a href="#">Contact</a>
        </div>
    </div>
</body>
</html>
Output:
Note:
- Text Formatting: Control text color, size, alignment, spacing, and decoration.
- Images: Style images using width, height, borders, radius, and responsive sizing.
- Lists: Customize list markers and spacing.
- Tables: Improve table readability using borders, padding, alignment, and border-collapse .
- Forms: Style inputs and create focus effects using attribute selectors and :focus .
- Links: Use link states such as :link ,:visited ,:hover , and:active to provide visual feedback.
