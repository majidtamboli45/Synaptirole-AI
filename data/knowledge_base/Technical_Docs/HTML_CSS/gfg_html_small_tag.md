# HTML small Tag

> Source: https://www.geeksforgeeks.org/html/html-small-tag

The <small> tag in HTML is an inline element used to display text in a smaller font size, typically for less important or secondary information.
- It is commonly used for fine print, disclaimers, or secondary information.
- The <small> tag does not change the semantic meaning of text but visually deemphasizes it.
<html>
<head>
    <title></title>
</head>
<body>
    <h1> GeeksforGeeks </h1>
    <h2> <small> Tag </h2>
    <small> Welcome to GeeksforGeeks! </small>
</body>
</html>
Syntax
<small> Contents... </small>
Note: The <small> tag also supports the Global Attributes and Event Attributes in HTML. This tag is not deprecated, but it is possible to achieve better results or nearly the same effect with CSS.
Working with small Tag
There are basically two ways in which you could use this <small> tag.
1. In a Nested Form
When you use the <small> tag in a nested form then the <small> tag will going to change the font size of the text in between it with respect to the parent element's font size which means changing text with respect to its surroundings.
Example 1: Implement the above form in an HTML document.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2> Welcome To GFG </h2>
    <p style="font-size: 18px;">
        Geeks For Geeks
        <small>
            A platform to learn coding and computer science concepts.
        </small>
    </p>
</body>
</html>
Note: The <small> tag uses relative sizing, so it scales with the parent element’s font size.
Example 2: Implement the small tag in an HTML document.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2> Welcome To GFG </h2>
    <p style="font-size: 32px">
        Geeks for Geeks
        <small>
            Your go-to platform for learning programming and computer science.
        </small>
    </p>
</body>
</html>
2. In a non-nested Form
If the <small> tag is used as a separate element in the HTML document, then changing the font size of any element will not going to affect the font size of the <small>tag text.
Example 1: Demonstrates the <small> tag displaying secondary text in a relatively smaller font within a paragraph.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2>Welcome To GFG</h2>
    <p style="font-size: 18px">
        Geeks For Geeks
        <small>
            Your go-to platform for learning programming and computer science.
        </small>
    </p>
</body>
</html>
Note : If we change the font size of the paragraph, it will not affect the font size of the <small> tag text.
Example 2: Shows <small> text rendered smaller relative to surrounding content.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2> Welcome To GFG </h2>
    <p style="font-size: 32px">
        Geeks For Geeks
    </p>
    <small>
        A platform to learn coding, data structures, and algorithms.
    </small>
</body>
</html>
Example 3: Using CSS property to set the font size smaller.
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>
        body {
            text-align: center;
        }
        h1 {
            color: green;
        }
        .gfg {
            font-size: smaller;
        }
    </style>
</head>
<body>
    <h1> GeeksforGeeks </h1>
    <h2> font-size: smaller; </h2>
    <div class="gfg">
        Welcome to GeeksforGeeks! (using CSS smaller)
    </div>
    <p>
        <small>
            Welcome to GeeksforGeeks! (using <small> tag)
        </small>
    </p>
</body>
</html>
