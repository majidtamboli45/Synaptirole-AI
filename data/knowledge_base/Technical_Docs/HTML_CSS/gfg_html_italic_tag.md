# HTML Italic Tag

> Source: https://www.geeksforgeeks.org/html/html-i-tag

The <i> tag in HTML displays text in an italic style and is mainly used for words or phrases that need a different visual meaning. It often highlights technical terms or foreign words.
- Used for technical terms, important words, or text in another language.
- It is a container tag with an opening tag, content, and a closing tag.
- Does not add semantic importance, only changes the visual appearance of text.
- Can be styled further using CSS for customized italic effects.
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
    <p>This is an <i>italic</i> word.</p>
</body>
</html>
Syntax
// Inline way to make italic text in html file
<i> Now content is Italic </i>
// Use in external style.css file to make italic
i {
font-style: italic;
}
Examples of Italic Tag
Demonstrates how the <i> tag and CSS can be used to render text in italics.
Example 1: Illustrating the <i> tag to make the italic text in HTML.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h1>GeeksforGeeks</h1>
    <h3>HTML i tag</h3>
    <div>
<!--Driver Code Ends-->
        <p>
            <i>A Computer Science portal for geeks.</i>
            It contains well written, well thought and well
            explained computer science and programming articles
        </p>
<!--Driver Code Starts-->
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 2: Using <i> tag & <p> tag to illustrate the difference in the text appearance while rendering it.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h1>GeeksforGeeks</h1>
    <h3>HTML i tag</h3>
    <p>This is normal text written inside p tag</p>
    <i>This text is in italic font style</i>
</body>
</html>
Example 3: A text can be written in italics using CSS also. When the CSS font-style property is set to italic, then the text can be seen as follows:
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h1>GeeksforGeeks</h1>
    <h3>HTML i tag</h3>
    <p style="font-style: italic;">
        This text content is in italic font.
    </p>
    <h5>Note:This example is only possible when the
        font-style property is kept "italic" in CSS
    </h5>
</body>
</html>
Usage
Defines when to use the <i> tag for stylistic text without adding semantic importance.
- Use the <i> tag for words that you want to show differently from the normal phrase for readability purposes.
- These semantic elements give contextual significance to text, while <i> primarily focuses on the text's appearance.
- Use <i> tag only when it is not marked up with these elements: <em>, <strong>, <mark>, <cite>, and <dfn>
Note: The <i> tag is also supported by Global attribute and Event Attributes in HTML.
