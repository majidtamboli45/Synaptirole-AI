# HTML sub Tag

> Source: https://www.geeksforgeeks.org/css/html-sub-tag

The <sub> tag in HTML defines subscript text, displayed smaller and below the normal text baseline, commonly used in chemical formulas, mathematical expressions, and footnotes (e.g., H₂O or E=mc²).
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<!--Driver Code Ends-->
    <h1>Using the <sub> Tag in HTML</h1>
    <p>Chemical formula example: H<sub>2</sub>O</p>
    <p>Mathematical expression example: E = mc<sub>2</sub></p>
    <p>Footnote example: Water molecule contains two hydrogen atoms<sub>1</sub></p>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
Syntax
<sub> Contents. . . </sub>
There are no such attributes that apply specifically to this <sub> tag. The attributes that only apply to this tag are global attributes.
Use of Subscript in HTML
The HTML <sub> tag is specifically designed for subscript text. It is easy to use and supported by all major browsers.
Using Subscript in HTML
1. Chemical Formulas
Subscript is widely used to denote the number of atoms in chemical compounds.
<!--Driver Code Starts-->
<html>
<head></head>
<body>
    <h1>Chemical Formulas with Subscript</h1>
<!--Driver Code Ends-->
    <p>Water: H<sub>2</sub>O</p>
    <p>Carbon Dioxide: CO<sub>2</sub></p>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
In this example the <sub> tag for subscripts, representing elements and their quantities in compounds.
2. Mathematical Expressions
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>
<h1>Mathematical Expressions</h1>
<!--Driver Code Ends-->
    <p>The point is denoted as P<sub>i</sub> in the graph.</p>
    <p>The variable is expressed as x<sub>1</sub> + y<sub>2</sub>.</p>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
In this example, the <sub> tag lowers the text to denote indices or variables in mathematical equations.
3. Technical Notations
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>
<!--Driver Code Ends-->
    <p>Matrix elements are represented as A<sub>ij</sub>.</p>
    <p>Footnotes are referenced as text<sub>1</sub>.</p>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
In this example, the <sub> tag is used to define indices for technical terms or to represent footnotes.
Styling the <sub> Tag with CSS
By default, subscript text is smaller and lowered below the baseline. You can further customize its appearance using CSS
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
<!--Driver Code Ends-->
<style>
        sub {
            font-size: 0.75em;
            color: blue;
            vertical-align: sub;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Scientific Notation</h1>
    <p>Avogadro's Number: 6.022 × 10<sup>23</sup></p>
</body>
</html>
<!--Driver Code Ends-->
- font-size: Adjusts the size of the subscript text relative to the surrounding text.
- color: Changes the text color for better visibility.
- vertical-align: Ensures proper positioning of the subscript text below the baseline.
Best Practices
- Use Semantically: Use the <sub> tag only when text needs to appear as a subscript. This improves semantic HTML and accessibility.
- Combine with CSS: Apply consistent styling to subscript text across your webpage using CSS.
- Accessibility: Use descriptive text or ARIA labels if the meaning of the subscript isn’t immediately obvious to screen readers.
