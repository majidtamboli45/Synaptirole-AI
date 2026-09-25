# CSS Preprocessor LESS

> Source: https://www.geeksforgeeks.org/css/css-preprocessor-less

LESS (Leaner Style Sheets) is a CSS preprocessor that extends CSS with dynamic behavior, including variables, nesting, mixins, and mathematical operations, all while maintaining compatibility with standard CSS.
- Variables: Store reusable values like colors, fonts, and measurements using the @ symbol.
- Mixins: Include reusable groups of CSS properties in other rulesets.
- Nesting: Write CSS in a hierarchical structure reflecting the HTML.
- Mathematical Operations: Perform arithmetic on CSS values.
- Functions: Use built-in functions for math, color manipulation, and more.
Working of LESS
A browser cannot directly process LESS code. A LESS preprocessor compiles the LESS file into standard CSS that browsers can interpret.
Working Steps
- Write the LESS code in a .less file.
- Compile the LESS file into CSS using lessc style.less style.css.
- Link the compiled CSS file in the HTML document.
Here is a list of all the features of LESS, each explained one by one:
1. Variables: Variables can be used to store CSS values that may be reused. They are initialized with @.
@lt-gray: #ddd;
@background-dark: #512DA8;
@carousel-item-height: 300px;
h1 {
    color:@lt-gray;
    background:@background-dark;
}
Syntax: To compile the above less code to CSS code write the following command-
lessc style.less style.css
The compiled CSS file comes to be:
h1 {
  color: #ddd;
  background: #512DA8;
}
2. Mixins: Mixins are a way of including a bunch of properties from one rule-set into another rule set.
zero-margin {
    margin:0px auto;
    background: white;
}
.row-header {
    margin:zero-margin;
    padding:0px auto;
}
.row-content {
    margin:zero-margin;
    border-bottom: 1px ridge;
    min-height:400px;
    padding: 50px 0px 50px 0px;
}
Syntax: To compile the above less code to CSS code write the following command-
lessc style.less style.css
The compiled CSS file comes to be:
zero-margin {
  margin: 0px auto;
  background: white;
}
.row-header {
  margin: zero-margin;
  padding: 0px auto;
}
.row-content {
  margin: zero-margin;
  border-bottom: 1px ridge;
  min-height: 400px;
  padding: 50px 0px 50px 0px;
}
3. Nesting: LESS gives you the ability to use nesting. 
@lt-gray: #ddd;
@background-dark: #512DA8;
@carousel-item-height: 300px;
.carousel {
    background:@background-dark;
    .carousel-item {
        height: @carousel-item-height;
        img {
            position: absolute;
            top: 0;
            left: 0;
            min-height: 300px;
        }
    }
}
Syntax: To compile the above less code to CSS code write the following command-
lessc style.less style.css
The compiled CSS file comes to be:
.carousel {
  background: #512DA8;
}
.carousel .carousel-item {
  height: 300px;
}
.carousel .carousel-item img {
  position: absolute;
  top: 0;
  left: 0;
  min-height: 300px;
}
4. Mathematical Operations: Arithmetical operations +, -, *, / can operate on any number, color, or variable.
@lt-gray: #ddd;
@background-dark: #512DA8;
@carousel-item-height: 300px;
.carousel-item {
    height: @carousel-item-height;
}
.carousel-item .item-large {
    height: @carousel-item-height *2;
}
Syntax: To compile the above less code to CSS code write the following command-
lessc style.less style.css
The compiled CSS file comes to be:
.carousel-item {
  height: 300px;
}
.carousel-item .item-large {
  height: 600px;
}
5. Functions: LESS provides a variety of functions like math, list, string, color operations, color blending, etc.
@base:0.5;
@width: 0.8;
.class {
    width: percentage(@width); // Returns `80%`
    color: saturate(@base, 5%);
    background-color: light(@base, 25%), 8;
}
Syntax: To compile the above less code to CSS code write the following command-
lessc style.less style.css
The compiled CSS file comes to be:
.class {
  width: 80%;
  color: saturate(0.5, 5%);
  background-color: light(0.5, 25%), 8;
}
Example: File name gfg.html
<!--Driver Code Starts-->
<html>
<head>
    <link rel="stylesheet" href="./css/style.css">
</head>
<!--Driver Code Ends-->
<body>
    <div class="head">
      Welcome to GeeksforGeeks
        <ul class="list">
            <li class="a">Algo</li>
            <li>DS</li>
            <li class="a">Languages</li>
            <li>Interviews</li>
            <li>CS subjects</li>
        </ul>
    </div>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
@color-primary: #009900; 
@font-pri: Sans-Serif; 
@font-sec: Helvetica; 
body{ 
    color: @color-primary; 
    font-size: 40px; 
} 
.list{ 
    font-family: @font-pri; 
    font-size: 20px; 
    .a{ 
        font-family: @font-sec; 
        font-size: 10px; 
    } 
} 
body { 
color: #009900; 
font-size: 40px; 
} 
.list { 
font-family: Sans-Serif; 
font-size: 20px; 
} 
.list .a { 
font-family: Helvetica; 
font-size: 10px; 
} 
Output:
Advantages of LESS
- LESS is cross-browser compatible.
- LESS provides a list of operators making it easy for users to code.
- Maintenance is easy due to the use of variables.
Disadvantages of LESS
- LESS provides fewer frameworks as compared to SASS.
- It can be tricky to those who are new to CSS.
Best Practices for Using LESS
- Modularize Your Code: Divide your styles into logical, reusable modules or partials to enhance maintainability.
- Limit Nesting Levels: Avoid deep nesting to prevent overly specific selectors and maintain readability.
- Utilize Variables: Define variables for commonly used values like colors and fonts to ensure consistency and simplify updates.
