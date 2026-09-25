# CSS text-decoration Property

> Source: https://www.geeksforgeeks.org/css/css-text-decoration-property

The text-decoration property in CSS is used to add decorative effects to text, such as underlines and strike-through lines. It helps improve the styling and visual appearance of text content on web pages.
- Common values include underline, overline, line-through, and none.
- It can be used to customize links, headings, and highlighted text.
- The property also supports shorthand styling for decoration color, style, and thickness.
Understanding the text-decoration Property
The text-decoration property in CSS is a shorthand property used to set the decoration of text in one declaration. It combines the text-decoration-line, text-decoration-style, text-decoration-color, and text-decoration-thickness properties.
Syntax:
text-decoration: line style color | initial | inherit;
/* for example
text-decoration: underline dashed green;
*/
CSS text-decoration shorthand property for:
- text-decoration-line : use to sets the type of line decoration for our text.
- text-decoration-color : use to sets the color for the line decoration.
- text-decoration-style : use to sets the style of the line specified by text-decoration-line.
- text-decoration-thickness : use to sets the thickness of the line used in decoration.
CSS text-decoration Property Examples:
Example 1: Here is the 3 value representation of CSS text-decoration Property.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>Text Decoration Example</title>
<!--Driver Code Ends-->
    <style>
        h2{
            text-decoration: underline dashed green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h2>
        Text Decoration Example
    </h2>
   
</body>
</html>
<!--Driver Code Ends-->
Example 2: Here is the single value representation of CSS text-decoration Property.
<!DOCTYPE html>
<html>
    <head>
        <title>Text Decoration Example</title>
        <style>
            h2 {
                text-decoration-line: overline;
                text-decoration-style: solid;
                text-decoration-color: blue;
            }
        </style>
    </head>
    <body>
        <h2>Text Decoration Example</h2>
    </body>
</html>
Output:
- The text-decoration property in CSS is a versatile tool for web developers to control the visual presentation of text.
- By combining various properties like text-decoration-line, text-decoration-style, text-decoration-color, and text-decoration-thickness, you can create visually appealing text decorations that enhance user experience and site aesthetics.
- Understanding how to use this property effectively ensures your web content is both stylish and accessible.
- Stay updated with browser compatibility to maintain a consistent look across different platforms.
