# CSS Variables

> Source: https://www.geeksforgeeks.org/css/css-variables

CSS variables (custom properties) are reusable values defined with two dashes (--) that make your CSS code efficient and easier to maintain.
- Store values like colors, sizes, or fonts in one place for centralized updates.
- Use var() to apply these variables anywhere in your CSS.
- Improve code readability and consistency across your styles.
Syntax:
var( --custom-name, value );
- --custom-name: (Required) The name of the custom property, starting with two dashes (--).
- value: (Optional) A value used if the custom property is not defined or is invalid.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        :root {
            --main-bg-color: lightblue;
            --main-text-color: darkblue;
        }
        body {
            background-color: var(--main-bg-color);
            color: var(--main-text-color);
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Welcome to My Website</h1>
    <p>This is a sample paragraph demonstrating CSS variables.</p>
</body>
</html>
<!--Driver Code Ends-->
Example of CSS Variable
Here are some examples of CSS Variable:
1. Themed Button Using CSS Variables
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        :root {
            --button-bg: #4CAF50;
            --button-text: white;
            --button-padding: 10px 20px;
        }
        .btn {
            background-color: var(--button-bg);
            color: var(--button-text);
            padding: var(--button-padding);
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: darkgreen;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <button class="btn">Click Me</button>
</body>
</html>
<!--Driver Code Ends-->
- :root defines --btn-bg for button background and --btn-text for button text color.
- These variables are applied to style a button, making theme updates easy by changing values in :root.
2. Dynamic Spacing Using CSS Variables
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        :root {
            --spacing: 20px;
        }
        .box {
            width: 100px;
            height: 100px;
            background-color: lightcoral;
            margin: var(--spacing);
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- :root defines --spacing to set uniform spacing between boxes.
- Changing the --spacing value in :root adjusts the margin for all .box elements.
Best Practices
Some best practices are as follows:
- Define Variables in :root: Declare global variables within the :root selector to ensure they are accessible throughout your stylesheet.
- Use Descriptive Naming: Choose clear and descriptive names for variables to enhance readability and maintainability.
- Leverage the Cascade: Take advantage of CSS variables' ability to inherit and be overridden within specific scopes, allowing for flexible theming and component styling.
