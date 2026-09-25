# CSS Preprocessor SASS

> Source: https://www.geeksforgeeks.org/css/css-preprocessor-sass

Sass (Syntactically Awesome Style Sheets) is a CSS preprocessor that enhances standard CSS by introducing features like variables, nesting, imports, mixins, and inheritance, all while maintaining compatibility with all CSS versions.
- Variables: Store reusable values such as colors, fonts, or any CSS value for consistent styling.
- Nesting: Reflect the HTML hierarchy in your stylesheets by nesting CSS rules within each other.
- Imports: Split your CSS into smaller, manageable files and import them as needed.
- Mixins: Create reusable chunks of code that can be included in other selectors, allowing for efficient code reuse.
- Inheritance: Share a set of CSS properties from one selector to another using the @extend directive.
Installation
- To install Sass, follow the instructions provided on the official Sass installation page.
Sass Syntax Variants
- SCSS (Sassy CSS): It uses the .scss extension and is fully compatible with CSS syntax.
- Indented Syntax (Sass): An older syntax that uses indentation instead of braces and semicolons, with files having a .sass extension.
Workflow Steps
- Write SCSS Code: Create a file named styling.scss with your Sass code.
- Compile SCSS to CSS: Use the command sass styling.scss style.css to compile the SCSS file into a standard CSS file named style.css.
- Include in HTML: Link the compiled style.css file in your HTML document within the <head> section.
Example: File name index.html
<html>
<head>
    <link rel="stylesheet" href="style.css"> 
</head>
<body>
    <div id="d1">Welcome to GeeksforGeeks.
        <ul>
            <li>Algo</li>
            <li>DS</li>
            <li>Languages</li>
            <li>Interviews</li>
            <li>CS subjects</li>
        </ul>
    </div>
</body>
</html>
Variables: Variables can be used to store CSS values that may be reused. To declare a variable in SASS, the '$' character is used. For eg, $v_name.
$fs: 30px;
$bgcolor: #00ff40;
$pd: 100px 350px;
#dl {
 font-size: $fs;
 color: $bgcolor;
 padding: $pd;
}
This fig. shows the same code:
After compiling the CSS code, save it in file by style.css.
#dl {
 font-size: 30px;
 color: #00ff40;
 padding: 100px 350px;
}
Nesting: Nesting in SASS allows CSS rules to be nested within each other, which follows the same visual hierarchy of HTML. For eg. CSS property can be used to the <li> tag nested inside the div tag.
$fs: 30px;
$bgcolor: #00ff40;
#col2: #ff0066e1;
$pd: 100px 350px;
#dl {
 font-size: $fs;
 color: $bgcolor;
 padding: $pd;
 li {
   color: $col2;
 }
}
After compiling the CSS code save it file by style.css.
#dl {
 font-size: 30px;
 color: #00ff40;
 padding: 100px 350px;
}
#dl li {
 color: #ff0066e1;
}
Output:
Mixins: Mixins helps to make a set of CSS properties reusable i.e. it saves one code and use it again and again. It can be included in other CSS rules by using the @include directive.
Example: This example describes the use of @mixin & @include.
$fs: 30px;
$bgcolor: #00ff40;
#col2: #ff0066e1;
$pd: 100px 350px;
@mixin font_style() {
 font-family: sans-serif;
 font-size: $fs;
 color: blue;
}
#dl {
 @include font_style();
 padding: $pd;
}
After compiling the CSS code becomes:
#dl {
 font-family: sans-serif;
 font-size: 30px;
 color: blue;
 padding: 100px 350px;
}
The output of the web page:
Example: Mixins can also take variables as arguments. The values are passed while including them in the CSS rules.
$fs: 30px;
#col2: #ff0066e1;
$pd: 100px 350px;
@mixin font_style() {
 font-family: sans-serif;
 font-size: $fs;
 color: blue;
}
@mixin list_style($size, $color) {
 font-size: $size;
 color: $color;
}
#dl {
 @include font_style();
 padding: $pd;
 li {
   @include list_style(20px, red);
 }
}
The compiled CSS code:
#dl {
 font-family: sans-serif;
 font-size: 30px;
 color: blue;
 padding: 100px 350px;
}
#dl li {
 font-size: 20px;
 color: red;
}
Final Output:
Best Practices
- Modularize Your Code: Organize your styles into smaller, manageable partials and import them into a main stylesheet for better maintainability.
- Use Variables Effectively: Define variables for colors, fonts, and other reusable values to maintain consistency and simplify updates.
- Limit Nesting Depth: Avoid deep nesting to prevent overly specific selectors and maintain readability; a depth of 3 levels is recommended.
- Utilize Mixins and Functions: Create reusable mixins and functions for common patterns to reduce code duplication and enhance maintainability.
- Consistent Formatting: Maintain a consistent coding style, including indentation and naming conventions, to improve code readability and collaboration.
