# CSS Syntax

> Source: https://www.geeksforgeeks.org/css/css-syntax

CSS syntax defines how CSS rules are written so that browsers can interpret and apply them to HTML elements. It is useful for styling and designing web pages efficiently.
- It defines how styles are applied to HTML elements.
- It uses selectors to target elements.
- It consists of properties and values inside a declaration block.
- Selector: Targets the HTML element "h1" to apply styles.
- Declaration Block: Enclosed in curly braces { }, contains one or more declarations.
- Property: Specifies the style attribute, here "color" for text color.
- Value: Defines the property's setting, here "blue" for the text hue.
- Overall Structure: Forms a complete CSS rule: h1 { color: blue; }, styling h1 headings blue.
<!--Driver Code Starts-->
<html>
<head>
    <style>
<!--Driver Code Ends-->
        /* CSS Rule */
        h1 {
            color: blue;
            /* Property: value */
            font-size: 24px;
        }
        p {
            color: green;
            font-size: 16px;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <h1>Hello, World!</h1>
    <p>This is a simple paragraph.</p>
</body>
</html>
<!--Driver Code Ends-->
- h1: This selector targets all <h1> elements on the page. The style applied to <h1> will set the text color to blue and the font size to 24px.
- p: This selector targets all <p> elements. The text color will be green and the font size will be 16px.
Declaration Block in CSS Syntax
Each declaration consists of a property and a value, separated by a colon, and each declaration is followed by a semicolon:
1. Properties: Properties are the aspects of the selected elements you want to style (like color, width, height, etc.).
- color: Defines the text color.
- background-color: Defines the background color of an element.
- font-size: Sets the size of the font.
- margin: Specifies the space around an element.
- padding: Defines the space between the element's content and its border.
2. Values: Values define the specifics of the property you want to apply, such as a color name, a number (e.g., 16px), or percentages (e.g., 50%).
