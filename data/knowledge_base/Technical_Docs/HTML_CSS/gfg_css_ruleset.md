# CSS Ruleset

> Source: https://www.geeksforgeeks.org/css/what-is-css-ruleset

A CSS ruleset is the foundation of how styles are applied to HTML elements on a web page. It consists of a selector and one or more declarations, which define how elements are displayed.
- A CSS ruleset is made up of a selector and declarations.
- The selector targets HTML elements to apply styles.
- Declarations are pairs of property names and values that define how the selected elements should be styled.
- The declarations are enclosed in curly braces {}.
<!--Driver Code Starts-->
<html><head>
<!--Driver Code Ends-->
    <style>
        /* This is a CSS ruleset */
        p {
            color: blue;
            font-size: 16px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>This is a paragraph.</p>
</body></html>
<!--Driver Code Ends-->
- The selector is p, which targets all <p> (paragraph) elements in the HTML.
- The declarations define how the <p> element should look. The color property changes the text color to blue, and the font-size property sets the text size to 16px.
Declarations
A declaration specifies a CSS property and its value, separated by a colon (:). Declarations must end with a semicolon (;).
1. Color and Background
The declaration block to style the body of an element can be written by keeping body as a selector and the declaration must be kept within these {} braces.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        body {
            color: black;
            background-color: white;
            background-image: url('background.jpg');
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
</body>
</html>
<!--Driver Code Ends-->
2. Font and Text
The declaration block to style the h1 element by using an element selector.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        h1 {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
            text-transform: uppercase;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Welcome to GFG</h1>
</body>
</html>
<!--Driver Code Ends-->
3. Box Model (Margin, Padding, Border)
The box model describes the structure of an element as a rectangular box consisting of content, padding, border, and margin.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        div {
            margin: 20px;
            padding: 10px;
            border: 1px solid black;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div> </div>
</body>
</html>
<!--Driver Code Ends-->
4. Positioning of elements within the width and height of the screen
CSS positioning controls how an element is placed on a page using properties like static, relative, absolute, fixed, and sticky.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <link rel="stylesheet" href="styles.css">
<!--Driver Code Starts-->
</head>
<body>
    <div class="container">
        <div class="box static">Static</div>
        <div class="box relative">Relative</div>
        <div class="box absolute">Absolute</div>
        <div class="box fixed">Fixed</div>
        <div class="box sticky">Sticky</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
/*styles.css*/
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    height: 200vh;
    /* To demonstrate scrolling for fixed and sticky positions */
}
.container {
    position: relative;
    height: 400px;
    border: 2px solid black;
    padding: 20px;
}
.box {
    width: 100px;
    height: 50px;
    margin: 10px;
    padding: 10px;
    color: white;
    text-align: center;
    line-height: 50px;
}
.static {
    position: static;
    background-color: gray;
}
.relative {
    position: relative;
    background-color: blue;
    top: 20px;
    /* Moves relative to its original position */
    left: 20px;
}
.absolute {
    position: absolute;
    background-color: red;
    top: 50px;
    /* Moves relative to the nearest positioned ancestor */
    left: 50px;
}
.fixed {
    position: fixed;
    background-color: green;
    top: 10px;
    /* Always stays at the same position relative to the viewport */
    right: 10px;
}
.sticky {
    position: sticky;
    background-color: orange;
    top: 0;
    /* Sticks to the top of its container while scrolling */
}
5. Flexbox
Flexbox is a layout model that provides efficient alignment and distribution of space among items in a container, even if their size is dynamic.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        body {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background: lightgray;
        }
        .box {
            width: 150px;
            height: 150px;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 8px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box">Centered Box</div>
</body>
</html>
<!--Driver Code Ends-->
6. Responsive Design
Using media queries to adjust styles for different screen sizes.
<!--Driver Code Starts-->
<html>
<!--Driver Code Ends-->
<head>
    <style>
        body {
            font-size: 16px;
        }
        @media (max-width: 600px) {
            body {
                font-size: 14px;
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>Resize the browser to see the font size change.</p>
</body>
</html>
<!--Driver Code Ends-->
7. Advanced Selectors
- Advanced selectors in CSS allow for more precise targeting of elements, such as using pseudo-classes (e.g., :nth-child()), pseudo-elements (e.g., ::before), attribute selectors, and combinators like > or ~.
- They enhance styling capabilities by enabling dynamic and contextual styling based on states, relationships, and element attributes.
8. Pseudo-classes
A pseudo-class is a keyword added to a selector that defines a special state of the selected elements. For example, you might want to style an element when the user hovers over it, or when a link has been visited.
9. Pseudo-Elements
A pseudo-element allows you to style specific parts of an element, such as the first letter or the first line, or even insert content before or after the element.
Note: Double colons :: are recommended for pseudo-elements, but some older browsers also support a single colon :
10. Combining Pseudo-Classes and Pseudo-Elements
You can use pseudo-classes and pseudo-elements together for advanced styling. On hovering the button a flame symbol will appear before the content ie Click me in the button.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        button:hover::before {
            content: "🔥 ";
            font-size: 1.2rem;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <button>Click me</button>
</body>
</html>
<!--Driver Code Ends-->
Must Read: Comments in CSS
