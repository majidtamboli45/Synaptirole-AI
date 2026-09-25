# CSS Fundamentals Project

> Source: https://www.geeksforgeeks.org/css/css-fundamentals-project

You are tasked with creating a simple Course Welcome Page using HTML and CSS. The page should introduce a course, show a short description, display a few course details, and include a call-to-action.
You must build the project using the basic CSS concepts covered in the CSS Fundamentals module, including CSS syntax, selectors, declarations, internal CSS, colors, fonts, text styling, margins, padding, borders, and background styling.
Requirements
- Create a simple course welcome section.
-  Use Internal CSS inside the <style> tag.
- Use CSS selectors and rulesets to style HTML elements.
- Apply colors and background colors.
- Style text using font size, weight, alignment, and text transformation.
- Use margin, padding, and borders for spacing and structure.
- Keep the project in a single HTML file.
Module Articles Used
Step-by-Step Implementation
1. Create the HTML Structure
Create a course welcome page containing a heading, description, course details, and a button.
<div class="course-card">
    <p class="label">WEB DEVELOPMENT</p>
    <h1>Learn CSS Fundamentals</h1>
    <p class="description">
        Learn the basics of CSS and understand how to style
        HTML pages using simple and reusable rules.
    </p>
    <div class="details">
        <p><strong>Level:</strong> Beginner</p>
        <p><strong>Topics:</strong> CSS Syntax, Rulesets and Styling</p>
    </div>
    <a href="#">Start Learning</a>
</div>
2. Add Internal CSS
Add a <style> element inside the <head> and create CSS rulesets for the page.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSS Fundamentals Course</title>
    <style>
<!--Driver Code Ends-->
        body {
            margin: 0;
            background-color: #f2f6fa;
            font-family: Arial, sans-serif;
        }
        .course-card {
            width: 500px;
    
            padding: 30px;
            background-color: white;
            border: 2px solid #d5dce3;
            text-align: center;
        }
        .label {
            color: #2878c8;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
        }
        h1 {
            color: #222;
            font-size: 32px;
            margin: 15px 0;
        }
        .description {
            color: #555;
            font-size: 16px;
            line-height: 1.5;
        }
        .details {
            margin: 25px 0;
            padding: 15px;
            background-color: #eef5fb;
            border: 1px solid #c9d9e8;
            text-align: left;
        }
        .details p {
            margin: 8px 0;
            color: #333;
        }
        a {
            display: inline-block;
            padding: 12px 24px;
            background-color: #2878c8;
            color: white;
            font-weight: bold;
            text-decoration: none;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <div class="course-card">
        <p class="label">WEB DEVELOPMENT</p>
        <h1>Learn CSS Fundamentals</h1>
        <p class="description">
            Learn the basics of CSS and understand how to style
            HTML pages using simple and reusable rules.
        </p>
        <div class="details">
            <p><strong>Level:</strong> Beginner</p>
            <p><strong>Topics:</strong> CSS Syntax, Rulesets and Styling</p>
        </div>
        <a href="#">Start Learning</a>
    </div>
</body>
</html>
<!--Driver Code Ends-->
3. Combine the HTML and CSS
Place the CSS inside <style> in the <head> and the HTML inside <body> to create the complete single-file project.
Final Source Code
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSS Fundamentals Course</title>
    <style>
        body {
            margin: 0;
            background-color: #f2f6fa;
            font-family: Arial, sans-serif;
        }
        .course-card {
            width: 500px;
            margin: 80px auto;
            padding: 30px;
            background-color: white;
            border: 2px solid #d5dce3;
            text-align: center;
        }
        .label {
            color: #2878c8;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
        }
        h1 {
            color: #222;
            font-size: 32px;
            margin: 15px 0;
        }
        .description {
            color: #555;
            font-size: 16px;
            line-height: 1.5;
        }
        .details {
            margin: 25px 0;
            padding: 15px;
            background-color: #eef5fb;
            border: 1px solid #c9d9e8;
            text-align: left;
        }
        .details p {
            margin: 8px 0;
            color: #333;
        }
        a {
            display: inline-block;
            padding: 12px 24px;
            background-color: #2878c8;
            color: white;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="course-card">
        <p class="label">Web Development</p>
        <h1>Learn CSS Fundamentals</h1>
        <p class="description">
            Learn the basics of CSS and understand how to style
            HTML pages using simple and reusable rules.
        </p>
        <div class="details">
            <p><strong>Level:</strong> Beginner</p>
            <p><strong>Topics:</strong> CSS Syntax, Rulesets and Styling</p>
        </div>
        <a href="#">Start Learning</a>
    </div>
</body>
</html>
Output
Note:
- CSS rulesets use selectors, properties, and values to style HTML.
-  Internal CSS can be written inside the <style> tag.
- CSS can control colors, fonts, spacing, borders, backgrounds, and text alignment.
- Using reusable rulesets keeps the styling organized and easier to maintain.
