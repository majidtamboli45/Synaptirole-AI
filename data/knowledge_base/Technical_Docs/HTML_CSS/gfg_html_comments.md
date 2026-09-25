# HTML Comments

> Source: https://www.geeksforgeeks.org/html/html-comments

HTML comments are used to add notes or explanations in the HTML code that are not displayed by the browser.
- They are useful for documenting the code, making it easier to understand and maintain.
- To add a comment, use the syntax <!-- your comment here -->.
<!-- This is a comment and will not be displayed on the webpage -->
<p>This is visible text.</p>
- The text within the <!-- and--> Tags will not appear on the webpage.
- These comments can include reminders, warnings, or explanations about the code, which can be useful for anyone reading or editing the HTML document.
Different Ways to Add Comments in HTML
There are two main ways to write comments in HTML: single-line and multi-line comments. Both use the same basic syntax but differ in how they are implemented.
Single-Line and Inline Comments
Single-line and inline comments are used to add short notes or explanations within code without affecting its execution.
<html>
<body>
    <!--This is heading Tag-->
    <h1>GeeksforGeeks</h1>
    <!--This is single line comment-->
    <h2>This is <!--given for--> single line comment</h2>
</body>
</html>
- The code uses HTML comments (<!-- comment -->) to add notes for developers, which are not displayed on the webpage.
- The <h1> and <h2> tags display headings, while inline comments in <h2> do not affect the visible text.
Multi-Line Comments and Hidden Code Sections
Multi-line comments and hidden code sections let developers write detailed explanations or temporarily disable code without deleting it.
<html>
<body>
    <!-- This is
    multi-line
         comment -->
    <h2>This is multi-line comment</h2>
    <!-- <button style="font-family: Sans-serif;">
           Click Me
         </button> -->
</body>
</html>
- The code includes HTML comments (<!-- comment -->) that are not displayed by browsers but serve as notes for developers.
- The <h1> and <h2> tags define headings, with comments explaining their purpose; the commented-out <button> element is not rendered on the page.
Note: The shortcut for adding the comment through the keyboard is by typing Ctrl + / in Windows, and Command + / for Mac users.
