# CSS Text Formatting

> Source: https://www.geeksforgeeks.org/css/css-text-formatting

CSS text formatting styles and controls text appearance, improving readability and visual appeal.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .initials {
            font-size: 40px;
            font-weight: bold;
            color: #4CAF50;
            text-transform: uppercase;
            font-family: Arial, sans-serif;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p class="initials">M.B.</p>
</body>
</html>
<!--Driver Code Ends-->
- Font Size: The text size is set to 40px, making it large and prominent.
- Font Weight: The text is bold, making it stand out more.
- Color: The text color is set to a green shade (#4CAF50), giving it a fresh look.
- Text Transform: The text is converted to uppercase, so the letters appear in capital letters.
- Font Family: The text uses Arial, which is a sans-serif font, for a clean, modern appearance.
CSS Text Formatting Properties
These are the following text formatting properties.
| Property | Description | 
|---|---|
| text-color | Sets the color of the text using color name, hex value, or RGB value. | 
| text-align | Specifies horizontal alignment of text in a block or table-cell element. | 
| text-align-last | Sets alignment of last lines occurring in an element. | 
| text-decoration | Decorates text content. | 
| text-decoration-color | Sets color of text decorations like overlines, underlines, and line-throughs. | 
| text-decoration-line | Sets various text decorations like underline, overline, line-through. | 
| text-decoration-style | Combines text-decoration-line and text-decoration-color properties. | 
| text-indent | Indents first line of paragraph. | 
| text-justify | Justifies text by spreading words into complete lines. | 
| text-overflow | Specifies hidden overflow text. | 
| text-transform | Controls capitalization of text. | 
| text-shadow | Adds shadow to text. | 
| letter-spacing | Specifies space between characters of text. | 
| line-height | Sets space between lines. | 
| direction | Sets text direction. | 
| word-spacing | Specifies space between words of line. | 
Text Formatting Properties
CSS text formatting properties control the appearance, alignment, spacing, and style of text on a web page.
1. color
This property help's to set the color of a text on your web page which is inside an element or inside the body tag if no element is parenting it.
- Applies to child text if no parent overrides it.
- Supports formats like names, RGB, HEX, HSL.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            color: green;
            font-size:50px;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <p>Hello GFG</p>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    color: color-name | rgb | rgba | hsl | hsla | hexadecimal;
}
2. text-align
This property aligns the text in an element at a specific position. Also it aligns the text on basis of it's writing direction with properties like start and end it means to the start and end of the container in which it is written.
- Aligns text horizontally within an element.
- Supports direction-based values like start and end.
- Common values include left, right, center, justify.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            height: 70px;
            background-color: aquamarine;
            text-align: center;
            color: black;
            border: 2px solid black;
            font-size:18px;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <p>The quick brown fox jumps over the lazy dog. This phrase is often used to
      test typewriters and fonts because it contains all the letters of the English alphabet, making it a perfect pangram for evaluating typeface appearance and readability.
</p>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    text-align: left| right |center | justify |start | end | initial | inherit;
}
3. text-align-last
This property in CSS understands the last line as the line after a natural line break sequence. Suppose if a person is writing a paragraph this property will consider the last line as the line after the natural line break due to page width end as the last line of the paragraph.
- Aligns the last line of a text block.
- Useful for paragraphs with justified text.
- Applies after natural line wrapping.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            width: 250px;
            border: 2px solid black;
            text-align-last:;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>The quick brown fox jumps over the lazy dog. This phrase is often used to
        test typewriters and fonts because all the letters of the English alphabet, making it a perfect pangram for evaluating typeface appearance and readability.
</p>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    text-align-last: left | right | center | justify | initial | inherit;
}
4. text - decoration
This property basically help's to add a underline to the text written in your element , In this their are various type's of decoration context's that you can apply to your text.
- Adds decorative lines to text.
- Common uses include underline and line-through.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            width: 250px;
            border: 2px solid black;
            text-decoration: underline;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>The quick brown fox jumps over the lazy dog. This phrase is often used to
        test typewriters and fonts because all the letters of the English alphabet, making it a perfect pangram for evaluating typeface appearance and readability.
</p>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    text-decoration: dashed | dotted | double | line-through | none | overline | solid | underline | wavy;
}
5. text-decoration-color
This property help's to add a color to the underline that is made over or under a text with the use of text-decoration property.
- Sets the color of text decoration lines.
- Works only when text-decoration is applied.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            width: 250px;
            border: 2px solid black;
            text-decoration: underline;
            text-decoration-color: red;
            font-size:20px;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <p>The quick brown fox jumps over the lazy dog. This phrase is often used to
        test typewriters and fonts becaues</p>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    text-decoration-color: color | initial | inherit;
}
6. text-decoration-line
This property help's to set the type of line used in decoration of any text.
- Defines the type of decoration line.
- Controls underline, overline, or strike-through.
- Can combine multiple line types.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            width: 250px;
            border: 2px solid black;
            text-decoration: underline;
            text-decoration-color: gray;
            text-decoration-line:line-through;
            font-size:20px;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <p>The quick brown fox jumps over the lazy dog. This phrase is often used to
        test typewriters and fonts because </p>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    text-decoration-line: underline | overline | line-through | none | inherit | initial;
}
7. text-decoration-style
This property help's to set the preview of the line used for a particular text.
- Specifies the style of the decoration line.
- Options include solid, dashed, dotted, and wavy.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            width: 250px;
            border: 2px solid black;
            text-decoration: underline;
            text-decoration-color: green;
            text-decoration-style: wavy;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>The quick brown fox jumps over the lazy dog. This phrase is often used to
        test typewriters and fonts because it contains all the letters of the English Alphabet, making it a perfect pangram for evaluating typefaceappearance and readability. </p>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    text-decoration-style: dashed | dotted | double | none | solid | wavy |  initial | inherit;
}
8. text-indent
This property in CSS add 's an indentation to the first line written in an element from the starting of that particular element.
- Indents the first line of text.
- Commonly used in paragraphs.
- Accepts length values like px or em.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            width: 250px;
            border: 2px solid black;
            text-decoration: underline;
            text-decoration-color: green;
            text-decoration-style: wavy;
            text-indent: 70px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>The quick brown fox jumps over the lazy dog. This phrase is often used to
        test typewriters and fonts becauese it contains all the letters of the English alphabet, making it a perfect pangram for evaluating typeface appearance and readability.</p>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    text-indent: value in pixel's | inherit | initial;
}
9. text - justify
This property in CSS specifies the kind of justification that has to be made to a text on basis of inter-word space or inter-character space.
- Controls spacing method in justified text.
- Works with text-align: justify.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        h1 {
            text-align: center;
            color: green;
        }
        div {
            height: 100px;
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            border: 2px solid black;
            text-align: justify;
            text-justify: inter-word;
            column-count: 3;
            column-gap: 1em;
            column-rule: 2px solid red;
            font-size: 16px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>
        NEWSPAPER GeeksforGeeks
    </h1>
    <div>
        CSS Text Formatting refers to applying styles to text elements to control appearance and layout.
      This includes properties for color, alignment, decoration, indentation, justification, shadows,
      spacing, and direction. These properties enhance readability and aesthetics, 
      improving the presentation of textual content on web pages.
    </div>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    text-justify: initial | inter-word | inter-character | inherit;
}
10. text-overflow
This is a CSS text property with the help of which you can decide that how you want to show the begining of the hidden text in your document.
- Controls how hidden overflow text is displayed.
- Commonly used with ellipsis (…).
- Requires overflow: hidden and white-space.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            width: 200px;
            height: 50px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            border: 2px solid black;
            font-size:30px;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <p>CSS Text Formatting refers to applying styles to text elements to control appearance and layout.
      This includes properties for color, alignment, decoration, indentation, justification, 
      shadows, spacing, and direction. These properties enhance readability and aesthetics, 
      improving the presentation of textual content on web pages..</p>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    text-overflow: clip | ellipse | inherit | initial;
}
11. text-transform
This is a property in CSS with the help of which a user has the control over the casing of the text in your element.
- Changes the letter casing of text.
- Does not modify the original content.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            text-transform: capitalize;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>Welcome to GeeksforGeeks</p>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    text-transform: capitalize | lowercase | uppercase | initial | inherit
}
12. text-shadow
This is a property which help's the user to add a shadow to the text in your element.
- Adds shadow effects to text.
- Enhances readability or visual style.
- Supports blur and color customization.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            font-size: 23px;
            font-family: sans-serif;
            font-weight: 900;
            text-shadow: 10px 10px 5px red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>Welcome to GeeksforGeeks</p>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element{
    text-shadow: shadow-height shadow-width  blur-radius shadow-color;
}
13. bdo
This is a tag in html that overrides the content written inside it to a specific direction using the dir attribute with it.
- Overrides text direction explicitly.
- Uses the dir attribute (ltr or rtl).
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        bdo {
            font-size: 23px;
            font-family: sans-serif;
            font-weight: 900;
            text-shadow: 10px 10px 5px red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <bdo dir="rtl">Welcome to GeeksforGeeks</bdo>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
element1 {
    property-x: value_y  !important; /* This will be applied. */
}
