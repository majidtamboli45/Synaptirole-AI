# HTML Elements

> Source: https://www.geeksforgeeks.org/html/html-elements

HTML elements are the basic building blocks of a webpage, defining its structure and content using start tags, content, and end tags.
- HTML elements start with an opening tag <tagname> and end with a closing tag </tagname> , and can contain text, attributes, or other nested elements.
- Some elements are self-closing (e.g., <br>, <img>), and browsers use elements to render the page visually.
- Properly nesting elements ensures valid, accessible, and well-structured HTML.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <p>Welcome to GeeksforGeeks!</p>
</body>
</html>
Case Sensitivity
HTML tags are not case-sensitive, but using lowercase (e.g., <b>) is recommended for consistency and readability.
- HTML tags are not case-sensitive. For example, <B> and <b> both represent bold text.
- However, it’s a best practice to use lowercase tags for consistency and readability.
Nested HTML Elements
Nested HTML elements occur when one element is placed inside another, creating a clear hierarchical structure for proper content organization and display.
- Nested elements create a parent–child hierarchy, which forms the structure of the DOM.
- Proper nesting improves accessibility, helping screen readers interpret content correctly.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body style="text-align:center">
    <h1>GeeksforGeeks</h1>
    <p>Computer science portal</p>
</body>
</html>
Necessary to Add an End Tag
It Always include closing tags for non-void HTML elements, as missing tags can cause unexpected browser layout issues.
- Browsers may auto-add missing closing tags.
- This can lead to unexpected layout issues.
- Always include closing tags for non-void HTML elements.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2>Welcome To GeeksforGeeks</h2>
    <p>Hi Geeks</p>
</body>
</html>
HTML Empty Element
HTML Elements without any content i.e., that do not print anything are called Empty elements. Empty HTML elements do not have an ending tag. For instance. <br>, <hr>, <link>, <input> etc are HTML elements.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2>Welcome To GfG</h2>
    <br />
    <p>Hello Geeks.</p>
</body>
</html>
Block-Level Elements and Inline Elements
In HTML, elements are broadly categorized into two main types based on how they display in the document layout: block-level elements and inline elements.
1. Block-Level Elements
Block-level elements start on a new line, occupy the full available width, stack vertically, and can contain both block-level and inline elements.
Examples
- <div>: A general-purpose container for other elements.
- <p>: Defines a paragraph.
- <h1>, <h2>, ..., <h6>: Heading elements of different levels.
- <ol>, <ul>: Ordered and unordered lists.
- <table>: Defines a table.
- <form>: Used for HTML forms to collect user inputs.
- <section>, <article>, <nav>, <aside>, <header>, <footer>: Semantic elements that define areas of a webpage.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <div>
        <h2>GeeksforGeeks</h2>
        <p>This content is inside a div.</p>
    </div>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>David</td>
            <td>22</td>
        </tr>
    </table>
</body>
</html>
2. Inline Elements
Inline elements do not start on a new line, take only the width of their content, and are used within block-level elements to add or style content.
- <span>: A general-purpose inline container for phrasing content.
- <a>: Creates hyperlinks.
- <img>: Embeds an image.
- <strong>, <b>: Used for strong emphasis and bold text, respectively.
- <em>, <i>: Used for emphasis and italic text, respectively.
- <br>: Inserts a line break within text.
- <input>: Creates interactive controls for forms.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <p>
        This is a <span>span element</span> used for styling text.
    </p>
    <p>
        <strong>Strong text</strong> and <b>bold text</b> are inline elements.
        <em>Emphasized text</em> and <i>italic text</i> are also inline.
    </p>
    <form>
        <label>Name:</label>
        <input type="text" placeholder="Enter your name">
    </form>
</body>
</html>
Also Check: HTML Block and Inline Elements
