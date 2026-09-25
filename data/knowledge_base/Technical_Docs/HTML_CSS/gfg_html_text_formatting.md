# HTML Text Formatting

> Source: https://www.geeksforgeeks.org/html/html-text-formatting

HTML text formatting refers to the use of specific HTML tags to modify the appearance and structure of text on a webpage. It allows you to style text in different ways, such as making it bold, italic, underlined, highlighted, or struck-through.
Categories of HTML Text Formatting
HTML text formatting can be divided into two main categories: Logical Tags and Physical Tags.
1. Logical Tags
Logical tags convey the meaning or importance of the text without necessarily altering its visual appearance. These tags help browsers, search engines, and assistive technologies understand the purpose of the text.
- <em>: Emphasizes text, typically rendered in italics. It implies that the text carries special importance or requires emphasis.
- <strong>: Marks text as important, often displayed in bold. It implies the content is of strong importance.
2. Physical Tags
Physical tags directly affect how text looks on the webpage by changing the font, size, or style.
- <b>: Displays text in bold without implying importance.
- <i>: Italicizes text without any implied emphasis.
Here’s a list of commonly used HTML text formatting tags and their description:
| Tags | Description | 
|---|---|
| <i> | Showcases italicized text. | 
| <small> | Renders text in a smaller font size. | 
| <ins> | Highlights added or inserted text. | 
| <sub> | Creates subscript text. | 
| <strong> | Emphasizes text with importance, often in bold. | 
| <b> | Displays text in a bold format. | 
| <mark> | Accentuates text with a background highlight. | 
| <del> | Strikes through text to signify deletion. | 
| <em> | Adds emphasis to text, commonly styled as italic. | 
| <sup> | Formats text as superscript. | 
HTML Formatting Elements
1. <i> – Italicizes text
Use the <i> tag to display text in italics without implying emphasis.
<i>This is italic text.</i>
2. <small> – Reduces the font size of the text
The <small> tag renders text in a smaller font than the surrounding text.
<small>This text is smaller than the rest.</small>
3. <ins> – Highlights inserted text
The <ins> tag marks text as newly added or inserted, often displayed with an underline.
<ins>This is inserted text.</ins>
4. <sub> – Displays subscript text
Use the <sub> tag for subscripted text, often used in chemical formulas or footnotes.
H<sub>2</sub>O
5. <strong> – Emphasizes important text, often rendered in bold
The <strong> tag is semantically meaningful and indicates that the text is of high importance.
<strong>This text is bold and important.</strong>
6. <b> – Makes text bold
The <b> tag visually makes the text bold but does not imply any special significance.
<b>This is bold text.</b>
7. <mark> – Highlights text with a background color
The <mark> tag highlights text with a background color, similar to using a highlighter on paper.
<mark>This text is highlighted.</mark>
8. <del> – Strikes through text
The <del> tag is used to show that text has been deleted or is no longer relevant.
<del>This text is crossed out.</del>
9. <em> – Emphasizes text, typically italicized
The <em> tag is used for emphasized text and is usually rendered in italics to highlight importance.
<em>This text is emphasized.</em>
10. <sup> – Displays superscript text
Use the <sup> tag to show superscripted text, commonly used in exponents or footnotes.
E = mc<sup>2</sup>
Examples of HTML Text Formatting
Example 1: Basic Text Formatting
In this example we demonstrates various text formatting tags: <strong> for important and bold text, <em> for emphasized and italic text, <b> for bold text, <i> for italic text, and <mark> for highlighted text.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Text Formatting Example</title>
</head>
<body>
    <p>
        <strong>Strong:</strong> 
        This text is important and bold.
    </p>
    <p>
        <em>Emphasized:</em> 
        This text is emphasized and italic.
    </p>
    <p>
        <b>Bold:</b> 
        This text is bold.
    </p>
    <p>
        <i>Italic:</i> 
        This text is italic.
    </p>
    <p>
        <mark>Marked:</mark> 
        This text is highlighted.
    </p>
</body>
</html>
Output:
Example 2: Combining Logical and Physical Tags
This example shows how logical and physical tags can be combined for enhanced text formatting:
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Advanced Text Formatting</title>
</head>
<body>
    <p>This is a 
        <strong><em>very important</em></strong> message.
    </p>
    <p>The chemical formula of water is H
        <sub>2</sub>O.
    </p>
    <p>
        <del>Deleted text</del> and 
        <ins>inserted text</ins> 
        are shown here.
    </p>
    <p><small>Smaller text</small> 
        can be used for disclaimers.
    </p>
    <p>E = mc<sup>2</sup></p>
</body>
</html>
Output:
