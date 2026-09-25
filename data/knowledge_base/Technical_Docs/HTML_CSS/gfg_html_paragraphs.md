# HTML Paragraphs

> Source: https://www.geeksforgeeks.org/html/html-paragraph

A paragraph in HTML is simply a block of text enclosed within the <p> tag. The <p> tag helps divide content into manageable, readable sections. It’s the go-to element for wrapping text in a web page that is meant to be displayed as a distinct paragraph.
- Adds space before and after the paragraph to visually separate it from other content.
- Breaks the text into a single block, creating an easy-to-read section.
<!DOCTYPE html>
<html>
    <body>
        <p>A Computer Science portal for geeks.</p>
        <p>It contains well written, well thought articles.</p>
    </body>
</html>
Properties of the paragraph Tag
- The browser reduces multiple spaces added by users to a single space.
- Browsers ignore extra whitespace (spaces, tabs, line breaks) and render content as a single continuous line.
- By default, the display of the paragraph element is set to "block," meaning each new paragraph is placed on a new line.
Note: This behaviour can be modified using CSS.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <p>
        This paragraph has multiple lines.
        But HTML reduces them to a single line,
        omitting the carriage return we have used.
    </p>
    <p>
        This paragraph has multiple spaces.
        But HTML reduces them all to a single
        space, omitting the extra spaces and 
          line we have used.
    </p>
</body>
</html>
Note: To preserve spaces and line breaks, use the <pre> tag, which displays text exactly as written.
The <br> tag
The HTML <br> tag element creates a line break, giving you a new line without starting a new paragraph. Use <br> when you want to move to the next line without beginning a whole new paragraph.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <p>
        This paragraph has multiple
        <br />lines. But HTML reduces them
        <br />to a single line, omitting
        <br />the carriage return we have used.
    </p>
</body>
</html>
The Horizontal Rules <hr> tag
The HTML <hr> tag is used to create a horizontal rule or line, visually separating content on a webpage. Use <hr> when you want to insert a horizontal line to signify a division between sections or elements, providing a clear visual break in the page.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <h1>Welcome to My Website</h1>
    <p>
        GeeksforGeeks is a leading
        platform that provides computer
        science resources and coding challenges
    </p>
    <hr>
    <p>
        GeeksforGeeks is a leading platform
        that provides computer science resources
        and coding challenges
    </p>
</body>
</html>
Align attribute
The <p> tag specifically supports the alignment attribute and allows us to align our paragraphs in left, right, or center alignment.
Syntax:
<p align="value">
Note: The align attribute is deprecated in HTML5, and styles should be used via CSS for better practices.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <p align="center">Welcome Geeks</p>
    <p align="left">A Computer Science portal for geeks.</p>
    <p align="right">It contains well written, well thought articles.</p>
</body>
</html>
Avoiding Common Mistakes with Paragraphs
- Avoid Nested Paragraphs: You cannot nest paragraphs within one another. Each <p> tag should contain only the text for one block of content.
- Avoid Using <p> for Non-Textual Content: The<p> tag is meant for text-based content. If you need to wrap images, tables, or other elements, use appropriate tags like<img> ,<table> , or<div> .
